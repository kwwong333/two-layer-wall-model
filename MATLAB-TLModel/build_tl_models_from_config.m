function models = build_tl_models_from_config(config, outMatFile)
% BUILD_TL_MODELS_FROM_CONFIG  Build TL-model function handles from a JSON file
% or a MATLAB struct. Optionally saves to a .mat.
%
% Usage:
%   models = build_tl_models_from_config('tl_models_config.json');
%   models = build_tl_models_from_config(cfgStruct, 'tl_models.mat');
%
% Output:
%   models.<name>(yPlus) -> alphaPlus(yPlus)

    % --- 1) Load config (JSON path or struct)
    if ischar(config) || isstring(config)
        txt = fileread(char(config));
        cfg = jsondecode(txt);
    elseif isstruct(config)
        cfg = config;
    else
        error('config must be a JSON file path or a struct.');
    end

    % --- 2) Defaults (with safe fallbacks)
    D = default_params();
    if isfield(cfg, 'defaults') && isstruct(cfg.defaults)
        D = merge_defaults(D, cfg.defaults);
    end

    % --- 3) Build models
    assert(isfield(cfg, 'models') && isstruct(cfg.models), ...
        'Config must contain a "models" array of structs.');

    models = struct();
    for k = 1:numel(cfg.models)
        m = cfg.models(k);
        req = {'name','ReTau','Sc','preset'};
        for r = 1:numel(req)
            assert(isfield(m, req{r}), 'Model entry %d missing field "%s".', k, req{r});
        end

        % Local overrides (optional)
        Dloc = D;
        if isfield(m, 'overrides') && isstruct(m.overrides)
            Dloc = merge_defaults(Dloc, m.overrides);
        end

        f = make_tl_model(m.ReTau, m.Sc, m.preset, Dloc);
        models.(m.name) = f;
    end

    % --- 4) Optional save
    if nargin >= 2 && ~isempty(outMatFile)
        save(outMatFile, 'models');
    end
end

% ============================ Internals ============================

function D = default_params()
% Baseline defaults for constants, exponents, and preset coefficient maps.

    D.C        = 10.0;
    D.powRe    = 3.0;
    D.powSc    = 3.3;

    % Blend function (logistic around L_Sc)
    D.smoothFun = @(yPlus, Lsc) 1.0 ./ (1.0 + exp(-(yPlus - Lsc)));

    % L_Sc correlations
    D.LscFun10 = @(Sc) 10.5 * Sc.^(-0.34);  % Ma2015 / many cases
    D.LscFun11 = @(Sc) 11.5 * Sc.^(-0.29);  % HS2009 / Na2000

    % K_Re correlations
    D.Kre_lin  = @(ReTau) 0.3785 + 1.75e-4 * ReTau;           % default
    D.Kre_ri   = @(ReTau) 0.4647 + 2.5714e-6 * ReTau;         % Ri2023
    D.Kre_pi   = @(ReTau) -1.145 * (ReTau.^(-0.589)) + 0.473; % PI2023

    % K_Sc correlations
    D.Ksc_sqrt  = @(Sc) -0.004 * sqrt(Sc) + 0.4275; % high-Sc fit
    D.Ksc_const = @(Sc) 0.41 + 0*Sc;                % constant for low-Sc
end

function D = merge_defaults(D, S)
% Merge fields of S into struct D (1 level deep).
    f = fieldnames(S);
    for i = 1:numel(f)
        D.(f{i}) = S.(f{i});
    end
end

function f = make_tl_model(ReTau, Sc, preset, D)
% Factory returning a function handle f(yPlus) for the chosen dataset "preset".
% Preset selects K_Re / K_Sc / L_Sc correlations.

    [K_Re, K_Sc, L_Sc] = choose_coeffs(ReTau, Sc, preset, D);

    C        = D.C;
    powRe    = D.powRe;
    powSc    = D.powSc;
    smoothFn = D.smoothFun;

    f = @(yPlus) tl_core(yPlus, ReTau, Sc, C, K_Re, K_Sc, L_Sc, powRe, powSc, smoothFn);
end

function alpha_p = tl_core(yPlus, ReTau, Sc, C, K_Re, K_Sc, L_Sc, powRe, powSc, smoothFn)
% Single source of truth for the two-layer formula.
% alpha_plus(y+) = (1 + y+/(ReTau*Sc)) / ( 1/Sc + blend / ( (K_Re y+)^2 + C^2 ) )

    yPlus = ensure_col(yPlus);

    i_ind = smoothFn(yPlus, L_Sc);          % in [0,1]; 0 => Sc-branch, 1 => Re-branch
    num_sc = (K_Sc .* yPlus) .^ powSc;      % (K_Sc y+)^{3.3}
    num_re = (K_Re .* yPlus) .^ powRe;      % (K_Re y+)^{3.0}

    blend_num = (1 - i_ind) .* num_sc + i_ind .* num_re;
    denom     = (K_Re .* yPlus).^2 + C.^2;

    alpha_t_p = blend_num ./ denom;         % turbulent part in wall units
    rhs       = 1./Sc + alpha_t_p;          % total diffusivity in wall units
    pref      = 1 + yPlus ./ (ReTau * Sc);  % (1 + y^+/(Re_tau Sc))

    alpha_p   = pref ./ rhs;
end

function [K_Re, K_Sc, L_Sc] = choose_coeffs(ReTau, Sc, preset, D)
% Select coefficient formulas for each dataset preset.

    switch lower(preset)
        case 'default'        % many "Tis" / Ma2015 high-Sc style
            K_Re = D.Kre_lin(ReTau);
            K_Sc = D.Ksc_sqrt(Sc);
            L_Sc = D.LscFun10(Sc);

        case 'ma2015_const'   % Ma2015 low-Pr/Sc with constant K_Sc
            K_Re = D.Kre_lin(ReTau);
            K_Sc = D.Ksc_const(Sc);
            L_Sc = D.LscFun10(Sc);

        case 'hs2009'         % HS2009 / Na2000: L=11.5*Sc^-0.29, K_Sc sqrt
            K_Re = D.Kre_lin(ReTau);
            K_Sc = D.Ksc_sqrt(Sc);
            L_Sc = D.LscFun11(Sc);

        case 'sm2007_const'   % SM2007: constant K_Sc, L=11.5*Sc^-0.29
            K_Re = D.Kre_lin(ReTau);
            K_Sc = D.Ksc_const(Sc);
            L_Sc = D.LscFun11(Sc);

        case 'ri2023_const'   % Ri2023: Kre alternative linear, K_Sc const, L=10.5...
            K_Re = D.Kre_ri(ReTau);
            K_Sc = D.Ksc_const(Sc);
            L_Sc = D.LscFun10(Sc);

        case 'pi2023_const'   % PI2023: Kre power-law, K_Sc const, L=10.5...
            K_Re = D.Kre_pi(ReTau);
            K_Sc = D.Ksc_const(Sc);
            L_Sc = D.LscFun10(Sc);

        otherwise
            error('Unknown preset "%s".', preset);
    end
end

function x = ensure_col(x)
    if isrow(x), x = x.'; end
end

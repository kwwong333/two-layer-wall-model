%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initial Restructing of the Two-Layer Wall Model 
%
% Author: Kin Wing Wong, kwwo@kth.se
%
% Core idea:
%   alpha_plus(y+) = (1 + y+/(ReTau*Sc)) / ( 1/Sc + [blend of (K_Sc*y+)^3.3 and (K_Re*y+)^3] / [ (K_Re*y+)^2 + C^2 ] )
% where the blend is a logistic switch around L_Sc.
%
% All datasets differ only by (K_Re, K_Sc, L_Sc) correlations.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear; clc;

% ----------------------------
% User-tunable defaults
% ----------------------------
defaults.C          = 10.0;
defaults.powRe      = 3.0;   % exponent for the "Re" branch
defaults.powSc      = 3.3;   % exponent for the "Sc" branch
defaults.smoothFun  = @(yPlus, Lsc) 1.0 ./ (1.0 + exp(-(yPlus - Lsc)));  % logistic
defaults.LscFun10   = @(Sc) 10.5 * Sc.^(-0.34); % Ma2015 / many cases
defaults.LscFun11   = @(Sc) 11.5 * Sc.^(-0.29); % HS2009 / Na2000
defaults.Kre_lin    = @(ReTau) 0.3785 + 1.75e-4 * ReTau;                 % default
defaults.Kre_ri     = @(ReTau) 0.4647 + 2.5714e-6 * ReTau;               % Ri2023
defaults.Kre_pi     = @(ReTau) -1.145 * (ReTau.^(-0.589)) + 0.473;       % PI2023
defaults.Ksc_sqrt   = @(Sc) -0.004 * sqrt(Sc) + 0.4275;                  % high-Sc fit
defaults.Ksc_const  = @(Sc) 0.41 + 0*Sc;                                 % constant for low-Sc

% ----------------------------
% Build models via a tiny factory
% ----------------------------
models = struct();

% Helper to add a model with a single line
add = @(name, ReTau, Sc, preset) ...
    setfield(models, name, make_tl_model(ReTau, Sc, preset, defaults)); %#ok<SFLD>

% ====== Tis (default L=10.5*Sc^-0.34, Kre=lin, Ksc=sqrt)
models = add('TLModel_Tis_Sc_100', 395, 100, 'default');
models = add('TLModel_Tis_Sc_200', 395, 200, 'default');

% Sc=500, two datasets with different L_Sc
models = add('TLModel_Tis_Sc_500',     150, 500, 'hs2009'); % uses L=11.5*Sc^-0.29
models = add('TLModel_Ma_2015_Sc_500', 400, 500, 'default');

% ====== PI_2023 (Kre=PI form, Ksc=const, L=10.5*Sc^-0.34)
models = add('TLModel_PI_2023_Pr_16', 1070, 16, 'pi2023_const');

% ====== HS_2009 (Kre=lin, Ksc=sqrt, L=11.5*Sc^-0.29)
models = add('TLModel_HS_2009_Pr_100', 150, 100, 'hs2009');
models = add('TLModel_HS_2009_Pr_200', 150, 200, 'hs2009');
models = add('TLModel_HS_2009_Pr_400', 150, 400, 'hs2009');

% ====== SM_2007 (low-Sc -> Ksc=const, L=11.5*Sc^-0.29)
models = add('TLModel_SM_2007_Pr_1',   180, 1,  'sm2007_const');
models = add('TLModel_SM_2007_Pr_3',   180, 3,  'sm2007_const');
models = add('TLModel_SM_2007_Pr_10',  180, 10, 'sm2007_const');
models = add('TLModel_SM_2007_Pr_25',  180, 25, 'sm2007_const');
models = add('TLModel_SM_2007_Pr_49',  180, 49, 'sm2007_const');
models = add('TLModel_SM_2007_Pr_50',  180, 50, 'sm2007_const');

% ====== Ma_2015 (low-Sc -> Ksc=const, L=10.5*Sc^-0.34)
models = add('TLModel_Ma_2015_Pr_1',   400, 1,  'ma2015_const');
models = add('TLModel_Ma_2015_Pr_3',   400, 3,  'ma2015_const');
models = add('TLModel_Ma_2015_Pr_10',  400, 10, 'ma2015_const');
models = add('TLModel_Ma_2015_Pr_25',  400, 25, 'ma2015_const');
models = add('TLModel_Ma_2015_Pr_50',  400, 50, 'ma2015_const');

% ====== Na_2000 (Kre=lin, Ksc=sqrt, L=11.5*Sc^-0.29)
models = add('TLModel_Na_2000_Pr_100', 150, 100,  'hs2009'); % same recipe as HS2009
models = add('TLModel_Na_2000_Pr_500', 150, 500,  'hs2009');
models = add('TLModel_Na_2000_Pr_2400',180, 2400, 'hs2009');

% ====== Ri_2023 (Kre=ri, Ksc=const, L=10.5*Sc^-0.34)
for ReTau = [420, 628, 830, 1070]
    models = add(sprintf('TLModel_Ri_2023_Pr_6_%d', ReTau), ReTau, 6, 'ri2023_const');
    models = add(sprintf('TLModel_Ri_2023_Pr_4_%d', ReTau), ReTau, 4, 'ri2023_const');
    models = add(sprintf('TLModel_Ri_2023_Pr_2_%d', ReTau), ReTau, 2, 'ri2023_const');
    models = add(sprintf('TLModel_Ri_2023_Pr_1_%d', ReTau), ReTau, 1, 'ri2023_const');
end

% ----------------------------
% Example usage
% ----------------------------
yPlus = logspace(-2, 3, 400);
f1 = models.TLModel_HS_2009_Pr_400;   % pick any
f2 = models.TLModel_Ma_2015_Pr_50;

alpha1 = f1(yPlus);
alpha2 = f2(yPlus);

% quick plot (optional)
figure; loglog(yPlus, alpha1, '-', yPlus, alpha2, '--', 'LineWidth', 1.5);
grid on; xlabel('y^+'); ylabel('\alpha^+');
legend('HS 2009 Pr=400', 'Ma 2015 Pr=50', 'Location', 'best');
title('Two-Layer Model Variants');


%% ========================== Local Functions ==========================

function f = make_tl_model(ReTau, Sc, preset, D)
% Factory returning a function handle f(yPlus) for the chosen dataset "preset".
% Presets control Kre/Ksc/Lsc formulas.

    % Choose coefficients
    [K_Re, K_Sc, L_Sc] = choose_coeffs(ReTau, Sc, preset, D);

    % Bind parameters into a closure (no globals)
    C        = D.C;
    powRe    = D.powRe;
    powSc    = D.powSc;
    smoothFn = D.smoothFun;

    f = @(yPlus) tl_core(yPlus, ReTau, Sc, C, K_Re, K_Sc, L_Sc, powRe, powSc, smoothFn);
end

function alpha_p = tl_core(yPlus, ReTau, Sc, C, K_Re, K_Sc, L_Sc, powRe, powSc, smoothFn)
% Single source of truth for the two-layer formula.

    yPlus = ensure_col(yPlus);

    % logistic switch i(y+) in [0,1]
    i_ind = smoothFn(yPlus, L_Sc);     % 0 => Sc-branch; 1 => Re-branch

    num_sc = (K_Sc .* yPlus) .^ powSc; % (K_Sc y+)^{3.3}
    num_re = (K_Re .* yPlus) .^ powRe; % (K_Re y+)^{3.0}

    blend_num = (1 - i_ind) .* num_sc + i_ind .* num_re;
    denom     = (K_Re .* yPlus).^2 + C.^2;

    alpha_t_p = blend_num ./ denom;            % turbulent part in wall units
    rhs       = 1./Sc + alpha_t_p;             % total diffusivity in wall units
    pref      = 1 + yPlus ./ (ReTau * Sc);     % (1 + y^+/(Re_tau Sc))

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

% Build from JSON and save to MAT
models = build_tl_models_from_config('tl_models_config.json', 'tl_models.mat');

% Use a model
yPlus   = logspace(-2, 3, 400);
alpha50 = models.TLModel_Ma_2015_Pr_50(yPlus);

% Quick plot
loglog(yPlus, alpha50, 'LineWidth', 1.6); grid on
xlabel('y^+'); ylabel('\alpha^+');
title('TLModel\_Ma\_2015\_Pr\_50');

% MATLAB struct can also be used to drive the two-layer model
(* cfg.defaults.C = 10.0;
cfg.models = struct( ...
    'name',   {'TLModel_Test_1','TLModel_Test_2'}, ...
    'ReTau',  {395, 400}, ...
    'Sc',     {100, 50}, ...
    'preset', {'default','ma2015_const'} ...
);
models = build_tl_models_from_config(cfg);
 *)


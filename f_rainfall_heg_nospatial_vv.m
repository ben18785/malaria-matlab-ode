function [t,total,v_t,v_nu] = f_rainfall_heg_nospatial_vv(c_thetaA,c_thetaB,c_e,c_T,c_stochastic,c_chi,c_eta)
% Runs a simulation of the model Ace uses in his paper, with now
% stochasticity present for the rainfall.

%% Convert into the units used in the paper diagrams
c_S0 = 0.15;
c_SH = 0.5;
c_SM = 0.3;
c_omega = 40;
c_kappa = 120;
c_O = c_thetaB*c_S0*c_S0*pi*c_omega/c_kappa;
c_H = (c_thetaA*pi*c_SH*c_SH);


%% Define parameters

c_nu_mean = 0.12*c_O;
c_gamma_j = 0.1;
c_mu_j = 0.1;
c_alpha = (0.05/c_thetaB);
c_mu_m = 0.1;
c_mu_u = 0.1;
c_m = 0.01*pi*c_SM*c_SM;
c_mu_h = 0.1;
c_gamma_h = 0.015*c_H;
c_mu_o = 0.1;

v_parameters = [c_kappa; c_nu_mean; c_e; c_gamma_j; c_mu_j; c_alpha; c_mu_m; c_mu_u; c_m; c_mu_h; c_gamma_h; c_mu_o];
v_init = [1000,2000,0,1000,0,1000,0,0,1000,0];

%% Get the path of the breeding sites, which determines the egg laying rate
dt = (c_T+10)/5000;
v_t = (0:dt:c_T+10-dt)';
if c_stochastic == 0
    v_nu = c_nu_mean*ones(length(v_t),1);
else
    v_nu = c_nu_mean*f_series_ornstein_v(c_T+10,5000,c_chi,c_eta);
end

%% Solve ODE
[t,Y] = ode45(@(t,Y)f_derivative_xshred_rainfall(t,Y,v_parameters,v_t,v_nu),[0,c_T], v_init);

J_x = Y(:,1); J_Y0 = Y(:,2); J_Y1 = Y(:,3); M_Y0 = Y(:,4); M_Y1 = Y(:,5); U = Y(:,6); H_Y0 = Y(:,7);
H_Y1 = Y(:,8); O_Y0 = Y(:,9); O_Y1 = Y(:,10);

total = J_x+J_Y0+J_Y1+M_Y0+M_Y1+U+H_Y0+H_Y1+O_Y0+O_Y1;

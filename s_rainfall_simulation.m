clear; close all; clc;
% Runs a simple simulation of the model Ace uses in his paper. Nothing has
% been changed, this is merely a recapitulation.

%% Define parameters
c_T = 100;
c_nu_mean = 0.12; % Start off the value here
c_kappa = 120;
c_e = 0.6;
c_gamma_j = 0.1;
c_mu_j = 0.1;
c_alpha = 0.05;
c_mu_m = 0.1;
c_mu_u = 0.1;
c_m = 0.01;
c_mu_h = 0.1;
c_gamma_h = 0.015;
c_mu_o = 0.1;

v_parameters = [c_kappa; c_nu_mean; c_e; c_gamma_j; c_mu_j; c_alpha; c_mu_m; c_mu_u; c_m; c_mu_h; c_gamma_h; c_mu_o];
v_init = [1000,1000,1000,1000,1000,1000,1000,1000,1000,1000];

%% Get the path of the breeding sites, which determines the egg laying rate
v_nu = c_nu_mean*f_series_ornstein_v(c_T+10,5000,1,1);
dt = (c_T+10)/5000;
v_t = (0:dt:c_T+10-dt)';

%% Solve ODE
[t,Y] = ode45(@(t,Y)f_derivative_xshred_rainfall(t,Y,v_parameters,v_t,v_nu),[0,c_T], v_init);

J_x = Y(:,1); J_Y0 = Y(:,2); J_Y1 = Y(:,3); M_Y0 = Y(:,4); M_Y1 = Y(:,5); U = Y(:,6); H_Y0 = Y(:,7);
H_Y1 = Y(:,8); O_Y0 = Y(:,9); O_Y1 = Y(:,10);



%% Convert into the units used in the paper diagrams
c_thetaB = 64;
c_S0 = 0.15;
c_omega = 40;
c_kappa = 120;

v_nu_nospatial = v_nu/(c_thetaB*c_S0*c_S0*c_omega/c_kappa);

%% Plot results
subplot(1,2,1),plot(t,M_Y0)
subplot(1,2,2),plot(v_t,v_nu_nospatial)
xlim([0 100])

clear; close all; clc;

c_T = 100;

c_kappa = 120;
c_nu = 0.12;
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

v_parameters = [c_kappa; c_nu; c_e; c_gamma_j; c_mu_j; c_alpha; c_mu_m; c_mu_u; c_m; c_mu_h; c_gamma_h; c_mu_o];
v_init = [1000,1000,1000,0,0,0,0,0,0,0];

[t,Y] = ode45(@(t,Y)f_derivative_xshred_simple(t,Y,v_parameters),[0,c_T], v_init);

J_x = Y(:,1); J_Y0 = Y(:,2); J_Y1 = Y(:,3); M_Y0 = Y(:,4); M_Y1 = Y(:,5); U = Y(:,6); H_Y0 = Y(:,7);
H_Y1 = Y(:,8); O_Y0 = Y(:,9); O_Y1 = Y(:,10);

plot(t,O_Y1)
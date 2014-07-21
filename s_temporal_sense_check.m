clear; close all; clc;
c_T = 1000;
c_chi = 0.01;
c_eta = 0.17;
c_nu_mean = 0.12;

dt = (c_T+10)/5000;
v_t = (0:dt:c_T+10-dt)';
v_nu = c_nu_mean*f_series_ornstein_v(c_T+10,5000,c_chi,c_eta);

plot(v_t,v_nu)
% v_chi = zeros(8,1);
% v_eta = zeros(8,1);
% for i = 1:8
%     v_chi(i) = 0.01*10^(0.25*i-0.25);
%     v_eta(i) = 0.01*10^(0.25*i-0.25);
% end
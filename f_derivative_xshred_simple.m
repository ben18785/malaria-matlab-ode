function dYdt = f_derivative_xshred_simple(t,Y,v_parameters)
% A function which calculates the derivatives of the non-spatial simple
% x-shredder model's variables

J_x = Y(1); J_Y0 = Y(2); J_Y1 = Y(3); M_Y0 = Y(4); M_Y1 = Y(5); U = Y(6); H_Y0 = Y(7);
H_Y1 = Y(8); O_Y0 = Y(9); O_Y1 = Y(10);


c_kappa = v_parameters(1);
c_nu = v_parameters(2);
c_e = v_parameters(3);
c_gamma_j = v_parameters(4);
c_mu_j = v_parameters(5);
c_alpha = v_parameters(6);
c_mu_m = v_parameters(7);
c_mu_u = v_parameters(8);
c_m = v_parameters(9);
c_mu_h = v_parameters(10);
c_gamma_h = v_parameters(11);
c_mu_o = v_parameters(12);

dJ_xdt = c_kappa*c_nu*(O_Y0/2 + ((1-c_e)/2)*O_Y1) - c_gamma_j*J_x - c_mu_j*J_x - c_alpha*J_x*(J_x + J_Y0 + J_Y1);
dJ_Y0dt = c_kappa*c_nu*(O_Y0/2) - c_gamma_j*J_Y0 - c_mu_j*J_Y0 - c_alpha*J_Y0*(J_x + J_Y0 + J_Y1);
dJ_Y1dt = c_kappa*c_nu*(((1+c_e)/2)*O_Y1) - c_gamma_j*J_Y1 - c_mu_j*J_Y1 - c_alpha*J_Y1*(J_x + J_Y0 + J_Y1);
dM_Y0dt = c_gamma_j*J_Y0 - c_mu_m*M_Y0;
dM_Y1dt = c_gamma_j*J_Y1 - c_mu_m*M_Y1;
dUdt = c_gamma_j*J_x - c_mu_u*U - c_m*U*(M_Y0+M_Y1);
dH_Y0dt = c_m*U*M_Y0 + c_nu*O_Y0 - c_mu_h*H_Y0 - c_gamma_h*H_Y0;
dH_Y1dt = c_m*U*M_Y1 + c_nu*O_Y1 - c_mu_h*H_Y1 - c_gamma_h*H_Y1;
dO_Y0dt = -c_nu*O_Y0 - c_mu_o*O_Y0 + c_gamma_h*H_Y0;
dO_Y1dt = -c_nu*O_Y1 - c_mu_o*O_Y1 + c_gamma_h*H_Y1;

dYdt = [dJ_xdt; dJ_Y0dt; dJ_Y1dt; dM_Y0dt; dM_Y1dt; dUdt; dH_Y0dt; dH_Y1dt; dO_Y0dt; dO_Y1dt];
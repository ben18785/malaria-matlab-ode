function cell_results = f_temporal_variance_cell(c_e,c_T,c_thetaA,c_thetaB)
% A function which calculates the mean, variance of rainfall across
% different chi and eta. It also estimates whether the population has
% survived after c_T iterations.

c_stochastic = 1;

n_pow = 8;
v_chi = zeros(n_pow,1);
v_eta = zeros(n_pow,1);

for i = 1:n_pow
    v_chi(i) = 0.01*10^(0.25*i-0.25);
    v_eta(i) = 0.01*10^(0.25*i-0.25);
end

cell_results = cell(3,1);
m_rainfall_mean = zeros(n_pow,n_pow);
m_rainfall_var = zeros(n_pow,n_pow);
m_survive = zeros(n_pow,n_pow);

k = 1;
for i = 1:n_pow
    for j = 1:n_pow   
        [t,total,v_t,v_rainfall] = f_rainfall_heg_nospatial_vv(c_thetaA,c_thetaB,c_e,c_T,c_stochastic,v_chi(i),v_eta(j));
        
        if total(end) > 100
            m_survive(i,j) = 1;
        end
        
        m_rainfall_mean(i,j) = mean(v_rainfall);
        m_rainfall_var(i,j) = std(v_rainfall)^2;
        
        
        k
        k = k + 1;
    end
end

cell_results{1,1} = m_rainfall_mean;
cell_results{2,1} = m_rainfall_var;
cell_results{3,1} = m_survive;

clear; close all; clc;

c_e = 0;
c_T = 2000;
c_stochastic = 1;
c_thetaA = 16;
c_thetaB = 16;

n_pow = 8;
v_chi = zeros(n_pow,1);
v_eta = zeros(n_pow,1);

for i = 1:n_pow
    v_chi(i) = 0.01*10^(0.25*i-0.25);
    v_eta(i) = 0.01*10^(0.25*i-0.25);
end

cell_total = cell(n_pow^2,1);
cell_time = cell(n_pow^2,1);
cell_rainfall_time = cell(n_pow^2,1);
cell_rainfall_precip = cell(n_pow^2,1);

v_survive = zeros(n_pow,n_pow);
k = 1;
for i = 1:n_pow
    for j = 1:n_pow   
        [t,total,v_t,v_rainfall] = f_rainfall_heg_nospatial_vv(c_thetaA,c_thetaB,c_e,c_T,c_stochastic,v_chi(i),v_eta(j));
        cell_total{k} = total;
        cell_time{k} = t;
        cell_rainfall_time{k} = v_t;
        cell_rainfall_precip{k} = v_rainfall;
        
        if total(end) > 100
            v_survive(i,j) = 1;
        end
        k
        k = k + 1;
    end
end

hmap = HeatMap(v_survive,'RowLabels',v_chi,'ColumnLabels',v_eta);
addYLabel(hmap,'Chi');
addXLabel(hmap,'Eta');


for i = 1:n_pow^2
   subplot(1,2,1),plot(cell_rainfall_time{i},cell_rainfall_precip{i})
   subplot(1,2,2),plot(cell_time{i},cell_total{i})
   pause(1)
end

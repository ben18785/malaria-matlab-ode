clear; close all; clc;


c_e = 0;
c_T = 2000;

v_thetaA = zeros(4,1);
v_thetaB = zeros(4,1);
n_pow = 7;
for i = 1:n_pow
    v_thetaA(i) = 2^(0.5*i+0.5);
    v_thetaB(i) = 2^(0.5*i+3.5);
end

cell_total = cell(n_pow^2,1);
cell_time = cell(n_pow^2,1);
v_survive = zeros(n_pow,n_pow);
k = 1;
for i = 1:n_pow
    for j = 1:n_pow   
        [t,total] = f_simple_heg_nospatial_vv(v_thetaA(i),v_thetaB(j),c_e,c_T);
        cell_total{k} = total;
        cell_time{k} = t;
        if total(end) > 100
            v_survive(i,j) = 1;
        end
        k
        k = k + 1;
    end
end

hmap = HeatMap(v_survive,'RowLabels',v_thetaA,'ColumnLabels',v_thetaB);
addYLabel(hmap,'Feeding sites');
addXLabel(hmap,'Breeding sites');


% for i = 1:16
%    plot(cell_time{i},cell_total{i})
%    pause(1)
% end

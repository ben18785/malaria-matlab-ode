clear; close all; clc;
% A script which iterates through spatial parameters, with subiterations
% through temporal parameters at each set. 

v_spatial_params = [8,16; 4,32; 2,64; 8,64];
cell_parameter_sweep = cell(4,1);
c_e = 0;
c_T = 2000;

for i = 1:4
    i
    cell_parameter_sweep{i} = f_temporal_variance_cell(c_e,c_T,v_spatial_params(i,1),v_spatial_params(i,2));
end
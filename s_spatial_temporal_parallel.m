clear; clc; close all;

% Find the maximum number of cores which the computer has
a = feature('numCores');

if matlabpool('size') < a
    matlabpool open
end

cn_iterations = 50;
cell_iterations = cell(cn_iterations,1);

parfor n = 1:cn_iterations
    n
    cell_iterations{n} = f_rainfall_temporal_spatial_cell();
end
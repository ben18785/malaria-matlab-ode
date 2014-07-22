clear; close all; clc; close hidden;

n_pow = 8;
v_chi = zeros(n_pow,1);
v_eta = zeros(n_pow,1);

for i = 1:n_pow
    v_chi(i) = 0.01*10^(0.25*i-0.25);
    v_eta(i) = 0.01*10^(0.25*i-0.25);
end



load('temporal_spatial.mat')

m_results1 = zeros(8,8);
m_results2 = zeros(8,8);
m_results3 = zeros(8,8);
m_results4 = zeros(8,8);

m_mean1 = zeros(8,8);
m_mean2 = zeros(8,8);
m_mean3 = zeros(8,8);
m_mean4 = zeros(8,8);

m_var1 = zeros(8,8);
m_var2 = zeros(8,8);
m_var3 = zeros(8,8);
m_var4 = zeros(8,8);


for i = 1:50
    cell_temporary = cell_iterations{i};
    for j = 1:4
        cell_temporary_small = cell_temporary{j};
        
        switch j
            case 1
                m_mean1 = m_mean1 + cell_temporary_small{1,1};
                m_var1 = m_var1 + cell_temporary_small{2,1};
                m_results1 = m_results1 + cell_temporary_small{3,1};
                
            case 2
                m_mean2 = m_mean2 + cell_temporary_small{1,1};
                m_var2 = m_var2 + cell_temporary_small{2,1};
                m_results2 = m_results2 + cell_temporary_small{3,1};
                
            case 3
                m_mean3 = m_mean3 + cell_temporary_small{1,1};
                m_var3 = m_var3 + cell_temporary_small{2,1};
                m_results3 = m_results3 + cell_temporary_small{3,1};
                
            case 4
                m_mean4 = m_mean4 + cell_temporary_small{1,1};
                m_var4 = m_var4 + cell_temporary_small{2,1};
                m_results4 = m_results4 + cell_temporary_small{3,1};
                
        end
    end
end

% Now take the average
m_mean1 = m_mean1/50;
m_mean2 = m_mean2/50;
m_mean3 = m_mean3/50;
m_mean4 = m_mean4/50;

m_var1 = m_var1/50;
m_var2 = m_var2/50;
m_var3 = m_var3/50;
m_var4 = m_var4/50;


m_results1 = m_results1/50;
m_results2 = m_results2/50;
m_results3 = m_results3/50;
m_results4 = m_results4/50;

v_spatial_params = [8,16; 4,32; 2,64; 8,64];

hmap = HeatMap(m_results4,'RowLabels',v_chi,'ColumnLabels',v_eta);
addYLabel(hmap,'Chi');
addXLabel(hmap,'Eta');

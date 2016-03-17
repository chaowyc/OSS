%% 最小二乘法
%   数据集描述
%   数据集趋势：m(x) = a(1 - (1 + b*x)exp(-b*x))
%   目标函数： J(theta) = (1 / n)sum((m(x) - y)^2)
%   梯度下降法
% (C) 哈尔滨工业大学 计算机科学与技术-移动与容错计算中心

%% Get the data from files and scatter it
data=importdata('lab.xlsx');
x = zeros(size(data, 1), 0);
y = zeros(size(data, 1), 0);
x(:, 1) = data(:, 1);
y(:, 1) = data(:, 2);
figure;
scatter(x, y, 'k');
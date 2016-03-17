function [] = getFun3(mt, t1, t2, ratio)
%% 计算非线性方程组 两个变点的
% input:
%   mt:
%   t1:第一个变点
%   t2:第二个变点
%   ration: 训练数据占数据集的比例
%(C) 哈尔滨工业大学 计算机科学与技术-移动与容错计算中心

%% 计算两个变点的B(t) 
bugcount = mt(1:ceil(length(mt) * ratio));
b1 = sym('b1', 'real');
b2 = sym('b2', 'real');
B = zeros(length(bugcount), 1);

B(1) = (1 + b1) * exp(-b1);
for t = 2 : length(bugcount)    
    if t < t1
        B(t) = (1 + b1 * t).*exp(-b1 * t);
    elseif (t >= t1) && (t < t2)
        B(t) = (1 + b1 * t1 + b2 * (t - t1)).*exp(-b1 * t1 - b2 * (t - t1));
    elseif t >= t2
        B(t) = (1 + b1 * t1 + b2 * (t2 - t1)).*exp(-b1 * t1 - b2 * (t2 - t1) - b3 * (t - t2));
    end
end
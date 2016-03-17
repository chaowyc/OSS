function [time, mt] = simFor1CP(parameter)
% num = 500;   %´íÎóÊı
% a = 440;
% t1 = 113;
% b1 = 0.010;
% b2 = 0.003;
num = parameter(11, 1)
a = parameter(1, 1)
b1 = parameter(3, 1)
b2 = parameter(4, 1)
t1 = parameter(9, 1)
time = event1CP(num,a,b1,b2,t1);
for j = 1:num
    if(j <= t1)
        mt(j,1) = a*(1-(1+b1*j)*exp(-b1*j));
    else
        mt(j,1) = a*(1-(1+b1*t1)*exp(-b1*t1-b2*(j-t1)));
    end
end
% figure;
% plot(time);
% hold on;
% plot([1:num]',mt);
% title('1CP');
end
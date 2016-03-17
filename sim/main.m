% %G-O
% clear;
% num = 400;   %´íÎóÊı
% a = 497.8;
% b = 0.002;
% t = [1:num]';
% time(1,1) = eventGO(0,a,b);
% for i = 2:num
%     tt = time(i-1,1);
%     time(i,1) = eventGO(tt,a,b);
% end
% lt = time(num,1);
% for j = 1:lt
%     mt(j,1) = a*(1-exp(-b*j));
% end
% figure;
% plot(time,t,[1:lt]',mt);
% title('G-O');
% 
% %DDS
% clear;
% num = 100;   %´íÎóÊı
% a = 110.8;
% b = 0.026;
% t = [1:num]';
% time(1,1) = eventDDS(0,a,b);
% for i = 2:num
%     tt = time(i-1,1);
%     time(i,1) = eventDDS(tt,a,b);
% end
% lt = time(num,1);
% for j = 1:lt
%     mt(j,1) = a*(1-(1+b*j)*exp(-b*j));
% end
% %[time,t] = simulated(time, t);
% figure;
% plot([1:lt]',mt);
% title('DDS');

%1CP
% clear;
% num = 100;   %´íÎóÊı
% a = 2692;
% t1 = 46;
% b1 = 0.003;
% b2 = 0.002;
% t = [1:num]';
% time(1,1) = event1CP(0,a,b1,b2,t1);
% for i = 2:num
%     tt = time(i-1,1);
%     time(i,1) = event1CP(tt,a,b1,b2,t1);
% end
% lt = floor(time(num,1));
% for j = 1:lt
%     if(j <= t1)
%         mt(j,1) = a*(1-(1+b1*j)*exp(-b1*j));
%     else
%         mt(j,1) = a*(1-(1+b1*t1)*exp(-b1*t1-b2*(j-t1)));
%     end
% end
% figure;
% plot(time,t,[1:lt]',mt);
% title('1CP');

%2CP
clear;
num = 240;   %´íÎóÊı
a = 255;
t1 = 138;
t2 = 178;
b1 = 0.005;
b2 = 0.077;
b3 = 0.05;
t = [1:num]';
time(1,1) = event2CP(0,a,b1,b2,b3,t1,t2);
for i = 2:num
    tt = time(i-1,1);
    time(i,1) = event2CP(tt,a,b1,b2,b3,t1,t2);
end
lt = floor(time(num,1));
for j = 1:lt
    if(j <= t1)
        mt(j,1) = a*(1-(1+b1*j)*exp(-b1*j));
    elseif(j <= t2)
        mt(j,1) = a*(1-(1+b1*t1+b2*(j-t1))*exp(-b1*t1-b2*(j-t1)));
    else
        mt(j,1) = a*(1-(1+b1*t1+b2*(t2-t1)+b3*(j-t2))*exp(-b1*t1-b2*(t2-t1)-b3*(j-t2)));
    end
end
figure;
plot(time,t,[1:lt]',mt);
title('2CP');


function [ SimMt ] = event1CP(num, a, b1, b2, t1)
%EVENT1CP Summary of this function goes here
%   Detailed explanation goes here

dt = 0.01;
event = 0;
tmp = 0.0
t = 0
SimMt = zeros(num, 1);
while(t < num)
    while(tmp <= t)
        if(tmp <= t1)
            x = a*b1*b1*tmp*exp(-b1*tmp);
        else
            x = a*b2*(1+b1*t1)*exp(-b1*t1-b2*(tmp-t1));
        end
        rad = rand(1,1);
        if(rad < x*dt)
            event = event+1;
        end
        tmp = tmp+dt;
    end
    tmp = t;
    t = t + 1;
    SimMt(t, 1) = event
end
end


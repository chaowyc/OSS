function [ t ] = event1CP(t, a, b1, b2, t1)
%EVENT1CP Summary of this function goes here
%   Detailed explanation goes here

dt = 0.1;
event = 0;
while(event == 0)
    if(t <= t1)
        x = a*b1*b1*t*exp(-b1*t);
    else
        x = a*b2*(1+b1*t1)*exp(-b1*t1-b2*(t-t1));
    end
    rad = rand(1,1);
    if(rad < x*dt)
        event = event+1;
    end
    t = t+dt;
end


end


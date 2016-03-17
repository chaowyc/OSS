function [ SimMt ] = eventDDS( num, a, b )
dt = 0.01;
event = 0;
t = 0;
tmp = 0.0;
SimMt = zeros(num, 1);
while(t < num)
    while(tmp <= t)
        x = a*b*b*tmp*exp(-b*tmp);
        rad = rand(1,1);
        if(rad < x*dt)
            event = event + 1;
        end
        tmp = dt+tmp;
    end
    tmp = t;
    t = t + 1;
    SimMt(t, 1) = event;
end
end






function [ cfit ] = GetFit( pram ,mt)
t1=pram(1);t2=pram(2);
x=1:length(mt);
M_beta(1)=pram(3);M_beta(2)=pram(4);M_beta(3)=pram(5);M_beta(4)=pram(6);
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if(t2>0)
    c1 = M_beta(1).*(1-(1+M_beta(2)*x(1:t1)).*exp(-M_beta(2)*x(1:t1)));
    c2 = M_beta(1).*(1-(1+M_beta(2)*t1+M_beta(3)*(x((t1+1):t2)-t1)).*exp(-M_beta(2)*t1-M_beta(3)*(x((t1+1):t2)-t1)));
    c3 = M_beta(1).*(1-(1+M_beta(2)*t1+M_beta(3)*(t2-t1)).*exp(-M_beta(2)*t1-M_beta(3)*(t2-t1)).*exp(-M_beta(4)*(x((t2+1):length(mt))-t2)));
    cfit(1:t1)=c1;
    cfit((t1+1):t2)=c2;
    cfit((t2+1):length(mt))=c3;
else
    c1 = M_beta(1).*(1-(1+M_beta(2)*x(1:t1)).*exp(-M_beta(2)*x(1:t1)));
    c2 = M_beta(1).*(1-(1+M_beta(2)*t1+M_beta(3)*(x((t1+1):length(mt))-t1)).*exp(-M_beta(2)*t1-M_beta(3)*(x((t1+1):length(mt))-t1)));
    cfit(1:t1)=c1;
    cfit((t1+1):length(mt))=c2;
end
figure;
plot(mt,'k-','LineWidth',1)
hold on;
plot(cfit,'g-','LineWidth',1)



end


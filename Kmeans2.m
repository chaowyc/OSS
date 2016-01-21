function [ p,returna,returnc ] = Kmeans( FindTime,datetype)
tmp=datenum(FindTime);
for i=1:length(tmp)
    tmp2{i,1}=datestr(tmp(i,1),'yyyy-mm-dd');
end
findDate=datenum(tmp2);
firstDay=min(findDate);
len=length(findDate);
lastDate=max(findDate)-firstDay;
date=findDate-firstDay;
mt=zeros(lastDate,1);
for i=1:lastDate
    for j=1:len
        if date(j,1)<=i
            mt(i,1)=mt(i,1)+1;
        else
            break;
        end
    end
end


mttmp(1,1)=mt(1,1);
if(strcmp(datetype,'month'))
    for i=31:30:length(mt)
        mttmp((i+29)/30,1)=mt(i,1);
    end
end
if(strcmp(datetype,'week'))
    for i=8:7:length(mt)
        mttmp((i+6)/7,1)=mt(i,1);
    end
end
if(strcmp(datetype,'day'))
    mttmp=mt;
end
clear mt;
mt=mttmp;
clear mttmp;




past=0;
now=0;
ay=min(mt);
by=ceil((min(mt)+max(mt))/2);
cy=max(mt);
ax=0;cx=length(mt);
for i=1:length(mt)
    if mt(i,1)==ay &&ax==0
        ax=i;
    elseif mt(i,1)==cy && cx==0
        cx=i;
    end
end


for i=1:length(mt)
    x(i,1)=i;
    y(i,1)=mt(i,1);
end
for k=1:1:3000
    a(1,1)=x(1,1);
    a(1,2)=y(1,1);
   
    c(1,1)=x(1,1);
    c(1,2)=y(1,1);
    alen=0;
   
    clen=0;
    aj=1;
  
    cj=1;
    for i=1:1:length(x)%E²½
        
        alen=((abs(x(i,1)-ax)).^0.25+(abs(y(i,1)-ay)).^0.25).^4;
    
        clen=((abs(x(i,1)-cx)).^0.25+(abs(y(i,1)-cy)).^0.25).^4;
        if alen<=clen
            a(aj,1)=x(i,1);
            a(aj,2)=y(i,1);
            aj=aj+1;
       
        elseif clen<alen
            c(cj,1)=x(i,1);
            c(cj,2)=y(i,1);
            cj=cj+1;
        end
        now=now+alen+clen;
    end
    ax=mean(a(:,1));
    ay=mean(a(:,2));
  
    cx=mean(c(:,1));
    cy=mean(c(:,2));
    now=now/length(x);
    if abs(now-past)<0.01
        break;
    else
        past=now;
        now=0;
    end 
end
p=[c(1,1)]

 plot(a(:,1),a(:,2),'r.',c(:,1),c(:,2),'g.','LineWidth',1);
  xlabel('Time(weeks)','fontsize',12);
    ylabel('cumulative number of faults per week','fontsize',12);
returna=a(:,2);
% returnb=b(:,2);
returnc=c(:,2);
end


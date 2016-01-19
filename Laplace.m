function [ y ] = Laplace( FindTime ,datetype)
tmp=datenum(FindTime);
j=1;
for i=1:length(tmp)
    tmp2{j,1}=datestr(tmp(i,1),'yyyy-mm-dd');
    j=j+1;
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
bugcount=mt(1:ceil(length(mt)*1));
weekbug(1,1)=bugcount(1,1);
for i=2:1:length(bugcount)
    weekbug(i,1)=bugcount(i,1)-bugcount(i-1,1);
end
tmp(1,1)=0;
for i=2:1:length(bugcount)
    tmp(i,1)=tmp(i-1,1)+(i-1)*weekbug(i,1);
end
u=zeros(length(bugcount),1);
for i=1:1:length(bugcount)
    u(i,1)=(tmp(i,1)/bugcount(i,1)-0.5*(i-1))./sqrt((i^2)./(12*bugcount(i,1)));
end
y=u;
end


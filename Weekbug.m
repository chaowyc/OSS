function [ y ] = Weekbug( mt ,datetype)

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



bugcount=mt(1:ceil(length(mt)*1));%ceil����ȡ�� 
%fprintf('%d \n', bugcount);

weekbug(1,1)=bugcount(1,1);
for i=2:1:length(bugcount) 
    weekbug(i,1)=bugcount(i,1)-bugcount(i-1,1);
end
%%�õ���һ����ǰһ���Bug�����Ĳ�ֵ
for i=length(weekbug):-1:1
    if weekbug(i,1)~=0 %~= ���Ⱥ�
        break;
    end
end

y=weekbug(1:i,1);

end


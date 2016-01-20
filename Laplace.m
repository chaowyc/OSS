function [ y, changePointCount ] = Laplace( FindTime ,dateType)
%% Laplace检测方法核心
%   计算每周的bug数目，然后根据公式u(i) = c - m / sqrt((t^2 - 1) / 12N(t)) 详见论文p14
%   输入：失效发现时间
%   输出：U(t)
%(C) 哈尔滨工业大学 计算机科学与技术-移动与容错计算中心

%% 通过mt计算每周的bug数目
[ mt ] = getMT( FindTime ,dateType); 
bugcount=mt(1:ceil(length(mt)*1));
weekbug(1,1)=bugcount(1,1);
for i=2:1:length(bugcount)
    weekbug(i,1)=bugcount(i,1)-bugcount(i-1,1);
end

%% 计算c
tmp(1,1)=0;
for i=2:1:length(bugcount)
    tmp(i,1)=tmp(i-1,1)+(i-1)*weekbug(i,1);
end

%% 计算 u(i)
u=zeros(length(bugcount),1);
for i=1:1:length(bugcount)
    u(i,1)=(tmp(i,1)/bugcount(i,1)-0.5*(i-1))./sqrt((i^2)./(12*bugcount(i,1)));
end
y=u;

%% 根据U的趋势判断变点的个数
maxu = max(u);
lastu = u(length(bugcount), 1);
changePointCount = 1;
if maxu > 0 &&  lastu > 0
    changePointCount = 1;
elseif maxu > 0 && lastu < 0
    changePointCount = 2;
end

end
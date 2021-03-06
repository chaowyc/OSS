function C_chart_Draw(filename,datatype)
%% 绘制控制图
% 先画出每周的bug数的变化趋势图，然后在此基础上绘制三条控制线
%(C) 2015-2016 哈尔滨工业大学 计算机科学与技术-移动与容错中心

% files={'AMQ 5.3.0.xlsx','AMQ 5.4.0.xlsx','AMQ 5.6.0.xlsx','AMQ 5.9.0.xlsx','AMQ 5.11.0.xlsx','Zookeeper 3.0.0.xlsx','Zookeeper 3.3.3.xlsx','Zookeeper 3.4.0.xlsx','Zookeeper 3.4.5.xlsx','Zookeeper 3.5.0.xlsx'};
%files={'AMQ 5.3.0.xlsx'};
% for i=1:1:length(files)
%     filename=files{1,i};
    findDate= getFindDate(filename);
    mt=getMT(findDate,'day'); 
    figure;
    
    
    %      hold on;
    [y,y1,y2,y3]=Weekbug3( mt ,datatype);
    plot(y,'k','LineWidth',1)
    hold on
    plot(y1(1:length(y)),'k-.','LineWidth',1)
    hold on
    plot(y2(1:length(y)),'k-.','LineWidth',1)
    hold on
    plot(y3(1:length(y)),'k-.','LineWidth',1)
    tmp3= regexp( filename, ' |.xlsx', 'split'); %regexp匹配正则表达式
    tmp=['Open source software(',tmp3{1,1},') Release ',tmp3{1,2}];
    title(tmp,'fontsize',12);
    xlabel(['Time(',datatype,')'],'fontsize',12);
    ylabel(['cumulative number of faults per ',datatype],'fontsize',12);
    %     hold on;
    
% end
end
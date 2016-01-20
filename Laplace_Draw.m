function Laplace_Draw(filename,datetype)
%% 根据Laplace核心函数的返回结果绘制图像
%(C)哈尔滨工业大学 计算机科学与技术-移动与容错计算中心

% files={'AMQ 5.3.0.xlsx','AMQ 5.4.0.xlsx','AMQ 5.6.0.xlsx','AMQ 5.9.0.xlsx','AMQ 5.11.0.xlsx','Zookeeper 3.0.0.xlsx','Zookeeper 3.3.3.xlsx','Zookeeper 3.4.0.xlsx','Zookeeper 3.4.5.xlsx','Zookeeper 3.5.0.xlsx'};
% files={'AMQ 5.4.0.xlsx'};
% for i=1:1:length(files)

%     filename=files{1,i};
    findDate= getFindDate(filename);
%     mt=getMT(findDate,'day');
    figure; 
    [ y, changePointCount ] = Laplace( findDate,datetype );
    tmp3= regexp( filename, ' |.xlsx', 'split');
    tmp=['Open source software(',tmp3{1,1},') Release ',tmp3{1,2}];
    title(tmp,'fontsize',12);
    xlabel(['Time(',datetype,')'],'fontsize',12);
    ylabel('U(t)','fontsize',12);
    hold on;
    zero=zeros(1,length(y));
    plot(zero,'k:');
    plot(y,'k-');
        
end
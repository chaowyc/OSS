filename='AMQ 5.3.0.xlsx';  %这里输入文件名
dateType='week';%按什么时间段进行统计,可取参数：week/month/day

[FindTime]=getFindDate(filename);%输入：excel文件，要求第E列为故障发现时间 统一时间格式
%%%%%%%%%%%%%%%%绘制部分%%%%%%%%%%%%%%%%
%绘制m(t)
 [ mt ] = getMT( FindTime ,dateType); 
figure;
plot(mt,'k-');
title('函数mt');
%绘制ControlChart
C_chart_Draw(filename,dateType);
%绘制Laplace_Draw
Laplace_Draw(filename,dateType);
%绘制2段Kmeans----返回的p是拐点,returna,returnb,returnc是分段后的累计故障数
% [ p,returna,returnb ] = Kmeans2( FindTime,dateType);
%绘制3段Kmeans----返回的p是拐点,returna,returnb,returnc是分段后的累计故障数
%[ p,returna,returnb,returnc ] = Kmeans( FindTime,dateType);

%%%%%%%%%%%%%%%%拟合部分%%%%%%%%%%%%%%%%
%!!!!!需要调初始参数的部分
%三段拟合 两段delayed+一段G-O
%输入参数：a_1,b_1,b_2,b_3为初始值，a_0,b1_0,b2_0,b3_0为迭代增量，
%         t1,t2为分段点，canshu是训练集的比例
%输出：anlysize_result=[SSE;MSE;RMSE;R_squre]为拟合效果检验
%      answer为得到的拟合参数以及似然函数最大值
%      y为拟合后的累积故障数
%当answer的最后一个参数最大时认为得到了最优的参数估计

%主要参数
 a_1=250;
 b_1=0.003;
 b_2=0.051;
 b_3=0.06;
%主要参数

 t1=161;
 t2=193;
 
 a_0=0.1;
 b1_0=0.0001;
 b2_0=0.0001;
 b3_0=0.001;
 
 canshu=0.9;
[ ~ ,anlysize_result,answer] =MLE_DDG( a_1,b_1,b_2,b_3,a_0,b1_0,b2_0,b3_0,t1,t2,canshu,FindTime,dateType)

%y->~，节省时间
 
%得到最优参数后，可以使用下面的代码将拟合前和拟合后的进行比较 
%黑线为原始数据曲线，绿线为拟合数据曲线
% pram=[t1,t2,answer(1),answer(2),answer(3),answer(4)];
[ mt ] = getMT( FindTime ,dateType);
% [ cfit ] = GetFit( pram,mt);




% figure;

% plot(y);
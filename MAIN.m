filename='AMQ 5.3.0.xlsx';  %���������ļ���
dateType='week';%��ʲôʱ��ν���ͳ��,��ȡ������week/month/day

[FindTime]=getFindDate(filename);%���룺excel�ļ���Ҫ���E��Ϊ���Ϸ���ʱ�� ͳһʱ���ʽ
%%%%%%%%%%%%%%%%���Ʋ���%%%%%%%%%%%%%%%%
%����m(t)
 [ mt ] = getMT( FindTime ,dateType); 
figure;
plot(mt,'k-');
title('����mt');
%����ControlChart
C_chart_Draw(filename,dateType);
%����Laplace_Draw
Laplace_Draw(filename,dateType);
%����2��Kmeans----���ص�p�ǹյ�,returna,returnb,returnc�Ƿֶκ���ۼƹ�����
% [ p,returna,returnb ] = Kmeans2( FindTime,dateType);
%����3��Kmeans----���ص�p�ǹյ�,returna,returnb,returnc�Ƿֶκ���ۼƹ�����
%[ p,returna,returnb,returnc ] = Kmeans( FindTime,dateType);

%%%%%%%%%%%%%%%%��ϲ���%%%%%%%%%%%%%%%%
%!!!!!��Ҫ����ʼ�����Ĳ���
%������� ����delayed+һ��G-O
%���������a_1,b_1,b_2,b_3Ϊ��ʼֵ��a_0,b1_0,b2_0,b3_0Ϊ����������
%         t1,t2Ϊ�ֶε㣬canshu��ѵ�����ı���
%�����anlysize_result=[SSE;MSE;RMSE;R_squre]Ϊ���Ч������
%      answerΪ�õ�����ϲ����Լ���Ȼ�������ֵ
%      yΪ��Ϻ���ۻ�������
%��answer�����һ���������ʱ��Ϊ�õ������ŵĲ�������

%��Ҫ����
 a_1=250;
 b_1=0.003;
 b_2=0.051;
 b_3=0.06;
%��Ҫ����

 t1=161;
 t2=193;
 
 a_0=0.1;
 b1_0=0.0001;
 b2_0=0.0001;
 b3_0=0.001;
 
 canshu=0.9;
[ ~ ,anlysize_result,answer] =MLE_DDG( a_1,b_1,b_2,b_3,a_0,b1_0,b2_0,b3_0,t1,t2,canshu,FindTime,dateType)

%y->~����ʡʱ��
 
%�õ����Ų����󣬿���ʹ������Ĵ��뽫���ǰ����Ϻ�Ľ��бȽ� 
%����Ϊԭʼ�������ߣ�����Ϊ�����������
% pram=[t1,t2,answer(1),answer(2),answer(3),answer(4)];
[ mt ] = getMT( FindTime ,dateType);
% [ cfit ] = GetFit( pram,mt);




% figure;

% plot(y);
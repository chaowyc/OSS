### 工具箱
目标功能：
1. 生成指定模型的仿真数据，并保存
2. 进行指定模型的指定方法(LSE MLE Bayes)的参数拟合。
3. PLR & U-plot

使用前操作：
<pre>
<code>
	1. git clone https://github.com/chaowyc/OSS.git
	2. 打开MATLAB 解释器 >> mainGUI
</code>
</pre>

### 目前功能使用介绍
实现生成指定模型的仿真数据。
界面：
![](http://i.imgur.com/sIF1cFP.png)

<pre>
<code>

1. 通过下拉菜单选定仿真数据的模型
2. 参数区域填入指定模型的参数
具体:
a 后面两个编辑区的意义依次是：a的值 |  a0的值(MLE的时候会用到)
b 后面六个编辑区的意义依次是：
		b1 | b2 | b2 | b1_0 | b2_0 | b3_0
		b1_0 | b2_0 | b3_0 会在MLE的时候用到
t 后面两个编辑区的意义依次是：
t1 | t2
day 表示整个故障发现时常，单位是day


举例说明：
仿真DSS模型数据
1. 下拉菜单 选定 DSS
2. DSS模型需要三个参数 a b day
依次在相应的位置上填入数值。这里a = 137.2  b = 0.156 day = 100
3. simulation 
4. 仿真结果显示在绘图区，红色曲线为仿真结果，蓝色曲线为函数实际趋势
</code>
</pre>

### 各个模型参数及结果
#### GO
参数：
<pre>
<code>
a = 497.8
b = 0.016
num = 400
</code>
</pre>
结果：
![](http://i.imgur.com/Mq8xesj.png)

#### DSS
参数
<pre>
<code>
a = 137.2
b = 0.156
num = 100
</code>
</pre>

结果：
![](http://i.imgur.com/7t19ebU.png)

#### 1CP
参数：
<pre>
<code>
a = 440
t1 = 113
b1 = 0.010
b2 = 0.003
num = 500
</code>
</pre>
结果：
![](http://i.imgur.com/13b8woP.png)

#### 2CP
<pre>
<code>
num = 200; 
a = 89.4;
t1 = 84;
t2 = 150;
b1 = 0.018;
b2 = 0.245;
b3 = 0.072;
</code>
</pre>

结果：
![](http://i.imgur.com/rYgmh3E.png)

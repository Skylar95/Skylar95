---
layout: post
title: 矩的理解
date: 2017-3-06
categories: blog
tags: [Math]
description: 图像相关数学知识
---

* content
{:toc}

# 矩意义的理解及与矩阵的区别

&emsp;&emsp;之前在写一个小正方体的位姿估计程序，把矩的概念了解了一下，刚好随机过程老师又提到了，就当成课外作业彻底弄懂。

## 矩

### 物理意义
&emsp;&emsp;数学中矩的概念来自物理学。在物理学中，矩是表示距离和物理量乘积的物理量，表征物体的空间分布。由其定义，矩通常需要一个参考点（基点或参考系）来定义距离。如力和参考点距离乘积得到的力矩（或扭矩），原则上任何物理量和距离相乘都会产生力矩，质量，电荷分布等。
<br>单个点的力矩：
<center>$ \mu_n=r^n Q$ </center>
<br>多个点则是积分得空间密度
<center>$ \mu_n=\int r^n \rho(r) \mathrm{d}r $</center>
<br>**如果点表示质量**，则第零矩是总质量，一阶矩除以总质量是质量，二阶矩是
转动惯量
<center>$ I=r^2 m $
	$ \sum_i r_i^2 m_i$
</center>
<br>还有一个多极矩的概念，设计到极坐标系和球面坐标，就不多说了[link](https://en.wikipedia.org/wiki/Moment_(physics))

### 数学意义
&emsp;&emsp;矩是物体形状识别的重要参数指标。在统计学中，矩表征随机量的分布。如一个“二阶矩”在一维上可测量其“宽度”，在更高阶的维度上由于其使用于橢球的空间分布，我们还可以对点的云结构进行测量和描述。其他矩用来描述诸如与均值的偏差分布情况（偏态），或峰值的分布情况（峰态） 

定义在实数域的实函数相对于值c的n阶矩为： 
<center>$ \mu '_n=\int_{-\infty}^{\infty}  (x-c)^n \,f(x)\,dx $
</center>
<br>**如果点表示概率密度**，则第零阶矩表示总概率（即1）,1,2,3阶矩依次为以下四项。数学中的概念与物理学中矩的概念密切相关。

- 期望
	<br>随机变量的期望定义为其一阶**原点**矩：
	<center>$E(x)=\int_{-\infty}^{\infty} x\,f(x)\,dx $</center>
	在方差等定义中，期望也成为随机变量的“中心”。
	<br>显然，任何随机变量的i一阶中心据为0。
<br>**对于以下二阶及更高阶的矩，通常使用中心矩（围绕平均值c的矩，均值是一阶矩），而不是原点矩，因为中心矩能更清楚的体现关于分布形状的信息。**
- 方差
	<br>随机变量的方差定义为其二阶中心矩： 
	<center>$ Var(x)=\int_{-\infty}^{\infty} [x-E(x)]^2 \,f(x)\,dx $</center>
> 归一化矩
	<br>归一化n阶中心矩或者说标准矩，是n阶中心矩除以标准差 $\sigma^n $,归一化n阶中心矩为
	<center>$x=\frac{E[(x-\mu)^n]}{\sigma^n} $ </center>
	<br>这些归一化矩是无量纲值，表示独立于任何尺度的线性变化的分布。举个栗子，对于电信号，一阶矩是其DC(直流)电平，二阶矩与平均功率成比例。

- 偏态
	<br>随机变量的偏态（衡量分布不对称性）定义为其三阶中心矩:
	<center>$ S(x)=\int _{-\infty }^{\infty }[x-E(x)]^{3}\,f(x)\,dx$</center>
	<br>需要注意，**任何对称分布偏态为0**，归一化三阶矩被成为偏斜度，向左偏斜（分布尾部在左侧较长）具有负偏度（失效率数据常向左偏斜，如极少量的灯泡会立即烧坏），向右偏斜分布（分布尾部在右侧较长）具有正偏度（工资数据往往以这种方式偏斜，大多数人所得工资较少）。
	![偏态](https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Negative_and_positive_skew_diagrams_%28English%29.svg/400px-Negative_and_positive_skew_diagrams_%28English%29.svg.png)


- 峰度
	<br>一般随机变量的峰度定义为其四阶中心矩与方差平方的比值再减3，减3是为了让正态分布峰度为0，这也被称为超值峰度：
	<center>$$ K(x)=\frac{\int _{-\infty }^{\infty }[x-E(x)]^{4}\,f(x)\,dx}{\sigma^2}-3 $$</center>

>   峰度表示分布的波峰和尾部与正态分布的区别，峰度有助于初步了解数据分布的一般特征。
	<br>完全符合正态分布的数据峰度值为0,及基线。如果样本峰度显著偏离0，就可判断此数据不是正态分布。 

- 混合矩
	<br>混合矩是多个变量的矩，比如协方差，协偏度，协峰度。虽然协方差只有一个，但协偏度和协峰度存在多个。

- 中心转换
	<br>
	$${\displaystyle (x-b)^{n}=(x-a+a-b)^{n}=\sum _{i=0}^{n}{{n} \choose {i}}(x-a)^{i}(a-b)^{n-i}} $$
	<br>所以
	<br>
	$${\displaystyle E[(x-b)^{n}]=\sum _{i=0}^{n}{{n} \choose {i}}E[(x-a)^{i}](a-b)^{n-i}}$$

- 累加性
	<br>当x和y是独立变量时<br>
	$$
	{\displaystyle {\begin{aligned}m_{1}(X+Y)&=m_{1}(X)+m_{1}(Y)\\\operatorname {Var} (X+Y)&=\operatorname {Var} (X)+\operatorname {Var} (Y)\\\mu _{3}(X+Y)&=\mu _{3}(X)+\mu _{3}(Y)\end{aligned}}}
	$$	

- 样本矩
	<br>矩常常通过样本矩来估计，这种方法不需要先估计其概率分布。
	<center>$\mu '_{n}\approx {\frac {1}{N}}\sum _{i=1}^{N}X_{i}^{n}$</center>
	<br>对于任何样本大小，原始样本矩的期望值等于群体的k阶矩（若存在）。

### 图像意义

如果把二值图或灰度图看作是二维密度分布函数，就可把矩技术应用于图像分析中。

### 点云意义


参考：

-- [zh.wiki_矩（数学）](https://zh.wikipedia.org/wiki/%E7%9F%A9_(%E6%95%B8%E5%AD%B8)) 
-- [wiki_moments(math)](https://en.wikipedia.org/wiki/Moment_(mathematics)) 
-- [wiki_moments(physics)](https://en.wikipedia.org/wiki/Moment_(physics))
-- [偏度和峰度如何影响您的分布](http://support.minitab.com/zh-cn/minitab/17/topic-library/basic-statistics-and-graphs/summary-statistics/how-skewness-and-kurtosis-affect-your-distribution/)

（）
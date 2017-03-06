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

# 矩的理解

&emsp;&emsp;之前在写一个小正方体的位姿估计程序，把矩的概念了解了一下，刚好随机过程老师又提到了，就当成课外作业彻底弄懂。

## 矩

### 物理意义
&emsp;&emsp;数学中矩的概念来自物理学。在物理学中，矩是表示距离和物理量乘积的物理量，表征物体的空间分布。由其定义，矩通常需要一个参考点（基点或参考系）来定义距离。如力和参考点距离乘积得到的力矩（或扭矩），原则上任何物理量和距离相乘都会产生力矩，质量，电荷分布等。
<br>单个点的力矩：
<center>$ \mu_n=r^n Q $</center>
<br>多个点则是积分得空间密度
<center>$ \mu_n=\int r^n \rho(r) \mathrm{d}r $</center>
<br>**如果点表示质量**，则第零矩是总质量，一阶矩除以总质量是质量，二阶矩是
转动惯量
<center>$ I=r^2 m $</center>
<center>$ \sum_i r_i^2 m_i$</center>
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
	<center>$ K(x)=\frac{\int _{-\infty }^{\infty }[x-E(x)]^{4}\,f(x)\,dx}{\sigma^2}-3$</center>
	<br>峰度表示分布的波峰和尾部与正态分布的区别，峰度有助于初步了解数据分布的一般特征。
	<br>完全符合正态分布的数据峰度值为0,及基线。如果样本峰度显著偏离0，就可判断此数据不是正态分布。

	![正峰度](http://support.minitab.com/zh-cn/minitab/17/distribution_plot_positive_kurtosis.png)
	![负峰度](http://support.minitab.com/zh-cn/minitab/17/distribution_plot_negative_kurtosis.png) 

- 混合矩
	<br>混合矩是多个变量的矩，比如协方差，协偏度，协峰度。虽然协方差只有一个，但协偏度和协峰度存在多个。

- 中心转换
	<br>由于：<br>
	<center>$(x-b)^n=(x-a+a-b)^n=\sum\limits_{i=0}^n \left( \begin{array}{c} c\\r \end{array} \right) (x-a)^i (a-b)^{n-i} $</center>
	<br>所以：<br>
	<center>$E[(x-b)^n]= \sum\limits_{i=0}^n \left( \begin{array}{c} c\\r \end{array} \right) E[(x-a)^i](a-b)^{n-i} $</center>

- 累加性
	<br>当x和y是独立变量时，<br>
	<center>$m_1(x+y)=m_1(x)+m_1(y) \\ Var(x+y)=Var(x)+Var(y)\\\mu_3(x+y)=\mu_3(x)+\mu_3(y) $ </center>

- 样本矩
	<br>矩常常通过样本矩来估计，这种方法不需要先估计其概率分布。
	<center>$\mu '_{n}\approx {\frac {1}{N}}\sum _{i=1}^{N}X_{i}^{n}$</center>
	<br>对于任何样本大小，原始样本矩的期望值等于群体的k阶矩（若存在）。

### 图像意义

在图像处理，计算机视觉和相关领域中，一个图像矩是图像像素强度的某个特定加权平均（矩），或者是这样的矩的函数，通常选择具有一些有吸引力的特性或解释。
<br>图像矩对于分割之后对象的描述是有用的。通过图像矩得到的图像的简单属性包括面积（或总强度），其质心和关于其方向的信息。

- 原点矩

	<br>对一个二维连续函数$f(x,y)$，第$(p+q)$个点的矩（原点矩）被定义为
	<center>$M_{pq} = \int\limits_{-\infty}^{\infty} \int\limits_{-\infty}^{\infty} x^p y^q \,f(x,y) \,dx \,dy \quad \quad p,q=0,1,2,...$ </center>
	<br>照这个思路，像素强度为$I(x,y)$的灰度图，原点矩为：
	<center>$M_{ij}=\sum\limits_x \sum\limits_y x^i y^i I(x,y)$ </center>
	<br>有些情况下，也可以把图像看成概率密度函数来计算 $\sum\limits_x \sum\limits_y x^i y^i I(x,y)$

> 唯一性定理(Hu[1962])指出，如果$f(x,y)$是分段连续的并且仅在xy平面的有限部分中具有非零值，则存在所有阶的矩，并且矩序列$M_pq$由$f(x,y)$唯一确定。
反之，中心矩$M_pq$唯一确定$f(x,y)$。

> 在实践中，图像被概括为具有几个较低阶矩的函数。

> 举个栗子，Opencv中moment函数从原点矩中获得的简单图像属性
-	面积（二值图）或灰度和（灰度图）：M00
-	质心：$ {\bar{x},\bar{y}}={ \frac{M10}{M00},\frac{M01}{M00} }$ 

```
 	vector<Moments> mu(contours.size() );
	vector<Point2f> mc(contours.size() );
	mu[c] = moments( contours[i], false );
	double area=mu[c].m00 ;
	mc[c] = Point2f( mu[c].m10/mu[c].m00 , mu[c].m01/mu[c].m00 );
	
```

- 中心矩
	<br>中心矩被定义为：
	<center>$\mu_{pq}=\int\limits_{-\infty}^{\infty} \int\limits_{-\infty}^{\infty} (x-\bar{x})^p (y-\bar{y})^q \,f(x,y) \,dx\,dy \quad \bar{x}=\frac{M_{10}}{M_{00}} ,\bar{y}=\frac{M_{01}}{M_{00}} $ </center>
	<br>如果是数字图像，则等式变为
	<center>$\mu_{pq}=\sum\limits_x \sum\limits_y (x-\bar{x})^p (y-\bar{y})^q\,f(x,y)$ </center>
	3阶及以下中心矩依次为：
	<center>$
	\mu_{00}=M_{00},\\ \mu_{01}=0,\\\mu_{10}=0,\\
	\mu_{11}=M_{11}-\bar{x}M_{01}=M_{11}-\bar{y}M_{10},\\
	\mu_{20}=M_{20}-\bar{x}M_{10},\\
	\mu_{02}=M_{02}-\bar{y}M_{01},\\
	\mu_{21}=M_{21}-2\bar{x}M_{11}-\bar{y}M_{20}+2\bar{x}^2M_{01},\\
	\mu_{12}=M_{12}-2\bar{y}M_{11}-\bar{x}M_{02}+2\bar{y}^2M_{10},\\
	\mu_{30}=M_{30}-3\bar{x}M_{20}+2\bar{x}^2M_{10},\\
	\mu_{03}=M_{03}-3\bar{y}M_{02}+2\bar{y}^2M_{01},
	$</center>
	<br>总结出来就是
	<center>$\mu_{pq}=\sum\limits_x \sum\limits_y  \left( \begin{array}{c} p\\m \end{array} \right) \left( \begin{array}{c} q\\n \end{array} \right) (-\bar{x})^{p-m} (-\bar{y})^{q-n} M_{mn} $</center>
	<br>中心矩具有平移不变性

> 举个栗子
<br>图像方向的信息可以通过首先使用二阶中心矩来构造协方差矩阵导出(底下这个式子很明显就是矩阵降维)
<center>
$ \mu'_{20}=\frac{\mu_{20}}{\mu_{00}}=\frac{M_{20}}{M_{00}}-\bar{x}^2 \\
 \mu'_{02}=\frac{\mu_{02}}{\mu_{00}}=\frac{M_{02}}{M_{00}}-\bar{y}^2 \\
 \mu'_{11}=\frac{\mu_{11}}{\mu_{00}}=\frac{M_{11}}{M_{00}}-\bar{x}\bar{y}
$
</center>
<br>其中，图像上一点$I(x,y)$的协方差矩阵为
<center>
$
	cov[I(x,y)]=\begin{bmatrix}
					\mu'_{20} & \mu'_{11} \\
					\mu'_{11} & \mu'_{02}
					\end{bmatrix}
$
</center>
<br>矩阵的特征向量对英语图像强度的长轴和短轴，因此可以从与最大特征值相关联的特征向量的角度朝向最靠近该特征向量的轴提取取向。可以证明，该角度$\theta$可由以下公式得出：
<center>$
	\Theta=\frac{1}{2}arctan\bigg( \frac{2\mu'_{11}}{\mu'_{20}-mu'_{02}} \bigg) \quad \mu'_{20}- \mu'_{02} \neq 0
$</center>
<br>协方差矩阵的特征值可以表示为：
<center>$
	\lambda_i = \frac{\mu'_{20}+\mu'_{02}}{2}  \pm  \frac{\sqrt{4\mu'_{11}^2+(\mu'_{20}+\mu'_{02})^2}}{2}
$</center>


- 矩不变性

	- 平移不变性

	- 尺度不变性

	- 旋转不变性

### 点云意义


参考：

1. [zh.wiki/矩（数学）](https://zh.wikipedia.org/wiki/%E7%9F%A9_(%E6%95%B8%E5%AD%B8)) 
2. [wiki/moments(math)](https://en.wikipedia.org/wiki/Moment_(mathematics)) 
3. [wiki/moments(physics)](https://en.wikipedia.org/wiki/Moment_(physics))
4. [偏度和峰度如何影响您的分布](http://support.minitab.com/zh-cn/minitab/17/topic-library/basic-statistics-and-graphs/summary-statistics/how-skewness-and-kurtosis-affect-your-distribution/)
5. [wiki/Image_moment](https://en.wikipedia.org/wiki/Image_moment)


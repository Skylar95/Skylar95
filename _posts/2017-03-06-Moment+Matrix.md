---
layout: post
title: 矩和矩阵
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
&emsp;&emsp;数学中矩的概念来自物理学。在物理学中，矩是表示距离和物理量乘积的物理量，受物理量的空间分布或安排影响。由其定义，矩通常需要一个参考点（基点或参考系）来定义距离。如力和参考点距离乘积得到的力矩（或扭矩），原则上任何物理量和距离相乘都会产生力矩，质量，电荷分布等。
<br>单个点的力矩：
<center>$$ \mu_n=r^n Q$$ </center>
<br>多个点则是积分得空间密度
<center>$ \mu_n=\int r^n \rho(r) \mathrm{d}r$$</center>
<br>**如果点表示质量**，则第零矩是总质量，一阶矩除以总质量是质量，二阶矩是
转动惯量
<center>$$ I=r^2 m $$
	$$ \sum_i r_i^2 m_i$$
</center>
<br>还有一个多极矩的概念，设计到极坐标系和球面坐标，就不多说了[link](https://en.wikipedia.org/wiki/Moment_(physics))

### 数学意义
&emsp;&emsp;矩是物体形状识别的重要参数指标。总的来说，在数学中，矩的概念用来度量一组具有一定形态特点的点阵。如一个“二阶矩”在一维上可测量其“宽度”，在更高阶的维度上由于其使用于橢球的空间分布，我们还可以对点的云结构进行测量和描述。其他矩用来描述诸如与均值的偏差分布情况（偏态），或峰值的分布情况（峰态） 

定义在实数域的实函数相对于值c的n阶矩为： 
<center>$$ \mu '_n=\int_{-\infty}^{\infty}  (x-c)^n \,f(x)\,dx $$
</center>
<br>**如果点表示概率密度**，则第零阶矩表示总概率（即1），1，2,3,4阶矩依次为以下四项。数学中的概念与物理学中矩的概念密切相关。

- 期望
	<br>随机变量的期望定义为其一阶**原点**矩：
	<center>$$E(x)=\int_{-\infty}^{\infty} x\,f(x)\,dx $$</center>
	在方差等定义中，期望也成为随机变量的“中心”。
	<br>显然，任何随机变量的i一阶中心据为0。
<br>对于以下二阶及更高阶的矩，通常使用中心矩（围绕平均值c的矩，均值是一阶矩），而不是原点矩，因为中心矩能更清楚的体现关于分布形状的信息。
- 方差
	<br>随机变量的方差定义为其二阶中心矩： 
	<center>$$ Var(x)=\int_{-\infty}^{\infty} [x-E(x)]^2 \,f(x)\,dx $$</center>
- 偏态
	<br>随机变量的偏态定义为其三阶中心矩:
	<center>$$ S(x)=\int _{-\infty }^{\infty }[x-E(x)]^{3}\,f(x)\,dx$$</center>
- 峰态
	<br>随机变量的峰态定义为其四阶中心矩：
	<center>$$ K(x)=\int _{-\infty }^{\infty }[x-E(x)]^{4}\,f(x)\,dx$$</center>
- 样本矩
	<br>矩常常通过样本矩来估计，这种方法不需要先估计其概率分布。
	<center>$$\mu '_{n}\approx {\frac {1}{N}}\sum _{i=1}^{N}X_{i}^{n}$$</center>
### 图像意义

### 点云意义


参考[zh.wiki_矩（数学）](https://zh.wikipedia.org/wiki/%E7%9F%A9_(%E6%95%B8%E5%AD%B8)) / [wiki_moments(math)](https://en.wikipedia.org/wiki/Moment_(mathematics)) / [wiki_moments(physics)](https://en.wikipedia.org/wiki/Moment_(physics))


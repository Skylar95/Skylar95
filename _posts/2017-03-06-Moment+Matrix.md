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

<br>单个点的力矩：$$ \mu_n=r^n Q$$ 
<br>多个点则是积分得空间密度$$ \mu_n=\int r^n \rho(r) \mathrm{d}r$$

力矩是一阶矩<br>
转动惯量$$ I=r^2 m $$$$ \sum_i r_i^2 m_i$$ 是二阶矩 
<br>还有一个多极矩的概念，设计到极坐标系和球面坐标，就不多说了[link](https://en.wikipedia.org/wiki/Moment_(physics))

### 数学意义
&emsp;&emsp;矩是物体形状识别的重要参数指标。总的来说，在数学中，矩的概念用来度量一组具有一定形态特点的点阵。如一个“二阶矩”在一维上可测量其“宽度”，在更高阶的维度上由于其使用于橢球的空间分布，我们还可以对点的云结构进行测量和描述。其他矩用来描述诸如与均值的偏差分布情况（偏态），或峰值的分布情况（峰态） 

定义在实数域的实函数相对于值c的n阶矩为：$$ \mu'_n=\int_{-\infty}^{\infty} (x-c)^n \,f(x)\,dx $$,若f(x)是概率密度函数，则可看出其相对于值0的一阶矩是连续随机变量的数学期望

- 期望
	随机变量的期望定义为其一阶**原点**矩：
	$$E(x)=\int_{-\infty}^{infty} x\,f(x)\,dx $$
	在方差等定义中，期望也成为随机变量的“中心”。
	<br>显然，任何随机变量的i一阶中心据为0。
- 方差
	随机变量的方差定义为其二阶中心矩：
	$$ Var(x)=\int_{-\infty}^{infty} [x-E(x)]^2 \,f(x)\,dx $$

- 偏态
- 峰态
- 样本矩

### 图像意义

### 点云意义


参考[zh.wiki_矩（数学）](https://zh.wikipedia.org/wiki/%E7%9F%A9_(%E6%95%B8%E5%AD%B8)) / [wiki_moments(math)](https://en.wikipedia.org/wiki/Moment_(mathematics)) / [wiki_moments(physics)](https://en.wikipedia.org/wiki/Moment_(physics))


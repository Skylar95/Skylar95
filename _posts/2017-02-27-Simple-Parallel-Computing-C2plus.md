---
layout: post
title: 简单并行计算
date: 2017-2-27
categories: blog
tags: [Parallel]
description: vision 总结
---

* content
{:toc}

# 用c++实现简单并行计算处理矩阵

因为平时写代码设计矩阵比较多，for循环有点儿耗时间，一开始用的是openmp开多线程处理，后来一打听gpu的并行处理时间更短。。。

时间效率比大概是

 $$ 
  \frac{nGpuProcess*GpuFrequency}{nCpuProcess * CpuFrequency} 
 $$

## Cpu Parallel 加速
其实非常简单，主要用来处理前后无关的for循环

- CMake OpenMP=On 

```
	find_package(OpenMP)
	if (OPENMP_FOUND)
	     set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
	    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
	endif()
```

- add parallel label

在需要并行计算的for循环前加上

```
	#pragma omp parallel for 
```
这样就可以了。时间效率主要看你Cpu是几核的就是几倍速，据说代码移植到单核机器上跑的时候也不会报错哦，自动使用单核处理器

我这里只谈了最简单的前后无关联的for循环，后面还有更多的技巧可以参考[这个博客](http://www.opencv.org.cn/forum.php?mod=viewthread&tid=18014)，或者一个比较官方的[链接](http://on-demand.gputechconf.com/gtc/2016/presentation/s6510-jeff-larkin-targeting-gpus-openmp.pdf)


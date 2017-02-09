---
layout: post
title: Ubuntu Hello Google
date: 2017-2-9
categories: blog
tags: [UbuntuGnome]
description: Ubuntu setting tutorial
---

# 如何配置一个实用又装x的Ubuntu(二) chrome+hosts两步翻墙

![](https://github.com/reasonW/MyImage/blob/master/reasonW.github.io/_posts/2017-02-09-img/2_1.png?raw=true)<br>
hosts翻墙,首先要找到一个好用且稳定的hosts
<br>以前一直是百度,排第一的那个[hosts](https://laod.cn/hosts/2016-google-hosts.html),后来换了github上的这个[hosts](https://github.com/racaljk/hosts/blob/master/hosts) 

## 第一步
- Ubuntu
<br>打开终端

```
sudo gedit /etc/hosts
```
将链接中给的hosts全部复制,粘贴到原hosts的后面

- Windows
<br>找到 C:\Windows\System32\drivers\etc\hosts

修改权限,让自己拥有修改权利
然后同上粘贴进去

## 第二步
- chrome
<br>在地址栏输入
`chrome://net-internals/#hsts`
<br>在打开的界面中找到`Domain`一栏
<br>填入`google.com`
<br>在下面两个选项后面打上对勾<br>
`Include subdomains for STS: `<br>
`Include subdomains for PKP: `<br>
<br>再点击下面的`Add`即可

依次把`google.com`换成 `google.com.hk`,`googleusercontent.com`,`googleapis.com`

## 第三步

???怎么会有第三步

稍等一会儿就可以直接[google](https://www.google.com.hk/webhp?sourceid=chrome-instant&ion=1&ie=UTF-8&pli=1&rct=j#newwindow=1&safe=strict&q=Hello+Google) 了

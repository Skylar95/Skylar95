---
layout: post
title: Ubuntu GNOME
date: 2017-2-9
categories: blog
tags: [UbuntuGnome]
description: Ubuntu setting tutorial
---

* content
{:toc}

# 如何配置一个实用又装x的Ubuntu(一)系统-实用配置-美化

以前一直用14.04版本的，试过换到16.04，但几个视觉的包一直报错，就不再尝试了。今年过完年感觉16版本差不多了，就开始升级，所有错误一遍过，没有从头来，还是很开心的。
先上图吧
<br>
![](https://github.com/reasonW/MyImage/blob/master/reasonW.github.io/_posts/2017-02-09-img/1_1.png?raw=true)<br>
今天我就从头写一遍教程，写详细点，以后就再也不为系统烦心了。

## 装双系统
渣机就是ThinkPad E431，配置也不高，双系统的大部分操作一直和[这个链接](http://jingyan.baidu.com/article/4d58d5411380dd9dd5e9c07e.html)差不多

-  这里下载的镜像是[UbuntuGnome-16.04](https://ubuntugnome.org/download/) 的，因为Gnome的桌面比默认的unity好看还实用

- 给Ubuntu划出来了160个G，因为一些视觉包的原因，装完一堆东西后就占了50多G了。

- 刻系统盘用的是软碟通，然后U盘不用拔，设置BIOS啥的不同电脑也不一样，总之是把系统盘放在第一位，之后重启，进到U盘这个系统盘里开始安装。

- 到了底下这一步，有点儿不同<br>
![](https://github.com/reasonW/MyImage/blob/master/reasonW.github.io/_posts/2017-02-09-img/1_2.png?raw=true)<br>
 依然是选择其它选项。之后选择分区的时候，我就把之前在Windows上留的160G分成了一个主分区 '/'挂载点,剩下的boot啥的它自己就在里面创建了，一直向下走 

 - 密码设置不要设太长，太长了敲的累，以后你就会懂的。。。不管你咋样，我就设了两位，还是一直往下走，知道重启完成，顺利进入Gnome桌面环境，安装成功。


## 必备软件
不管你装没装，反正我装了<br>
因为我都装好了，所以这里安装时候的一些图片我就不贴了，尽量理解吧。<br>
以后有机会重装的话，我尽量补全<br>

- menthust 
<br>校园网，要用锐捷,mentohust挺方便的，你要是找不到下载，可以发私信找我要，github,gmail都行。 

```
	sudo dpkg -i mentohust_0.3.4-1_amd64.deb 
```
<br>然后

``` 
	sudo mentohust
```
第一次使用要配置一遍参数，以后就不用配置了，直接命令行就行。
<br>首先选择网卡,选第一个就行，默认是有线网卡，我的这个叫 `enps0`
<br>然后应该是登录啥的，一个选择二次认证，另一个选择锐捷就行，这是锐捷的登录机制，不多研究
<br>账号就是你的锐捷账号，我是10位数字学号，接着密码
<br>配置完就可以看到登录提示了<br>
![](https://github.com/reasonW/MyImage/blob/master/reasonW.github.io/_posts/2017-02-09-img/1_3.png?raw=true)
![](https://github.com/reasonW/MyImage/blob/master/reasonW.github.io/_posts/2017-02-09-img/1_4.png?raw=true)
<br>前面也提到，锐捷一个比较坑的地方就是二次认证，所以看到提示成功后，还要点击系统右上角的有线连接，断开，再连接。。。或者在刚刚那个终端窗口里`ctrl^C`,再`sudo mentohust`,总之连两次才行。。。
<br>**这样就联网成功啦**
<br> 当然还可以直接插不需要锐捷认证的网线联网。。。

 - 无线驱动
<br> 方法1. 

```
	sudo apt install bcmwl-kernel-source 
```
<br> 方法2. win键，搜索软件和更新，，在附加驱动一栏，找到无线驱动，选择并应用更改，就行。

- chrome | chromium-browser
<br>用了大半年firefox，后来就弃坑改 chrome了，主要是同步方便

```
	sudo apt install chromium-browser
	sudo apt remove firefox libreoffice-common
```

- wps
libreoffice对ppt啥的支持很不友好，建议换成wps，而且这玩意儿常年不更新，下一个安装包存起来以后这么用就行

```
	sudo dpkg -i wps-office_10.1.0.5672~a21_amd64.deb
```

- Sogou
<br>比fcitx带的sunpinyin好用，最主要是熟悉，同上，常年备安装包，防止连不上网的时候没法打字

```
	sudo dpkg -i sogoupinyin_2.1.0.0082_amd64.deb 
	sudo apt install -f
```

- uGet+aria2
<br>下载神器，同上，我常年备份，你可以自己google一下安装

```
	sudo dpkg -i uget_2.0.8-0ubuntu0~trusty_amd64.deb
	sudo dpkg -i aria2_1.18.1-1_amd64.deb
	sudo apt install -f
```

- Franz+Wechat

![](https://github.com/reasonW/MyImage/blob/master/reasonW.github.io/_posts/2017-02-09-img/1_5.png?raw=true)


```
	wget "https://github.com/meetfranz/franz-app/releases/download/4.0.4/Franz-linux-x64-4.0.4.tgz"
	sudo mkdir /opt/franz
	sudo tar -xf Franz-linux*.tgz -C /opt/franz
	wget "https://cdn-images-1.medium.com/max/360/1*v86tTomtFZIdqzMNpvwIZw.png" -O franz-icon.png
	sudo mv franz-icon.png /opt/franz
```

```
	sudo gedit /opt/franz/franz.desktop
```
在里面粘贴这段内容，并保存

```
	[Desktop Entry]
	Name=Franz
	Comment=
	Exec=/opt/franz/Franz
	Icon=/opt/franz/franz-icon.png
	Terminal=false
	Type=Application
	Categories=Messaging,Internet
```

```
	sudo cp /opt/franz/franz.desktop /usr/share/applications/franz.desktop
```

- **Sublime-text3**

<br>大神器,写文档看代码特别顺手，跨平台
<br>我这里常备了几个Sublime 的package，就不用配置了，你们可以自己搜一下配置

- 汉化包

 	自己搜一下，下载，解压出来汉化包
 	cp Sublime/Default.sublime-package ~/.config/sublime-text-3/Installed\ Packages

- Package Control

```
	wegt "https://packagecontrol.io/Package%20Control.sublime-package" ~/.config/sublime-text-3/Installed\ Packages

```
之后其他插件可以 `shift+ctrl+p`,选择 `install package`,回车，搜索安装

- Alignment
	- `ctrl+alt+A` 对齐
- WakaTime
	- 记录coding 时间，适合朋友圈装逼,安装的时候需要输入在[官网](https://wakatime.com/)注册完获得的注册码
<br><br>![](https://github.com/reasonW/MyImage/blob/master/reasonW.github.io/_posts/2017-02-09-img/1_6.png?raw=true)
- ConvertToUTF8
	- 解决中文乱码
- Bracket Highlighter
	- 括号高亮
- OmniMarkupPreviewer 
<br><br>![](https://github.com/reasonW/MyImage/blob/master/reasonW.github.io/_posts/2017-02-09-img/1_7.png?raw=true)
 	- 可实现编辑markdown时，浏览器实时预览 
	- 编辑Preferences->Package setting->OmniMarkupPreviewer->Setting user,粘贴以下内容
```
	{
	  "mathjax_enabled": true,

	 "renderer_options-MarkdownRenderer": {
	     "extensions": ["tables", "fenced_code", "codehilite"]
	 }

	}
```
- IMEsupport #解决输入法不跟随
- colorsublime # 主题实时预览
- SublimeClang

&emsp;&emsp;配置sublime-clang,可以实现代码补全自动提示和跳转

```
	// 手动下载SublimeClang源码
	cd ~./config/sublime-text-3/Packages
	git clone --recursive https://github.com/quarnster/SublimeClang SublimeClang
	cd SublimeClang
	git pull && git submodule foreach --recursive git pull origin master

	// 拷贝libclang.so到internals文件夹
	sudo apt-get install libclang-3.8
	ldconfig -p | grep clang
	cp /usr/lib/i386-linux-gnu/libclang-3.8.so ~/.config/sublime-text-3/Packages/SublimeClang/internals/libclang.so

	// 手动编译出libcache.so
	cd src
	mkdir build
	cd build
	cmake ..
	make
```
	- 解决无法输入中文
&emsp;&emsp;这底下要分别配置从命令行打开，图标打开，活动打开输入中文

```
	sudo apt install libglib2.0-bin=2.48.1-1~ubuntu16.04.1 libglib2.0-0=2.48.1-1~ubuntu16.04.1 
	sudo apt install libgtk2.0-dev
	cd Sublime
	gcc -shared -o libsublime-imfix.so sublime-imfix.c  `pkg-config --libs --cflags gtk+-2.0` -fPIC
	sudo cp libsublime-imfix.so /opt/sublime_text/libsublime-imfix.so
	sudo gedit /usr/bin/subl
	# //sunl文件内容
	# !/bin/sh
	# LD_PRELOAD=/opt/sublime_text/libsublime-imfix.so exec /opt/sublime_text/sublime_text "$@"
	sudo gedit /usr/share/applications/sublime_text.desktop
```

<br>&emsp;&emsp;将[Desktop Entry]中的字符串
 
```
	Exec=/opt/sublime_text/sublime_text %F
```
<br>&emsp;&emsp;修改为
 
```
	Exec=bash -c "LD_PRELOAD=/opt/sublime_text/libsublime-imfix.so exec /opt/sublime_text/sublime_text %F"
```
<br>&emsp;&emsp;将[Desktop Action Window]中的字符串
 
```
	Exec=/opt/sublime_text/sublime_text -n
```
<br>&emsp;&emsp;修改为
 
```
	Exec=bash -c "LD_PRELOAD=/opt/sublime_text/libsublime-imfix.so exec /opt/sublime_text/sublime_text -n"
```
<br>&emsp;&emsp;将[Desktop Action Document]中的字符串

```
	Exec=/opt/sublime_text/sublime_text --command new_file
```
<br>&emsp;&emsp;修改为

```		
	Exec=bash -c "LD_PRELOAD=/opt/sublime_text/libsublime-imfix.so exec /opt/sublime_text/sublime_text --command new_file"
```

- simplescreenrecorder | 录屏软件

```
	sudo add-apt-repository -y ppa:maarten-baert/simplescreenrecorder
	sudo apt-get update
	sudo apt-get install simplescreenrecorder
```

- indicator-multiload | 系统状态监视器
<br>默认固定在后台，unity的右上角，gnome的左下角会看到，很直观

```
	sudo add-apt-repository ppa:indicator-multiload/stable-daily
	sudo apt-get update
	sudo apt-get install indicator-multiload
```


- **卸载不必要的软件**

```
	sudo apt-get remove unity-webapps-common
	sudo apt-get remove libreoffice-common
	sudo apt remove evolution
	sudo apt-get remove thunderbird totem rhythmbox empathy brasero simple-scan gnome-mahjongg aisleriot
	sudo apt remove transmission-common  gnome-sudoku deja-dup gnome-orca
```

## 主题、图标和shell拓展
我只修改了图标,其他主题都是默认

```
	sudo add-apt-repository ppa:noobslab/icons
	sudo apt-get update
	sudo apt-get install ultra-flat-icons-orange
```
shell拓展

```
	sudo apt install gnome-shell-extensions
```
- On:
	- Alternatetab
	- Applications menu
	- Auto move windows
	- Hide top bar
	- Launch new instance
	- Openenweather
	- Places status indicator
	- Screenshot window sizer
	- Taskbar
    - 概览
		- 任务打开
		- 工作区按钮打开
		- 收藏打开
		- 顶部面板打开
		- 底部面板打开
		- 对齐自己调整
		- 桌面按钮关闭
		- 应用视图按钮关闭

  	- 面板 
		- 面板背景颜色和不透明度自己调整成透明
	- User themes
- Off:
	- Native window placement
	- Removable drive menu
	- Window list
	- Workspace indicator
	- Windownavigator



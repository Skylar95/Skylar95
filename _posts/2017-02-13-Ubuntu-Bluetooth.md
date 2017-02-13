---
layout: post
title: Ubuntu 蓝牙搜索不到设备
date: 2017-2-13
categories: blog
tags: [UbuntuGnome]
description: Ubuntu setting tutorial
---

* content
{:toc}

# Ubuntu 蓝牙搜索不到设备

ThinkPad E431,不管是14版还是16版的Ubuntu 总会遇到一个问题就是蓝牙打开后搜索不到设备,也不能被搜索到。

之前试了很多什么`rfkill list` 和`rfkill unblock wlan1` 之类的都不见效。
今天算找到根儿了。

现在已经能成功连接小音箱和鼠标了

<center>![](https://github.com/reasonW/MyImage/blob/master/reasonW.github.io/_posts/2017-02-13-img/1_1.png?raw=true)
</center>

# Pre-install

```
	sudo apt install blueman  bluez bluez-cups bluez-obexd bluetooth bluez-btsco bluez-hcidump bluez-tools 
```
# 查看状态

```
	dmesg | grep -i blue
```
```
	[   12.013495] thinkpad_acpi: rfkill switch tpacpi_bluetooth_sw: radio is unblocked
	[   13.321383] Bluetooth: Core ver 2.21
	[   13.321398] Bluetooth: HCI device and connection manager initialized
	[   13.321401] Bluetooth: HCI socket layer initialized
	[   13.321403] Bluetooth: L2CAP socket layer initialized
	[   13.321407] Bluetooth: SCO socket layer initialized
	[   13.637359] Bluetooth: hci0: BCM: chip id 70
	[   13.653365] Bluetooth: hci0: LETC
	[   13.653369] Bluetooth: hci0: Direct firmware load for brcm/BCM.hcd failed with error -2
	[   14.369339] Bluetooth: hci0: BCM: patch brcm/BCM.hcd not found
	[   28.625283] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
	[   28.625286] Bluetooth: BNEP filters: protocol multicast
	[   28.625290] Bluetooth: BNEP socket layer initialized
	[  119.485547] Bluetooth: hci0: BCM: chip id 70
	[  119.501566] Bluetooth: hci0: Broadcom Bluetooth Device (43142)
	[  119.501574] Bluetooth: hci0: BCM (001.001.011) build 0312
	[  120.093533] Bluetooth: hci0: BCM (001.001.011) build 0312
	[  120.109536] Bluetooth: hci0: Broadcom Bluetooth Device (43142)
	[  120.328257] Bluetooth: RFCOMM TTY layer initialized
	[  120.328267] Bluetooth: RFCOMM socket layer initialized
	[  120.328276] Bluetooth: RFCOMM ver 1.11
```
会看到里面的`hci0` 提示`brcm/BCM.hcd` not found ,当然你的电脑可能是别的什么`.hcd`找不到。 

# BCM hcd

首先从网上下载windows里面的蓝牙驱动并解压

```
	wget "http://catalog.update.microsoft.com/v7/site/ScopedViewRedirect.aspx?updateid=87a7756f-1451-45da-ba8a-55f8aa29dfee"
	sudo apt install cabextract
	cabextract 20662520_6c535fbfa9dca0d07ab069e8918896086e2af0a7.cab
```
当然，你也可以在自己电脑windows里面的文件夹`C:Windows/System32/drivers`下面搜索.hex文件，然后放到ubuntu下面编译成.hcd文件

编译

```
	git clone https://github.com/jessesung/hex2hcd.git
	cd hex2hcd
	make
	./hex2hcd BCM20702A1_001.002.014.1443.1572.hex BCM.hcd
```
放到firmware文件夹下

```
	sudo cp BCM.hcd /lib/firmware/brcm/
```
重新加载模块

```
	sudo modprobe -r btusb
	sudo modprobe btusb
```
然后就可以在蓝牙的设备里发现其他设备了。

# blueman.bluez.errors
但是虽然搜索到了却总是无法连接，报一个错

```
	Connection Failed: blueman.bluez.errors.DBusFailedError: Protocol Not available
```
网上给的办法都是

```
	sudo apt-get install pulseaudio-module-bluetooth
	pactl load-module module-bluetooth-discover
```
但是我电脑装的时候老提软件版本依赖，怎么办呢？
**换源**, 软件与更新里换成aliyun的源，更新，软件包升级，再安装就行了。
之后重启就好 。
---
layout: 从零开始学习Swift-> iOS
title: 从零开始学习Swift-> iOS
date: 2020-11-23 7:00:00
categories: 博客
cover: https://i.loli.net/2020/11/25/N1hGLrTuYA82iKR.jpg
tags: [博客,编程,iOS]
---

**从零开始学习Swift-> iOS**
<!-- more -->

<!-- toc -->

# 1 前言

这是一篇学习iOS开发的教程，也是一篇记录学习的博客。

适合初学者观看，所有代码基于Swift 5 与 iOS 12

本文以UIkit作为学习对象，SwiftUI不在范围内

# 2 Swift

## 2.1 基本语法

以Hello world为例

```swift
import Cocoa
//Swift基本语法
var String = "Hello World"
print(String)
```

### 2.1.1 引入

import引入OC框架或者C库.



### 2.1.2 注释

单行注释:

//单行注释

多行注释:

/*第一行注释

第二行注释*/



### 2.1.3分号

Swift不要求单行语句以分号结尾,但是多条语句在一行需要分号相隔



### 2.1.4关键字

略


### 2.1.5空格

**运算符不能跟在变量常量后**



### 2.1.6 标识符

区分大小写

可以以下划线_字母开始,不能以数字开始

可以使用简单Unicode字符

使用关键字作为标识符,在前后添加`



### 2.1.7 数据类型 

**Int** 整数(长度与平台字长相同)

**UInt** 无符号整数(长度与平台字长相同)

**Float Double** 32位浮点数, 64位浮点数,默认使用Double

**Bool** 布尔值, 布尔常量true, false

**String** 字符串

**Character** 字符(单个字母)

**Optional** 可选类型



### 2.1.8 类型别名

```swift
typealias aliasname = Int
var number: aliasname = 10
```

typealias关键字将aliasname(自定)设为Int类型的别名



### 2.1.9 声明

var声明变量 let声明常量

```swift
var number1 = 10
var number2: Int = 10
var number3: Int
number3 = 10

```

number1, number2, number3都为Int类型,值为10

number1没有指定数据类型,swift会自动进行**类型推断**,浮点数类型的类型推断会默认为Double类型而非Float



### 2.2 可选类型

**swift不会自动为变量赋初始值, 在变量使用之前需要对其初始化**

可选类型即 Optinal类型, 指"变量可能有一个值"

```swift
var optvar1: Int?
var optvar2: Int? = 10
var optvar3: Optional<Int>
```

其中,optvar1和optvar3是一样的,都是声明了一个Optional类型变量, 这个变量可能包含一个Int类型的值(也可能不包含), 因为没有显式赋值,所以optvar1和optvar2有一个默认值为nil, nil表示这个变量是空的.

optvar2也声明了一个Optinal类型变量,这个变量赋了初值Int类型10.



# 3 Playground

## 3.1 创建工程

在xcode中，新建一个工程（文章默认以iOS应用），在life Cycle选择UIKit App Delegate, 语言选择Swift即可。

## 3.2 文件结构

新建工程后，呈现在面前一堆文件，那么分别都是些什么作用的？

```bash
|-XXX //主要文件目录
  |-AppDelegate.swift           //工程默认入口
  |-SceneDelegate.swift         //页面默认入口
  |-ContenView.swift            //SwiftUI用，不使用SwiftUI时建议删除
  |-Assets.xcassets             //图像资源管理工具
  |-LaunchScreen.storyboard     //用于页面布局管理
  |-info.plist                  //工程信息
```

### 3.2.1 AppDelegate

AppDelegate是新建一个工程后默认的工程入口，类似于C中的main.c.

@main.c就是程序执行的入口。AppDelegate是app启动后系统调用的第一个类。

AppDelegate中有3个重要的方法

```swi
func application(_:didFinishLaunchingWithOptions:) -> Bool
func application(_:configurationForConnecting:options:) -> UISceneConfiguration
func application(_:didDiscardSceneSessions:)
```

func application(_:didFinishLaunchingWithOptions:) -> Bool ：在程序刚启动的时候调用，用于执行应用程序设置。

func application(_:configurationForConnecting:options:) -> UISceneConfiguration ：用来调用以获取和创建新的场景。

func application(_:didDiscardSceneSessions:) ：当用户丢弃一个scene时，就会调用此方法。

### 3.2.2 SceneDelegate

SceneDelegate用于负责屏幕上显示内容

```swift
scene(_:willConnectTo:options:)
sceneDidDisconnect(_:)
sceneDidBecomeActive(_:)
sceneWillResignActive(_:)
sceneWillEnterForeground(_:)
sceneDidEnterBackground(_:)
```

scene(_:willConnectTo:options:) ：是UISceneSession调用的第一个方法，会创建一个初始的视图

sceneDidDisconnect(_:) ：场景在后台不活跃时断开会话执行。此时程序并不一定会被杀死，只有场景会被断开。
[toc]

# 从零开始学习Swift-> iOS

## 前言

本文以未接触过Swift, OC, iOS开发为背景从零开始，学习Swift语法以及iOS程序开发。

## Swift

### 基本语法

以Hello world为例

```swift
import Cocoa
//Swift基本语法
var String = "Hello World"
print(String)
```



##### 引入

import引入OC框架或者C库.



##### 注释

单行注释:

//单行注释

多行注释:

/*第一行注释

第二行注释*/



##### 分号

Swift不要求单行语句以分号结尾,但是多条语句在一行需要分号相隔



##### 关键字

略



##### 空格

**运算符不能跟在变量常量后**



##### 标识符

区分大小写

可以以下划线_字母开始,不能以数字开始

可以使用简单Unicode字符

使用关键字作为标识符,在前后添加`



##### 数据类型 

**Int** 整数(长度与平台字长相同)

**UInt** 无符号整数(长度与平台字长相同)

**Float Double** 32位浮点数, 64位浮点数,默认使用Double

**Bool** 布尔值, 布尔常量true, false

**String** 字符串

**Character** 字符(单个字母)

**Optional** 可选类型



##### 类型别名

```swift
typealias aliasname = Int
var number: aliasname = 10
```

typealias关键字将aliasname(自定)设为Int类型的别名



##### 声明

var声明变量 let声明常量

```swift
var number1 = 10
var number2: Int = 10
var number3: Int
number3 = 10

```

number1, number2, number3都为Int类型,值为10

number1没有指定数据类型,swift会自动进行**类型推断**,浮点数类型的类型推断会默认为Double类型而非Float




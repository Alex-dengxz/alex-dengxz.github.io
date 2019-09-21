---
layout: 快速搭建一个基于github+hexo的博客
title: 快速搭建一个基于github+hexo的博客
date: 2019-09-19 19:29:59
categories: 博客
tags: [博客,编程]
---
通过github和hexo，快速搭建一个属于自己的个人博客
<!-- more -->

[TOC]

## 1 什么是Hexo

Hexo是一个快速、简洁且高效的博客框架。Hexo使用Markdown解析文章，通过配置的主题快速部署属于你的静态网站。

## 2 安装Hexo

### 2.1 安装Hexo 之前：

安装node:

macOS下：

```bash
brew install node
```

其他linux系统：

```bash
apt-get install node
```

检验安装成功：

```bash
node -v
```

输出node版本号即表示安装成功

### 2.2 开始安装

```bash
npm install hexo-cli -g
```

部分情况下可能需要前夹*sudo*来获取管理员权限。

## 3 开始搭建

### 3.1 创建目录

依次执行三条命令：

```bash
hexo init XXX.github.io
cd XXX.github.io
npm install
```

将其中的XXX替换为你的github username

当然 *XXX.github.io* 只是代表要生成的文件夹，也可以命名为其他名字，不过建议如此。

现在，在你的 *~/* 目录下就多了一个 *XXX.github.io* 的文件夹了，这个目录中就装着你关于个人主页的配置。

[查看目录结构](#7.3 主题配置)

### 3.2 第一次生成静态页面

现在你并没有拥有一个博客页面，只有当你通过Hexo生成一个静态页面后，你才能拥有一个初始的博客页面。

```bash
hexo clean
hexo g
```

*hexo g* 是 *hexo generate(生成)* 的缩写，*hexo clean* 也可以缩写为 *hexo cl*。

### 3.3 本地运行

```bash
hexo s
```

*hero s* 是 *hexo server* 的缩写，通过这行指令，可以在本地搭建一个临时服务器，默认情况下，访问网址为： `http://localhost:4000/`。

此时访问应该可以看到如下画面：

![hexo-s.png](https://i.loli.net/2019/09/21/LEGBb8rwPo7W3p5.png)

但是你并不能在其他的网络中访问到这个博客页面，因此，你需要github来作为你的服务器。

## 4 使用GitHub page 部署

### 4.1 创建库

首先，登录你的GitHub账号，新建一个库，命名为XXX.github.io

**⚠️：这里的XXX是你的GitHub username，这个库名必须按照这个格式，且必须为新建库（不能更改库名）**

当你启用GitHub page功能时，GitHub会为你分配一个XXX.github.io的域名，为了防止被滥用，因此每个用户只能根据用户名创建一个page（事实上，你确实可以创建任意多且任意名称的库并开启github page，但是因为你只能有一个个人页面，其他的所有都只能作为项目主页，你需要为项目主页准备一个单独的域名才能使用它)，并且如果更改了github username，这个域名也就失效了。

### 4.2 本地配置

首先安装 [hexo-deployer-git](https://github.com/hexojs/hexo-deployer-git)

```bash
npm install hexo-deployer-git --save
```

然后进入 XXX.github.io 文件夹，找到 *_config.yml* 并编辑

在其中的deploy一项中进行更改：

```bash
deploy:
	type: git
	repo: [repo]
```

>[repo]替换为https://github.com/XXX/XXX.github.io，其中XXX是你的GitHub username
>
>**⚠️：冒号(:)后一定要跟一个空格**

### 4.3 部署

退出编辑后在 *XXX.github.io* 文件夹中执行：

```bash
hexo d
```

*hexo d* 是 *hexo deploy(部署)* 的缩写，执行之后，hexo 会将之前 *hexo g* 生成的静态页面给上传到你GitHub的 *XXX.github.io* 库的*master*分支中，GitHub page只只支持*master*分支和其他少数几个分支，因此不要上传到其他分支。

### 4.4 开启github page 及绑定域名

在github中进入XXX.github.io库进行管理，在设置中，向下划到倒数第二大类：github page 中，在Source中选中 *master branch* ，如果你有域名，只需要在下面的 Custom domain中输入属于你的域名并保存，github就会自动为你的域名设置解析。

部分情况下，需要手动到域名提供商进行域名的dns解析设置。

到现在，你就可以在*XXX.github.io*访问到初始的博客页面了。

## 5 发布文章

有两种方式可以为你的博客新增文章，

```bash
hexo new [article]
```

或者直接在你的 *~/XXX.github.io/source/_posts* 文件夹中新建名字为*article.md*的文件。

之后只要用markdown语法来完成你的文章就好了。

不过发布了之后，别忘了在完成编辑后执行hexo命令：

```bash
hexo clean
hexo g
hexo d
```

当你发布之后，如果你刷新网页没有变化，可能是你本地的浏览器缓存问题，清除浏览器缓存就好了。

## 6 配置

你可以在*_config.yml*中修改Hexo为你预设的博客属性，或者你也可以在*~/XXX.github.io/themes/[themename]/中更近一步修改你的博客布局。

部分*_config.yml*中的设置会被你的主题中的设置所覆盖，具体需要阅读[Hexo官方文档](https://hexo.io/zh-cn/docs/configuration.html)与对应的主题文档。

> **⚠️：冒号(:)后一定要跟一个空格**，否则会在`hexo g`时报错

以下是一些 *_config.yml* 比较重要的设置项

### 6.1 Site

```bash
title:              #标题
subtitle:           #副标题
description:        #描述，用于搜索引擎检索
keywords:           #关键字，用于搜索引擎检索
author:             #作者昵称
language:           #简体中文zh-Hans 默认为英文en
timezone:           #通常情况下可以省略（hexo默认以你本地市区作为博客时区)
```

### 6.2 URL

```bash
url:                                    #网站网址，有域名天蝎域名
root: /                                 #文章根目录
permalink: :year/:month/:day/:title/    #博客自页面链接格式
permalink_defaults:                     #永久链接中每个段的默认值
```

### 6.3 Extensions

```bash
theme:              #默认为landscape,之后更改为你所要替换的主题名，
```

## 7 主题

现在你的博客已经可以成功的上传文章并访问了，但是，你是不是觉得太过于单调又丑陋了一些呢？那么，为你的博客替换一个主题就很重要了。

### 7.1 寻找主题

**推荐：**你可以在[官方页面](https://hexo.io/themes/)中挑选你所想要的主题。

也可以在搜索引擎中查找主题，大部分的主题都是保存在github下的，因此，在github中搜索hexo theme也是一个不错的方法。

### 7.2 安装主题

进入主题的github页面，然后将其克隆到本地的 *~/XXX.github.io/themes/* 中，注意，大部分的主题以 *hexo-theme-name* 格式命名，你在克隆时需要改名为*name*.

现在，在你的themes文件夹中就会多一个主题文件夹了，当你在*_config.yml*中将theme更改为当前主题名，就启用了这个主题。

### 7.3 主题配置

首先介绍一下hexo的配置：

```bash
.
│   _config.yml                 #官方配置文件
│   package-lock.json           #包依赖
│   package.json                #包依赖
│	
└───node_modules
│   │ 
│   ...
│
└───scaffolds                   #默认的文章生成前缀
│   │
│   │   draft.md               
│   │   page.md
│   │   post.md                 #hexo new默认生成post文章
│
└───source                      #博客的内容
│   │
│   └───_posts                  #文章存放位置
│   └───_images                 #自行添加，存放图片
│   
└───themes                      #主题文件夹
    │
    └───landscape               #默认主题，这里用来举例
    │   │
    │   │   _config.yml         #主题配置文件，会替换掉官方配置对应项
    │   │
    │   └───layout              #配置博客布局的脚本
    │   └───source              #存放css和js配置文件
    │         │
    │         └───css
    │         └───js
    └───theme_name              #其他主题文件夹
    
```

这其中最重要的两个配置文件就是

`~/XXX.github.io/_config.yml`和`~/XXX.github.io/themes/theme_name/_config.yml`

分别代表全局配置和主题配置，其中主题配置的优先级更高。
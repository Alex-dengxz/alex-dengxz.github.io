---
layout: 快速搭建一个基于github+hexo的博客
title: 快速搭建一个基于github+hexo的博客
date: 2019-09-19 19:29:59
categories: 博客
tags: [博客,编程]
---
**通过github和hexo，快速搭建一个属于自己的个人博客**
<!-- more -->

<!-- toc -->

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
yum install node
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

[查看目录结构]({% post_path '快速搭建一个基于github与hexo的博客' %}#73-主题配置)

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

我的主题是：[nexmoe](https://github.com/nexmoe/hexo-theme-nexmoe)

我也曾用过:  [icarus](https://github.com/ppoffice/hexo-theme-icarus)

### 7.1 寻找主题

**推荐：**你可以在[官方页面](https://hexo.io/themes/)中挑选你所想要的主题。(上述两者也都可以在官方页面中找到)

也可以在搜索引擎中查找主题，大部分的主题都是保存在github下的，因此，在github中搜索hexo theme也是一个不错的方法。

还有一种方法：当你身边有朋友在使用hexo时，通常可以在他的博客底部看到一行：Powered by Hexo & Themename, 这时你就可以选择一个和你朋友相同的主题了。

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

要配置主题请仔细阅读主题相关文档，本博客采用[nexmoe](https://github.com/nexmoe/hexo-theme-nexmoe)主题，不会在本文中介绍nexmoe的配置，后续应该会写一篇更深度定制化的博客文章。

## 8 备份

不管你的博客在哪里搭建，又一个很重要的事情就是备份。

你可能会想：不是已经把博客上传到了github上吗？

是的，虽然github上已经有了你的博客，但是那只是你本地生成上传的一个静态网页，而你真正的内容，还保留在你的电脑/服务器中。

当然，你可以把本地文件拷贝到你的移动硬盘、云盘中，不过还有一个更好的方法：上传到github中

### 8.1 删除对主题文件夹的跟踪

> 如果你使用的初始主题可以忽视

在你的hexo文件夹下，又一个主题文件夹是从github上克隆下来的，在不取消对这个文件夹的跟踪时，想要将文件夹上传到自己的github库是一个很麻烦的事情。

> 跟踪指的就是对文件夹保留git信息，以便于版本更新

```bash
cd ~/XXX.github.io/themes/themename/
git rm --cached .
```

### 8.2 进入新的hexo分支

在第一次上传后，本地已经存在一个`master`分支，这个分支时用来存储静态网站，而现在就要创建一个用于存储文件的hexo分支（可以任意命名）

```bash
git checkout -b hexo
```

你可以创建一个.gitignore来将一些不想备份的文件屏蔽。

### 8.3 开始备份

```bash
cd ~/XXX.github.io/
git add .
git commit -m "Backup"
git push origin hexo
```

### 8.4 设置默认分支

在你上传后，github中会增加一个新的分支，但是你打开库默认显示的是你之前上传的静态页面，可以在设置中将默认分支改为hexo，这样在恢复时更加方便。

### 8.5 从备份中恢复

```bash
git clone https://github.com/XXX/XXX.github.io
cd XXX.github.io
npm install hexo-cli
npm install
npm install hexo-deployer-git
```

这样就可以从一台新的电脑继续开始更新博客，而不用重新配置了。

## 9 其他

### 9.1 保存域名

在你完成上述操作并更新一次后，你会发现：你无法通过你的域名访问你的博客了，这是怎么回事？

原来，在你更新后，GitHub Pages 解除了和域名的绑定，你当然可以每次更新后都重复[4.4 绑定域名](#44-开启github-page-及绑定域名)的操作，但是这样太过沙雕。

想要一次解决，只需要在 *~/XXX.github.io/source/* 中添加一个名字为 *CNAME* 的文档，内容为你的域名地址就好了。

### 9.2 一键更新

是不是觉得每次更新博客都非常麻烦，要是输指令的顺序错了，还可能有不好的后果，那么，写一个脚本来一键完成这个步骤就非常适合你了。

在任意地方（推荐 *~/XXX.github.io/* 中）创建一个update.sh的文件

```bash
#!/bin/bash

hexo clean
hexo g
hexo d
git add .
git commit -m "Backup"
git push origin hexo
```

保存后为文件添加执行权限：

```bash
chmod 777 ./update.sh
```

然后以后的每次更新就可一通过：`~/XXX.github.io/update.sh`来执行了。
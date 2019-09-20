---
layout: 快速搭建一个基于github+hexo的博客
title: 快速搭建一个基于github+hexo的博客
date: 2019-09-19 19:29:59
categories: 博客
tags: [博客,编程]
---
通过github和hexo，快速搭建一个属于自己的个人博客
<!-- more -->

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

当你启用GitHub page功能时，GitHub会为你分配一个XXX.github.io的域名，为了防止被滥用，因此每个用户只能根据用户名创建一个page，并且如果更改了github username，这个域名也就失效了。

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

### 4.3 部署

退出编辑后在 *XXX.github.io* 文件夹中执行：

```bash
hexo d
```

*hexo d* 是 *hexo deploy(部署)* 的缩写，执行之后，hexo 会将之前 *hexo g* 生成的静态页面给上传到你GitHub的 *XXX.github.io* 库的*master*分支中，GitHub page只只支持*master*分支，因此不要上传到其他分支。


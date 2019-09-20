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




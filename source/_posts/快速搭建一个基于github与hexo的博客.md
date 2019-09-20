---
layout: 快速搭建一个基于github+hexo的博客
title: 快速搭建一个基于github+hexo的博客
date: 2019-09-19 19:29:59
categories: 博客
tags: [博客,编程]
---
通过github和hexo，快速搭建一个属于自己的个人博客
<!-- more -->

## 什么是Hexo

Hexo是一个快速、简洁且高效的博客框架。Hexo使用Markdown解析文章，通过配置的主题快速部署属于你的静态网站。

## 安装Hexo

### 安装Hexo 之前：

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

### 开始安装

```bash
npm install hexo-cli -g
```

部分情况下可能需要前夹*sudo*来获取管理员权限。


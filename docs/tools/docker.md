# Docker

Docker是一个开源的应用容器引擎，基于Go语言并遵从Apache2.0协议开源。

Docker可以让开发者打包他们的应用以及依赖包到一个轻量级、可移植的容器中，然后发布到任何流行的Linux机器上，也可以实现虚拟化。

容器是完全使用沙箱机制，相互之间不会有任何接口（类似iPhone的app），更重要的是容器性能开销极低。

## 应用场景

- web应用的自动化打包和发布
- 自动化测试和持续集成、发布
- 在服务型环境中部署和调整数据库or其他的后台应用
- 从头编译or扩展现有的OpenShift或Cloud Foundry平台来搭建自己的PaaS环境

## 3个基本概念

1. 镜像（Image）：Docker 镜像（Image），就相当于是一个 root 文件系统。比如官方镜像 ubuntu:16.04 就包含了完整的一套 Ubuntu16.04 最小系统的 root 文件系统。

2. 容器（Container）：镜像（Image）和容器（Container）的关系，就像是面向对象程序设计中的类和实例一样，镜像是静态的定义，容器是镜像运行时的实体。容器可以被创建、启动、停止、删除、暂停等。

3. 仓库（Repository）：仓库可看成一个代码控制中心，用来保存镜像。

## 国内镜像加速
1. [Docker中国区官方][https://registry.docker-cn.com]
2. [中科大][https://docker.mirrors.ustc.edu.cn]
3. [网易][http://hub-mirror.c.163.com]
4. [阿里云][https://<xxx>.mirror.aliyuncs.com	]

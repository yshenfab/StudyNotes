# Docker

Docker 是一个开源的应用容器引擎，基于 Go 语言并遵从 Apache2.0 协议开源。

Docker 可以让开发者打包他们的应用以及依赖包到一个轻量级、可移植的容器中，然后发布到任何流行的 Linux 机器上，也可以实现虚拟化。

容器是完全使用沙箱机制，相互之间不会有任何接口（类似 iPhone 的 app），更重要的是容器性能开销极低。

## Tutorials

- [Docker Practice](https://github.com/yeasy/docker_practice)
  [GitBook](https://yeasy.gitbook.io/docker_practice/)

- [Official Docs](https://docs.docker.com/)

## Linux post-installation for Docker Engine

[Post-installation steps](https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user)

The Docker daemon binds to a Unix socket, not a TCP port. By default it's the
`root` user that owns the Unix socket, other users can only access it with
`sudo`. The Docker daemon always runs as the `root` user.

If you don't want to preface the `docker` command with `sudo`, create a Unix
group called `docker` and add users to it.

```sh
sudo groupadd docker
sudo usermod -aG docker $USER
```

Log out and log back in so that your group membership is re-evaluated.

Start on boot.

```sh
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
```

## 应用场景

- web 应用的自动化打包和发布
- 自动化测试和持续集成、发布
- 在服务型环境中部署和调整数据库 or 其他的后台应用
- 从头编译 or 扩展现有的 OpenShift 或 Cloud Foundry 平台来搭建自己的 PaaS 环境

## 3 个基本概念

1. 镜像（Image）：Docker 镜像（Image），就相当于是一个 root 文件系统。比如官方镜像 ubuntu:16.04 就包含了完整的一套 Ubuntu16.04 最小系统的 root 文件系统。

2. 容器（Container）：镜像（Image）和容器（Container）的关系，就像是面向对象程序设计中的类和实例一样，镜像是静态的定义，容器是镜像运行时的实体。容器可以被创建、启动、停止、删除、暂停等。

3. 仓库（Repository）：仓库可看成一个代码控制中心，用来保存镜像。

## 国内镜像

Some mirrors are not active, check [link](https://gist.github.com/y0ngb1n/7e8f16af3242c7815e7ca2f0833d3ea6).

1. [Docker 中国官方](https://registry.docker-cn.com)
2. [中科大](https://docker.mirrors.ustc.edu.cn)
3. [网易](https://hub-mirror.c.163.com)
4. [阿里云](https://<xxx>.mirror.aliyuncs.com)
   需要先[注册](https://registry.cn-hangzhou.aliyuncs.com)，`xxx`是账号分配的前缀。
5. [百度云](https://mirror.baidubce.com)
6. [腾讯云](https://mirror.ccs.tencentyun.com)
7. [华为云](https://05f073ad3c0010ea0f4bc00b7105ec20.mirror.swr.myhuaweicloud.com)

创建 or 修改`/etc/docker/daemon.json`

修改后

```sh
systemctl daemon-reload
systemctl restart docker
```

## Concepts

1. Image: a root filesystem, such as ubuntu:16.04
2. Container: instance of image
3. Repository: code control center, store images

# Docker

[Git repo](https://github.com/moby/moby)

## Tutorials

- [Docker Practice](https://github.com/yeasy/docker_practice)
  [GitBook](https://yeasy.gitbook.io/docker_practice/)

- [Official Docs](https://docs.docker.com/)

## Introduction

Docker 是一个开源的应用容器引擎，基于 Go 语言并遵从 Apache2.0 协议开源。

Docker 可以让开发者打包他们的应用以及依赖包到一个轻量级、可移植的容器中，然后发布到任何流行的 Linux 机器上，也可以实现虚拟化。

容器是完全使用沙箱机制，相互之间不会有任何接口（类似 iPhone 的 app），更重要的是容器性能开销极低。

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

## 基本概念

1. 镜像 (Image)

   Docker image，就相当于是一个 root 文件系统。
   比如官方镜像 ubuntu:18.04 就包含了完整的一套 Ubuntu18.04 最小系统的 root 文件系统。
   Docker image 是一个特殊的文件系统，除了提供容器运行时所需的程序、库、资源、配置等，
   还包含一些运行时准备的一些配置参数（如匿名卷、环境变量、用户等）。

2. 容器 (Container)

   镜像和容器的关系，就像是面向对象程序设计中的类和实例一样，镜像是静态的定义，容器是镜像运行时的实体。容器可以被创建、启动、停止、删除、暂停等。

3. 仓库 (Repository)

   仓库可看成一个代码控制中心，用来保存镜像。

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

## 使用镜像

```sh
# pull image
# docker pull [OPTIONS] NAME[:TAG|@DIGEST]
docker pull ubuntu:18.04
# run image
docker run -it -rm ubuntu:18.04 bash
# list images
docker image ls
docker image ls ubuntu
docker image ls redis
# image space usage
docker system df
# remove image
docker image rm ubuntu:18.04
```

## 操作容器

```sh
docker run ubuntu:18.04 /bin/echo "Hello world"
docker run -t -i ubuntu:18.04 /bin/bash
docker container start
docker container stop
```

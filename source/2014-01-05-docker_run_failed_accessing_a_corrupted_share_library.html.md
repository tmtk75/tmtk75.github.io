---
layout: post
title: docker run failed with accessing a corrupted share library
tags: docker
lang: en
creation-date: 2014-01-05 11:33:54 +0900
modified-date: 2014-01-05 11:33:54 +0900
---
Encountered a following error. Why does this happen?

```
docker run centos /bin/echo hello
panic: accessing a corrupted shared library

goroutine 1 [running]:
github.com/dotcloud/docker/sysinit.executeProgram(0xc20007c180, 0xc20007c180, 0xa)
  /builddir/build/BUILD/docker-0.7.2/_build/src/github.com/dotcloud/docker/sysinit/sysinit.go:208 +0x2ff
github.com/dotcloud/docker/sysinit.SysInit()
  /builddir/build/BUILD/docker-0.7.2/_build/src/github.com/dotcloud/docker/sysinit/sysinit.go:255 +0x689
main.main()
  /builddir/build/BUILD/docker-0.7.2/dockerinit/dockerinit.go:14 +0x18

goroutine 3 [syscall]:
os/signal.loop()
  /usr/lib64/golang/src/pkg/os/signal/signal_unix.go:21 +0x1c
created by os/signal.init·1
  /usr/lib64/golang/src/pkg/os/signal/signal_unix.go:27 +0x2f
```

I tried on ami-9ffa709e in ap-northeast-1a. The instance type is m1.small.

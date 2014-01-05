---
layout: post
title: docker run failed with accessing a corrupted share library
tags: docker
lang: en
creation-date: 2014-01-05 11:33:54 +0900
modified-date: 2014-01-05 11:33:54 +0900
---
Encountered a following error. Why does this happen?
I tried on ami-9ffa709e in ap-northeast-1a. The instance type is m1.small.

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

Actually, docker works just after it was installed.
If I pull a repository which I made and registered in the docker index, it becomes not working...
The repository is [tmtk75/puppet-3.4.1](https://index.docker.io/u/tmtk75/puppet-3.4.1/).

How to reproduce it,

1. Set up docker in [CentOS6.4 of AWS](https://aws.amazon.com/marketplace/ordering?productId=9ededd96-9ff7-4ba1-ae15-2c99f7e93990&ref_=dtl_psb_continue&region=ap-northeast-1). The version I'm using is 0.7.2.
2. Execute `docker run centos /bin/echo hello`. It should work.
3. Pull a repository, `docker pull tmtk75/puppet-3.4.1`. It was registered by me, [here](https://index.docker.io/u/tmtk75/puppet-3.4.1/).
4. Execute again `docker run centos /bin/echo hello`. It fails somehow with above error :-(


P.S.

When I reinstalled docker and tried above again pulling [tmtk75/ruby-2.0.0p353](https://index.docker.io/u/tmtk75/ruby-2.0.0p353/) instead of tmtk75/puppet-3.4.1,
I got a different error like:

```
2014/01/05 03:57:17 Error: create: mkdir /var/lib/docker/devicemapper/mnt/5c2ae65fd1ff3ea34ea1031e52c23199344dbb0dda94ed457c0dd6a5b93e7964-init/rootfs: input/output error
```

Mh... what's happening...

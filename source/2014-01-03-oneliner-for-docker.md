---
layout: post
title: One liner to install docker into CentOS-6.x
tags: docker
lang: ja
creation-date: 2014-01-03 23:23:00 +0900
modified-date: 2014-01-03 23:23:00 +0900
---
新年初エントリーはワンライナー。

    curl https://gist.github.com/tmtk75/8238544/raw/f99a06905e459b0745694db484066dbf01d46bf8/centos-docker | bash

READMORE

CentOS-6.xにdockerをインストールします。rootで実行してくださいね。

    rpm -Uvh http://ftp.riken.jp/Linux/fedora/epel/6/i386/epel-release-6-8.noarch.rpm
    yum install puppet -y
    puppet apply -e 'package {docker-io:} service {docker: ensure=>running, require=>Package[docker-io]}'

中身はこれだけです、はい。

それでは今年も皆さんよいdockerライフを〜。

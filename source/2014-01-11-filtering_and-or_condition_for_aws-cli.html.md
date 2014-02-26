---
layout: post
title: aws-cli ec2 describe-instances --filterオプションでタグの値を指定する
tags: aws-cli
lang: ja
creation-date: 2014-01-11 17:11:14 +0900
modified-date: 2014-01-11 17:11:14 +0900
---
[aws ec2 describe-instances](http://docs.aws.amazon.com/cli/latest/reference/ec2/describe-instances.html)では
`--filter`オプションでいろいろ条件を指定することができますが、条件の指定の仕方にちょっと癖があるのでメモ。

使用したバージョンはaws-cli/1.2.3 Python/2.7.5 Darwin/13.0.0
READMORE

Tagの値でフィルタ
-----------------
[tag-key](http://docs.aws.amazon.com/cli/latest/reference/ec2/describe-instances.html#tag-key)と
[tag-value](http://docs.aws.amazon.com/cli/latest/reference/ec2/describe-instances.html#tag-value)を使います。

タグの値でフィルタする場合

    aws ec2 describe-instances \
      --filter Name=tag-key,Values=<タグ名> Name=tag-value,Values=<タグの値>

--filterオプションの後に`Name=...,Values=...`を２つ並べます。


    aws ec2 describe-instances \
      --filter Name=tag-key,Values=<タグ1> Name=tag-value,Values=<タグ1の値> \ 
      --filter Name=tag-key,Values=<タグ2> Name=tag-value,Values=<タグ2の値> \
      ...

--filterオプションを複数並べることもできます。

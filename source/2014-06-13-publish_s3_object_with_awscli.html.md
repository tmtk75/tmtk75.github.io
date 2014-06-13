---
layout: post
title: Publish s3 object with awscli
tags: S3 awscli publish
lang: ja
creation-date: 2014-06-13 09:54:39 +0900
modified-date: 2014-06-13 09:54:39 +0900
---
awscliメモ。s3のobjectを公開するやつ。`--grant-read`の引数のフォーマットがよくわからんかったけど、
全公開のEveryoneは下記に載っていたのでそのまま使った。  
<http://docs.aws.amazon.com/cli/latest/userguide/using-s3api-commands.html>

```
aws s3api put-object-acl \
  --bucket tmtk75.github.com \
  --key 2014-06-13/focuslight.png \
  --grant-read 'uri="http://acs.amazonaws.com/groups/global/AllUsers"'
```

Bucket, Object ACLの設定はこの辺にあったんだけど、AllUsersとかないしな。どこにあるんだろう。  
<http://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTacl.html>
<http://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectPUTacl.html>


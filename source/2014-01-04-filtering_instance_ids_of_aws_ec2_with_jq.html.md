---
layout: post
title: Filtering instance IDs of aws ec2 with jq
tags: aws, ec2, cli, jq
lang: 
creation-date: 2014-01-04 19:36:45 +0900
modified-date: 2014-01-04 19:36:45 +0900
---
How to list all stopped (or running) instances with [aws-cli](https://github.com/aws/aws-cli)
and filter only instance id using [jq](http://stedolan.github.io/jq/manual/).

```bash
$ aws ec2 describe-instances \
  --filter Name=instance-state-name,Values=stopped \
  | jq ".[][].Instances[].InstanceId" -r
i-092fxxxx
i-91ffxxxx
i-9f63xxxx
i-8872xxxx
i-fac6xxxx
```

jq is really very useful.

---
layout: post
title: RequestTimeTooSkewedが出たら
tags: S3, AWS
lang: ja
creation-date: 2013-07-06 11:03:23 +0900
modified-date: 2013-07-06 11:03:23 +0900
---
aws-sdkを使っててS3にアクセスしようとしたらこんなエラーに出くわした。

```
ERROR: Test failed: 403 (RequestTimeTooSkewed): The difference between the request time and the current time is too large.
```

403ってアクセス権絡みだとばっかり思ってたからaccess keyや
secret keyを見なおしてたりしててエラーメッセージ読んでなかった。

AWSさんから**時間ズレ過ぎじゃね？**とダメ出しされてたわけなんですね。

```bash
$ sudo ntpdate ntp.nict.jp
5 Jul 09:33:42 ntpdate[12211]: step time server 133.243.238.243 offset 1333.582866 sec
```

時間合わせてやったら何事もなかったようにちゃんとS3アクセスできましたよ。

ちなみに気づくまで２日くらいかかった。

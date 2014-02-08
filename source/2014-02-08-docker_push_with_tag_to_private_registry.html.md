---
layout: post
title: Docker プライベートのイメージレジストリにタグ付きでpushする方法
tags: docker docker-registry
lang: ja
creation-date: 2014-02-08 17:21:19 +0900
eodified-date: 2014-02-08 17:21:19 +0900
---
Dockerはイメージを登録することができる[オフィシャルの場所 DOCKER index](https://index.docker.io/)を提供している。
この[レジストリのイメージもDOCKER indexにあって](https://index.docker.io/_/registry/)、プライベートなレジストリをすぐに構築することができる。

試すだけならこんな感じでできるし、ストレージをS3とかにもできる[（参考）](http://inokara.hateblo.jp/entry/2014/01/26/102059)。

```
$ docker pull registry
...
$ docker run -d -p 5000:5000 registry
```

そんなプライベートリポジトリにタグ付きで登録する方法。
ちょっとハマったのでメモ。

準備
----
適当にimageをpullしてくる。
puppet-3.3.2と3.4.2のイメージがダウンロードできる。

```
$ docker pull tmtk75/puppet
Pulling repository tmtk75/puppet
...
3b87964ac4cc: Download complete 
05d8e04938c7: Download complete 
44e21fbdea22: Download complete 

$ docker images
tmtk75/puppet                    3.4.2               736485598cf7        3 hours ago         3.46 GB
tmtk75/puppet                    latest              736485598cf7        4 hours ago         3.46 GB
tmtk75/puppet                    3.3.2               f42506d60391        4 hours ago         3.442 GB
```

docker push
-----------
1行目が大事。タグ`latest`が残ってると`3.3.2`が無視されてしまう。

```
$ docker rmi tmtk75/puppet:latest
Untagged: 736485598cf72f150c3f397d5baff68ddb3ec595880b8bfdced4ac1d1ae1f269

$ docker tag tmtk75/puppet:3.3.2 localhost:5000/puppet:3.3.2

$ docker push localhost:5000/puppet
The push refers to a repository [localhost:5000/puppet] (len: 1)
Sending image list
Pushing repository localhost:5000/puppet (1 tags)
...
Pushing tags for rev [f42506d60391] on {http://localhost:5000/v1/repositories/puppet/tags/3.3.2}
f42506d60391: Image already pushed, skipping 
```

実際にpullしてみて確かめてみる。

```
$ docker pull localhost:5000/puppet:3.3.2
...
05d8e04938c7: Download complete 
44e21fbdea22: Download complete 
```

成功。

ちゃんとバージョニングしていきましょう。


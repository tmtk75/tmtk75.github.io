---
layout: post
title: focuslightのdockerイメージを作った
tags: docker focuslight
lang: ja
creation-date: 2014-06-13 05:55:34 +0900
modified-date: 2014-06-13 05:55:34 +0900
---

Focuslight <https://github.com/focuslight/focuslight> のdockerイメージ作った。
dockerの環境あればFocuslightがすぐに試せる[Makefile](https://github.com/tmtk75/Dockerfiles/blob/master/focuslight/Makefile)を用意しました。イメージのダウンロードにちょっと時間かかるけど。

実質ワンステップでfocuslightが起動します。boot2docker使用時はツーステップ。5125でlistenします。

```bash
curl -OL https://github.com/tmtk75/Dockerfiles/raw/master/focuslight/Makefile
make pull init data_container run

# in case of boot2docker for port-forwarding setting
make natpf

# sample request
curl -d "number=123" localhost:5125/api/service/section/graph
```

イメージはこちら。docker index改め、docker hubにおいてあります。
<https://registry.hub.docker.com/u/tmtk75/focuslight/>

READMORE

Ruby2.x入れたり、RRD入れたりするのが普段使ってない人にとってはちょっとめんどくさいところだと思うんだけど、
dockerならその辺全部気にしなくていいからこういうケースではほんと便利ですね。
データコンテナ使っててホスト側に永続化もしているので普通に使えると思います。

サンプルのcurl実行して、<http://localhost:5125/list/service/section>にアクセスして次のようなページが表示されればOK。

<img src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2014-06-13/focuslight.png' />

データはmakeを実行した際のカレントディレクトリに`./focuslight_data`ってのが作られていると思います。
boot2dockerの場合はVM内にあるので気をつけて。

## Dockerfile
イメージを作ったDockerfileはこちら。
<https://github.com/tmtk75/Dockerfiles/blob/master/focuslight/Dockerfile>

見るとわかるけど、`rrdtool-1.4.7-1`をrpmでインストールし直している。
EPELのrrdtool、rrdtool-develで最初試したら`--border`オプションがない、というエラーでfocuslightがグラフ表示に失敗したのでバージョンをあげた次第。
こういうの不具合報告したほうがいいのかな？

ともあれ、とりあえずさくっと試せるのでdockererはぜひお試しを。


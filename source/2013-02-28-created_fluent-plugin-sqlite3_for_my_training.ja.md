---
layout: post
title: fluentdのsqlite3用プラグイン書いた
tags: fluentd sqlite3 plugin
lang: ja
creation-date: 2013-02-28 09:06:29 +0900
modified-date: 2013-02-28 09:06:29 +0900
---
[fluentd][fd]って今更ながらいい製品だよね。完全に乗り遅れてた。不覚。

  [fd]: http://fluentd.org/

で、仕事でも使ってみようと思ってるのだが、その場合やっぱりいくつか
プラグインを書くことになるんだと思う。
なので、調査・練習がてらSQLite3用のOutputプラグインを書いてみた。

<https://github.com/tmtk75/fluent-plugin-sqlite3>


思ってたより簡単に書けるんだね、プラグイン。

[Ad hocモード][adhoc]っていう、とりあえずschemaも何も定義せずに
いきなり使いはじめることができる機能を入れたので、気軽に試せると思う。

  [adhoc]: https://github.com/tmtk75/fluent-plugin-sqlite3/blob/master/README.md#getting-started

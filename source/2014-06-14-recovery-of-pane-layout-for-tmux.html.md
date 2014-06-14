---
layout: post
title: tmuxのpaneのレイアウトを戻す
tags: tmux pane
lang: ja
creation-date: 2014-06-14 17:40:53 +0900
modified-date: 2014-06-14 17:40:53 +0900
---
tmuxを使い始めた。

まだショートカットに慣れていないので目当ての機能を実行するために適当にショートカットを実行していると、
たまに`C-!`(`:break-pane`)でアクティブpaneをwindowにしてしまうことある。

で、よく元に戻したいことが多いのでやり方を調べたら`join-pane`コマンドが見つかったのでメモ。


join-pane
---------
```
0:ruby
```
こんな状態から`C+!`で

```
0:ruby 1:bash*
```
こんな状態になる。`1:bash`windowがもともと`0:ruby`でアクティブpaneだったシェル。


こんなときは慌てず下記のように`:join-pane`コマンドを打つ。

```
C+:
:join-pane -t :0
```

`:0`はwindow番号。`-t ruby`でwindow名でもいいみたい。
そうすると元のwindowに綺麗に戻ってくれる。いろいろ引数も指定できるみたいだけど、とりあえずこれくらいで自分には十分。


select-layout
-------------

ついでに`select-layout`のMacでのショートカットがやっとできたので書いておく。

`:select-layout even-horizontal`は`ctrl+b ESC+1`だ。

たとえば、ビフォー（左）アフター（右）。  
<img src='http://tmtk75.github.com.s3.amazonaws.com/2014-06-14/before.png' width='48%'>
<img src='http://tmtk75.github.com.s3.amazonaws.com/2014-06-14/after.png' width='48%'>


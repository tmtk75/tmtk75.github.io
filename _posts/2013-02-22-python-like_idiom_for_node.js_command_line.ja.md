---
layout: post
title: node.jsで書くコマンドラインツールのPython-likeイディオム
description: node.jsで書かれたコマンドをライブラリとしても使いたいとき、もしくはその逆のときに使える
tags: nodejs cli
lang: ja
creation-date: 2013-02-23 10:48:21 +0900
modified-date: 2013-02-23 10:48:21 +0900
---
Pythonの有名なイディオム。
コマンドとして呼ばれたときだけ実行し、ライブラリとして読まれたときは実行しないようにするための一行。

<pre class="brush: python">
if __name__ == '__main__':
</pre>

node.jsで書くとこうなる。

<pre class='brush: jscript'>
if process.argv[1] == __filename
</pre>

[hello.coffee](https://gist.github.com/tmtk75/5010128) はコマンドとしてもライブラリとしても使える。
<script src="https://gist.github.com/tmtk75/5010128.js"></script>

ライブラリとして読み込まれたときは、メソッド`say`をexportする。
<script src="https://gist.github.com/tmtk75/5010132.js"></script>

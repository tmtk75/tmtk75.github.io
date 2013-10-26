---
layout: redirect
title: Node.jsでrequireされたかどうかを調べるには
tags: nodejs python
lang: ja
creation-date: 2013-06-08 11:31:16 +0900
modified-date: 2013-06-08 11:31:16 +0900
---
Pythonの有名なイディオム、`if __main__ == "__main__":`、
moduleとしてimportされたときはifの中を実行しないためのもの。

CLIとしてもmoduleとしても使えるようにするための常套手段。

Node.jsで同じことをやるにはどうするか。

<script src="https://gist.github.com/tmtk75/5733748.js"></script>
<script src="https://gist.github.com/tmtk75/5733751.js"></script>

実行したら、それぞれ次のように出力されるはず。

    $ node app.js
    started: app.js

    $ node cli.js
    started: cli.js

`module.parent`がフラグ。
直接実行されたときは`null`になる。moduleとしての親がないってことね。

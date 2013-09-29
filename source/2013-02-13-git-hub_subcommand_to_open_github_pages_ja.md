---
layout: post
title: githubのページをterminalから開くgit-hubサブコマンド
tags: git, github, extension
lang: ja
creation-date: 2013-02-13  8:08:24
modified-date: 2013-02-13  8:08:24
---
githubのUIはとても使いやすいと思う。
BTSなんかにピンポイントでコードのある行へのリンクを張ったりできて重宝している。
[こんなふうに](https://github.com/tmtk75/git-hub/blob/master/git-hub#L8)。

ただ、ファイルがソースツリーの深いところにあったりすると
何度もクリックして目的のファイルまでツリーを掘り進まないと行けないのが玉にキズ。

そんなときは、[git-hub][git-hub]サブコマンドをインストールするとちょっと幸せになれるかもしれない。
（今のところMacOSXでしか動かないけど。もしよかったら他のOSでの方法教えてください）

  [git-hub]: https://github.com/tmtk75/git-hub
  [mruby]: git://github.com/mruby/mruby.git

ソースツリー深くにあるファイルをgithub上で開きたいとき、
もしそのファイル名を知っているなら（後述するがファイル名の一部でも可）
次のようにタイプすればそのページをブラウザが開く。
思ったよりこれが便利。

```bash
$ git hub blob <part-of-filename>
```

例を挙げて説明する。巷で話題の[mruby][mruby]のリポジトリで試してみよう。

git-hubをインストールするのは非常に簡単。
cloneしてPATHを通すだけ。

```bash
$ git clone git://github.com/tmtk75/git-hub.git ~/.git-hub
$ PATH=$PATH:~/.git-hub
```

<https://raw.github.com/tmtk75/git-hub/master/git-hub>をPATHが通ったところに置くだけでもいい。

で、mrubyをcloneして、下のようにタイプしてみよう。
デフォルトブラウザで件のページが開くはず。

    $ git clone git://github.com/mruby/mruby.git
    $ cd mruby
    $ git hub blob v22012.rake

もし同じ名前のファイルが複数あったらどう動くか？
やってみよう。

    $ git hub blob README.md
    INFO: more than two lines matched like
    1 README.md
    2 doc/compile/README.md
    3 doc/mrbgems/README.md
    4 examples/mrbgems/c_and_ruby_extension_example/README.md
    5 examples/mrbgems/c_extension_example/README.md
    6 examples/mrbgems/ruby_extension_example/README.md
    7 test/README.md

    If you'd like to choose the line latter than 1st one without changing the pattern,
    please try specifying index to select like

    git hub blob README.md:2

git-hubはREADME.mdとマッチするファイルの候補をすべて列挙する。
もし3番目の`doc/mrbgems/README.md`を開きたいなら、後ろに`:3`を付けて`git hub blob README.md:3`タイプすればいい。
わざわざ長いパス名をタイプする必要がなく、一覧から選ぶだけなのでパスが深くても大丈夫。

他にも`commits`, `compare`, `branches`などあるが、詳しくは[the README][readme]を見てほしい。

  [readme]: https://github.com/tmtk75/git-hub#readme


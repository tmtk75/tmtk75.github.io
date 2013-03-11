---
layout: post
title: grunt-contrib-jasmine-node
tags: grunt jasmine-node
lang: ja
creation-date: 2013-03-10 12:14:39 +0900
modified-date: 2013-03-10 12:14:39 +0900
---
JavaScriptのTDD用ライブラリは[jasmine](http://pivotal.github.com/jasmine/)が好きだ。
もともとRSpec使ってたから似たようなものを探したからなんだけど。

で、CLI用に[jasmine-node](https://github.com/mhevery/jasmine-node)もある。
[こんなふう][ex1]に書けて、terminalで実行できるので重宝している。

  [ex1]: https://github.com/tmtk75/jumly/blob/master/spec/SequenceDiagramBuilderSpec.coffee

[GRUNT](http://gruntjs.com/)に移行したのでgruntからjasmine-nodeを起動するpluginを書いてみた。ただオプションは`--coffee`しかサポートしていない。

<https://github.com/tmtk75/grunt-contrib-jasmine-node>

    NODE_PATH=lib/js jasmine-node --coffee spec
{:.terminal}

こんなコマンドをGRUNTから叩くには、次のように定義してやる。

<pre class="brush:js">
grunt.initConfig({
  "jasmine-node": {
    options: {
      coffee: true
    },
    run: {
      spec: "spec"
    },
    env: {
      NODE_PATH: "lib/js"
    }
  }
})
</pre>

GRUNTのコマンドは次のようになる。

    $ grunt jsamine-node


`--coffee`オプションしかサポートしてないので、誰か追加してください :)
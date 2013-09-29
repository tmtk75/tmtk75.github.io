---
layout: post
title: data- 属性とjQuery.data
tags: html5, jquery
lang: ja
creation-date: 2013-04-28 08:32:21 +0900
modified-date: 2013-04-28 08:32:21 +0900
---
[JUMLY.scan](http://jumly.herokuapp.com/)の実装で`data-*`属性jQuery.dataを使ってちょっとハマったので書き残す。

動作検証用に書いたものを[Gistに貼った](https://gist.github.com/tmtk75/5475559)のでどうぞ。

## data-*名と.data()のキー名の関係
- data-fooは、.data("foo")で取得
- data-foo\_barは、.data("foo\_bar")で取得
- data-foo-barは、.data("fooBar")で取得
- data-foo-0は、.dataでは取得できない。foo-0がキー名として認識されないようだ

foo-barのキーはcamel styleになるのは誰得な感があるので、
ハイフンでつなぐスタイルは好みなんだけど個人的には使わないことにする。



## data-*にはvalidなJSONが必要
「data-*にはJSON書けたよなあ」とうろ覚えで、最初次のように書いてた。

```html
<div id='foo' data-foo="{like:'apple'}">...
```

実はぜんぜんダメで、次のようにvalidなJSONで書く必要があった。

```html
<div id='foo' data-foo='{"like":"apple"}'>...
```

これで次のように参照できる。

```javascript
$(foo).data("foo").like
```

ちなみに、validなJSONじゃないときは、ただの文字列として認識される。

```javascript
typeof $(foo).data("foo")
"string"
```



## data-*は初期値用（かな？）

data-*はjQueryオブジェクトが構築される際に一度評価されて、
対応する.dataのスロットに入るようだ。コードちゃんと読んだわけじゃないけど。

```html
<div id='foo' data-foo='{"like":"apple"}'>...
```

```javascript
$(foo).data("foo").like = 'orange';
```

として書き換えてもdata-fooの値には影響はない。
まあ、そりゃそうだよね。そんなコスト高いことやってもメリット特にないし。

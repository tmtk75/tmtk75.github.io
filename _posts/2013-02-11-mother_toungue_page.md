---
layout: post
title: 日本語ページ作った with Jekyll on gh-pages
tags: Jekyll Liquid gh-pages
lang: ja
creation-date: 2013-02-11 17:51:47
modified-date: 2013-02-11 17:51:47
---
10ヶ月くらい慣れない英語でブログを書いてきたのは、英語のライティングの練習と、
閲覧者数を考えた場合にやっぱり日本語よりは英語のほうが多いだろうなあ、ということから。

でもやっぱり日本語で書きたいときもあるので、日本語ページを作った。
って、それだけじゃただのアナウンスなので、どうやったか書く。

<hr>

このサイトはドメインを見れば分かるように[gh-pages][gh-pages]で公開している。
ということは当然jekyllベースだ。

公開リポジトリの [tmtk75.github.com.git][tmtk75.github.com] を覗いてみてもらうと分かるが、
たとえば[レイアウトファイル][_layouts]なんかはHamlで書いてある。
で、公開前に[こんなrakeのタスク][rake-task]で.htmlへ変換してからpushしている。

  [gh-pages]: http://pages.github.com/
  [tmtk75.github.com]: http://github.com/tmtk75/tmtk75.github.com.git
  [_layouts]: https://github.com/tmtk75/tmtk75.github.com/tree/master/_layouts
  [rake-task]: https://github.com/tmtk75/tmtk75.github.com/blob/master/Rakefile#L8
  [yaml-fm]: https://github.com/mojombo/jekyll/wiki/yaml-front-matter 

それぞれの.hamlファイルはjekyllの[YAML-Front-Matter][yaml-fm]を生成するために、
オレオレルールを使って書いている部分がある。
Hamlのコメントは`-`だけど、`-#`から始まる行はYAML-Front-Matterの行として生成するというルール。

<pre class='brush: ruby'>
-#layout: default
-#lang: ja
%div Hello World
</pre>

だから上のようなファイルを、次のように変換する。

<pre class='brush: ruby'>
---
layout: default
lang: ja
---
<div>Hello World</div>
</pre>

で、ここで定義した`lang`は、`_layouts`以下のレイアウトファイルでは、`page.lang`として参照可能。
なので、[_layouts/default.html.haml][default]などの中では、それらの値を[Liquidのifタグ][liquid-if]で使って
表示する記事をフィルタしたりリンク先のURLを変更したりしている。

  [default]: https://github.com/tmtk75/tmtk75.github.com/blob/master/_layouts/default.html.haml
  [liquid-if]: https://github.com/Shopify/liquid/wiki/Liquid-for-Designers

<pre class='brush: ruby'>
{% raw %}
{% if page.lang == 'ja' %}
%a.brand{href:'/index.ja.html'}{{site.title}}
{% else %}
%a.brand{href:'/'}{{site.title}}
{% endif %}
{% endraw %}
</pre>

こんな感じ。

オレオレルールを使ってるのがちょっとイケてないが、まあ目的は達成できているのでよしとしている。

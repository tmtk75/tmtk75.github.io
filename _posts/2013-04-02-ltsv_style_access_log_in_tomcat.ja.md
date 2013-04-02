---
layout: post
title: TomcatのアクセスログをLTSVにする
tags: LTSV accesslog tomcat
lang: ja
creation-date: 2013-04-03 07:03:44 +0900
modified-date: 2013-04-03 07:03:44 +0900
---
## LTSV + fluentdいいよ、という話

みなさん[fluentd](http://fluentd.org/)使ってますか。
もうfluentdとLTSVがないと生きていけない体になりました。
あ、LTSVは、"labeled Tab-separated Values", <http://ltsv.org/>ですよ。
LTSVについては、[ここ](http://d.hatena.ne.jp/naoya/20130207)が面白いですよ。

かいつまんで言うと、Apacheのアクセスログ、普通はこんな感じなのを

    127.0.0.1 - frank [10/Oct/2000:13:55:36 -0700] "GET /apache_pb.gif HTTP/1.0" 200 2326 "http://www.example.com/start.html" "Mozilla/4.08 [en] (Win98; I ;Nav)"

\<ラベル>:\<値>\<TAB>\<ラベル>:\<値>... のようにしましょう、というものです。  
（ログのパターンは<http://ltsv.org/>から引用）

    host:127.0.0.1<TAB>ident:-<TAB>user:frank<TAB>time:[10/Oct/2000:13:55:36 -0700]<TAB>req:GET /apache_pb.gif HTTP/1.0<TAB>status:200<TAB>size:2326<TAB>referer:http://www.example.com/start.html<TAB>ua:Mozilla/4.08 [en] (Win98; I ;Nav)

\*nix系の行指向コマンドや、fluentdなんかととても相性がいいです。  
自分の業務でも全部これでとりあえずファイルに出力してfluentdにいったんぶっこんでから、
どこかへ出力という方向でいろいろ単純化できており、大変重宝しております。


## TomcatアクセスログでのLTSV

Tomcatでは`server.xml`の`Value`要素でアクセスログのパターンを定義することができます。
詳しくはオフィシャルを見てください。<http://tomcat.apache.org/tomcat-7.0-doc/config/valve.html#Access_Log_Valve>.

<pre class="brush: xml">
<&#86;alve className="org.apache.catalina.valves.AccessLogValve"
  directory="logs" prefix="access" suffix=".log"
  pattern="%h %l %u %t %r %s %b %D %I" resolveHosts="false"/>
</pre>

ここでアクセスログのパターンを`pattern`属性に書く必要があるのですが、XMLゆえにちょっとした規則があります。
まあそういうめんどくさい規則うんぬんはおいといて、LTSVのためにタブを属性値に含めるには実体参照`&#9;`を使います。

<pre class="brush: xml">
<&#86;alve ...
  pattern="host:%h&amp;#9;ident:%l&amp;#9;user:%u" />
</pre>

上のように書くと、アクセスログにTABが出力できます。

    host:127.0.0.1<TAB>ident:-<TAB>user:frank

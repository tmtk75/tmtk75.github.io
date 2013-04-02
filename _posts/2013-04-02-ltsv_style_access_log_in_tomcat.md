---
layout: post
title: LTSV style access log in tomcat
tags: LTSV accesslog tomcat
lang: 
creation-date: 2013-04-02 16:24:44 +0900
modified-date: 2013-04-03 08:03:44 +0900
---
## LTSV + fluentd is nice

LTSV is "labeled Tab-separated Values", [http://ltsv.org/](http://ltsv.org/).

A typical access log of Apache is like:

    127.0.0.1 - frank [10/Oct/2000:13:55:36 -0700] "GET /apache_pb.gif HTTP/1.0" 200 2326 "http://www.example.com/start.html" "Mozilla/4.08 [en] (Win98; I ;Nav)"

In LTSV, it will be:

    host:127.0.0.1<TAB>ident:-<TAB>user:frank<TAB>time:[10/Oct/2000:13:55:36 -0700]<TAB>req:GET /apache_pb.gif HTTP/1.0<TAB>status:200<TAB>size:2326<TAB>referer:http://www.example.com/start.html<TAB>ua:Mozilla/4.08 [en] (Win98; I ;Nav)

Very handleable if using fluentd.

## LTSV for access log of tomcat

We can define the pattern of access log with with `Value` element of `server.xml`.
In detail, see this link <http://tomcat.apache.org/tomcat-7.0-doc/config/valve.html#Access_Log_Valve>.

We have to write the pattern in attribute of Value element.
So if you use tomcat, how do you define your server.xml?

Then use entity `&#9;` like:

<pre class="brush: xml">
<Value ...
  pattern="host:%h&amp;#9;ident:%l&amp;#9;user:%u" />
</pre>

You will get access logs like:

    host:127.0.0.1<TAB>ident:-<TAB>user:frank

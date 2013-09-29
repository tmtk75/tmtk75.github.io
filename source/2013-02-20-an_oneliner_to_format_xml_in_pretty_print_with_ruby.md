---
layout: post
title: An oneliner to format XML in pretty print with Ruby
tags: Ruby, oneliner, prettyprint, XML
lang: 
creation-date: 2013-02-20 18:25:28 +0900
modified-date: 2013-02-20 18:25:28 +0900
---

    ruby -e 'require "rexml/document";d=REXML::Document.new($stdin.read);d.write(s="",2);puts s'

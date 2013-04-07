---
layout: post
title: An oneliner to format JSON in pretty-print with Ruby
tags: onenliner Ruby JSON prettyprint
lang: 
creation-date: 2013-02-19 15:43:13 +0900
modified-date: 2013-02-19 15:43:13 +0900
---
I cannot rememer this short line.  
I'll note it.

    ruby -e "require 'json'; puts (JSON.pretty_generate JSON.parse(STDIN.read))"

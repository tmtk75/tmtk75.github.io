---
layout: post
title: Group values of regular expression in CoffeeScript
tags: coffeescript, regex
lang: 
creation-date: 2013-05-26 18:47:51 +0900
modified-date: 2013-05-26 18:47:51 +0900
---
Easy to refer group values of regular expression in CoffeeScript.

Let's say you parse URL, then you can write like this.

```coffeescript
[_, path, queryParams] = req.url.match /([^?]+)\?(.*)/
```

Pretty useful.

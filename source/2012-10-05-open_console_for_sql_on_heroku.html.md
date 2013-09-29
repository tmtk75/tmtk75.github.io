---
layout: post
title: open console for SQL on heroku
creation-date: 2012-10-05 11:45:54
---
Use heroku-sql-console.

```bash
$ heroku plugins:install git://github.com/ddollar/heroku-sql-console.git
$ heroku sql [--app APPLICATION_NAME]
```

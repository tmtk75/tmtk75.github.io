---
layout: redirect
title: "warning: possible EventEmitter memory leak detected"
tags: nodejs eventemitter
lang: 
creation-date: 2013-06-09 22:15:44 +0900
modified-date: 2013-06-09 22:15:44 +0900
---
You may encounter the following warning when using [EventEmitter](http://nodejs.org/api/events.html#events_class_events_eventemitter).

    warning: possible EventEmitter memory leak detected. 11 listeners added. Use emitter.setMaxListeners() to increase limit.

For now, if you want to suppress it, set 0 with `setMaxListeners`.
See <http://nodejs.org/api/events.html#events_emitter_setmaxlisteners_n>.

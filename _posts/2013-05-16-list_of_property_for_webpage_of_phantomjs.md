---
layout: post
title: List of property for WebPage of PhantomJS
tags: webpage phantomjs
lang: 
creation-date: 2013-05-16 06:48:31 +0900
modified-date: 2013-05-16 06:48:31 +0900
---

I'm personally checking PhantomJS. At first about WebPage class.

Listed the properties with [this simple script on gist](https://gist.github.com/tmtk75/5587683).
Here is that of PhantomJS 1.9.0.

```
    objectName: 'WebPage'
    title: ''
    frameTitle: ''
    content: '<html><head></head><body></body></html>'
    frameContent: '<html><head></head><body></body></html>'
    url: 'about:blank'
    frameUrl: 'about:blank'
    loading: false
    loadingProgress: 0
    canGoBack: false
    canGoForward: false
    plainText: ''
    framePlainText: ''
    libraryPath: '{your-path}/phantomjs-learning'
    offlineStoragePath: '{your-home}/Library/Application Support/Ofi Labs/PhantomJS'
    offlineStorageQuota: 5242880
        height: 300
        width: 400
        height: 0
        left: 0
        top: 0
        width: 0
        left: 0
        top: 0
    navigationLocked: false
    zoomFactor: 1
    cookies: Array[0]
    windowName: ''
    pages: Array[0]
    pagesWindowName: Array[0]
    ownsPages: true
    framesName: Array[0]
    frameName: ''
    framesCount: 0
    focusedFrameName: ''
```

I'll keep checking PhantomJS having fun.

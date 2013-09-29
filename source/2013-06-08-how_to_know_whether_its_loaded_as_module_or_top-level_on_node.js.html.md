---
layout: post
title: How to know whether it's loaded as module or top-level on Node.js
tags: nodejs, python
lang: 
creation-date: 2013-06-08 11:31:16 +0900
modified-date: 2013-06-08 11:31:16 +0900
---
As you know, there is a famous idiom on Python, which is `if __main__ == "__main__":`.

The inside of if is only executed when it is directly launched by python command.
It's the way that we make command line interface which is compatible to module.

On Node.js, we can do same thing.

<script src="https://gist.github.com/tmtk75/5733748.js"></script>
<script src="https://gist.github.com/tmtk75/5733751.js"></script>

You can see next if you run them.

    $ node app.js
    started: app.js

    $ node cli.js
    started: cli.js

`module.parent` is the way. If it's directly launched, it becomes `null`. Very simple.

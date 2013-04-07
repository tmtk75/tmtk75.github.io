---
layout: post
title: Python-like idiom for node.js command line
tags: nodejs cli
lang: 
creation-date: 2013-02-22 10:48:21 +0900
modified-date: 2013-02-22 10:48:21 +0900
---
There is a major idiom in Python for CLI.

```python
if __name__ == '__main__':
```

This is in order to run the code in the if-clause only from executed on command line.

I'll show same code like this on node.js.

[hello.coffee](https://gist.github.com/tmtk75/5010128) works as a command and as a library.
This provides a method 'say' if it's library.

Here is an idiom for node.js.

```javascript
if process.argv[1] == __filename
```

<script src="https://gist.github.com/tmtk75/5010128.js"></script>
<script src="https://gist.github.com/tmtk75/5010132.js"></script>

---
layout: post
title: Try to remove .npm if npm install fails
tags: npm, node
lang: 
creation-date: 2013-02-19 13:46:20 +0900
modified-date: 2013-02-19 13:46:20 +0900
---
I encountered an error like following when I tried to solve dependency my module [JUMLY](https://github.com/tmtk75/jumly).
It's the time I cloned the repository and ran `npm install`.

    npm WARN prefer global jasmine-node@1.2.0 should be installed with -g
    npm http 304 https://registry.npmjs.org/bytes/0.1.0
    npm ERR! Error: ENOENT, utime '/Users/tsakuma/3scale-dashboard/node_modules/express/node_modules/connect/node_modules/qs/benchmark.js'
    npm ERR! If you need help, you may report this log at:
    npm ERR!     <http://github.com/isaacs/npm/issues>
    npm ERR! or email it to:
    npm ERR!     <npm-@googlegroups.com>
    npm ERR! System Darwin 12.2.0
    npm ERR! command "/Users/tsakuma/.nvm/v0.9.4/bin/node" "/Users/tsakuma/.nvm/v0.9.4/bin/npm" "install"
    ... to be continued long

I say the conclusion first of all.  
Try to remove your ~/.npm if no problem for you.

```bash
rm -rm ~/.npm    
```

And then try `npm install` again.  
In case of me, it worked well though I didn't know the root cause.

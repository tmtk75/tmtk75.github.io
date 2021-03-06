---
layout: redirect
title: grunt-contrib-jasmine-node
tags: grunt jasmine-node
lang: 
creation-date: 2013-03-10 12:14:39 +0900
modified-date: 2013-03-10 12:14:39 +0900
---
[jasmine-node](https://github.com/mhevery/jasmine-node) is a command to execute [jasmine](http://pivotal.github.com/jasmine/) on node.js.

I wrote a small plugin, which supports only `--coffee` option, for [GRUNT](http://gruntjs.com/).

<https://github.com/tmtk75/grunt-contrib-jasmine-node>

If you want to specify a environtment var like `NODE_PATH=lib/js` and set `--coffee` option,
and spec files are in `spec` directory, you can define the initConfig of grunt.

```javascript
grunt.initConfig({
  "jasmine-node": {
    options: {
      coffee: true
    },
    run: {
      spec: "spec"
    },
    env: {
      NODE_PATH: "lib/js"
    }
  }
})
```

Then you run like:

```bash
$ grunt jsamine-node
```

It's similar to:

```bash
$ NODE_PATH=lib/js jasmine-node --coffee spec
```

The current version 0.0.1 does support only an option `--coffee`.
I'll improve, or could you conribute? :)

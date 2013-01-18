---
layout: post
title: A directory layout of node module
tags: nodejs npm node_modules
creation-date: 2013-01-17  9:52:27
---
I've published a few node modules with npm.  
Then, my own specification is like:

- coffee-script can be used for most major scripts
- CLI interface can be supported
- Web interface can be supported

For these, I like a directory layout like:

    ./+-- bin
      |   `-- cli.js
      |-- index.js
      |-- app.coffee
      |-- lib
      |   |-- js
      |   |   |-- index.coffee
      |   |   |-- mymod.coffee
      |   |   |-- ...
      |   |
      |   `-- css
      |       |-- index.styl
      |       |-- ...
      |    
      `-- package.js
{:.terminal}

`cli.js`, which is a wrapper to invoke `index.coffee` in `lib/js`.

<pre class="brush:js">
#!/usr/bin/env node
require("coffee-script");
require(require('path').join(require('fs').realpathSync(__dirname), '../lib/js/index.coffee'));
</pre>

`index.coffee`, which is a wrapper of `cil.js`.

<pre class="brush:js">
#!/usr/bin/env node
require(require("path").join(require("fs").realpathSync(__dirname), "bin/cli.js"));
</pre>

`app.coffee`, which provides a webapp on express.

<pre class="brush:js">
#!/usr/bin/env coffee
express = require "express"
jade    = require "jade"
stylus  = require "stylus"
mymod   = require "lib/js/mymod.coffee"
## Your configuraiton of express...
</pre>

`index.coffee`, which is the actual entry point. Here is an example to require a local module.

<pre class="brush:js">
mymod = require "./mymod"
console.log mymod.hello_message()
</pre>

`mymod.coffee`, which is a module. At here, provides an object with a function to return a string.

<pre class="brush:js">
module.exports =
  hello_message: -> "hello! from " + __filename
</pre>

How about you? :)

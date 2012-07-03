---
layout: post
title: How to load YAML in Node.js
creation-date: 2012-05-27 17:08:52
---
I think js-yaml is a good library for loading YAML in Node.js

<https://github.com/nodeca/js-yaml>

<pre class="terminal">
$ npm install js-yaml
</pre>

Let's say your yaml file is as "your.yml",

    greeting: hello!
    year: 2012

In your .js code,

<pre class="brush:js">
var yaml = require("js-yaml");
var fs = require("fs");
var e = yaml.load(fs.readFileSync("your.yml"));
console.log(e.greeting);
console.log(e.year);
</pre>

---
layout: post
title: How to load YAML in Node.js
creation-date: 2012-05-27 17:08:52
---
I think js-yaml is a good library for loading YAML in Node.js

<https://github.com/nodeca/js-yaml>

```bash
npm install js-yaml
```

Let's say your yaml file is as "your.yml",

```yaml
greeting: hello!
year: 2012
```

In your .js code,

```javascript
var yaml = require("js-yaml");
var fs = require("fs");
var e = yaml.load(fs.readFileSync("your.yml"));
console.log(e.greeting);
console.log(e.year);
```

---
layout: redirect
title: How to use including file in jade template of express
creation-date: 2012-05-26  7:12:14
---
We defaultly cannot use "require" function of Node.js in jade template of express.
If we want to embed an external file in markdown, we cannot.

Then, it's happy to define utility function in app.js, and you can pass it like this.

```coffeescript
utils =
  markdown: (path)-> require("markdown-js").parse fs.readFileSync(path).toString()
app.get "/", (req, res)-> res.render 'index', utils
```

And use it in template.

    != markdown("your-file.md")

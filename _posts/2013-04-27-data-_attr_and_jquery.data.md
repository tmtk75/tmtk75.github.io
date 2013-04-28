---
layout: post
title: data- attribute and jQuery.data
tags: html5 jquery
lang: 
creation-date: 2013-04-28 08:32:21 +0900
modified-date: 2013-04-28 08:32:21 +0900
---
I wrote down this memo for `data-*` attribute and jQuery.data
because I got stuck when using them on implemetation of JUMLY.scan.

Here is [a gist](https://gist.github.com/tmtk75/5475559) to check behavior of them.


## Relation between data-* name and key of .data()
- `data-foo` is for `.data("foo")`
- `data-foo_bar` is for `.data("foo_bar")`
- `data-foo-bar` is for `.data("fooBar")`
- `data-foo-0` is for nothing. `foo-0` is not recognized as key name

I'm wondering `foo-bar` is camel style like `fooBar`.
Pyphenation-style like `foo-bar` is my favor, but I won't use this style in jQuery.


## Require valid JSON for data-*
I just remembered we use JSON string in data-\*. At first, I wrote like this.

```html
<div id='foo' data-foo="{like:'apple'}">...
```

Actually, it didn't work well. I needed to write like this.

```html
<div id='foo' data-foo='{"like":"apple"}'>...
```

It can be refered like this.

```javascript
$(foo).data("foo").like
```

Additionally, when it's not valid JSON, it becomes just a string.

```javascript
typeof $(foo).data("foo")
"string"
```



## data-* is used as initial values (?)

The value of data-* is evaluated and captured in a slot of jQuery object when the object is built once.
I'm not sure of the detail though I've not read the code.

```html
<div id='foo' data-foo='{"like":"apple"}'>...
```

```javascript
$(foo).data("foo").like = 'orange';
```

If we edit a part of object, the value of data-foo is not affected. It keeps the initial value.

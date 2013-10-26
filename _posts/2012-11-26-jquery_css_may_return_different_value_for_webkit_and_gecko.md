---
layout: redirect
title: jQuery css return different value for WebKit and Gecko
tag: unresolved
creation-date: 2012-11-26 22:41:40
---
I usually use Google Chrome on MacOSX and develop [JUMLY](http://jumly.herokuapp.com/), too.

JUMLY didn't work properly on Firefox yesterday when I released.
The reason was the difference jQuery.css returns value for "left" of div applied position:relative.

At following case, WebKit returns "auto", but Gecko returns "0px".

```javascript
var div = $("<div>").css({position:"relative"});
var parent = $("<div>").css({position:"relative"});
parent.append(div);
$("body").append(parent);
console.log(div.css("left"));
```

About a node which position is "relative",
when it is in another node which position is "relative",
Gecko, which is 17.0 on MacOSX, returns "0px".

I tentatively fixed as <https://github.com/tmtk75/jumly/commit/4f8332d3be3d32199b26220b59181d5647a885ff> for now,
but how do I see if left of css is specified as "0px" or not on Firefox?

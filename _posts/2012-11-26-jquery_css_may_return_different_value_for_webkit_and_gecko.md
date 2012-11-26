---
layout: post
title: jQuery css may return different value for WebKit and Gecko
category: JUMLY
creation-date: 2012-11-26 22:41:40
---
I usually use Google Chrome on MacOSX and develop [JUMLY](http://jumly.herokuapp.com/), too.

JUMLY didn't work properly on Firefox yesterday when I released.
The reason is the difference jQuery.css returns value for "left"

Chfome returns "auto"

    div = $("<div>");
    $("body").append(div);
    console.log(div.css("left"));

https://github.com/tmtk75/jumly/commit/4f8332d3be3d32199b26220b59181d5647a885ff

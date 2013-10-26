---
layout: redirect
title: node-jquery which supports dom, jquery and xhr on node
creation-date: 2012-10-09 18:25:08
---
I wrote a node module to support dom, jquery and xhr.  
[node-jquery](https://npmjs.org/package/node-jquery)  
You can use many jQuery methods including $.ajax and use jQuery's selector.

Here is a sample to retrieve all anchors on the top page of yahoo.
<script src="https://gist.github.com/3857612.js?file=example.coffee"></script>

This mostly depends on wonderful libraries, [node-jquery][node-jquery], [jsdom][jsdom] and [node-XMLHttpRequest][xhr].
Thank you so much for the authors.

[node-jquery]: https://github.com/coolaj86/node-jquery.git
[jsdom]: https://github.com/tmpvar/jsdom.git
[xhr]: https://github.com/driverdan/node-XMLHttpRequest.git

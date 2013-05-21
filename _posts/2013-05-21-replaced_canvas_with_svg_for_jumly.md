---
layout: post
title: Replaced canvas with svg for JUMLY
tags: canvas svg jumly
lang:
creation-date: 2013-05-21 09:54:43 +0900
modified-date: 2013-05-21 09:54:43 +0900
---
JUMLY has used &lt;canvas&gt; tag in order to render arrows of message.
From v0.1.4, JUMLY used &lt;svg&gt; tag for those.

I've not understood svg can be customized so easily with CSS.
It's strongly helpful, useful, wonderful, awesome... anyway great.
And also, it's kindly portable even if css is imported without any JavaScript files.
Tremendous again.

Here is an exmample.

```html
<style>
svg {border:solid gray #ddd}
.mono .arrow {stroke:gray; stroke-width:2px}
.mono .arrow .triangle {fill:none}
.pop .arrow {stroke:#ffba00; stroke-width:8px; stroke-linecap:round; stroke-linejoin:round}
.pop .arrow .triangle {stroke:#bf8b00; fill:none}
</style>
<svg class="mono" width="192" height="64">
  <g class="arrow">
    <path class="line" d="M4,32 l140,0"/>
    <path class="triangle" d="M164,32 l-20,12 l0,-24 Z"/>
  </g>
</svg>
<svg class="pop" width="192" height="64">
  <g class="arrow">
    <path class="line" d="M4,32 l140,0"/>
    <path class="triangle" d="M164,32 l-20,12 l0,-24 Z"/>
  </g>
</svg>
```

<style>
svg {border:solid gray #ddd}
.mono .arrow {stroke:gray; stroke-width:2px}
.mono .arrow .triangle {fill:none}
.pop .arrow {stroke:#ffba00; stroke-width:8px; stroke-linecap:round; stroke-linejoin:round}
.pop .arrow .triangle {stroke:#bf8b00; fill:none}
</style>
<svg class="mono" width="192" height="64">
  <g class="arrow">
    <path class="line" d="M4,32 l140,0"/>
    <path class="triangle" d="M164,32 l-20,12 l0,-24 Z"/>
  </g>
  <text x='20' y='30' style='text-anchor:start'>class="mono"</text>
</svg>
<svg class="pop" width="192" height="64">
  <g class="arrow">
    <path class="line" d="M4,32 l140,0"/>
    <path class="triangle" d="M164,32 l-20,12 l0,-24 Z"/>
  </g>
  <text x='20' y='30' style='text-anchor:start'>class="pop"</text>
</svg>

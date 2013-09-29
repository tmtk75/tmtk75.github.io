---
layout: post
title: JUMLY can change arrow style
tags: JUMLY, style, css, svg, JML
lang: en
creation-date: 2013-09-21 10:23:35 +0900
modified-date: 2013-09-21 10:23:35 +0900
---
A JavaScript library, JUMLY, is to render UML sequence diagrams.
It can change styles whatever you want even arrows.

Here is a simple example.

<a href='http://jumly.herokuapp.com/public/examples/simple.html'><img style='box-shadow:none' src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-09-21/simple.png'></a>

On the other hand, here is a styled one.

<a href='http://jumly.herokuapp.com/public/examples/styling-arrow.html'><img style='box-shadow:none' src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-09-21/styled.png'></a>

Here is the style. Put this in your &lt;style&gt;

```css
.sequence-diagram .message svg.arrow line {
  stroke-width: 3px;
  stroke: #8bc84b;
  stroke-dasharray: 8, 4;
}
.sequence-diagram .message svg.arrow polyline {
  stroke: #8bc84b;
  fill: #8bc84b;
}
```

As you can see, arrow is rendered with SVG.
So many properties are prepared.
In detail, please see here, <http://www.w3.org/TR/SVG/styling.html#SVGStylingProperties>.

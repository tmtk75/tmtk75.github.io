---
layout: post
title: JUMLY is being improved for robustness diagram
tags: JUMLY robustness
lang: 
creation-date: 2013-03-29 08:42:01 +0900
modified-date: 2013-03-29 08:42:01 +0900
---
I'm improving [JUMLY](http://jumly.herokuapp.com/) to enable rendering [robustness diagram](https://www.google.co.jp/search?q=robustness+diagram&hl=en&tbm=isch&tbo=u&source=univ&sa=X&ei=UMpUUa5Bh_KQBYmngZgJ&ved=0CC8QsAQ&biw=998&bih=738).

The following is a prototyping for rendering and DSL.

<link rel="stylesheet" href="https://jumly.herokuapp.com/release/jumly.min.css" />
<script src='http://code.jquery.com/jquery-1.9.1.min.js'></script>
<script src='http://coffeescript.org/extras/coffee-script.js'></script>
<script type="text/javascript" src='https://jumly.herokuapp.com/release/jumly.min.js'></script>
<script type="text/jumly+robustness">
@actor "User" :-> @view "Browser"
@view "Browser" :-> @controller "Server"
@controller "Server" :-> @entity "Database"
</script>

<pre class="brush:js">
@actor "User" :-> @view "Browser"
@view "Browser" :-> @controller "Server"
@controller "Server" :-> @entity "Database"
</pre>

Actually, I'm considering about:

- Placement algorithm for elements like actor, view, controller and entity.
  It's better if they are placed automaticallly.
  If need, we can set exact position.
- My first DSL is messy. It's not helpful to understand relationship between elements.

The current placement logic is very ad-hoc, and the DSL is not intuitive.
Also I don't like the result of rendering about the gap among the lines and elemnets.

Robustness diagram is different from sequence diagram at layout.
The former is 2D graph, so called.
If someone knows good algorithms to place nodes on 2D graph and give me that, it would be very happy for me.

Anyway, I have to improve these.

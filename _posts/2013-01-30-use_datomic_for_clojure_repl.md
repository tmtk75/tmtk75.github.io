---
layout: post
title: Use a Datomic archive for clojure REPL
tags: datomic clojure REPL
creation-date: 2013-01-30 11:43:19
---
<div class="alert alert-info">
  <dl style='margin:0'>
    <dt>NOTE</dt>
    <dd>a new post is here, <a href='/2013/02/01/not_datomic_but_leiningen_for_repl.html'>Not datomic but Leiningen for REPL</a></dd>
  </dl>
</div>

Now clojure's latest stable version is [1.4.0], and [1.5.0-RC4][1.5.0] is as a beta.

  [1.4.0]: http://clojure.org/downloads
  [1.5.0]: http://search.maven.org/#search%7Cga%7C1%7Cg%3A%22org.clojure%22%20AND%20a%3A%22clojure%22%20AND%20v%3A1.5.0*

They have a REPL (Read-Eval-Print-Loop) environment, but it's a bit poor because of no history, complement and edit feature.

I planned to add the features to the REPL and found a good library [jline2][jline2] which supports all functions I want.

  [jline2]: https://github.com/jline/jline2


When I built a set of projects for the both on my eclipse, I found a new good one which already has great editable REPL environtment for clojure.
It's [Datomic](http://www.datomic.com/), which is a one of database products which has new architecture. (This is very interesting for me! I'll check this later!)

Download a free version from [here](http://downloads.datomic.com/free.html), extract it and change current directory.
You can see `repl-jline` in the bin directory.

    $ ./bin/repl-jline
    Clojure 1.4.0
    user=> 

Congraturation!  
you got very useful REPL environment!

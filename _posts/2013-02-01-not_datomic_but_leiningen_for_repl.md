---
layout: post
title: Not datomic but Leiningen for REPL
tags: clojure leiningen repl
creation-date: 2013-02-01 16:39:49
---
I described [Datomic provides a better REPL](/2013/01/30/use_datomic_for_clojure_repl.html) which we can use command history and line-edit in.

Actually, I found a new better one, [leiningen][github].
It's a build & package manager like maven of Java.

  [github]: https://github.com/technomancy/leiningen

The way to install is very easy according to its [README][github].

    $ mkdir -p ~/bin
    $ PATH=$PATH:~/bin
    $ wget -O ~/bin/lein https://raw.github.com/technomancy/leiningen/stable/bin/lein
    $ chmod +x ~/bin/lein
    $ lein

Just only!

And type to run REPL just like this, `lein repl`.

    $ lein repl
    nREPL server started on port 51856
    REPL-y 0.1.9
    Clojure 1.4.0
        Exit: Control+D or (exit) or (quit)
    Commands: (user/help)
        Docs: (doc function-name-here)
              (find-doc "part-of-name-here")
      Source: (source function-name-here)
              (user/sourcery function-name-here)
     Javadoc: (javadoc java-object-or-class-here)
    Examples from clojuredocs.org: [clojuredocs or cdoc]
              (user/clojuredocs name-here)
              (user/clojuredocs "ns-here" "name-here")
    user=> 

In REPL, you can use command-history, line-edit and command-complement.
Command-complement is not supported in the REPL of datomic.
Super wonderful!

Let's enjoy clojure life!

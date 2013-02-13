---
layout: post
title: git-hub subcommand to open github pages
tags: git github extension
lang: 
creation-date: 2013-02-13  8:08:24
modified-date: 2013-02-13  8:08:24
---
The UI of github is cool, referenceable and capable.
We can tell a line of a source file as easy as poining it with an URL like [this](https://github.com/tmtk75/git-hub/blob/master/git-hub#L8).
That's very nice to write a specific link in a commit on a BTS.

However, when we want to get a link, we have to sometimes dig into the target file clicking over and over.
That's a bit stressful.

Then, you may be happy if you install [git-hub][git-hub]. (now, this is only for MacOSX)

  [git-hub]: https://github.com/tmtk75/git-hub
  [mruby]: git://github.com/mruby/mruby.git

When you want to open a page for a file at the bototm of deep source tree,
then you alreadly know the filename, you can type as following using git-hub.

    $ git hub blob <part-of-filename>
{:.terminal}


For example, let's play git-hub on [mruby][mruby].

Install git-hub, that's very easy.

    $ git clone git://github.com/tmtk75/git-hub.git ~/.git-hub
    $ PATH=$PATH:~/.git-hub
{:.terminal}

Clone mruby, open vs2012.rake
The page is opened with your default browser.

    $ git clone git://github.com/mruby/mruby.git
    $ cd mruby
    $ git hub blob v22012.rake
{:.terminal}

If there are many files with same name, how do it work?
Let's try.

    $ git hub blob README.md
    INFO: more than two lines matched like
    1  README.md
    2 doc/compile/README.md
    3 doc/mrbgems/README.md
    4 examples/mrbgems/c_and_ruby_extension_example/README.md
    5 examples/mrbgems/c_extension_example/README.md
    6 examples/mrbgems/ruby_extension_example/README.md
    7 test/README.md

    If you'd like to choose the line latter than 1st one without changing the pattern,
    please try specifying index to select like

    git hub blob README.md:2


  

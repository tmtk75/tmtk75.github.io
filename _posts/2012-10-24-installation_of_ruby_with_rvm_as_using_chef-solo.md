---
layout: post
title: Installation of ruby with rvm to be available of chef-solo
creation-date: 2012-10-24 12:54:20
---
Everytime I set up ruby on a new machine, I forget how to install chef-solo works well.
I'll memorize it.

As <https://rvm.io/rvm/install/>, but without `--ruby`

    $ \curl -L https://get.rvm.io | bash -s stable
    $ source ~/.rvm/scripts/rvm
{:.terminal}

Install required libraries

    $ for e in readline iconv curl openssl zlib autoconf ncurses pkgconfig gettext glib mono llvm libxml2 libxslt libyaml; do rvm pkg install $e; done
{:.terminal}

Install a version of ruby

    $ rvm install 1.9.3-p286
{:.terminal}

Install chef with gem

    $ gem install --no-ri --no-rdoc chef
{:.terminal}


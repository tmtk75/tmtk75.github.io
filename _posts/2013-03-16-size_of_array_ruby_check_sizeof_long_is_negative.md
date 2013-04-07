---
layout: post
title: size of array ruby_check_sizeof_long is negative in case of installing mysql2 gem
tags: ruby gem mysql
lang: 
creation-date: 2013-03-16 08:31:28 +0900
modified-date: 2013-03-16 08:31:28 +0900
---
When you install `mysql2` with gem, if you ran into a weird issue such as `error: size of array ‘ruby_check_sizeof_long’ is negative`,
it must be caused by the arch of mysql binary you installed.

    ERROR:  Error installing mysql2:
            ERROR: Failed to build gem native extension.

            /Users/tsakuma/.rvm/rubies/ruby-1.9.3-p327/bin/ruby extconf.rb --with-mysql-config=~/.kiidev/usr/mysql-5.5.28-osx10.6-x86/bin/mysql_config
    checking for rb_thread_blocking_region()... yes
    checking for rb_wait_for_single_fd()... yes
    checking for mysql.h... yes
    checking for errmsg.h... yes
    checking for mysqld_error.h... yes
    creating Makefile

    make
    compiling client.c
    In file included from /Users/tsakuma/.rvm/rubies/ruby-1.9.3-p327/include/ruby-1.9.1/ruby.h:32,
                     from ./mysql2_ext.h:8,
                     from client.c:1:
    /Users/tsakuma/.rvm/rubies/ruby-1.9.3-p327/include/ruby-1.9.1/ruby/ruby.h:105: error: size of array ‘ruby_check_sizeof_long’ is negative
    /Users/tsakuma/.rvm/rubies/ruby-1.9.3-p327/include/ruby-1.9.1/ruby/ruby.h:109: error: size of array ‘ruby_check_sizeof_voidp’ is negative
    In file included from /Users/tsakuma/.rvm/rubies/ruby-1.9.3-p327/include/ruby-1.9.1/ruby/intern.h:34,
                     from /Users/tsakuma/.rvm/rubies/ruby-1.9.3-p327/include/ruby-1.9.1/ruby/ruby.h:1382,
                     from /Users/tsakuma/.rvm/rubies/ruby-1.9.3-p327/include/ruby-1.9.1/ruby.h:32,
                     from ./mysql2_ext.h:8,
                     from client.c:1:
    /Users/tsakuma/.rvm/rubies/ruby-1.9.3-p327/include/ruby-1.9.1/ruby/st.h:67: error: size of array ‘st_check_for_sizeof_st_index_t’ is negative
    lipo: can't open input file: /var/folders/nh/0mswhyh930737hfwj9xqbzp40000gn/T//ccjcncjn.out (No such file or directory)
    make: *** [client.o] Error 1


    Gem files will remain installed in /Users/tsakuma/.rvm/gems/ruby-1.9.3-p327/gems/mysql2-0.3.11 for inspection.
    Results logged to /Users/tsakuma/.rvm/gems/ruby-1.9.3-p327/gems/mysql2-0.3.11/ext/mysql2/gem_make.out

Download a new archive from [the download page](http://www.mysql.com/downloads/mysql/).

<a href="https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-03-16/MySQL+__+Download+MySQL+Community+Server.png">
<img width="100%" src="https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-03-16/MySQL+__+Download+MySQL+Community+Server.png"/>
</a>

So you start installing again like:

    gem install mysql2 --no-ri --no-rdoc -- --with-mysql-config=$YOUR_MYSQL_HOME/bin/mysql_config
    Successfully installed mysql2-0.3.11
    1 gem installed


[The answer on the Stack Overflow](http://stackoverflow.com/questions/5229907/mysql2-ruby-gem-will-not-install-10-6) was helpful for me.


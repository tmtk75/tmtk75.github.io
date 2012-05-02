---
layout: post
title: Chef server installation at ubuntu-11.10
creation-date: 2012-05-02 20:22:19
---
[Chef][chef-home] is one of configuration management system.

  [chef-home]: http://wiki.opscode.com/display/chef/Home
  [ruby-tarball]: ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p125.tar.bz2

I'll explain how to set up chef-server with [ruby 1.9.3-p125][ruby-tarball] on ubuntu-11.10.


<pre>
$ sudo apt-get install zlib1g-dev libssl-dev libxml2-dev libsqlite3-dev
$ cd /usr/local/src
$ wget ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p125.tar.bz2
$ tar xfj ruby-1.9.3-p125.tar.bz2
$ cd /usr/local/src/ruby-1.9.3-p125
$ make distclean; ./configure; make
$ gem install zliby
$ gem install chef-solr
</pre>

<pre>
$ dpkg --configure -a
$ apt-get install erlang
</pre>

<pre>
$ chef-solo -c /etc/chef/solo.rb -j ~/chef.json -r http://s3.amazonaws.com/chef-solo/bootstrap-latest.tar.gz
</pre>

<pre>
$ cd /usr/bin
$ ln -sf /usr/local/bin/chef-* .
</pre>

If you get following, they are working.

<pre>
$ /etc/init.d/chef-solr
Usage: /etc/init.d/chef-solr {start|stop|force-stop|restart|force-reload|status}
</pre>

chef-server is not in /usr/bin, /usr/sbin, ...
So make the link to it.
<pre>
$ ln -s /usr/local/lib/ruby/gems/1.9.1/gems/chef-server-api-0.10.8/bin/chef-server /usr/bin
</pre>

/var/lib/chef 's permission is inconsistent. Once remove it, and re-run chef-solo.
<pre>
$ chef-solo -c /etc/chef/solo.rb -j ~/chef.json -r http://s3.amazonaws.com/chef-solo/bootstrap-latest.tar.gz
</pre>


<pre class="prettyprint ruby">
default[:app][:home] = "."
</pre>

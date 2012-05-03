---
layout: post
title: Chef server installation in ubuntu-11.10
creation-date: 2012-05-02 20:22:19
---
[Chef][chef-home] is one of configuration management system, but it seems hard to install for not rubyist.

I'll explain how to set up chef-server with exact versions.
They are [ruby 1.9.3-p125][ruby-tarball] on [ubuntu-11.10][ubuntu].

  [chef-home]: http://wiki.opscode.com/display/chef/Home
  [ruby-tarball]: ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p125.tar.bz2
  [ubuntu]: http://www.ubuntu.com/

### Installation for ruby 1.9.3-p125.
<pre>
$ sudo apt-get update
$ sudo dpkg --configure -a
$ sudo apt-get install zlib1g-dev libssl-dev libxml2-dev libsqlite3-dev libyaml-dev erlang ruby1.9.2-full
</pre>

<pre>
$ sudo mkdir /etc/chef
</pre>

/etc/chef/solo.rb

<pre class="prettyprint ruby">
file_cache_path "/tmp/chef-solo"
cookbook_path "/tmp/chef-solo/cookbooks"
</pre>

~/chef.json

<pre class="prettyprint json">
{
  "chef_server": {
    "server_url": "http://localhost:4000",
    "webui_enabled": true
  },
  "run_list": [ "recipe[chef-server::rubygems-install]" ]
}
</pre>

<pre>
$ sudo gem install zliby chef-solr --no-ri --no-rdoc
$ sudo chef-solo -c /etc/chef/solo.rb -j ~/chef.json -r http://s3.amazonaws.com/chef-solo/bootstrap-latest.tar.gz
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

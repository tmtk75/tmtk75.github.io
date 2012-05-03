---
layout: post
title: Chef server installation in ubuntu-11.10
creation-date: 2012-05-02 20:22:19
---
[Chef][chef-home] is one of configuration management system, but it seems hard to install for not rubyist.

I'll explain how to set up chef-server with exact versions.
They are ruby 1.9.2 and [ubuntu-11.10][ubuntu].

  [chef-home]: http://wiki.opscode.com/display/chef/Home
  [ubuntu]: http://www.ubuntu.com/

<pre>
$ sudo apt-get update
$ sudo apt-get install libstdc++6-4.6-dev g++ ruby1.9.2-full
</pre>

~/solo.rb

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
$ sudo chef-solo -c ~/solo.rb -j ~/chef.json -r http://s3.amazonaws.com/chef-solo/bootstrap-latest.tar.gz
</pre>

<pre>
$ cd /usr/bin
$ sudo ln -sf /usr/local/bin/chef-* .
</pre>

<pre>
$ sudo /etc/init.d/chef-solr start
$ sudo /etc/init.d/chef-expander start
$ sudo /etc/init.d/chef-server start
$ sudo /etc/init.d/chef-server-webui start
</pre>

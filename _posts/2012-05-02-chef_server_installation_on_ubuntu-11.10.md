---
layout: post
title: How to install chef server on ubuntu-11.10 using apt-get
creation-date: 2012-05-02 20:22:19
---
<div class="alert alert-info">
  <dl style='margin:0'>
    <dt>NOTE</dt>
    <dd>a new post is here, <a href='/2013/02/01/set_up_chef-server_on_ec2_with_ubuntu-12.4.html'>Set up chef-server on EC2 with Ubuntu 12.04</a></dd>
  </dl>
</div>

[Chef][chef-home] is one of configuration management system, but it seems hard to install for not rubyist.
I'll explain how to set up chef-server with exact versions.
They are ruby 1.9.2 and [ubuntu-11.10][ubuntu].

You can absolutely set up chef-server after this post!

  [chef-home]: http://wiki.opscode.com/display/chef/Home
  [ubuntu]: http://www.ubuntu.com/

Initially, install ruby1.9

```bash
sudo apt-get update
sudo apt-get install libstdc++6-4.6-dev g++ ruby1.9.2-full
```

Create two configuration files of chef.

[~/solo.rb](https://gist.github.com/2600816)

```ruby
file_cache_path "/tmp/chef-solo"
cookbook_path "/tmp/chef-solo/cookbooks"
```

[~/chef.json](https://gist.github.com/2600821)

```json
{
  "chef_server": {
    "server_url": "http://localhost:4040",
    "webui_enabled": true
  },
  "run_list": [ "recipe[chef-server::rubygems-install]" ]
}
```

Install chef client, and install chef server using chef-solo.

```bash
sudo gem install zliby chef-solr --no-ri --no-rdoc
sudo chef-solo -c ~/solo.rb -j ~/chef.json -r http://s3.amazonaws.com/chef-solo/bootstrap-latest.tar.gz
```


Some scripts in /etc/init.d strangely require /usr/bin/chef-* scripts.
Make symbolic links for them.

```bash
sudo ln -sf /usr/local/bin/chef-* /usr/bin
```

Start all related services in order.

```bash
sudo /etc/init.d/chef-solr start
sudo /etc/init.d/chef-expander start
sudo /etc/init.d/chef-server start
sudo /etc/init.d/chef-server-webui start
```


Congraturation, you finished installing chef server.
Open <http://localhost:4040> with your browser.

---
layout: redirect
title: How to install chef server on CentOS-6.2 using yum
creation-date: 2012-05-05 15:03:55
---
I posted [how to set up chef server on ubuntu-11.10](/2012/05/02/chef_server_installation_on_ubuntu-11.10.html).
CentOS is a popular Linux distributions. I'll describe how to set it up step by step, too.

Install chef-solr as root.

```bash
su -
yum install gcc make ruby ruby-devel rubygems
gem install --no-rdoc --no-ri chef-solr
```

Create two configuration files, 
[~/solo.rb](https://gist.github.com/2600816), [~/chef.json](https://gist.github.com/2600821)

You can run chef-solo to install.

```bash
$ chef-solo -c solo.rb -j ~/chef.json -r http://s3.amazonaws.com/chef-solo/bootstrap-latest.tar.gz
```

<span class="label label-important">Important</span>
And, you may need to retry the same command because the 1st execution will be failed due to an error which says yum locking.
If failed, re-run it. And also, it takes so much time in order to compile geocode.

```bash
chef-solo -c solo.rb -j ~/chef.json -r http://s3.amazonaws.com/chef-solo/bootstrap-latest.tar.gz
```

In case finishing without error, open <http://localhost:4000> with your browser.

<img src="{{site.images.url}}/2012-05-05/chef-server-webui.jpg" alt="chef-server-webui.jpg" width="256px"/>

If you can see above, installation is succeeded!

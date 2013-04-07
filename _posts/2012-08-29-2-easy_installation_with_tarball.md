---
layout: post
title: chef's definition to download tarball
creation-date: 2012-08-29  8:52:13
---
It's frequent process downloading a tarball from somewhere and extracting it.
Here is a definition of chef to do it.

```ruby
define :install_tarball do

  url = params[:name]
  home = params[:home] or node.home
  path = File.basename URI.split(url)[5]
  tarball = "#{home}/#{path}"

  remote_file tarball do
    source url
    action :create_if_missing
  end

  execute "tar xf #{tarball}" do
    cwd home
  end

end
```

Put this under your cookbook as like tomcat/definitions/install_tarball.rb.

Then, if you can put the next resource in your recipe,
apache-tomcat-x.x.x will be extracted in node.home.
(It assumes node.home and node.tomcat.releases.latest, which is URL, are defined)

    install_tarball node.tomcat.releases.latest


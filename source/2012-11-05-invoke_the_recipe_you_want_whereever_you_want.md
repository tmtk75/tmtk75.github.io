---
layout: post
title: Invoke the recipe of chef you want whereever you want
creation-date: 2012-11-05  7:04:53
---
You can use "include_recipe" in a recipe if you want to invoke another recipe,
but can't use it in providers and definitions as is.

In the case, you can use `run_context`.

```ruby
action :an_action do
  ## invoke "maven" recipe if mvn command missing.
  unless ::File.exists? "#{ENV['M2_HOME']}/bin/mvn"
    run_context.include_recipe "maven"
  end
  
  ## processes using maven
  ## ...
```

I think this is not official interface though working on chef-10.16.2.

Found the answer here, <http://lists.opscode.com/sympa/arc/chef/2011-12/msg00382.html>.

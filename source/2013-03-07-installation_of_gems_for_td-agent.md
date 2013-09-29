---
layout: post
title: Installation of gems for td-agent
tags: td-agent, fluentd, plugin
lang: 
creation-date: 2013-03-07 18:42:36 +0900
modified-date: 2013-03-07 18:42:36 +0900
---
I needed a fluent-plugin for my plugin in order to run on td-agent.
td-agent has complete runtime of Ruby, we should install gems to the GEM_HOME td-agent refers.

     $ cat `which td-agent`
     #!/usr/lib64/fluent/ruby/bin/ruby
     ENV["GEM_HOME"]="/usr/lib64/fluent/ruby/lib/ruby/gems/1.9.1/"
     ...

Seeing the script<sup><a href='#fn1'>1</a></sup> to launch, it says the GEM_HOME.

So when you install gems td-agent uses, set GEM_HOME like this.

     export GEM_HOME="/usr/lib64/fluent/ruby/lib/ruby/gems/1.9.1/"
     gem install mysql2-cs-bind --no-ri --no-rdoc

td-agent will recognize it.

<span id='fn1'></span>
<span>1:</span><span>the version was td-agent-1.1.11-0.x86_64</span>

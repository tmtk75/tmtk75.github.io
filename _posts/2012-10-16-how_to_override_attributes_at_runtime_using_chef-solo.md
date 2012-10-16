---
layout: post
title: How to override attributes at runtime using chef-solo
creation-date: 2012-10-16 14:50:14
---
chef-solo allows overriding attributes at the runtime with `-j` options which is given a json.

It usually is used for declaring `run_list` like this.

<pre class="brush: java">
    {
      "run_list": ["recipe[java]"]
    }
</pre>

Then you can write attributes in same level with `run_list`.

<pre class="brush: java">
    {
      "java": {
        "home": "/usr/local/java"
      },
      "run_list": ["recipe[java]"]
    }
</pre>

It equals following notattion in attributes/default.rb of cookbook of java.

<pre class="brush: ruby">
    default[:java][:home] = "/usr/local/java"
</pre>

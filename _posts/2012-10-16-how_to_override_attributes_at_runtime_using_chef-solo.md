---
layout: redirect
title: How to override attributes at runtime using chef-solo
creation-date: 2012-10-16 14:50:14
---
chef-solo allows overriding attributes at the runtime with `-j` options which is given a json.

It usually is used for declaring `run_list` like this.

```ruby
{
  "run_list": ["recipe[java]"]
}
```

Then you can write attributes in same level with `run_list`.

```ruby
{
  "java": {
    "home": "/usr/local/java"
  },
  "run_list": ["recipe[java]"]
}
```

It equals following notattion in attributes/default.rb of cookbook of java.

```ruby
default[:java][:home] = "/usr/local/java"
```

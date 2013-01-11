---
layout: post
title: directory recursively does not work even for chef-10.16.6
tags: chef
creation-date: 2013-01-11  9:06:12
---

You know well, mkdir -p can recursively create directory.
I've expected the `directory` resource of chef works such that.

For example, if foobar directory doesn't exist, it creates 12345-abc.

<pre class='brush:ruby'>
directory "/tmp/foobar/12345-abc" do
  recursive true
end
</pre>

But it occurs an error and stops.
It seems recursive option works for only deleting.

Instead of it, I used raw-ruby code like:

<pre class='brush:ruby'>
require "fileutils"
::FileUtils.mkdir_p "/tmp/foobar/12345-abc"
</pre>

At the point like what we can writeraw-ruby code, chef is useful.

---
layout: post
title: How to install chef server on CentOS-6.2 using yum
creation-date: 2012-05-05 15:03:55
---
I posted how to set up chef server on ubuntu-11.10.
There is a popular Linux distributions, CentOS. I'll describe how to set it up step by step.

    $ su -
    $ yum install gcc make ruby ruby-devel rubygems
    $ gem install --no-rdoc --no-ri chef-solr

You can

    $ chef-solo -c solo.rb -j ~/chef.json -r http://s3.amazonaws.com/chef-solo/bootstrap-latest.tar.gz


    NOTE: Maybe the 1st run will be failed because of yum locking.
    You may need to retry the same command.
    And also, it takes so much time in order to compile geocode.


    $ chef-solo -c solo.rb -j ~/chef.json -r http://s3.amazonaws.com/chef-solo/bootstrap-latest.tar.gz

    To check running well, run next.
    $ wget localhost:4000

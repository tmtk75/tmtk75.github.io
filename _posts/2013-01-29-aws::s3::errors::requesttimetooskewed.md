---
layout: post
title: RequestTimeTooSkewed
tags: aws s3 ruby
creation-date: 2013-01-29 14:39:16
---
I ran into an above error, `AWS::S3::Errors::RequestTimeTooSkewed`, when I tried to download an object from S3 using aws-sdk of ruby.

    [2013-01-29T14:34:35+09:00] FATAL: AWS::S3::Errors::RequestTimeTooSkewed: ruby_block[something.s3.bucket/pub/archive-i-want.tar.ggz] (/foobar/fizbiz/s3.rb line 8) had an error: AWS::S3::Errors::RequestTimeTooSkewed: The difference between the request time and the current time is too large.
{:.terminal}

It was occurred that the clock of local machine was very late.

I updated the time with ntpdate.

    $ sudo /usr/sbin/ntpdate 210.173.160.27
    29 Jan 14:28:41 ntpdate[32495]: step time server 210.173.160.27 offset -929.483212 sec
{:.terminal}

If you don't have ntpdate, you can install with yum.

    $ sudo yum install -y ntp
{:.terminal}

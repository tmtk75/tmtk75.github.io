---
layout: post
title: How see the process listening on a port
creation-date: 2012-11-21 11:05:44
---
I remember `lsof` and `-i` option, but I always forgot ':'.

    $ /usr/sbin/lsof -i :80,443
    COMMAND PID    USER   FD   TYPE             DEVICE SIZE/OFF NODE NAME
    Dropbox 822 xxxxxxx   10u  IPv4 0xxxxxxxxxxxxxxxxx      0t0  TCP xxx.xxx.xxx.xxx:49337->sjc-not1.sjc.dropbox.com:http (ESTABLISHED)
{:.terminal}


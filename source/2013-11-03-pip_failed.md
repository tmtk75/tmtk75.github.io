---
layout: post
title: pip execution fails and the recovery
tags: pip, python, installation, Mavericks
lang: en
creation-date: 2013-11-03 10:15:10 +0900
modified-date: 2013-11-03 10:15:10 +0900
---
I got following error from pip.

```
$ pip
Traceback (most recent call last):
  File "/usr/local/bin/pip", line 5, in <module>
    from pkg_resources import load_entry_point
  File "/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/pkg_resources.py", line 2603, in <module>
    working_set.require(__requires__)
  File "/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/pkg_resources.py", line 666, in require
    needed = self.resolve(parse_requirements(requirements))
  File "/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/pkg_resources.py", line 565, in resolve
    raise DistributionNotFound(req)  # XXX put more info here
pkg_resources.DistributionNotFound: pip==1.4.1
```

READMORE

There is a way to fix in [a thread of StackOverflow](http://stackoverflow.com/questions/6200056/pip-broke-how-to-fix-distributionnotfound-error).

```
easy_install --upgrade pip
```

I've remembered I has installed it with the installer, <https://raw.github.com/pypa/pip/master/contrib/get-pip.py>,
but it seemed my misunderstanding. I've never installed pip on this machine which I got recently and upgraded to Mavericks.

Anyway, the command fixed the issue :)

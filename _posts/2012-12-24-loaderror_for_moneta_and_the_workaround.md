---
layout: redirect
title: LoadError for moneta and the workaround
creation-date: 2012-12-24 10:55:04
---
Using chef-solo 10.16.2, I encountered an error like:

```bash
[2012-12-24T10:52:15+09:00] FATAL: LoadError: template[...] (my::recipe line 13) had an error: LoadError: cannot load such file -- moneta/basic_file
```

It was just after updating all gems with `gem update`.
Suspecting that, I checked the version of moneta like `gem list moneta`, so 0.7.0 was installed.
I removed it like `gem uninstall moneta -v0.7.0`.

After then, chef worked well.

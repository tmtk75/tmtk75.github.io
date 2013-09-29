---
layout: post
title: An oneliner for git
creation-date: 2012-05-10  9:24:11
---
An one-liner to get the current revision.

```bash
git log --pretty=format:'%H' | head -n1
```

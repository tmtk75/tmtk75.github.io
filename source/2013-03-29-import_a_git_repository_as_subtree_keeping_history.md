---
layout: post
title: import a git repository as subtree keeping history
tags: git
lang: 
creation-date: 2013-03-29 21:57:03 +0900
modified-date: 2013-03-29 21:57:03 +0900
---
To a git repository, we sometimes want to import another repository, keeping the history.

Let's say there are two repositories like `~/main.git` and `~/manual.git`.
If you want to import manual.git to main.git/doc as a directory,
you follows next.

```bash
cd ~/main.git
mkdir doc
cd doc

git remote add -f man ~/manual.git
git merge -s ours --no-commit man/master
git read-tree --prefix=doc -u man/master
git pull -s subtree man master
git ci -m "import manual.git"
```

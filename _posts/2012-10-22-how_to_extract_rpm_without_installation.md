---
layout: redirect
title: How to extract rpm without installation
creation-date: 2012-10-22 15:41:49
---

    $ rpm2cpio your.rpm | cpio -idmv

This makes installation image at the current directory.

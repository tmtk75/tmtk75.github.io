---
layout: post
title: How to tag and remove tag on docker
tags: docker
lang: en
creation-date: 2013-09-16 11:40:04 +0900
modified-date: 2013-09-16 11:40:04 +0900
---
Let's say you already have some images.

    $ docker images
    REPOSITORY   TAG                                        ID                  CREATED             SIZE
    user/foobar  1dee6a0ffae858a796e53aaf88a676f9ccb33165   c4480f1bd5a7        About an hour ago   12.29 kB (virtual 1.625 GB)
    user/fizbiz  9c4f77f7388406f5ad3cfbc673e2f1bb27fe3d29   6b9184c7d178        11 hours ago        12.29 kB (virtual 1.299 GB)
    ...

Then you can tag to any image IDs with `tag` command.

    $ docker tag c4480f1b user/foobar latest
    $ docker images
    REPOSITORY   TAG                                        ID                  CREATED             SIZE
    user/foobar  1dee6a0ffae858a796e53aaf88a676f9ccb33165   c4480f1bd5a7        About an hour ago   12.29 kB (virtual 1.625 GB)
    user/foobar  latest                                     c4480f1bd5a7        About an hour ago   12.29 kB (virtual 1.625 GB)
    ...

If you run from them,

    $ docker run user/foobar
    or
    $ docker run user/foobar:1dee6a0ffae858a796e53aaf88a676f9ccb33165

`latest` can be ommitted. These two are same.

Also if removing one of them, use `rmi` subcommand.

    $ docker rmi user/foobar:1dee6a0ffae858a796e53aaf88a676f9ccb33165
    $ docker images
    REPOSITORY   TAG                                        ID                  CREATED             SIZE
    user/foobar  latest                                     c4480f1bd5a7        About an hour ago   12.29 kB (virtual 1.625 GB)
    user/fizbiz  9c4f77f7388406f5ad3cfbc673e2f1bb27fe3d29   6b9184c7d178        11 hours ago        12.29 kB (virtual 1.299 GB)
    ...

The help message says `rmi` removes one or more images, but it removes only a tag in this case that an image are tagged with multiple tags.

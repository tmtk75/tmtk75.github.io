---
layout: post
title: could not find module Control.Monad.Writer
tags: haskell, ghc-pkg
creation-date: 2013-01-14 22:43:25
---
I use [GHCi](http://www.haskell.org/ghc/) version 7.4.2 on MacOSX 10.8.2 and also [Haskell Platform](http://www.haskell.org/platform/mac.html).
Then, I ran into a next error about importing module.

```
Prelude> :m Control.Monad.Writer
<no location info>:
  Could not find module `Control.Monad.Writer'
  Perhaps you meant
    Control.Monad.Fix (from base)
    Control.Monad.Zip (from base)
Prelude> :m Control.Monad.
Control.Monad.Fix        Control.Monad.ST       Control.Monad.ST.Lazy.Safe    Control.Monad.ST.Safe    Control.Monad.ST.Unsafe
Control.Monad.Instances  Control.Monad.ST.Lazy  Control.Monad.ST.Lazy.Unsafe  Control.Monad.ST.Strict  Control.Monad.Zip
```

At first, I couldn't find `Control.Monad.Writer`.
But now, I can find it though I'm not sure why it is found.

I remember I tried `ghc-pkg list`, `ghc-pkg dump` and `ghc-pkg recache`.
I've never tried any special things...

Mh... have to be familier with Haskell GHC environment.

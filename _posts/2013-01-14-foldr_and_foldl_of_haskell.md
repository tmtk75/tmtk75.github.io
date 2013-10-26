---
layout: redirect
title: foldr and foldl of Haskell
tags: haskell foldr foldl
creation-date: 2013-01-14 15:10:58
---
A difference of foldr and foldl.

```
$ ghci
GHCi, version 7.4.2: http://www.haskell.org/ghc/  :? for help
Loading package ghc-prim ... linking ... done.
Loading package integer-gmp ... linking ... done.
Loading package base ... linking ... done.
Prelude> foldl (-) 1 [2,3,4]
-8
Prelude> foldr (-) 1 [2,3,4]
2
Prelude> 
```

It's easy to understand as thinking like:

foldl calculates `((0 - 1) - 2) - 3`.  
foldr does `3 - (2 - (1 - 0))`.

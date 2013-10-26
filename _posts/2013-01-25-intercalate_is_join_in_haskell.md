---
layout: redirect
title: intercalate is join in Haskell
tags: haskell
creation-date: 2013-01-25 18:34:54
---

    Prelude>:m Data.List
    Prelude Data.List> putStrLn $ intercalate " " ["Hello", "World"]
    Hello World

"join" is one of popular names of such function.  
In Haskell, it's `intercalate`.

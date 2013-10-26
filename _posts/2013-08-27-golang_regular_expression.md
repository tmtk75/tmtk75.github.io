---
layout: redirect
title: Go言語 正規表現
tags: golang go
lang: ja
creation-date: 2013-08-27 22:40:17 +0900
modified-date: 2013-08-27 22:40:17 +0900
---

正規表現はregexpパッケージ。

captureに相当するのは[FindStringSubmatch](http://golang.org/pkg/regexp/#example_Regexp_FindStringSubmatch)なんですね。

```go
package main

import (
  "fmt"
  "regexp"
)

func main() {
  fmt.Println("---- MatchString ----")
  validID := regexp.MustCompile("^[a-zA-Z0-9]+$")
  fmt.Println(validID.MatchString("0123"))
  fmt.Println(validID.MatchString("a_b"))

  fmt.Println("---- ReplaceAllString ----")
  fmt.Println(regexp.MustCompile("hello").ReplaceAllString("hello world", "HELLO"))

  fmt.Println("---- FindString ----")
  fmt.Println(regexp.MustCompile("([a-z]+)@gmail.com").FindString("mail: yourname@gmail.com"))

  fmt.Println("---- FindStringSubmatch ----")
  fmt.Println(regexp.MustCompile("([a-z]+)@(.*?).com").FindStringSubmatch("mail: yourname@gmail.com"))
}
```

正規表現パターンを`Compile`するのは、これまたPythonの影響が強いですね。

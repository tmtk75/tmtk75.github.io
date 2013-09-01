---
layout: post
title: Go言語 コマンドラインオプション解析(FlagSet)
tags: golang flagset parseoptions cli
lang: ja
creation-date: 2013-09-01 18:48:06 +0900
modified-date: 2013-09-01 18:48:06 +0900
---
[flag](http://golang.org/pkg/flag/) packageを使います。

型のバリエーションなどは[Go言語 コマンドラインオプション解析](/2013/09/01/golang_flag.html)を見てください。

ひとつハマったことがあって、FlatSet.Parseには`os.Args[1:]`を渡す。
`os.Args`をそのまま渡すとオプションの認識をしてくれないみたい。

```go
package main

import (
  "flag"
  "fmt"
  "os"
)

var flagset = flag.NewFlagSet("default", flag.PanicOnError)
var silent bool
var name *string

func main() {
  flagset.BoolVar(&silent, "silent", false,  "silent mode")
  name = flagset.String(   "name",   "taro", "your name")

  if len(os.Args) == 1 {
    flagset.PrintDefaults()
    os.Exit(1)
  }

  err := flagset.Parse(os.Args[1:])
  if err != nil {
    panic(err)
  }

  fmt.Println(flagset.Args())
  fmt.Println("--")
  fmt.Println("NArg()", flagset.NArg())
  fmt.Println("NFlag()", flagset.NFlag())
}
```

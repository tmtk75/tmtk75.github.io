---
layout: post
title: Go言語 環境変数 展開
tags: golang, env, environ, expand
lang: ja
creation-date: 2013-09-01 21:12:28 +0900
modified-date: 2013-09-01 21:12:28 +0900
---
環境変数の取得と、値の展開。

```go
package main

import (
  "fmt"
  "os"
)

func replace(s string) string {
  switch s {
  case "name": return "Mike"
  default: return "hello"
  }
}

func main() {
  fmt.Println(os.Getenv("HOME"))
  fmt.Println(os.Expand("My name is ${name}.", replace))
  fmt.Println(os.ExpandEnv("My homedir is ${HOME}."))
}
```

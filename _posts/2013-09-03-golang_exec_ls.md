---
layout: post
title: Go言語 os/exec ls実行
tags:
lang: 
creation-date: 2013-09-03 10:04:14 +0900
modified-date: 2013-09-03 10:04:14 +0900
---
PATHをLookupして、コマンド実行して、Outputで結果を出力。  
簡単。

```go
package main

import (
  "fmt"
  "os/exec"
)

func main() {
  path, err := exec.LookPath("ls")
  if err != nil {
    panic(err)
  }

  cmd := exec.Command(path)
  out, _ := cmd.Output()
  fmt.Print(string(out))
}

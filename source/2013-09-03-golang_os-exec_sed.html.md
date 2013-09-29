---
layout: post
title: Go言語 os/exec sed実行
tags: golang, exec, command
lang: ja
creation-date: 2013-09-03 10:08:45 +0900
modified-date: 2013-09-03 10:08:45 +0900
---
標準入力に書き込む場合。`StdinPipe`を使う。

```go
package main

import (
  "fmt"
  "os/exec"
)

func main() {
  path, err := exec.LookPath("sed")
  if err != nil {
    panic(err)
  }

  cmd := exec.Command(path, "s/a/A/g")

  stdin, _ := cmd.StdinPipe()
  stdin.Write([]byte("aaa"))
  stdin.Close()

  out, _ := cmd.Output()
  fmt.Print(string(out))
}
```

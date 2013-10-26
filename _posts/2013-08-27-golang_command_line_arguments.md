---
layout: redirect
title: Go言語 コマンドライン引数
tags: golang go
lang: ja
creation-date: 2013-08-27 13:17:01 +0900
modified-date: 2013-08-27 13:17:01 +0900
---

```go
package main

import "fmt"
import "os"

func main() {
  args := os.Args
  fmt.Printf("%d\n", len(args))

  for i := 0; i < len(args); i++ {
    fmt.Printf("%s\n", args[i])
  }
}
```

パッケージ経由で取得するのね。Pythonみたい。

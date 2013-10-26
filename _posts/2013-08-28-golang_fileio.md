---
layout: redirect
title: Go言語 ファイル読み込み
tags:
lang: ja
creation-date: 2013-08-28 09:20:32 +0900
modified-date: 2013-08-28 09:20:32 +0900
---

```go
package main

import (
  "fmt"
  "os"
)

func main() {
  file, err := os.Open("file_read.go")
  defer file.Close()
  if err != nil {
    panic(err)
  }

  data := make([]byte, 50)
  fmt.Println(file)

  file.Read(data)
  fmt.Println(string(data))
}
```

```go
package main

import (
  "bufio"
  "fmt"
  "os"
)

func main() {
  file, err := os.Open("file_Scanner.go")
  defer file.Close()
  if err != nil {
    panic(err)
  }

  sc := bufio.NewScanner(file)
  for i := 0; sc.Scan(); i++ {
    fmt.Println(i, sc.Text())
  }
}
```

```go
package main

import (
  "bufio"
  "fmt"
  "os"
  "io"
)

func main() {
  file, err := os.Open("file_ReadLine.go")
  defer file.Close()
  if err != nil {
    panic(err)
  }

  r := bufio.NewReader(file)
  for i := 0; ; i++ {
    s, p, err := r.ReadLine()
    if err == io.EOF {
      break
    }
    fmt.Println(i, string(s), p, err)
  }
}
```

```go
package main

import (
  "bufio"
  "fmt"
  "os"
  "io"
  "strings"
)

func main() {
  file, err := os.Open("file_ReadString.go")
  defer file.Close()
  if err != nil {
    panic(err)
  }

  r := bufio.NewReader(file)
  for i := 0; ; i++ {
    s, err := r.ReadString('\n')
    if err == io.EOF {
      break
    }
    fmt.Println(i, strings.Trim(s, "\n"), err)
  }
}
```

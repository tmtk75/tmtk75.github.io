---
layout: post
title: Go言語 コマンドラインオプション解析
tags: golang, flagset, flag, parseoptions, cli
lang: ja
creation-date: 2013-09-01 18:46:03 +0900
modified-date: 2013-09-01 18:46:03 +0900
---
[flag](http://golang.org/pkg/flag/) packageを使う。

オプション定義には次の２つの形式が型それぞれにある。

- ポインタを返す形式 ex) flag.String, flag.Float64
- ポインタを指定する形式 ex) flag.BoolVar, flag.IntVar

Value interfaceを使って独自の解析もできる。

ぱっと見出来なさそうなのが、ひとつのオプションに対してshort/longを両方を提供すること。
例えばsilent modeを`--silent`と`-s`どちらでも有効にする、みたいな。
できるのかな？

```go
package main

import (
  "flag"
  "fmt"
  "os"
  "strings"
  "time"
)

type MyValue struct {
  vals []string
}

func (v *MyValue) String() string {
  return ""
}
func (v *MyValue) Set(e string) error {
  v.vals = strings.Split(e, ",")
  return nil
}

var silent bool
var name *string
var age int
var tall *float64
var hours time.Duration
var myVal MyValue

func init() {
  flag.BoolVar(&silent,    "silent", false,       "silent mode")
  name = flag.String(      "name",   "taro",      "your name")
  flag.IntVar(&age,        "age",    24,          "")
  tall = flag.Float64(     "tall",   172.5,       "tall")
  flag.DurationVar(&hours, "hours",  5*time.Hour, "")
  flag.Var(&myVal,         "my-value",     "comma separated values e.g) --attr=1,a,3")
}

func main() {
  if len(os.Args) == 1 {
    flag.PrintDefaults()
    os.Exit(1)
  }
  flag.Parse()

  fmt.Println(flag.Args())
  fmt.Println("--")
  fmt.Println("NArg()", flag.NArg())
  fmt.Println("NFlag()", flag.NFlag())

  fmt.Println("--")
  fmt.Println("silent", silent)
  fmt.Println("name",   *name)
  fmt.Println("age",    age)
  fmt.Println("tall",   *tall)
  fmt.Println("hours",  hours)
  fmt.Println("myVal",  myVal)
}
```


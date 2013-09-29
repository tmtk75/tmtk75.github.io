---
layout: post
title: Go言語 Time/Date
tags:
lang: ja
creation-date: 2013-08-30 08:34:45 +0900
modified-date: 2013-08-30 08:34:45 +0900
---
Goでの日付、時間の取り扱いについて。

- 現在時刻の取得
- Unixタイム(へ|からの)変換
- 日付文字列のパース
- Time値のフォーマット
- 数時間前、などの計算

これくらいあれば当面困らないっしょ。

```go
package main

import (
  "fmt"
  "time"
)

func main() {
  fmt.Println(time.Now())
  fmt.Println(time.Now().Unix())
  fmt.Println(time.Unix(1371646123, 0))

  fmt.Println(time.Parse("Mon Jan 2 15:04:05 MST 2006", "Fri Aug 30 08:18:23 GMT 2013"))
  fmt.Println(time.Parse("2006-01-02 15:04:05 +0600", "2013-08-30 08:18:23 +0900"))
  fmt.Println(time.Parse(time.RFC3339, "2013-08-30T08:18:23+07:00"))

  fmt.Println(time.Now().Format("2006/01/02 15:04:05 GMT"))
  fmt.Println(time.Now().Add(-(3*time.Hour + 40*time.Minute)))
  fmt.Println(time.Date(2013, 8, 30, 8, 18, 23, 0, time.UTC).AddDate(0, 0, 1))
}
```

time.Parse
----------
[time.Parse](http://golang.org/pkg/time/#Parse)関数のタイムゾーンの扱いが正直良くわからない。

time.RFC3339の値は`2006-01-02T15:04:05Z07:00`なんだけど、次のコードはParseエラーになるんだよな。
```go
time.Parse(time.RFC3339, "2013-08-30T08:18:23Z07:00")
```

必要になったらまた突っ込んで調べよう。

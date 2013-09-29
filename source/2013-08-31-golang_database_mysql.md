---
layout: post
title: Go言語 データベース MySQL SELECT
tags: MySQL, database, golang
lang: ja
creation-date: 2013-08-31 09:13:30 +0900
modified-date: 2013-08-31 09:13:30 +0900
---
[https://github.com/go-sql-driver/mysql](https://github.com/go-sql-driver/mysql)を使っています。

    $ go get github.com/go-sql-driver/mysql

`go get`で取得してください。

```go
package main

import (
  "database/sql"
  "fmt"
  _ "github.com/go-sql-driver/mysql"
)

func main() {
  db, err := sql.Open("mysql", "<username>:<password>@/<database>")
  defer db.Close()
  if err != nil {
    panic(err)
  }
  tx, _ := db.Begin()
  stmt, _ := tx.Prepare("select name, age from users where id = ?")
  rows, _ := stmt.Query(1234)
  cols, _ := rows.Columns()
  fmt.Println(cols)
  for rows.Next() {
    var name string
    var age int
    err := rows.Scan(&name, &age)
    fmt.Println(name, age, err)
  }
}
```

エラーハンドリングはOpen以外では省略しちゃってるんだけど、ちゃんと書くならひとつひとつチェックする必要がある。

あと、JDBCとかではよく`select * from users`とかして`ResultSet#getString(String name)`でカラム名を指定して値を取得とかできるけど、
Goの標準インタフェースではそういうのはないみたい。ポインタ渡して中身書いてもらうとか久々で逆に新鮮だ。


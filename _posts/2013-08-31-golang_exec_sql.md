---
layout: redirect
title: Go言語 データベース MySQL EXEC
tags: golang database mysql exec
lang: ja
creation-date: 2013-08-31 15:32:39 +0900
modified-date: 2013-08-31 15:32:39 +0900
---
[https://github.com/go-sql-driver/mysql](https://github.com/go-sql-driver/mysql)を使っています。

    $ go get github.com/go-sql-driver/mysql

`go get`で取得してください。

```go
ackage main

import (
  "database/sql"
  "fmt"
  _ "github.com/go-sql-driver/mysql"
)

func main() {
  db, _ := sql.Open("mysql", "<username>:<password>@/<database>")
  defer db.Close()
  tx, _ := db.Begin()
  stmt, _ := tx.Prepare("update users set name='taro' where id = ?")
  r, _ := stmt.Exec(1234)
  id, _ := r.LastInsertId()  // returns 0 when update
  n, _ := r.RowsAffected()
  fmt.Println(id, n)
}
```

`RowsAffected`は`update文`で影響を受けたレコードの数。

`LastInsertId`は`int64`なんだけど何が返ってくるのかな。
primary keyを設定していないテーブルにinsertしたら0が返ってきたよ。
あ、driverの実装依存か。

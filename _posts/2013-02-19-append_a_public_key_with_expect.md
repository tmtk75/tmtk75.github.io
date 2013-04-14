---
layout: post
title: expectで公開鍵を登録する
tags: expect publickey ssh
lang: ja
creation-date: 2013-02-19 10:52:32 +0900
modified-date: 2013-02-20 11:17:00 +0900
---

[minaでログファイルをtailするまで](/2013/02/18/tail-logfiles-w-mina.ja.html)を書いていて
思ったが、やっぱり公開鍵をサーバへ登録するところが手作業では煩わしい。
最初のscp/sshでの接続ではどうしてもパスワードを入れなきゃいけない。

ということで、 [expect](http://en.wikipedia.org/wiki/Expect)を使って
パスワードの入力を最低限抑えるようにしてみた。
コマンドライン引数に一回だけ書く。<sup id='fn1ref'><a href='#fn1'>1</a></sup>

[Gist](https://gist.github.com/tmtk75/4982391)はこちら。<sup id='fn2ref'><a href='#fn2'>2</a></sup>

```ruby
#!/usr/bin/env expect
set user "your_username"
set prompt ".*$user.*"
set domain "subdomain.yourdomain.com"
set timeout 60

if { $argc < 2 } {
  puts "usage: $argv0 <public-key-absolute-path> <ssh-password>
  Append a public key to ~/.ssh/authorized_keys of $user@$domain
  ex) $ ./append-publickey.exp /home/foobar/.ssh/id_rsa.pub abc123
"
  exit 1
}

set pubkey_path [lindex $argv 0]
set password [lindex $argv 1]

### Copy a public key to a domain at $HOME
spawn scp $pubkey_path $user@$domain:./
sleep 1
expect "password: "
send "$password\r"
expect -re $prompt

### Log in with password and append the public key to authorized_keys
spawn ssh $user@$domain
sleep 1
expect "password: "
send "$password\r"
expect -re $prompt

set pubkey_name [file tail $pubkey_path]
send "cat ~/$pubkey_name >> ~/.ssh/authorized_keys\r"
send "chmod 600 ~/.ssh/authorized_keys\r"
send "chmod 700 ~/.ssh\r"
send "rm ~/$pubkey_name\r"
expect -re $prompt

### Exit the session
send "exit\r"
expect eof
```

ホスト名やpromptも変更できるように工夫すれば、いろんなホストに公開鍵をばらまけるようになるね。


<span id='fn1'></span>
<span>1:</span>
<span>Historyに残るのがイヤな人はファイルを読み込んでそこから値を受け取る、とか直すといい</span>

<span id='fn2'></span>
<span>2:</span>
<span>expectってsyntax highlightingしてくれないのね、いくらGistでも</span>

---
layout: post
title: minaでログファイルをtailするまで
tags: mina Ruby
lang: ja
creation-date: 2013-02-18 21:21:15 +0900
modified-date: 2013-02-18 21:21:15 +0900
---
deploy用のツールのひとつとして[capistrano][capistrano]が有名。
[github:help][github-help]にも載ってて標準ツールと言ってもいい。

僕も使ってるし。

で、今日[mina][mina]というcapistranoの対抗馬があることを知った。
インストールとか使用感とかcapistranoとの比較などは先人がいるので
そちらを見てもらうとして、ここでは「remoteのログファイルをtail -fする」
というピンポイントなユースケースについて書く。

- [Capistrano の対抗馬？ Mina の導入方法][mina-inst]
- [デプロイツール mina を使ってみる][mina-deploy]
- [デプロイ用gem CapistranoとMinaの比較][mina-cmp]

  [mina]: https://github.com/nadarei/mina
  [capistrano]: https://github.com/capistrano/capistrano
  [github-help]: https://help.github.com/articles/deploying-with-capistrano
  [mina-inst]: http://qiita.com/items/23d447a7aba6ac910fff
  [mina-deploy]: http://blog.44uk.net/2012/11/03/use-deploy-tool-mina/
  [mina-cmp]: http://d.hatena.ne.jp/deeeki/20121224/capistrano_mina_comparison

今回の状況は以下のとおり。

- 秘密/公開鍵は新しく作る。ファイル名はminademo
- サーバ名はmina.example.com
- minauserがすでにmina.example.comにある
- minauserはsudo可能（例が/var/log/messagesをtailするので）
- MacOSでやったけど、ubuntuとかCentOSとかでもたぶん大丈夫。

## minaをインストール
gemですんなり入る。

    foobar@~$ gem install mina --no-ri --no-rdoc

## 秘密/公開鍵を作ってサーバへ登録
ssh-keygenでファイル名指定しつつ鍵を作成。
おもむろに公開鍵をサーバへコピーし、authorized_keysへ登録。

minademo生成。

    foobar@~$ ssh-keygen -t rsa -f ~/.ssh/minademo
    Generating public/private rsa key pair.
    Enter passphrase (empty for no passphrase): 
    Enter same passphrase again: 
    Your identification has been saved in /Users/foobar/.ssh/minademo.
    Your public key has been saved in /Users/foobar/.ssh/minademo.pub.
    The key fingerprint is:
    (snip)

サーバへ公開鍵をコピー。

    $ scp ~/.ssh/minademo.pub minauser@mina.example.com:./
    minauser@mina.example.com's password: 

authorized_keysへ公開鍵を追加。

    $ ssh minauser@mina.example.com "cat ~/minademo.pub >> ~/.ssh/authorized_keys; chmod 600 ~/.ssh/authorized_keys; chmod 700 ~/.ssh"
    minauser@mina.example.com's password: 


公開鍵の登録ができたら、登録できているかの確認も含めてコピーしたminademo.pubを消しておく。

    $ ssh -i ~/.ssh/minademo minauser@mina.example.com "rm ~/minademo.pub"


## config/deploy.rbの作成する
minaはデフォルトで`config/deploy.rb`を参照します。`-f`オプションで変更可能。

    $ mkdir config
    $ vi config/deploy.rb

内容は次のようにする。

```ruby
set :domain, 'mina.example.com'
set :user, 'minauser'
set :identity_file, (ENV[:identity_file.to_s] or "~/.ssh/minademo")
set :port, 22

task :logs do
  queue 'echo "tail -f /var/log/messages"'
  queue 'sudo tail -f /var/log/messages'
end
```

- `:domain` 対象ホスト名
- `:user` ユーザ名
- `:identity_file` 秘密鍵へのpath
- `:port` sshのポート番号
- タスク名は`logs`
- 処理はechoとtail

この辺はcapistranoと似てる。


## logsタスクを実行する

minaを実行する。
タスク名はlogs。
sudoをしているのでpasswordの入力を求められる。

    $ mina logs
    tail -f /var/log/messages
    [sudo] password for minauser: 
    ...

identity_fileはコマンドライン引数として与えることができる。
minaはコマンドライン引数をENVから受け取るみたい。
capistranoはローカル変数として受け取ったはずなので、ここはちょっと違う。

    $ mina logs identity_file=~/.ssh/minademo
    ...

この例ではデフォルト値と同じなので、sudoのpassword入力を求められる。

~/.ssh/minademoではなく、適当なファイルや存在しないpathを指定すると、
公開鍵認証が効かないので、minauserとしての認証を求められるはず。


他の機能は[公式ドキュメント](http://nadarei.co/mina/)を見て欲しい。


しかし、読み直すとminaの導入というよりは、大半が鍵作成と公開鍵の登録についてだな。

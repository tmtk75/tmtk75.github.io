---
layout: post
title: Docker + Jenkins + serverspecでpuppetのmanifestをCIする
lang: ja
tags: docker jenkins serverspec puppet manifests ci sshd vagrant
creation-date: 2013-09-28 20:58:12
---
<style>
.post .content h1 { margin-top: 3em }
.post .content h2 { margin-top: 2.5em }
.post .content h3 { margin-top: 2em }
.post .content p { margin-top: 1.5em }
</style>

puppetのCIが運用レベルに到達したのでちゃんとまとめておこうと思う。

下のリポジトリを使ってこの記事どおりにすれば、AWSにDocker + Jenkins for puppetのCI環境ができるはずだ。

<https://github.com/tmtk75/ci-puppet>


当初は「はよpuppetマニフェストをCIせなヤバイなー」という問題意識が先にあって、使う技術は何でもよかった。
やっぱレシピとかマニフェストってちょっと気を抜くと壊れるよね。
というか壊すよね。
ってか、最近すでに二回やっちまってるよね、俺。
ごめんなさい。
そう、まさにマニフェストのCIが急務だったわけです。

で、日本語リソースのDevOps的記事では、「Vagrant + serverspec + JenkinsでChefのcookbookをCI」というのが多い気がしてる。

ちょっとググると[@naoya](https://twitter.com/naoya_ito)さんのこの辺がひっかかる。

- [Vagrant + Chef Solo + serverspec + Jenkins でサーバー構築を CI](http://d.hatena.ne.jp/naoya/20130520/1369054828)
- [Docker (土曜日に podcast します)](http://d.hatena.ne.jp/naoya/20130620/1371729625)
- [Docker の Remote API + serverspec で CI](http://d.hatena.ne.jp/naoya/20130621/1371790990)

puppetだと[@gosukenator](https://twitter.com/gosukenator)さんのこの辺が見つかった。

- [Ukigumo と serverspec で Puppet の継続的インテグレーション](http://mizzy.org/blog/2013/03/27/1/)

両記事とも本当に参考にさせて頂きました。
で、AWS + Jenkinsとか、Vagrant + Jenkinsとか、Docker + Ukigumoとかいろいろ試したんだけど、
Dockerのgitのような履歴の取り回しのよさは魅力的だし、同僚達も使い慣れたJenkinsがやはりよかったので
最終的に Docker + Jenkinsの組み合わせに落ち着いた。


個人的な開発とかではchefで書くんだけど（[Berkshelf](http://berkshelf.com/)いいよね）、仕事ではpuppetの資産が多いのでしょうがなくpuppetも後から学んだ。
入門Puppet、入門Chef Soloはサーバサイドに関わるエンジニア必読の二冊と思う。
puppetからchefへ移る人は多そうだけど、逆はあまりいなさそうな雰囲気がある。気のせいかな。

<a target='_blank' href="http://www.amazon.co.jp/gp/product/B00BSPH158/ref=as_li_ss_il?ie=UTF8&camp=247&creative=7399&creativeASIN=B00BSPH158&linkCode=as2&tag=t00b1-22"><img border="0" src="http://ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=B00BSPH158&Format=_SL110_&ID=AsinImage&MarketPlace=JP&ServiceVersion=20070822&WS=1&tag=t00b1-22" ></a>
<a target='_blank' href="http://www.amazon.co.jp/gp/product/B00CL92JC0/ref=as_li_ss_il?ie=UTF8&camp=247&creative=7399&creativeASIN=B00CL92JC0&linkCode=as2&tag=t00b1-22"><img border="0" src="http://ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=B00CL92JC0&Format=_SL110_&ID=AsinImage&MarketPlace=JP&ServiceVersion=20070822&WS=1&tag=t00b1-22" ></a>

ちなみに「puppetは古い」って思ってる人もいるかもしれないけど（実は私もそうでした）、ちゃんと知ってからはエンタープライズではpuppetオススメだと思っている。
外部DSLってのはchefみたいな内部DSLに比べて自由度ないけど、言い換えれば誰が書いても一定の枠組み以内の書き方に収まる。
自由度高すぎるとカオスになりがち。多くの人がメンテする可能性のあるときはpuppetのその点は強みになる。
依存関係がかっちり書けるのも理解すれば便利。
chefの書いた順ってのは分かり易いけどね。

VagrantやAWSだとどうしてもジョブを実行した後にインスタンスを破棄することになって、ジョブが失敗したときの事後調査がしにくい。
Dockerならstopしたcontainerを再度startすれば、ジョブ終了時の状態にログインできて失敗原因の調査がしやすい。
これは大きな魅力だと思う。

あと、Dockerを走らせるOSとしては[CoreOS](http://coreos.com/)も試してみたんだけど、
Jenkinsを動かしたかったし、制限がキツくて結局無難にubuntuに落ち着いた。


やったこと
==========
さて、本題。今回構築したCI環境のは以下の環境。

- AWS m1.large
- Ubuntu 12.04 LTS Tokyo region
- puppetマニフェストはgithubにhosting
- DockerのimageはCentOS-6.4
- ビルドごとにDocker containerをstartし、終わったらstop
- puppetの実行が成功したらserverspecを実行
- JUnit形式のレポートを作成


職場で構築した環境では、Jenkinsの認証関連にLDAPを使ったりとかした。


ホストの構築 on AWS
--------------------
ubuntu-12.04 LTSを使うのだが、`AUFS`が使えないAMIがあるので注意。
東京リージョンではAMI: `ami-c83c8fc9`を使った。
他のリージョンでは <https://aws.amazon.com/marketplace/pp/B007Z5YWX4> ここから探してください。

<a href='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-09-29/ami.png' width='386'/><img src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-09-29/ami.png' width='386'/></a>

私が行ったインスタンス起動時の主な設定は以下。

- Root volumeを16GBに変更
- Ephemeral diskを1つ追加（m1.largeならたぶんデフォルト）
- 8080が空いているsecurity groupを作ってそれを使う

DockerとかJenkinsとかのファイルはEphemeral diskに置くので最低1つは必要。
Jenkinsがデフォルトでは8080ポートでlistenするので、security groupで8080を開けておく。
あとはお好みで。

実際のホストの構築にはfabricを使った。シェルスクリプトでもいいんだろうけど。
このホスト自体の構築にpuppetを使ってみようと思ったんだけど、やってみたら圧倒的にめんどくさかったので[fabricにコマンド直書き](https://github.com/tmtk75/ci-puppet/blob/master/test/ci-server/fabfile.py)した。
とりあえず構築手順をできるだけ残すという目的は達成しているのでよしとする。


### 構築手順
EC2インスタンスが起動していれば、とりあえず次のコマンドでいけます。

    $ git clone https://github.com/tmtk75/ci-puppet
    $ cd ci-puppet/test/ci-server
    $ fab -i ~/.ssh/<keypair-name>.pem -u ubuntu -H <public-dns> setup

だけじゃなんなので、fabricでやってることを簡単に説明するとこんな感じ。
実際のfabfile.pyは[こちら](https://github.com/tmtk75/ci-puppet/blob/master/test/ci-server/fabfile.py)

- JenkinsとDockerのディレクトリをEphemeral diskへlink
- Dockerインストール
- RSA鍵を作成（Docker containerへのsshの鍵になる）
- sshdが起動できるDocker imageをビルド（image名は`core/sshd`）
- 必要なパッケージをインストール（git, serverspec, Jenkins）
- Jenkins用の.ssh/configを設定

Dockerのインストール時は、@naoyaさんの記事を参考に`/etc/init/dockerd.conf`を置き換えている。
ただ、よく考えたらホストOSからしかDockerのREST APIへはアクセスしないから必要ないのかもしれない。

Docker imageのビルド時は同様に@naoyaさんのDockerfileをベースにした。
Dockerの各containerへsshでログインするときに使うRSA鍵を生成してから`docker build`コマンドを実行。
`/etc/pam.d/sshd`や`/etc/sudoers`を置き換えたり、puppetをインストールしているところが追加の点。
これらをしておかないとDocker containerへsshでの接続がうまくいかなかったり（接続した瞬間にConnection Closedになる）、
sudoでの実行ができなかったりする。

    /etc/pam.d/sshd 下記行をコメントアウト
    #session    required     pam_loginuid.so

    /etc/sudoers 下記行をコメントアウト
    #Defaults    requiretty

CI時に使うパッケージをapt-getでインストールする。
ci-puppetリポジトリでは変更していないが、職場で構築した環境では`ruby2.0.0-p247`をソースからインストールする手順を追加している。
最初はserverspecはruby1.8.7でも動作するし、ubuntuにプリインのruby使ってたんだけど、同僚が「serverspecで2.0の文法使いたいよ」というのでソースから入れることにした。
この辺は[omnibus-ruby](https://github.com/opscode/omnibus-ruby)とかでうまいことrpm作れないか今度試す。


最後にJenkinsユーザが使うsshの設定。ssh接続時のホストのバリデーションを無効にするのがポイント。
そのための.ssh/configを置く。

    Host github.com
      StrictHostKeyChecking no
      UserKnownHostsFile=/dev/null
      User git
      IdentityFile ~/.ssh/github.pem


### Jenkinsの設定
Jenkins自体は[git plugin](https://wiki.jenkins-ci.org/display/JENKINS/Git+Plugin)を入れた以外は素に近い。

    Jenkinsの管理 -> プラグインの管理 -> 利用可能タブ -> フィルターで"git plugin"

<a href='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-09-29/pluings.png' width='386'/><img src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-09-29/plugins.png' width='386'/></a>

で、Git Pluginにチェックして、"ダウンロードして再起動後にインストール"ボタンを押してインストール。
後は認証としてLDAP + マトリックス認証を使ったが、これはもちろん状況に応じてなんでもいい。
何がめんどくさいって、Jenkinsの設定は手作業なこと。一発でバシッとやる方法はありますかね。たとえばslaveを増やしたいときとかWebUIでいちいち設定するのめんどくさいよね。


### 新規ジョブの作成と実行
次の４項目を入力。

- ジョブ名: `webapp.example.com`
- ソースコード管理 -> Git -> Repository: `https://github.com/tmtk75/ci-puppet`
- ビルド -> シェルスクリプト `$WORKSPACE/test/ci-server/ci-job core/sshd $WORKSPACE/manifests $WORKSPACE/modules webapp.example.com`
- ビルド後の処理: JUnitテスト結果の集計: テスト結果XML: `test/*.xml`

<a href='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-09-29/job.png' width='386'/><img src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-09-29/job.png' width='386'/></a>
<a href='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-09-29/src-git.png' width='386'/><img src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-09-29/src-git.png' width='386'/></a>
<a href='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-09-29/build-shell.png' width='386'/><img src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-09-29/build-shell.png' width='386'/></a>
<a href='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-09-29/after-build.png' width='386'/><img src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-09-29/after-build.png' width='386'/></a>



全部入力したら保存し、おもむろにビルド実行してみよう。コンソール出力に以下のように出ていたら期待通りだ。
テストケース２件中１件失敗するはず。

<pre style='width:120%'>
Started by user anonymous
Building in workspace /var/lib/jenkins/jobs/webapp.example.com/workspace
  .
  .
  .
spawned container_id: 870bba0aadb2         <- Docker containerをひとつ作成
  .
  .
  .
docker-apply exited with 0.
/usr/bin/ruby1.9.1 -S rspec spec/webapp/httpd_spec.rb    <- serverspec開始
Service "httpd"
  should be enabled (FAILED - 1)
  should be running

Failures:

  1) Service "httpd" should be enabled
     Failure/Error: it { should be_enabled }
       sudo chkconfig --list httpd | grep 3:on
       expected Service "httpd" to be enabled
     # ./spec/webapp/httpd_spec.rb:4:in `block (2 levels) in <top (required)>'

Finished in 0.28702 seconds
2 examples, 1 failure                                      <- 2件中1件失敗

Failed examples:

rspec ./spec/webapp/httpd_spec.rb:4 # Service "httpd" should be enabled
/usr/bin/ruby1.9.1 -S rspec spec/webapp/httpd_spec.rb failed
docker stop 870bba0aadb2                                   <- container 870bba0aadb2をstop
Build step 'Execute shell' marked build as failure
Recording test results
Finished: FAILURE
</pre>

また、２回以上実行するとテスト結果の推移のグラフが表示されるだろう。


とりあえず環境構築はこれで終了。
あとは、シェルスクリプトが何をやってるかを見てみる。


## ci-job、その他シェルスクリプト
Jenkinsのジョブは基本的にシェルスクリプトを起動するだけ。
終了コード0 or その他を返す。

  1. Dockerのcontainerを新しく作る。container IDが払い出される。先の例だと`870bba0aadb2`
  2. manifestsとmodulesをrsyncで送る
  3. ssh経由でstandaloneモードでpuppet applyを実行
  4. serverspec実行 over ssh



### ci-job
[ci-job](https://github.com/tmtk75/ci-puppet/blob/master/test/ci-server/ci-job)はDocker image ID、manifestsとmodulesのpath、certnameを受け取る。
「このスナップショット（Docker image ID）から起動して、これらのマニフェスト（manifests/modules）でこのホスト（certname）を構築してね」ってことだ。

containerを新たに作成するコマンドは`sudo docker run -d core/sshd`。
container IDが分かるとREST API経由でcontainerのsshのポートが分かるので、以後それを使ってover sshでドライブする。


### docker-rsync
[docker-rsync](https://github.com/tmtk75/ci-puppet/blob/master/test/ci-server/docker-rsync)でmanifestsとmodulesをコピー。
[docker-apply](https://github.com/tmtk75/ci-puppet/blob/master/test/ci-server/docker-apply)の中で使っている。

ここでもssh接続時のホストのバリデーションを無効にするのがポイント。

```bash
--rsh="ssh -p$tcp22 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
```

sshのportはREST APIで取得する。

``` bash
 curl -s localhost:4243/v1.4/containers/$1/json \
   | ruby -e 'require "json"; print (JSON.parse STDIN.read)["NetworkSettings"]["PortMapping"]["Tcp"]["22"], "\n"'
```

### docker-apply
[docker-apply](https://github.com/tmtk75/ci-puppet/blob/master/test/ci-server/docker-apply)でpuppet applyを実行する。

知らない人も多いみたいなんだけど、puppetにもchef-applyみたいなstandaloneモードがある。
chef-applyはchef11からだから、むしろpuppetの方が先。
一番簡単に実行するだけならpuppet apply a.ppみたくファイルひとつで実行可能。
このpuppet applyでrsyncしたマニフェストを実行する。

certnameを使うと任意のnode名を指定することができる。指定しなかったら基本的にはホスト名が使われる。/etc/puppet/puppet.confとかでも指定できる。

マニフェストが壊れてたりすると終了コード0以外が返ってくるので、そのときはserverspec流さないでエラー終了。


### serverspec
puppet applyが成功したら`rake`でserverspecを実行する。
実際に実行するコマンドは`rake docker:webapp`。
[test/spec/spec_helper.rb](https://github.com/tmtk75/ci-puppet/blob/master/test/spec/spec_helper.rb)でdockerのcontainerへserverspecを実行するように設定している。

テスト対象のホストを追加するときは、のようにする。

- [Rakefile](https://github.com/tmtk75/ci-puppet/blob/master/test/Rakefile)の`webapp.example.com`の次に`database.example.com`を追加
- [test/spec](https://github.com/tmtk75/ci-puppet/tree/master/test/spec)以下に`database`ディレクトリを作って、たとえば`mysql_spec.rb`を作る

あとはJenkinsのジョブを`webapp.example.com`と同様に作る。

これで、もりもりテストを書いておけば、マニフェストのリファクタリングもガリガリできるってもんだ。


# まとめ
- Docker + Jenkins + serverspecでpuppetマニフェストのCIサーバを構築した
- サーバ構築手順はfabfileでリモート実行、使い回しできるようにした
- Dockerだと履歴が残せるのでジョブが失敗したときの調査に便利。CIサーバへ直接ログインしないといけないけど
- Over sshでpuppetを実行したりrsyncを実行するための設定がめんどくさかった

振り返ってみると、やってることは大したことしてない。Docker走らせて、rsyncして、puppet applyして、serverspec流してるだけ。

ただ、これをover sshでやるところでところどころハマりポイントがあった。ホストバリデーションで`Are you sure you want to continue connecting (yes/no)? `
とか聞かれて止まるとか、sudoしようとすると`sudo: sorry,you must have a tty to run sudo.`とか、Dockerへのssh接続が`Connection closed`といきなり切れるとか。

まあ、とりあえず動いているようなのでテストの充実とマニフェストのリファクタリングをしていこうかと。


課題はclean upかなあ。
`sudo dokcer ps -a`で見るとジョブごとにcontainerが作成されるので大量のcontainerが残っているのが見える。2週間くらい運用してて、50GBくらい使用しているっぽい。
Ephemeral diskの15%くらいを消費しているので、数ヶ月くらいでdisk fullだ。まあ、バッチで古いcontainerから消していけばいいかな。


いやー、それにしても久しぶりにこんな長い記事書いた。

---
layout: post
title: AWS Static Website Hostingで404ページを設定する
tags: aws 404 s3
lang: ja
creation-date: 2014-05-24 15:11:46 +0900
modified-date: 2014-05-24 15:11:46 +0900
---
AWS S3のStatic Website Hostingを使うと静的サイトを簡単に公開できる。
もちろんこのサイトも使ってる（ジェネレータは[middleman](http://middlemanapp.com/)）
Bucketのpropertiesで、Static Website Hosting -> Enable website hostingを選択すればいい。
そのとき`Index Document`でインデックスページを指定したりできる。

READMORE

設定箇所は2014/05/24現在、下のような感じ。

<img src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2014-05-24/S3_Management_Console.png' width='77%' />

Error Documentの項目に`404.html`とか設定すると、存在しないpathにアクセスしたときにそのページを返してくれるんだけど、
よくよく見てみたらHTTPステータスコードは`403 Forbidden`を返してた。

まあそれじゃあまずいということで404を返す方法を調べた。
404を返すようにする設定はもちろんWebコンソールからでもできるけど、今回はawscliを使ってやった。awscliはpipとかで入れてください。

s3 bucket policyというのを設定します。

```bash
aws s3api put-bucket-policy \
  --bucket blog.tmtk.net \
  --policy file://`pwd`/policy.json 
```

`policy.json`はこんな感じ。[AWS Policy Generator](http://awspolicygen.s3.amazonaws.com/policygen.html)から作れます。

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::blog.tmtk.net/*"
        }
    ]
}
```

あとは上の画像の設定の部分。Index DocumentとError Documentを指定。

```bash
aws s3 website s3://blog.tmtk.net \
  --index-document index.html \
  --error-document 404.html
```

`--error-document`だけの設定はできないので（ちょっとハマった）両方指定します。もちろん実際にindex.htmlとか404.htmlというS3オブジェクトが存在すること。

```bash
$ curl -I blog.tmtk.net/missing
HTTP/1.1 404 Not Found
x-amz-error-code: NoSuchKey
x-amz-error-message: The specified key does not exist.
x-amz-error-detail-Key: missing
x-amz-request-id: D776050FA60AA5CF
x-amz-id-2: eE00HBPSRKYCMjKy193ulPgb6UN0Kw2k5Jxe2ymrPg0Z7xbkmp20F8wEUZaPPGsN
Transfer-Encoding: chunked
Date: Sat, 24 May 2014 07:12:53 GMT
Server: AmazonS3

```

404、ちゃんと返ってきました。

`Redirection Rules`の設定をするともっと細かい制御ができるみたいだけど、今はいいや。

- [S3のRedirection Rulesを利用してリダイレクトする2](http://dev.classmethod.jp/cloud/aws/s3-redirection-rules2/)
- [AWSのS3で各フォルダごとに404ページを設定する方法](http://c-note.chatwork.com/post/73487683032/s3-redirect-setting)


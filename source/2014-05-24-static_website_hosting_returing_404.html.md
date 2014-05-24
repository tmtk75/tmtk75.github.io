---
layout: post
title: static website hosting returing 404
tags: aws 404
lang: ja
creation-date: 2014-05-24 15:11:46 +0900
modified-date: 2014-05-24 15:11:46 +0900
---
AWS S3のStatic Website Hostingを使うと静的サイトを簡単に公開できる。
もちろんこのサイトも使ってる（ジェネレータは[middleman](http://middlemanapp.com/)）
Bucketのpropertiesで、Static Website Hosting -> Enable website hostingを選択すればいい。
そのとき`Index Document`でインデックスページを指定したりできる。

READMORE

<img src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2014-05-24/S3_Management_Console.png' />

404

```bash
aws s3api put-bucket-policy \
  --bucket blog.tmtk.net \
  --policy file://`pwd`/policy.json 
```

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


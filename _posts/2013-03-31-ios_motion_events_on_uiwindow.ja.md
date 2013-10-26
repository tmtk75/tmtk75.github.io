---
layout: redirect
title: iOSのUIWindow上でモーションイベントを受け取る
tags: iOS motionEvent
lang: ja
creation-date: 2013-03-31 22:43:02 +0900
modified-date: 2013-04-01 08:40:02 +0900
---
iOS勉強中です。  
正直勉強二日目くらいで心が折れそうです。

モーションイベントを受け取るには`First Responder`になる必要があるとかなんとか見かけたんだけど、あんまり関係なかった。 まだよくわかってないんだけど、このチェックが必要みたい。

<img src="https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-03-31/FizBiz.xcodeproj+%E2%80%94+Main.xib-1.png"/>

`Visible at Launch`をONにして、UIWindowのサブクラスをCustom ClassにInterface Builderで指定してmotionBeganを定義するとシェイクとかで呼ばれた。

```objective-c
-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
```

いやー、地道にやってくしかねーなー。

---
layout: post
title: Font AwesomeをiOSで使う
tags: iOS font tips
lang: ja
creation-date: 2013-06-30 12:06:06 +0900
modified-date: 2013-06-30 12:06:06 +0900
---
[Font Awesome](http://fortawesome.github.io/Font-Awesome/)はアイコンフォントで有名なものの一つ。
アイコンフォントは手っ取り早くアイコンを導入したりする場合にはとても便利。

ウェブサイト上で使うにはCSSをひとつ読むだけで簡単に使えるけど、じゃあiOSで使うにはどうするか？

FontAwesome+iOSというのが助けてくれそうです。  
<https://github.com/alexdrone/ios-fontawesome>.

## 導入手順
- fontawesome-webfont.ttfをプロジェクトへコピー
- フォント名を.plistへ追加
- .h, .m ファイルをプロジェクトへコピー
- NSString+FontAwesome.hをimport
- 実際に使うコードを追加

Xcode-4.6.3で試しました。

## フォントをコピー
`fontawesome-webfont.ttf`をプロジェクトへ追加する。
ファイルは[ここ](https://github.com/alexdrone/ios-fontawesome/tree/master/Resources)にあるけど、
現時点では3.1.1とちょっとだけ古い。最新は2013/06/30時点で3.2.1。まあそのうちアップデートされるでしょう。

<img src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-06-30/iOS-UI-mocks.xcodeproj+%E2%80%94+MockViewController.m.png'/>


## .plistへフォントファイル名を追加
\<your-project-name\>-info.plistというファイルがプロジェクト内にあるはずなので、
それを表示して下図のように追加します。独自フォントを使用する場合に必要な設定です。

<img src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-06-30/iOS-UI-mocks.xcodeproj+%E2%80%94+iOS-UI-mocks-Info.plist.png'/>


## コードでフォントを指定する
`self.label`がUILabelだとすると、次のようにします。
githubとtwitterのアイコンを並べる例です。

```objective-c
#import "NSString+FontAwesome.h"
```

```objective-c
id github  = [NSString fontAwesomeIconStringForEnum:FAIconGithub];
id twitter = [NSString fontAwesomeIconStringForEnum:FAIconTwitter];
self.label.font = [UIFont fontWithName:kFontAwesomeFamilyName size:32.f];
self.label.text = [NSString stringWithFormat:@"%@%@", github, twitter];
```

## iOSシミュレータで確認
表示されてますね。まさにAwesome！

<img src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-06-30/FA-iOS.png'/>


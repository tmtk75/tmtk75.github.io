---
layout: post
title: UIControlのステータスのトグル処理にReacativeCocoaを使う
tags: iOS, cocoa, ReactiveCocoa
lang: ja
creation-date: 2014-02-13 08:22:38 +0900
modified-date: 2014-02-13 08:22:38 +0900
---
1文字以上UITextViewに入っているときだけOKボタンを有効にする、なんてケースはよくある。
[Cocoa Bindings](https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/CocoaBindings/CocoaBindings.html)が使えればいいのだが、
あいにくiOSのCocoa Touchではまだサポートされていない。

[ReactiveCocoa](https://github.com/ReactiveCocoa/ReactiveCocoa)を使うとBlocksを使って楽に書ける。
`rac_textSignal`プロパティを使って次のように書くことができる。

```objective-c
#import <ReactiveCocoa.h>

UITextView _text = ...;
UIButton _ok = ...;

// Enable ok button when the length of text view content is more than zero.
[_text.rac_textSignal subscribeNext:^(NSString *x) {
    _ok.enabled = [x length] > 0;
}];
```


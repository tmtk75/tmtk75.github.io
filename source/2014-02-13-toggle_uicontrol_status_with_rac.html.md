---
layout: post
title: Toggle UIControl status with ReacativeCocoa
tags: iOS cocoa ReactiveCocoa
lang: en
creation-date: 2014-02-13 08:22:38 +0900
modified-date: 2014-02-13 08:22:38 +0900
---
We frequently need a case that enables button denpends on a condition like text view is filled with more than one character.
Then there is a way to implement easily using [ReactiveCocoa](https://github.com/ReactiveCocoa/ReactiveCocoa).

`rac_textSignal` property helps us to toggle butotn status like below.

```objective-c
UITextView _text = ...;
UIButton _ok = ...;

// Enable ok button when the length of text view content is more than zero.
[_text.rac_textSignal subscribeNext:^(NSString *x) {
    _ok.enabled = [x length] > 0;
}];
```


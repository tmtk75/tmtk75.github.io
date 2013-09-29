---
layout: post
title: How to use Font Awesome on iOS
tags: iOS font tips
lang: 
creation-date: 2013-06-30 12:06:06 +0900
modified-date: 2013-06-30 12:06:06 +0900
---
Font Awesome is a famouse iconic font, <http://fortawesome.github.io/Font-Awesome/>.
In a case, iconic font is useful because we can use many icons wihtout a lot of small files.

Font Awesome is easily available on web sites only including a CSS file.
On iOS, how do we use that?

FontAwesome+iOS helps us to use, <https://github.com/alexdrone/ios-fontawesome>.

## Steps to use
It's a few steps to use.

- Copy `fontawesome-webfont.ttf` to your project
- Add font name to .plist
- Copy .h and .m files to your project
- Import `NSString+FontAwesome.h`
- Add a piece of code to use

I did on Xcode-4.6.3.

## Copy the font resource
Copy `fontawesome-webfont.ttf` to your project. The file is contained in [here](https://github.com/alexdrone/ios-fontawesome/tree/master/Resources).
It's 3.1.1, but now 3.2.1 :) It will be updated before long.

<img src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-06-30/iOS-UI-mocks.xcodeproj+%E2%80%94+MockViewController.m.png'/>


## Add a font name to .plist
I guess there is a file named as \<your-project-name\>-info.plist.
Click and add an entry like this.

<img src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-06-30/iOS-UI-mocks.xcodeproj+%E2%80%94+iOS-UI-mocks-Info.plist.png'/>


## Use the font
Let's say you can access `self.label`. Following example aligns two icons for github and twitter.

```objective-c
#import "NSString+FontAwesome.h"
```

```objective-c
id github  = [NSString fontAwesomeIconStringForEnum:FAIconGithub];
id twitter = [NSString fontAwesomeIconStringForEnum:FAIconTwitter];
self.label.font = [UIFont fontWithName:kFontAwesomeFamilyName size:32.f];
self.label.text = [NSString stringWithFormat:@"%@%@", github, twitter];
```

## Check it out!
Run your simulator!

<img src='https://s3-ap-northeast-1.amazonaws.com/tmtk75.github.com/2013-06-30/FA-iOS.png'/>

It's a just UILable, Awesome!

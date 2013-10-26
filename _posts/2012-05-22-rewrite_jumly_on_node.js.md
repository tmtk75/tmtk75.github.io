---
layout: redirect
title: Rewrite JUMLY's site on Node.js from Ruby
creation-date: 2012-05-22  9:37:29
---
[JUMLY][jumly] is a JavaScript library product I've been improving these years.

The core is written in coffee-script, but the site was originally built on Sinatra in Ruby.
Sinatra is an innovative product which affects many frameworks, and I like Ruby very much :)
And also there are good libraries to help building site in Ruby like sprockets, kramdown, sass, and haml.

But as a developer, I'm interested in Node.js now since the time [Meteor][meteor] was releeased.
I made decision to re-write JUMLY's site in JS and searched helpful libraries in JS instead of the libraries in Ruby.

Followings are them I used for each Ruby library.

- Node.js <http://nodejs.org/> for Ruby
- express <http://expressjs.com/> for Sinatra
  - connect-assets <https://github.com/TrevorBurnham/connect-assets.git> for Sprockets
  - snockets <https://github.com/TrevorBurnham/snockets> for Sprockets, seems to be used by connect-assets
- less <http://lesscss.org/> for sass(scss)
- markdown-js <https://github.com/evilstreak/markdown-js.git> for kramdown
- jade <http://jade-lang.com/> for haml

  [jumly]: https://github.com/tmtk75/jumly
  [meteor]: http://meteor.com

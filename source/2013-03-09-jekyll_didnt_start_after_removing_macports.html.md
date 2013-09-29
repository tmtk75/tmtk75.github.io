---
layout: post
title: jekyll didn't start after removing MacPorts
tags: jekyll, ruby, rvm, gem
lang: 
creation-date: 2013-03-09 19:47:07 +0900
modified-date: 2013-03-09 19:47:07 +0900
---
I ran into a problem jekyll didn't start like this.

```
$ jekyll --server --auto
Configuration from /Users/tsakuma/Documents/workspace/blog/_config.yml
Unable to load the EventMachine C extension; To use the pure-ruby reactor, require 'em/pure_ruby'
Auto-regenerating enabled: /Users/tsakuma/Documents/workspace/blog -> /Users/tsakuma/Documents/workspace/blog/_site
[2013-03-09 19:09:02] regeneration: 240 files changed
/Users/tsakuma/.rvm/rubies/ruby-1.9.3-p327/lib/ruby/site_ruby/1.9.1/rubygems/custom_require.rb:55:in `require': dlopen(/Users/tsakuma/.rvm/rubies/ruby-1.9.3-p327/lib/ruby/1.9.1/x86_64-darwin12.2.0/digest/md5.bundle, 9): Library not loaded: /opt/local/lib/libcrypto.1.0.0.dylib (LoadError)
  Referenced from: /Users/tsakuma/.rvm/rubies/ruby-1.9.3-p327/lib/ruby/1.9.1/x86_64-darwin12.2.0/digest/md5.bundle
  Reason: image not found - /Users/tsakuma/.rvm/rubies/ruby-1.9.3-p327/lib/ruby/1.9.1/x86_64-darwin12.2.0/digest/md5.bundle
        from /Users/tsakuma/.rvm/rubies/ruby-1.9.3-p327/lib/ruby/site_ruby/1.9.1/rubygems/custom_require.rb:55:in `require'
        from /Users/tsakuma/.rvm/rubies/ruby-1.9.3-p327/lib/ruby/1.9.1/webrick/httpauth/digestauth.rb:17:in `<top (required)>'
        from /Users/tsakuma/.rvm/rubies/ruby-1.9.3-p327/lib/ruby/site_ruby/1.9.1/rubygems/custom_require.rb:55:in `require'
        from /Users/tsakuma/.rvm/rubies/ruby-1.9.3-p327/lib/ruby/site_ruby/1.9.1/rubygems/custom_require.rb:55:in `require'
        from /Users/tsakuma/.rvm/rubies/ruby-1.9.3-p327/lib/ruby/1.9.1/webrick/httpauth.rb:12:in `<top (required)>'
        from /Users/tsakuma/.rvm/rubies/ruby-1.9.3-p327/lib/ruby/site_ruby/1.9.1/rubygems/custom_require.rb:55:in `require'
        from /Users/tsakuma/.rvm/rubies/ruby-1.9.3-p327/lib/ruby/site_ruby/1.9.1/rubygems/custom_require.rb:55:in `require'
        from /Users/tsakuma/.rvm/rubies/ruby-1.9.3-p327/lib/ruby/1.9.1/webrick.rb:227:in `<top (required)>'
        from /Users/tsakuma/.rvm/rubies/ruby-1.9.3-p327/lib/ruby/site_ruby/1.9.1/rubygems/custom_require.rb:55:in `require'
        from /Users/tsakuma/.rvm/rubies/ruby-1.9.3-p327/lib/ruby/site_ruby/1.9.1/rubygems/custom_require.rb:55:in `require'
        from /Users/tsakuma/.rvm/gems/ruby-1.9.3-p327/gems/jekyll-0.12.1/bin/jekyll:277:in `<top (required)>'
        from /Users/tsakuma/.rvm/gems/ruby-1.9.3-p327/bin/jekyll:19:in `load'
        from /Users/tsakuma/.rvm/gems/ruby-1.9.3-p327/bin/jekyll:19:in `<main>'
        from /Users/tsakuma/.rvm/gems/ruby-1.9.3-p327/bin/ruby_noexec_wrapper:14:in `eval'
        from /Users/tsakuma/.rvm/gems/ruby-1.9.3-p327/bin/ruby_noexec_wrapper:14:in `<main>'
```

Yes, actually I removed `/opt/local/lib/libcrypto.1.0.0.dylib` in order to move 
the package manager from MacPorts to [homebrew][brew].

  [brew]: http://mxcl.github.com/homebrew/

To get recover, I tried to reinstall ruby with rvm.

```bash
rvm reinstall ruby-1.9.3
```

Then `1.9.3-p392` was installed although I had used `1.9.3-p327`.
I installed `jekyll` with 1.9.3-p392 and it was succeeded,
and reconfigure using p327.

```bash
rvm 1.9.3-p392 do gem install jekyll --no-ri --no-rdoc
rvm use 1.9.3-p327
```

So `jekyll --server --auto` got recovered.

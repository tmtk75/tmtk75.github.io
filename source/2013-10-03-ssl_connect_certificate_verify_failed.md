---
layout: post
title: SSL_connect certificate verify failed
tags: ruby gem bundler SSL
lang: en
creation-date: 2013-10-03 22:22:35 +0900
modified-date: 2013-10-03 22:22:35 +0900
---
I got a new MacBook Air and was setting up my development environment. Trying to install bundler, I ran into an SSL error.

I somehow fixed that issue though I'm not sure it was right or not. I'm writing down how to fix.


```bash
$ gem install bundler --no-ri --no-rdoc
ERROR:  Could not find a valid gem 'bundler' (>= 0), here is why:
          Unable to download data from https://rubygems.org/ - SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed (https://s3.amazonaws.com/production.s3.rubygems.org/latest_specs.4.8.gz)
```

READMORE

Then I was using following versions.

- Homebrew 0.9.5
- ruby-2.0.0-p247 installed by dvm 1.22.14
- gem included in the ruby

I googled and found some blogs for kind of this issue. They tried next command in order to the path of cert.pem.
 
```bash
$ ruby -ropenssl -e "p OpenSSL::X509::DEFAULT_CERT_FILE"
/etc/openssl/cert.pem
```

Seeing that directory, the directory didn't exist for me.

When installing ruby by rvm, rvm reported a cert.pem was located in `/usr/loca/etc/...`.
It's there. I linked the directory as `/etc/openssl` like

```bash
$ sudo ln -s /usr/loca/etc/openssl /etc/openssl
```

And then tried to install bundle again. gem didn't complain!

```bash
$ gem install bundle --no-rdoc --no-ri
```

Actually, the other MacBooks I have don't complain for SSL at least in spite of no that directory `/etc/openssl`.
I don't know why this ruby said the error.

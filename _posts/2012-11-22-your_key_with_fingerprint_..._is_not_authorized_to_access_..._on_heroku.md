---
layout: post
title: Your key with fingerprint ... is not authorized to access ... on heroku
creation-date: 2012-11-22 12:09:56
---
If you use multiple accounts of heroku, you may run into next error.

     $ git fetch 

     !  Your key with fingerprint 90:a4:b1:c6:ba:51:da:f0:62:8d:c9:60:2c:c1:d1:54 is not authorized to access northen-sea-7865.

     fatal: Could not read from remote repository.

     Please make sure you have the correct access rights
     and the repository exists.
{:.terminal}

It's a bit troublesome to use multiple accounts of heroku.

To avoid, follow the next instruction.

    $ ssh-keygen -t rsa -f ~/.ssh/id_rsa4heroku -N ""
    $ heroku keys:add ~/.ssh/id_rsa4heroku.pub
    Enter your Heroku credentials.
    Email: your-account@example.com
    Password (typing will be hidden): 
    $ ssh-add ~/.ssh/id_rsa4heroku
    $ git fetch
{:.terminal}

The summary of steps:
  - Creates a new keypair
  - Register the new public key to heroku
  - Log in with your account to be failed fetch
  - Add the new private to ssh-agent

Actually, if you already added another private key except for the new one, it doesn't work properly.

    $ ssh-add -l
    2048 7f:86:6a:f7:3c:da:86:47:bb:69:22:dc:1b:5b:7b:ba /Users/you/.ssh/id_rsa (RSA)
    2048 7f:86:6a:f7:3c:da:86:47:bb:69:22:dc:1b:5b:7b:ba /Users/you/.ssh/id_rsa4heroku (RSA)
{:.terminal}

In the case, you can unregister id_rsa for now like:

    $ ssh-add -d
    Identity removed: /Users/you/.ssh/id_rsa ( you@yourcomputer)
{:.terminal}

After then, try fetch again. It will be successful.

    $ git fetch
{:.terminal}

And also if succeeded, restore the key.

    $ ssh-add
    Identity added: /Users/you/.ssh/id_rsa (/Users/you/.ssh/id_rsa)
{:.terminal}


I hope heroku officially supports multi-accounts :-)


---
layout: post
title: Module version mismatch. Expected 10, got 1
tags: sqlit3 nodejs
lang: 
creation-date: 2013-02-22 10:47:15 +0900
modified-date: 2013-02-22 10:47:15 +0900
---
I encounterd following error when I ran an app using sqlite3 on node.js of MacOSX.

    Module version mismatch. Expected 10, got 1

It's probably owing to node.js's version. Check it out.
Currently for me, it worked on node.js 0.8.16.
On 0.8.20, it didn't work.

If you use nvm, change the version.

    $ nvm use 0.8.16
{:.terminal}


Actually, I tried to correct and checked versions about 
node-sqlite3 installed by npm and sqlite3 installed by MacPorts.

    foobar@0.1.0 /Users/mydirectory/myproject
    └── sqlite3@2.1.5 
{:.terminal}

node-sqlite3 was 2.1.5.

    foobar@~/myproject$ sudo port activate sqlite3
    --->  The following versions of sqlite3 are currently installed:
    --->      sqlite3 @3.7.14.1_0
    --->      sqlite3 @3.7.15_0
    --->      sqlite3 @3.7.15.2_0 (active)
    Error: port activate failed: Registry error: Please specify the full version as recorded in the port registry.
{:.terminal}

sqlite3 was active as 3.7.15.2.

It seemed I upgraded the version of node.js unfortunately, Wasted time.

---
layout: post
title: failed to install ruby 1.9.3-p194 with RVM
creation-date: 2012-09-05 11:27:51
---
On MacOS X Mountain Lion 10.8.1, I tried to update ruby to the latest with RVM 1.15.8, I ran into the following error.

    tsakuma@~/recengine$ rvm install 1.9.3
    Installing Ruby from source to: /Users/tsakuma/.rvm/rubies/ruby-1.9.3-p194, this may take a while depending on your cpu(s)...

    ruby-1.9.3-p194 - #downloading ruby-1.9.3-p194, this may take a while depending on your connection...
      % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
    Dload  Upload   Total   Spent    Left  Speed
    100 9610k  100 9610k    0     0   384k      0  0:00:24  0:00:24 --:--:--  407k
    ruby-1.9.3-p194 - #extracting ruby-1.9.3-p194 to /Users/tsakuma/.rvm/src/ruby-1.9.3-p194
    ruby-1.9.3-p194 - #extracted to /Users/tsakuma/.rvm/src/ruby-1.9.3-p194
    ruby-1.9.3-p194 - #configuring 
    Error running ' ./configure --prefix=/Users/tsakuma/.rvm/rubies/ruby-1.9.3-p194 --enable-shared --disable-install-doc --with-libyaml --with-opt-dir=/Users/tsakuma/.rvm/usr ', please read /Users/tsakuma/.rvm/log/ruby-1.9.3-p194/configure.log
    There has been an error while running configure. Halting the installation.
    tsakuma@~/recengine$ cat /Users/tsakuma/.rvm/log/ruby-1.9.3-p194/configure.log
    [2012-09-05 11:22:41]  ./configure --prefix=/Users/tsakuma/.rvm/rubies/ruby-1.9.3-p194 --enable-shared --disable-install-doc --with-libyaml --with-opt-dir=/Users/tsakuma/.rvm/usr 
    configure: WARNING: unrecognized options: --with-libyaml
    checking build system type... i386-apple-darwin12.1.0
    checking host system type... i386-apple-darwin12.1.0
    checking target system type... i386-apple-darwin12.1.0
    checking for gcc... no
    checking for cc... no
    checking for cl.exe... no
    configure: error: in `/Users/tsakuma/.rvm/src/ruby-1.9.3-p194':
    configure: error: no acceptable C compiler found in $PATH
    See `config.log' for more details

Seeing the log, it says --with-libyaml is not found. 

    2012-09-05 11:22:41]  ./configure --prefix=/Users/tsakuma/.rvm/rubies/ruby-1.9.3-p194 --enable-shared --disable-install-doc --with-libyaml --with-opt-dir=/Users/tsakuma/.rvm/usr 
    configure: WARNING: unrecognized options: --with-libyaml
    checking build system type... i386-apple-darwin12.1.0
    checking host system type... i386-apple-darwin12.1.0
    checking target system type... i386-apple-darwin12.1.0
    checking for gcc... no
    checking for cc... no
    checking for cl.exe... no
    configure: error: in `/Users/tsakuma/.rvm/src/ruby-1.9.3-p194':
    configure: error: no acceptable C compiler found in $PATH
    See `config.log' for more details

Mh... I'm sure using --with-libyaml when compiling current version of ruby I'm using.

    tsakuma@~$ find .rvm | egrep libyaml
    .rvm/src/yaml-0.1.4/src/.libs/libyaml-0.2.dylib
    ...
    .rvm/usr/lib/libyaml-0.2.dylib
    .rvm/usr/lib/libyaml.a
    .rvm/usr/lib/libyaml.dylib
    .rvm/usr/lib/libyaml.la

There is the libyaml under ~/.rvm, so I set LD_LIBRARY_PATH to there.

    $ export LD_LIBRARY_PATH=~/.rvm/usr/lib

Try again.

    tsakuma@~$ rvm install 1.9.3
    Installing Ruby from source to: /Users/tsakuma/.rvm/rubies/ruby-1.9.3-p194, this may take a while depending on your cpu(s)...

    ruby-1.9.3-p194 - #downloading ruby-1.9.3-p194, this may take a while depending on your connection...
    ruby-1.9.3-p194 - #extracted to /Users/tsakuma/.rvm/src/ruby-1.9.3-p194 (already extracted)
    ruby-1.9.3-p194 - #configuring 
    Error running ' ./configure --prefix=/Users/tsakuma/.rvm/rubies/ruby-1.9.3-p194 --enable-shared --disable-install-doc --with-libyaml --with-opt-dir=/Users/tsakuma/.rvm/usr ', please read /Users/tsakuma/.rvm/log/ruby-1.9.3-p194/configure.log
    There has been an error while running configure. Halting the installation.

    tsakuma@~$ cat /Users/tsakuma/.rvm/log/ruby-1.9.3-p194/configure.log
    [2012-09-05 11:35:04]  ./configure --prefix=/Users/tsakuma/.rvm/rubies/ruby-1.9.3-p194 --enable-shared --disable-install-doc --with-libyaml --with-opt-dir=/Users/tsakuma/.rvm/usr 
    configure: WARNING: unrecognized options: --with-libyaml
    checking build system type... i386-apple-darwin12.1.0
    checking host system type... i386-apple-darwin12.1.0
    checking target system type... i386-apple-darwin12.1.0
    checking for gcc... no
    checking for cc... no
    checking for cl.exe... no
    configure: error: in `/Users/tsakuma/.rvm/src/ruby-1.9.3-p194':

Oops, it says gcc is not found this time.
Ah, it's due to updating Xcode just now? This MBP is a sub note and I've not recently maintained.

    tsakuma@~/recengine$ sudo port selfupdate
    Password:
    --->  Updating MacPorts base sources using rsync
    MacPorts base version 2.0.4 installed,
    MacPorts base version 2.1.2 downloaded.
    --->  Updating the ports tree
    --->  MacPorts base is outdated, installing new version 2.1.2
    Installing new MacPorts release in /opt/local as root:admin; permissions 0755; Tcl-Package in /Library/Tcl

    Error: /opt/local/bin/port: port selfupdate failed: Error installing new MacPorts base: shell command failed (see log for details)

Oh, bingo... I got the trouble before like [this](http://tmtk75.github.com/2012/08/19/macports-upgrade.html).

<a href='{{site.paths.image}}/downloads-Xcode4_4.png'><img src='{{site.paths.image}}/downloads-Xcode4_4.png' width='386px' /></a>

With Xcode4.4, we can download command line tools from Preference -> Downloads.


BTW, got tired...

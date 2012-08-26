---
layout: post
title: MacPorts and Command Line Tools for Xcode
creation-date: 2012-08-19 11:43:00
---
What I want to say in this post is "Don't forget installation of Command Line Tools if you use MacPorts".


I ran into the following error when I update meteor to the latest.

    $ git fetch gh
    dyld: Library not loaded: /opt/local/lib/libexpat.1.dylib
      Referenced from: /opt/local/libexec/git-core/git-remote-https
      Reason: Incompatible library version: git-remote-https requires version 8.0.0 or later, but libexpat.1.dylib provides version 7.0.0

I thought I updated git with [MacPorts](http://www.macports.org/) and did selfupdate of MacPorts.

    $ sudo port selfupdate
    --->  Updating MacPorts base sources using rsync
    MacPorts base version 2.1.1 installed,
    MacPorts base version 2.1.2 downloaded.
    --->  Updating the ports tree
    --->  MacPorts base is outdated, installing new version 2.1.2
    Installing new MacPorts release in /opt/local as root:admin; permissions 0755; Tcl-Package in /Library/Tcl
    
    Error: /opt/local/bin/port: port selfupdate failed: Error installing new MacPorts base: command execution failed

Then I faced another error.

It seemed I had to install with [MacPorts-2.1.2-10.8-MountainLion.pkg](https://distfiles.macports.org/MacPorts/MacPorts-2.1.2-10.8-MountainLion.pkg) because my OS version is 10.8 a.k.a Mountain Lion.

So I installed it and ran MacPorts again.

    tsakuma@~/workspace/meteor$ sudo port upgrade outdated
    Warning: The Command Line Tools for Xcode don't appear to be installed; most ports will likely fail to build.
    Warning: See http://guide.macports.org/chunked/installing.xcode.html for more information.
    --->  Configuring apr
    Error: org.macports.configure for port apr returned: configure failure: command execution failed
    Please see the log file for port apr for details:
    /opt/local/var/macports/logs/_opt_local_var_macports_sources_rsync.macports.org_release_tarballs_ports_devel_apr/apr/main.log
    Error: Unable to upgrade port: 1
    To report a bug, follow the instructions in the guide:
    http://guide.macports.org/#project.tickets

Oh, oops, not yet. What do I need…? Ah, yes, [Command Line Tools](https://developer.apple.com/downloads/index.action) is maybe. That guess was right. It's released for Mountain Lion.

<img src="/img/CommandLineTools4MountainLion.png" width="386px"/>

After installation, I tried upgrade for just expat.

    tsakuma@~/workspace/meteor$ sudo port upgrade expat
    Password:
    --->  Configuring expat
    --->  Building expat
    --->  Staging expat into destroot
    --->  Installing expat @2.1.0_0
    --->  Cleaning expat
    --->  Activating expat @2.1.0_0
    --->  Cleaning expat
    --->  Updating database of binaries: 100.0%
    --->  Scanning binaries for linking errors: 100.0%
    --->  Found 33 broken file(s), matching files to ports
    --->  Found 4 broken port(s), determining rebuild order
    --->  Rebuilding in order
         apr-util @1.4.1 
         serf1 @1.0.3 
         subversion @1.7.4 
         subversion-perlbindings @1.7.4 
    --->  Computing dependencies for apr-util
    --->  Dependencies to be installed: apr
    --->  Configuring apr
    ...

Yep, looks working well.

    --->  Attempting to fetch subversion-1.7.6.tar.bz2 from http://apache.pesat.net.id/subversion
    --->  Verifying checksum(s) for subversion
    --->  Extracting subversion
    --->  Applying patches to subversion
    --->  Configuring subversion
    --->  Building subversion

Mh...? Why does port install subversion...? I've not already used it...

BTW, that's OK I was able to fetch the latest of meteor =)

    tsakuma@~/workspace/meteor$ git fetch
    remote: Counting objects: 3715, done.
    remote: Compressing objects: 100% (1207/1207), done.
    remote: Total 3484 (delta 2488), reused 3230 (delta 2254)
    Receiving objects: 100% (3484/3484), 719.25 KiB | 237 KiB/s, done.
    Resolving deltas: 100% (2488/2488), completed with 113 local objects.
    From https://github.com/meteor/meteor
       5105de0..92b848f  master     -> gh/master
     + d838e0f...729e450 auth       -> gh/auth  (forced update)
     * [new branch]      auth-email -> gh/auth-email
     * [new branch]      auth-test-isolation -> gh/auth-test-isolation
     * [new branch]      auth-twitter -> gh/auth-twitter
     * [new branch]      avital-remove -> gh/avital-remove
     * [new branch]      avital-watch -> gh/avital-watch
     * [new branch]      david-handlebars -> gh/david-handlebars
     * [new branch]      dev-bundle-bump -> gh/dev-bundle-bump
       ac48744..46d2964  devel      -> gh/devel
     * [new branch]      email      -> gh/email
     * [new branch]      forms      -> gh/forms
     * [new branch]      spark      -> gh/spark
     * [new branch]      spiderable -> gh/spiderable
     * [new branch]      test-isolation -> gh/test-isolation
     * [new branch]      webgl      -> gh/webgl
     * [new branch]      wrappedjs  -> gh/wrappedjs
     * [new branch]      {ref}squashed-auth -> gh/{ref}squashed-auth
     * [new tag]         v0.3.9     -> v0.3.9
    From https://github.com/meteor/meteor
     * [new tag]         v0.3.7     -> v0.3.7
     * [new tag]         v0.3.8     -> v0.3.8


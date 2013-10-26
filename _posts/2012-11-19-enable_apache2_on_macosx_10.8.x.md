---
layout: redirect
title: enable apache2 and PHP5 on MacOSX 10.8.x
creation-date: 2012-11-19 16:42:32
---
MacOSX 10.8 (or maybe other recent ones) already has apache2.
You can run it on terminal.

```bash
$ sudo apachectl start # or restart
```

If you enable PHP5, you comment off two lines in `/private/etc/apache2/httpd.conf`.
They were at 117 and 118 line on my machine.

```bash
#LoadModule php5_module libexec/apache2/libphp5.so
#LoadModule hfs_apple_module libexec/apache2/mod_hfs_apple.so
```

To test if it works, create a simple .php one.

```bash
$ sudo touch /Library/WebServer/Document/hello.php
$ sudo chmod 777 /Library/WebServer/Document/hello.php
$ echo '<?php echo "Hello World"?>' /Library/WebServer/Document/hello.php
```

After then, please restart apache2 and access to <http://localhost/hello.php>.

It will work properly!

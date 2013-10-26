---
layout: redirect
title: How to use hstore of postgreslq-9.0 with MacPorts
creation-date: 2012-10-04  9:48:29
---
hstore is contained in the archive of source for postgresql, but MacPorts doesn't provide it as is.
You need to change the Portfile of postgresql90.

```bash
sudo port edit postgresql90
```

<span class="label label-warning">warning</span> on my env, I got following error message when to begin editting. It's not major problem for hstore installation.

```bash
Error detected while processing /Users/tsakuma/.tealmole/vim/bundle/unite.vim/plugin/unite.vim:
line   34:
"sudo vim" is detected. Please use sudo.vim or other plugins instead.
line   35:
unite.vim is disabled.
Press ENTER or type command to continue
```

Change a line for contribs.

<span style="color: #F04000">-set contribs  "adminpack auto_explain…</span>
<span style="color: #008000">+set contribs  "hstore adminpack auto_explain…</span>

Install the server.

```bash
$ sudo port install postgresql90
$ sudo port install postgresql90-server
```

From now, will express how to make sure hstore setup.

Initialize a database directory, start a new server process and create a new database.

```bash
$ sudo mkdir -p /opt/local/var/db/postgresql90/defaultdb
$ sudo chown postgres:postgres /opt/local/var/db/postgresql90/defaultdb
$ sudo su postgres -c '/opt/local/lib/postgresql90/bin/initdb -D /opt/local/var/db/postgresql90/defaultdb'
$ sudo su postgres -c '/opt/local/lib/postgresql90/bin/pg_ctl -D /opt/local/var/db/postgresql90/defaultdb start'
$ echo 'create database yourdb' |  psql -h localhost -U postgres
```

Finally, you can execute queries to set up hstore. 

```bash
$ cat /opt/local/share/postgresql90/contrib/hstore.sql | psql -h localhost -U postgres yourdb
```

Try to check if it works.

```bash
$ psql -h localhost -U postgres
yourdb=> create table foo (vals hstore);
CREATE TABLE
```

Actually, I'd like to import some records from heroku, but it used hstore.
Setting up hstore on my local env cost me a lot of effort...

---
In addition at Oct 17, 2012

If you ran into next error message by executing initdb, change directory to /tmp by `cd /tmp` and try it again.

```bash
shell-init: error retrieving current directory: getcwd: cannot access parent directories: Permission denied
could not identify current directory: Permission denied
could not identify current directory: Permission denied
could not identify current directory: Permission denied
The program "postgres" is needed by pg_ctl but was not found in the
same directory as "pg_ctl".
```

That seems a workaround from <https://trac.macports.org/ticket/18024>.

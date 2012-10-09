---
layout: post
title: How to use hstore of postgreslq-9.0 with MacPorts
creation-date: 2012-10-04  9:48:29
---
hstore is contained in the archive of source for postgresql, but MacPorts doesn't provide it as is.
You need to change the Portfile of postgresql90.

    sudo port edit postgresql90
{:.terminal}

<span class="label label-warning">warning</span> on my env, I got following error message when to begin editting. It's not major problem for hstore installation.

<pre class="terminal">
Error detected while processing /Users/tsakuma/.tealmole/vim/bundle/unite.vim/plugin/unite.vim:
line   34:
"sudo vim" is detected. Please use sudo.vim or other plugins instead.
line   35:
unite.vim is disabled.
Press ENTER or type command to continue
</pre>

Change a line for contribs.
<pre>
<span style="color: #F04000">-set contribs  "adminpack auto_explain…</span>
<span style="color: #008000">+set contribs  "hstore adminpack auto_explain…</span>
</pre>

Install the server.

    $ sudo port install postgresql90
    $ sudo port install postgresql90-server
{:.terminal}

From now, will express how to make sure hstore setup.

Initialize a database directory, start a new server process and create a new database.

    $ sudo mkdir -p /opt/local/var/db/postgresql90/defaultdb
    $ sudo chown postgres:postgres /opt/local/var/db/postgresql90/defaultdb
    $ sudo su postgres -c '/opt/local/lib/postgresql90/bin/initdb -D /opt/local/var/db/postgresql90/defaultdb'
    $ sudo su postgres -c '/opt/local/lib/postgresql90/bin/pg_ctl -D /opt/local/var/db/postgresql90/defaultdb start'
    $ echo 'create database yourdb' |  psql -h localhost -U postgres
{:.terminal}

Finally, you can execute queries to set up hstore. 

    $ cat /opt/local/share/postgresql90/contrib/hstore.sql | psql -h localhost -U postgres yourdb
{:.terminal}

Try to check if it works.

    $ psql -h localhost -U postgres
    yourdb=> create table foo (vals hstore);
    CREATE TABLE
{:.terminal}


Actually, I'd like to import some records from heroku, but it used hstore.
Setting up hstore on my local env cost me a lot of effort...


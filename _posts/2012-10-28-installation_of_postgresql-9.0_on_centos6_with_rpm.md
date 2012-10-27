---
layout: post
title: Installation of postgresql-9.x on CentOS6 with yum
creation-date: 2012-10-28  8:14:26
---
prepare yum settings.
Please add `exclude=postgresql*` in [update] section of /etc/yum.repos.d/CentOS-Base.repo.

    [update]
    ...
    exclude=postgresql*


Let's say you will install v9.0, and if you want 9.1 or 9.2, simply replace 9.0 with them.

installation
------------

    $ wget http://yum.postgresql.org/9.0/redhat/rhel-6-x86_64/pgdg-centos90-9.0-5.noarch.rpm
    $ sudo rpm -i pgdg-centos90-9.0-5.noarch.rpm
    $ sudo yum -y install postgresql90-server postgresql90-devel postgresql90-contrib
    ...
    $ rpm -ql postgresql90-server | grep pg_ctl
    /usr/pgsql-9.0/bin/pg_ctl
    ...
{:.terminal}


initialization
--------------
create a directory to store data.

    $ id postgres
    uid=26(postgres) gid=26(postgres) groups=26(postgres)
    $ mkdir -p /usr/pgsql-9.0/db
    $ chown postgres:postgres !$
    $ su postgres -c '/usr/pgsql-9.0/bin/initdb -D /usr/pgsql-9.0/db'
    ...
    You can change this by editing pg_hba.conf or using the option -A, or
    --auth-local and --auth-host, the next time you run initdb.

    Success. You can now start the database server using:

        /usr/pgsql-9.0/bin/postgres -D /usr/pgsql-9.0/db
    or
        /usr/pgsql-9.0/bin/pg_ctl -D /usr/pgsql-9.0/db -l logfile start
{:.terminal}


create database
---------------
Let's say your account is `jenny` and the database name is `slake`.

    $ cd /tmp
    $ sudo su postgres -c '/usr/pgsql-9.0/bin/pg_ctl -D /usr/pgsql-9.0/db start'
    $ alias pg="psql -h localhost -U postgres"
    $ echo 'create database slake' | pg
    $ echo 'create user jenny' | pg
    $ echo 'grant all on database slake to public' | pg
    $ cat /usr/pgsql-9.0/share/contrib/hstore.sql | pg slake
{:.terminal}

`cd /tmp` in the first line is a workaround to avoid a postgresql's glitch about permission.

Now you can login like this.

    $ psql -h localhost -U jenny slake
{:.terminal}


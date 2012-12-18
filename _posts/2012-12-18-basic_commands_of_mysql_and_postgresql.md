---
layout: post
title: basic commands of CLI of MySQL and PostgreSQL
creation-date: 2012-12-18  8:41:12
---
I usually get confused for those commands. It's my own memo.

<style>
  thead tr, tbody tr:not(:last-child) { border-bottom: solid 1px gray; }
  thead th, tbody td { padding: 0.5em 0.5em 0.5em 1em; }
  tbody td:last-child { padding-right: 1em; }
  tbody tr:nth-child(even) { background-color: rgba(0,0,0,0.05); }
</style>

| | MySQL | PostgreSQL |
|-+-------+------------|
| login | mysql -h &lt;hostname> <br>&nbsp;&nbsp;-u &lt;username> <br>&nbsp;&nbsp;--password=&lt;password> <br>&nbsp;&nbsp;&lt;dbname> | PGPASSWORD=&lt;password> psql <br>&nbsp;&nbsp;-h &lt;hostname> <br>&nbsp;&nbsp;-U &lt;username> <br>&nbsp;&nbsp;-d &lt;dbname> |
| list databases | show databases; | \l |
| set current database | use &lt;dbname>; | N/A |
| show table names | show tables; | \dt |
| show table schema | desc &lt;tablename>; | \d &lt;tablename> |

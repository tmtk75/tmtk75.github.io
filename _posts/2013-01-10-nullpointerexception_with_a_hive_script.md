---
layout: post
title: NullPointerException with a Hive script
tags: troubleshooting hive
creation-date: 2013-01-10  8:36:08
---
I encountered a NullPointerException when using hive-0.8.1 on local like:

<textarea class='terminal' wrap='off' rows='20' style='width:140%' readonly='true'>
$ hive -f count.distinct.person.q
Logging initialized using configuration in jar:file:/home/foobarsen/usr/hive-0.8.1/lib/hive-common-0.8.1.jar!/hive-log4j.properties
Hive history file=/tmp/foobarsen/hive_job_log_foobarsen_201301091402_904175264.txt
converting to local s3n://example.com/lib/hive/hive-serde-json.jar
Added /tmp/foobarsen/hive_resources/hive-serde-json.jar to class path
Added resource: /tmp/foobarsen/hive_resources/hive-serde-json.jar
OK
Time taken: 5.588 seconds
OK
Time taken: 0.358 seconds
OK
Time taken: 0.37 seconds
FAILED: Hive Internal Error: java.lang.NullPointerException(null)
java.lang.NullPointerException
        at org.apache.hadoop.hive.ql.plan.ExprNodeGenericFuncDesc.newInstance(ExprNodeGenericFuncDesc.java:214)
        at org.apache.hadoop.hive.ql.parse.TypeCheckProcFactory$DefaultExprProcessor.getXpathOrFuncExprNodeDesc(TypeCheckProcFactory.java:684)
        at org.apache.hadoop.hive.ql.parse.TypeCheckProcFactory$DefaultExprProcessor.process(TypeCheckProcFactory.java:805)
        at org.apache.hadoop.hive.ql.lib.DefaultRuleDispatcher.dispatch(DefaultRuleDispatcher.java:89)
        at org.apache.hadoop.hive.ql.lib.DefaultGraphWalker.dispatch(DefaultGraphWalker.java:88)
        ... (snip)
</textarea>


As a result I tried to fix, it was occurred by the place of distinct.
At first, I wrote like this:

    SELECT distinct count(id) FROM person;

Actuall, it was wrong. The next is right.

    SELECT count(distinct id) FROM person;


I'm not sure the latest hive already has been fixed...

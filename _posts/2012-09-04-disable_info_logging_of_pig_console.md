---
layout: post
title: disable info logging of pig console
creation-date: 2012-09-04  7:53:05
---
It's slightly annoying for logging message every time when using pig console like

    2012-09-04 07:56:16,158 [main] INFO  org.apache.pig.Main - Apache Pig version 0.10.0 (r1328203) compiled Apr 19 2012, 22:54:12
    2012-09-04 07:56:16,159 [main] INFO  org.apache.pig.Main - Logging error messages to: /path/to/cwd/pig_1346712976155.log
    2012-09-04 07:56:16,489 [main] INFO  org.apache.pig.backend.hadoop.executionengine.HExecutionEngine - Connecting to hadoop file system at: hdfs://localhost:9000
    2012-09-04 07:56:16,713 [main] INFO  org.apache.pig.backend.hadoop.executionengine.HExecutionEngine - Connecting to map-reduce job tracker at: localhost:9001

especially for illustrate and describe, we can't concentrate on the output due to the message.

In order to suppress the message, set an option when launching of pig console.

    $ pig -4 nolog.conf

nolog.conf is very simple which is one line.

    log4j.rootLogger=fatal


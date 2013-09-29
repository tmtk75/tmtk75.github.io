---
layout: post
title: How to access to HDFS of Pseudo-Distributed Hadoop
creation-date: 2012-09-28 18:33:57
---
There is a way to install hadoop as [Pseudo-Distributed Operation][1].
This is an easy way to try hadoop with one host, but you cannot access to HDFS from another host.

[1]: https://hadoop.apache.org/docs/r0.20.2/quickstart.html#PseudoDistributed

To improve it, change a bit thing as
describing `fs.default.name` of `core-site.xml`
with IP address to be accessible from another host.

Let's say IP address of your host hadoop running is 192.168.10.20,
you rewrite the value of fs.default.name as following.

```xml
<configuration>
  <property>
    <name>fs.default.name</name>
    <value>hdfs://192.168.10.20:9000</value>
  </property>
</configuration>
```

That's all for the host.


After then, you can run hadoop command on your local machine. (Don't forget configuration of your local machine)

```bash
$ hadoop fs -lsr hdfs://192.168.10.20:9000/
drwxrwxrwx   - hadoop supergroup          0 2012-09-28 16:32 /user
```

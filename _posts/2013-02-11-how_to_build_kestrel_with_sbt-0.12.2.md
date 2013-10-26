---
layout: redirect
title: How to build kestrel with sbt-0.12.2
tags: HowTo install build kestrel sbt
lang: 
creation-date: 2013-02-11 15:37:37
modified-date: 2013-02-11 15:37:37
---

[kestrel][github] is an one of MQ (Message Queue) implementaiton used in twitter.
It's written in scala and [sbt][sbt] is used to build it.

  [github]: https://github.com/robey/kestrel
  [sbt]:    http://www.scala-sbt.org/

At this time I'm writing, the latest version of sbt is 0.12.2, 0.13.0 is going to be released though.
So I downloaded [0.12.2][tgz] from [here][here] and tried to bulid as the [building-it section][building-it].

  [tgz]:  http://scalasbt.artifactoryonline.com/scalasbt/sbt-native-packages/org/scala-sbt/sbt//0.12.2/sbt.tgz
  [here]: http://www.scala-sbt.org/release/docs/Getting-Started/Setup.html
  [building-it]: https://github.com/robey/kestrel#building-it


```bash
$ git clone git://github.com/robey/kestrel.git
$ cd kestrel
$ sbt clean update package-dist
```

I failed to build due to a following dependency error.

```
...
[info] Resolving org.scala-sbt#precompiled-2_8_2;0.12.0 ...
[info] Resolving org.scala-sbt#precompiled-2_10_0-m4;0.12.0 ...
[warn] 	::::::::::::::::::::::::::::::::::::::::::::::
[warn] 	::          UNRESOLVED DEPENDENCIES         ::
[warn] 	::::::::::::::::::::::::::::::::::::::::::::::
[warn] 	:: com.twitter#sbt-package-dist;1.0.6: not found
[warn] 	:: com.twitter#sbt11-scrooge;3.0.0: not found
[warn] 	::::::::::::::::::::::::::::::::::::::::::::::
[warn] 
[warn] 	Note: Some unresolved dependencies have extra attributes.  Check that these dependencies exist with the requested attributes.
[warn] 		com.twitter:sbt-package-dist:1.0.6 (sbtVersion=0.12, scalaVersion=2.9.2)
[warn] 		com.twitter:sbt11-scrooge:3.0.0 (sbtVersion=0.12, scalaVersion=2.9.2)
[warn] 
sbt.ResolveException: unresolved dependency: com.twitter#sbt-package-dist;1.0.6: not found
unresolved dependency: com.twitter#sbt11-scrooge;3.0.0: not found
  at sbt.IvyActions$.sbt$IvyActions$$resolve(IvyActions.scala:211)
  at sbt.IvyActions$$anonfun$update$1.apply(IvyActions.scala:122)
  ...
  at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:603)
  at java.lang.Thread.run(Thread.java:722)
[error] (*:update) sbt.ResolveException: unresolved dependency: com.twitter#sbt-package-dist;1.0.6: not found
[error] unresolved dependency: com.twitter#sbt11-scrooge;3.0.0: not found
Project loading failed: (r)etry, (q)uit, (l)ast, or (i)gnore? 
```

As [the section][building-it] saying, we have to use sbt 0.11.2 to build.

<blockquote>
Kestrel requires java 6 and sbt 0.11.2. Presently some sbt plugins used by kestrel depend on that exact version of sbt. On OS X 10.5, you may have to hard-code an annoying JAVA_HOME to use java 6:
</blockquote>

On sbt, you can put a `build.properties` in `project` directory in order to use the specific version of sbt.

```bash
echo "sbt.version=0.11.2" > project/build.properties
```

Then I tried to build again, so it was succeeded and dist directory is generated in kestrel.

About how to run, see [`Running it`](https://github.com/robey/kestrel#running-it) section.

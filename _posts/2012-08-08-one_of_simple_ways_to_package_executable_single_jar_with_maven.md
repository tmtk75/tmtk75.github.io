---
layout: post
title: One of simple ways to package executable single jar with maven
creation-date: 2012-08-08 10:50:54
---
It's using two plugins, jar and shade.

<pre class="brush:xml">
<plugin>
  <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-jar-plugin</artifactId>
    <configuration>
      <archive>
        <manifest>
          <addClasspath>true</addClasspath>
          <mainClass>com.your.class.Name</mainClass>
        </manifest>
      </archive>
    </configuration>
  </plugin>
  <plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-shade-plugin</artifactId>
    <executions>
      <execution>
        <!-- To build executable jar, type "mvn package" -->
        <phase>package</phase>
        <goals>
          <goal>shade</goal>
        </goals>
    </execution>
  </executions>
</plugin>
</pre>

And then just type such as

<pre class="terminal">
$ mvn package
$ java -jar target/your-artifactId-version.jar
</pre>

What a simple way :)

---
layout: post
title: One of simple ways to package executable single jar with maven
creation-date: 2012-08-08 10:50:54
---
It's using two plugins, jar and shade.

```xml
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
```

And then just type such as

```bash
mvn package
java -jar target/your-artifactId-version.jar
```

What a simple way :)

---
layout: post
title: visitor pattern in generics of Java
creation-date: 2012-07-03 10:30:21
---
Make an visitor interface for an type, Entity.
It has two generics types for return-type and optional parameter type.

```java
interface EntityVisitor<T, K> {
    T visit(Entity unknown, K args);
    T visit(LongEntity source, K args);
    T visit(StringEntity source, K args);
}
```

Let's say Entity is like this which has accept.
Its signature is something a bit complicated because of two generics types.

```java
abstract class Entity {
    public <T, K> T accept(EntityVisitor<T, K> visitor, K args) {
        return visitor.visit(this, args);
    }
}
```

Entity's sub classes are like this. Make sure overriding accept method =)
It's important to dispatch.

```java
abstract class LongEntity extends Entity {
    Long value;  // snip constructor
    public <T, K> T accept(EntityVisitor<T, K> visitor, K args) {
        return visitor.visit(this, args);
    }
}

abstract class StringEntity extends Entity {
    String value;  // snip constructor
    public <T, K> T accept(EntityVisitor<T, K> visitor, K args) {
        return visitor.visit(this, args);
    }
}
```

And create a concrete visitor.
It's like adding a new polymorphic method to Entity.

```java
class Stringify implements EntityVisitor<String, Integer> {
    public String visit(Entity unknown, Integer args) {
        throw new IllegalStateException("unknown: " + unknown + " args:" + args);
    }
    public String visit(LongEntity source, Integer args) {
        return "Long:" + source.value + " with " + args;
    }
    public String visit(StringEntity source, Integer args) {
        return "String:" + source.value + " with " + args;
    }
    public static void main(String[] args) {
        Entity a = new LongEntity(123L);
        Entity b = new StringEntity("123");
        System.out.println(new Stringify().visit(a, 3));
        System.out.println(new Stringify().visit(b, 87));
    }
}
```

Here is the result of execution.

```bash
$ java Stringify
Long:123 with 3
String:123 with 87
```

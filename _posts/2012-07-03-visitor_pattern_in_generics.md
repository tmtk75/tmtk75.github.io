---
layout: post
title: visitor pattern in generics of Java
creation-date: 2012-07-03 10:30:21
---

    interface EntityVisitor<T, K> {
        T visit(Entity unknown, K args);
        T visit(LongEntity source, K args);
        T visit(StringEntity source, K args);
    }

    abstract class Entity {
        public <T, K> T accept(EntityVisitor<T, K> visitor, K args) {
            return visitor.visit(this, args);
        }
    }

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
            System.out.println(new Stringify().visit(b, null));
        }
    }

    $ java Stringify
    Long:123 with 3
    String:123 with null

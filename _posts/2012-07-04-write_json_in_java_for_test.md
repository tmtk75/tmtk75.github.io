---
layout: post
title: Notation of JSON in Java for test
creation-date: 2012-07-04 15:59:43
---
A few helper static methods provide pretty good readability in Java for JSON literal.

<pre class="brush:java">
String json = _j(
    "'name':'Jhon'",
    "'age':23",
    "'pet':" + _j(
        "'name':'Coggy'",
        "'age':3"
    ),
    "'interests':"  + _a(1, 2, "'a'", "'b'", 3)
);
System.out.println(json);
public static String _(String left, String right, Object... props) {
    return "{" + join(props, ", ").replaceAll("'", "\"") + "}";
}
public static String _j(Object... props) {
    return _("{", "}", props);
}
public static String _a(Object... props) {
    return _("[", "]", props);
}
</pre>

It's a bit problem that cannot contain "'".

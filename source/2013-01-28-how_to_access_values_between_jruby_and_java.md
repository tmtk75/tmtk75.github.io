---
layout: post
title: How to access values between JRuby and Java
tags: java jruby interop
creation-date: 2013-01-28 10:40:16
---
This is a similar post of [the post for Java and Groovy][interopjavagroovy].

  [interopjavagroovy]: /2013/01/27/interoperability_between_java_and_groovy.html

Calling JRuby scripts from Java is a bit harder than Groovy, which existing ruby scripts may not be used as it is.

In JRuby,

- access to an element of Bindings with global variable
- cannot receive values as command line arguments as ARGV (I'm not sure there is a way)
- symbol of ruby is represented by org.jruby.RubySymbol, so hard to access a value with it in Java context.

```java
import java.util.Map;
import javax.script.*;

public class JRubyScripting {
	public static void main(String[] args) throws Exception {
		ScriptEngine engine = new ScriptEngineManager().getEngineByName("ruby");
		Bindings bindings = engine.getBindings(ScriptContext.ENGINE_SCOPE);
		
		bindings.put("counter", 3);
		bindings.put("ARGV", new String[] {"hello", "world"});
		
		String LF = "\n";
		String code = ""
				+ "puts '$counter: ' + $counter.to_s" + LF
				+ "puts ARGV[0]" + LF
				+ "{'a'=>123, :b=>456}"
				;
			
		Map vals = (Map)engine.eval(code);
		System.out.println("a: " + vals.get("a"));
		System.out.println("b: " + vals.get("b"));  // b is org.jruby.RubySymbol. it's not easy to access.
		System.out.println("counter: " + bindings.get("counter"));
	}
}
```

The output is like

    $counter: 3
    nil
    a: 123
    b: null
    counter: 3


In order to use jruby ScriptEngine, add a next dependency to pom.xml if you use maven.

```xml
<dependency>
  <groupId>org.jruby</groupId>
  <artifactId>jruby-complete</artifactId>
  <version>1.6.5</version>
</dependency>
```

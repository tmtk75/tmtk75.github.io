---
layout: post
title: interoperability between Java and Groovy
tags: java groovy
creation-date: 2013-01-27 21:54:32
---
If you want to invoke a groovy script from Java, you can use [ScriptEngine][scriptengine].
It's easy to give an initial value as a local variable to groovy script.
And also even if the script takes a few command line arguments,
that engine can give those values with using value name `args` which is an array of String.

<pre class="brush:java">
import javax.script.*;

public class GroovyScripting {
  public static void main(String[] args) throws Exception {
    ScriptEngine engine = new ScriptEngineManager().getEngineByName("groovy");
    Bindings bindings = engine.getBindings(ScriptContext.ENGINE_SCOPE);
    
    bindings.put("counter", 0);
    bindings.put("args", new String[] {"hello", "world"});
    
    String LF = "\n";
    String code = ""
        + "counter += 1" + LF
        + "println args[0]" + LF
        + "['a':123, 3:'b']";
                    
    System.out.println(((java.util.Map)engine.eval(code)).get("a"));
    System.out.println(bindings.get("counter"));
  }
}
</pre>

`counter` and `args` are local variables.

The output is like

    hello
    123
    1
{:.terminal}

`engine.eval(code)` returns the value which is evaluated at the last of script.
After the evaluation, you can see local variables thru [Bindings][bindings].
In this example, the last value is a Map.


Add a next dependency if you use maven.

<pre class="brush:xml">
<dependency>
  <groupId>org.codehaus.groovy</groupId>
  <artifactId>groovy-jsr223</artifactId>
  <version>2.0.0</version>
</dependency>
</pre>

  [scriptengine]: http://docs.oracle.com/javase/6/docs/api/javax/script/ScriptEngine.html
  [bindings]: http://docs.oracle.com/javase/6/docs/api/javax/script/Bindings.html

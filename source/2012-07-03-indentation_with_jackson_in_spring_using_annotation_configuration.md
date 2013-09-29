---
layout: post
title: Indentation with Jackson in springframework using annotation configuration
creation-date: 2012-07-03 10:47:20
---
ObjectMapper of jackson has a feature to make indent when deserializing as JSON.
Here is a way to use it on springframework.

A keen colleague who is special familiar with spring tought me this =)

```java
@Configuration
public class ObjectMapperConfiguration {
    @Provider
    @Consumes("*/*")
    @Produces("*/*")
    class ConfiguredJacksonJsonProvider
        extends JacksonJsonProvider
        implements MessageBodyWriter<Object>, MessageBodyReader<Object> {
        public ConfiguredJacksonJsonProvider() {
            super(new ObjectMapper().configure(Feature.INDENT_OUTPUT, true));
        }
    }

    @Bean
    @Scope("singleton")
    public JacksonJsonProvider jacksonJsonProvider() {
        return new ConfiguredJacksonJsonProvider();
    }
}
```

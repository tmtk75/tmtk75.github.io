---
layout: post
title: Indentation with Jackson in Spring using annotation configuration
creation-date: 2012-07-03 10:47:20
---

    @Configuration
    public class ObjectMapperConfiguration {
        @Provider
        @Consumes("*/*")
        @Produces("*/*")
        class ConfiguredJacksonJsonProvider extends JacksonJsonProvider implements MessageBodyWriter<Object>, MessageBodyReader<Object> {
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


---
layout: redirect
title: Testcase using tentative ApplicationContext of springframework
creation-date: 2012-07-16 12:44:25
---
When you use springframework, you make an AppliactionContext for production,
but you may sometimes want other ApplicationContext for test cases.

Then you can use @ContextConfiguration with ContextLoader.

```java
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(loader=Conf.class)
public class SomethingTest {
  @Autowired SomethingManager sm;

  @Test public void testcase() {
    sm.doSomething();
  }

  @Configuration
  static class Conf implements ContextLoader {
    @Bean
    DataSource dataSource() throws NamingException {
      DriverManagerDataSource ds = new DriverManagerDataSource();
      ds.setDriverClassName("org.h2.Driver");
      ds.setUrl("jdbc:h2:file:test;AUTO_SERVER=TRUE");
      ds.setUsername("sa");
      ds.setPassword("");
      return ds;
    }

    @Bean
    SomethingManager somethingManager(DataSource ds) {
      return new SomethingManager(ds);
    }

    @Override
    public ApplicationContext loadContext(String... locations) throws Exception {
      return new AnnotationConfigApplicationContext(Conf.class);
    }

    @Override
    public String[] processLocations(Class<?> clazz, String... locations) {
      return locations;
    }
  }
}
```

# Spring类注解配置文件

在config的类标Config注解,组件扫描时会获取

```java
package org.example.service;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

/**
 * @author Jackasher
 * @version 1.0
 * @className SpringConfig
 * @since 1.0
 **/
@Configuration
@ComponentScan({"org.example.service"})
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class SpringConfig {
}

```

这是注解类作为参数

```java
 @Test
    public void annotationTest(){
        ApplicationContext applicationContext = new AnnotationConfigApplicationContext(SpringConfig.class);
        UserService userService = applicationContext.getBean("userService", UserService.class);
        userService.login();
    }
```


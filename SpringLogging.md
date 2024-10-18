# SpringLogging

为spring配置日志首先引入maven依赖

```xml
   <!-- https://mvnrepository.com/artifact/org.apache.logging.log4j/log4j-slf4j2-impl -->
        <dependency>
            <groupId>org.apache.logging.log4j</groupId>
            <artifactId>log4j-slf4j2-impl</artifactId>
            <version>2.23.1</version>

        </dependency>


        <!-- https://mvnrepository.com/artifact/org.apache.logging.log4j/log4j-core -->
        <dependency>
            <groupId>org.apache.logging.log4j</groupId>
            <artifactId>log4j-core</artifactId>
            <version>2.23.1</version>
        </dependency>
```

如何配置文件 在类路径创建log4j2.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Configuration status="WARN">
    <Appenders>
        <Console name="Console" target="SYSTEM_OUT">
            <PatternLayout pattern="%d{HH:mm:ss.SSS} [%t] %-5level %logger{36} - %msg%n"/>
        </Console>
    </Appenders>
    <Loggers>
        <Root level="DEBUG">
            <AppenderRef ref="Console"/>
        </Root>
    </Loggers>
</Configuration>
```

控制反转和依赖注入,控制反转是一种思想,让上层不再依赖下层,依赖注入是一种解决方法,依赖是解决类的关系,注入是自动创建对象

```java
package org.example;

import org.example.service.UserService;
import org.example.service.impl.UserServiceIml;
import org.springframework.context.support.ClassPathXmlApplicationContext;

// Press Shift twice to open the Search Everywhere dialog and type `show whitespaces`,
// then press Enter. You can now see whitespace characters in your code.
public class Main {
    public static void main(String[] args) {

        ClassPathXmlApplicationContext classPathXmlApplicationContext = new ClassPathXmlApplicationContext("spring.xml");
        UserServiceIml jack = classPathXmlApplicationContext.getBean("userservice", UserServiceIml.class);
        jack.delete();
        System.out.println(jack);

    }
}
//这个虽然可以创建对象,但是对象没有关联,所以报错Cannot invoke "org.example.dao.UserDao.userDelete()" because "this.userDao" is null
```

<!--more-->

所以我们必须在属性下面创建set方法,让spring自动赋值

```java
 public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

//如后配置文件加入
    <bean id="jack" class="org.example.bean.User"></bean>

    <bean id="userdao" class="org.example.dao.impl.UserDaoImpl"></bean>

      //代表将set这个方法的属性关联userdao
    <bean id="userservice" class="org.example.service.impl.UserServiceIml">
        <property name="userDao" ref="userdao" />
    </bean>

```

这个是输出日志的调用方法时执行

```java
 private static final Logger logger = Logger.getLogger(String.valueOf(UserDaoImpl.class));
    public void userDelete(){
        logger.info("oweyiuweghdyew989wef");

    }
```


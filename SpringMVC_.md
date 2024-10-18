# SpringMVC_

终于配置好第一个springmvc程序,主要是一个拦截器,而且必须走这个拦截器,无法直接访问其他资源了,

首先构建一个web项目,关于web.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="https://jakarta.ee/xml/ns/jakartaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="https://jakarta.ee/xml/ns/jakartaee https://jakarta.ee/xml/ns/jakartaee/web-app_6_0.xsd"
         version="6.0">

    <servlet-mapping>
        <servlet-name>springmvc</servlet-name>
        <url-pattern>/</url-pattern>
    </servlet-mapping>

    <servlet>
        <servlet-name>springmvc</servlet-name>
        <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
    </servlet>
</web-app>
```

然后是pom文件

```xml

    <!--该依赖自动引入spring的依赖-->
    <dependencies>
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-web</artifactId>
            <version>6.1.5</version>
        </dependency>
        <!-- https://mvnrepository.com/artifact/org.springframework/spring-webmvc -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-webmvc</artifactId>
            <version>6.1.7</version>
        </dependency>
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-jdbc</artifactId>
            <version>6.1.5</version>
        </dependency>

        <dependency>
            <groupId>jakarta.servlet</groupId>
            <artifactId>jakarta.servlet-api</artifactId>
            <version>5.0.0</version>
            <scope>provided</scope>
        </dependency>
        <dependency>
            <groupId>ch.qos.logback</groupId>
            <artifactId>logback-classic</artifactId>
            <version>1.5.4</version>
        </dependency>
        <!-- https://mvnrepository.com/artifact/org.thymeleaf/thymeleaf-spring6 -->
        <dependency>
            <groupId>org.thymeleaf</groupId>
            <artifactId>thymeleaf-spring6</artifactId>
            <version>3.1.2.RELEASE</version>
        </dependency>
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.13.2</version>
            <scope>test</scope>
        </dependency>


    </dependencies>

</project>
```

还要配置个springmvc-servlet.xml在WEBINF下面

<!--more-->

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:aop="http://www.springframework.org/schema/aop"
       xmlns:tx="http://www.springframework.org/schema/tx"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
                           http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd
                           http://www.springframework.org/schema/aop http://www.springframework.org/schema/aop/spring-aop.xsd
                           http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx.xsd">


    <context:component-scan base-package="org.example.controller"></context:component-scan>


    <!-- SpringResourceTemplateResolver automatically integrates with Spring's own -->
    <!-- resource resolution infrastructure, which is highly recommended.          -->
    <bean id="templateResolver"
          class="org.thymeleaf.spring6.templateresolver.SpringResourceTemplateResolver">
        <property name="prefix" value="/WEB-INF/templates/" />
        <property name="suffix" value=".html" />
        <!-- HTML is the default value, added here for the sake of clarity.          -->
        <property name="templateMode" value="HTML" />
        <!-- Template cache is true by default. Set to false if you want             -->
        <!-- templates to be automatically updated when modified.                    -->
        <property name="cacheable" value="true" />

        <property name="characterEncoding" value="UTF-8" />
    </bean>

    <!-- SpringTemplateEngine automatically applies SpringStandardDialect and      -->
    <!-- enables Spring's own MessageSource message resolution mechanisms.         -->
    <bean id="templateEngine"
          class="org.thymeleaf.spring6.SpringTemplateEngine">
        <property name="templateResolver" ref="templateResolver" />
        <!-- Enabling the SpringEL compiler can speed up execution in most           -->
        <!-- scenarios, but might be incompatible with specific cases when           -->
        <!-- expressions in one template are reused across different data types, so  -->
        <!-- this flag is "false" by default for safer backwards compatibility.      -->
        <property name="enableSpringELCompiler" value="true" />
    </bean>

    <bean class="org.thymeleaf.spring6.view.ThymeleafViewResolver">
        <property name="templateEngine" ref="templateEngine" />
        <!-- NOTE 'order' and 'viewNames' are optional -->
        <property name="order" value="1" />
        <!--        <property name="viewNames" value="*.html,*.xhtml" />-->
        <property name="characterEncoding" value="UTF-8"/>
    </bean>



</beans>
```

将类交给spring管理,然后注解RequestMapping配置Servlet路径

```java
package org.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 该类为拦截器,拦截浏览器的请求并做处理
 * @author Jackasher
 * @version 1.0
 * @className FirstController
 * @since 1.0
 **/
@Controller("firstController")
public class FirstController {
    public FirstController() {
        System.out.println("FirstController被创建");
    }

    @RequestMapping("/first")
    public String hehe(){
        return "second";
    }

}

```


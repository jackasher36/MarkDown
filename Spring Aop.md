# Spring Aop.xml

比较完整的spring.xml文件

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:aop="http://www.springframework.org/schema/aop"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
                           http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd
                           http://www.springframework.org/schema/aop http://www.springframework.org/schema/aop/spring-aop.xsd">

    <!--扫描包下面所有的注解-->
    <!--    <context:component-scan base-package="org.example"/>-->


    <!--    表示使用Glib代理-->
    <!--    <aop:aspectj-autoproxy proxy-target-class="true"></aop:aspectj-autoproxy>-->

    <bean id="logAspect" class="org.example.service.LogAspect"></bean>
    <bean id="userService" class="org.example.service.UserService"></bean>


    <aop:config>
        <aop:pointcut id="myPointCut" expression="execution (* org.example.service.UserService.*(..))"/>
        <aop:aspect ref="logAspect">
            <aop:around method="aroundAdvice" pointcut-ref="myPointCut"></aop:around>
        </aop:aspect>
    </aop:config>


</beans>
```


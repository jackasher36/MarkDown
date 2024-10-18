# SPringMVC-servlet.xml

```xml

<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:aop="http://www.springframework.org/schema/aop"
       xmlns:tx="http://www.springframework.org/schema/tx" xmlns:mvc="http://www.springframework.org/schema/mvc"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
                           http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd
                           http://www.springframework.org/schema/aop http://www.springframework.org/schema/aop/spring-aop.xsd
                           http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx.xsd http://www.springframework.org/schema/mvc https://www.springframework.org/schema/mvc/spring-mvc.xsd">


    <context:component-scan base-package="org.example.controller"></context:component-scan>


    <!-- SpringResourceTemplateResolver automatically integrates with Spring's own -->
    <!-- resource resolution infrastructure, which is highly recommended.          -->
    <bean id="templateResolver"
          class="org.thymeleaf.spring6.templateresolver.SpringResourceTemplateResolver">
        <property name="prefix" value="/WEB-INF/templates/"/>
        <property name="suffix" value=".html"/>
        <!-- HTML is the default value, added here for the sake of clarity.          -->
        <property name="templateMode" value="HTML"/>
        <!-- Template cache is true by default. Set to false if you want             -->
        <!-- templates to be automatically updated when modified.                    -->
        <property name="cacheable" value="true"/>

        <property name="characterEncoding" value="UTF-8"/>
    </bean>

    <!-- SpringTemplateEngine automatically applies SpringStandardDialect and      -->
    <!-- enables Spring's own MessageSource message resolution mechanisms.         -->


    <bean id="templateEngine"
          class="org.thymeleaf.spring6.SpringTemplateEngine">
        <property name="templateResolver" ref="templateResolver"/>
        <!-- Enabling the SpringEL compiler can speed up execution in most           -->
        <!-- scenarios, but might be incompatible with specific cases when           -->
        <!-- expressions in one template are reused across different data types, so  -->
        <!-- this flag is "false" by default for safer backwards compatibility.      -->
        <property name="enableSpringELCompiler" value="true"/>
    </bean>

    <bean class="org.thymeleaf.spring6.view.ThymeleafViewResolver">
        <property name="templateEngine" ref="templateEngine"/>
        <!-- NOTE 'order' and 'viewNames' are optional -->
        <property name="order" value="1"/>
        <!--        <property name="viewNames" value="*.html,*.xhtml" />-->
        <property name="characterEncoding" value="UTF-8"/>
    </bean>

    <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
        <property name="prefix" value="/WEB-INF/jsp/"/>
        <property name="suffix" value=".jsp"/>
    </bean>
    <mvc:view-controller path="/e" view-name="c.html"/>

    <mvc:annotation-driven/>

    <mvc:default-servlet-handler/>


</beans>
```


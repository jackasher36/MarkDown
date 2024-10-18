# 整合mybatis的spring配置

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

    <context:component-scan base-package="org.example"/>
    <aop:aspectj-autoproxy proxy-target-class="true"></aop:aspectj-autoproxy>
    <context:property-placeholder location="jdbc.properties"></context:property-placeholder>

<!--    <bean id="myDataSource" class="com.alibaba.druid.pool.DruidDataSource">-->
<!--        <property name="driverClassName" value="com.mysql.cj.jdbc.Driver"></property>-->
<!--        <property name="url" value="jdbc:mysql://localhost:3306/jack"></property>-->
<!--        <property name="username" value="root"></property>-->
<!--        <property name="password" value="casio233."></property>-->
<!--    </bean>-->

    <bean id="myDataSource" class="com.alibaba.druid.pool.DruidDataSource">
        <property name="driverClassName" value="${jdbc.driver}"></property>
        <property name="url" value="${jdbc.url}"></property>
        <property name="username" value="${jdbc.username}"></property>
        <property name="password" value="${jdbc.password}"></property>
    </bean>
    
    <bean class="org.mybatis.spring.SqlSessionFactoryBean">
        <property name="dataSource" ref="myDataSource"></property>
        <property name="configLocation" value="mybatis-config.xml"></property>
        <property name="typeAliasesPackage" value="org.example.bank.pojo"></property>
    </bean>
    
    <bean class="org.mybatis.spring.mapper.MapperScannerConfigurer">
        <property name="basePackage" value="org.example.bank.mapper"></property>
        
    </bean>
    
    <bean id="txManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
        <property name="dataSource" ref="myDataSource" />
    </bean>
    
    <tx:annotation-driven transaction-manager="txManager"/>
    


</beans>
```


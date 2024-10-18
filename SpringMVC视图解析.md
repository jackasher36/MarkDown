# SpringMVC视图解析

这是一个最简单的视图解析,能够帮你找到文件

```xml
    <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
        <property name="prefix" value="/WEB-INF/jsp/"/>
        <property name="suffix" value=".jsp"/>
    </bean>
```

如果没有业务代码不用谢Controller了

```xml
 <mvc:view-controller path="/e" view-name="c.html"/>
```

但是会使组件扫描失效,需要重新使用组件扫描

```xml
    <mvc:annotation-driven/>
```

然后我们可以通过一下配置可以处理静态资源直接访问

```xml
    <mvc:default-servlet-handler/>
```


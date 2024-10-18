# SpringMVC过滤器

```xml
<filter>
    <filter-name>hiddenHttpMethodFilter</filter-name>
    <filter-class>org.springframework.web.filter.HiddenHttpMethodFilter</filter-class>
</filter>
<filter-mapping>
    <filter-name>hiddenHttpMethodFilter</filter-name>
    <url-pattern>/*</url-pattern>
</filter-mapping>
```



这个配置是用于在Spring框架中启用HiddenHttpMethodFilter过滤器的。HiddenHttpMethodFilter是Spring提供的一个过滤器，它允许你通过HTML表单发送除GET和POST之外的其他HTTP请求方法（如PUT、DELETE）。



具体来说，这是如何工作的：

1. **HTML表单限制**：标准的HTML表单只支持GET和POST请求方法。如果你想在表单中发送PUT或DELETE请求，浏览器本身不支持这些方法。

	2.	**隐藏字段**：为了绕过这个限制，你可以在表单中添加一个隐藏的输入字段，名称为_method，其值设置为你想要的HTTP方法（PUT、DELETE等）。_
	2.	_**过滤器工作原理**：当表单提交时，HiddenHttpMethodFilter会拦截请求并检查是否存在名为_method的隐藏字段。如果存在，它会把这个字段的值作为真正的HTTP方法来处理，并相应地修改请求的方法。

​	•filter标签定义了一个名为hiddenHttpMethodFilter的过滤器，它的实现类是org.springframework.web.filter.HiddenHttpMethodFilter。

​	•filter-mapping标签将这个过滤器映射到所有URL模式（/*），这意味着它会拦截所有进入的请求。

在这种情况下，当表单提交时，HiddenHttpMethodFilter会将请求的方法从POST修改为PUT，这样Spring MVC的控制器就可以正确地处理PUT请求。

通过使用这个过滤器，你可以方便地在HTML表单中使用PUT和DELETE方法，而不需要依赖JavaScript或其他客户端技术来实现这些HTTP方法的提交。
# SpringMVC原理

## 实现视图机制的原理描述

### 使用Thymeleaf作为视图

1. **浏览器发送请求**：
   - 浏览器发送请求给Web服务。

2. **请求接收**：
   - Spring MVC中的`DispatcherServlet`接收到请求。

3. **请求分发**：
   - `DispatcherServlet`根据请求路径分发到对应的Controller。

4. **调用Controller方法**：
   - `DispatcherServlet`调用Controller的方法。

5. **返回逻辑视图名**：
   - Controller的方法处理业务并返回一个逻辑视图名给`DispatcherServlet`。

6. **视图解析**：
   - `DispatcherServlet`调用`ThymeleafViewResolver`的`resolveViewName`方法，将逻辑视图名转换为物理视图名，并创建`ThymeleafView`对象返回给`DispatcherServlet`。

7. **视图渲染**：
   - `DispatcherServlet`再调用`ThymeleafView`的`render`方法，`render`方法将模板语言转换为HTML代码，响应给浏览器，完成最终的渲染。

### 使用JSP作为视图

1. **浏览器发送请求**：
   - 浏览器发送请求给Web服务。

2. **请求接收**：
   - Spring MVC中的`DispatcherServlet`接收到请求。

3. **请求分发**：
   - `DispatcherServlet`根据请求路径分发到对应的Controller。

4. **调用Controller方法**：
   - `DispatcherServlet`调用Controller的方法。

5. **返回逻辑视图名**：
   - Controller的方法处理业务并返回一个逻辑视图名给`DispatcherServlet`。

6. **视图解析**：
   - `DispatcherServlet`调用`InternalResourceViewResolver`的`resolveViewName`方法，将逻辑视图名转换为物理视图名，并创建`InternalResourceView`对象返回`DispatcherServlet`。

7. **视图渲染**：
   - `DispatcherServlet`再调用`InternalResourceView`的`render`方法，`render`方法将模板语言转换为HTML代码，响应给浏览器，完成最终的渲染。


# SpringMVC的初始化

记住springmvc-servlet.xml的文件要放在WEB-INf下面,不然springmvc找不到前端文件 那么



而且所有的SpringMVC都需要走Dispathcer除了jsp这意味,所有html文件是无法访问的,资源必须由Servlet解析给你

当没有显式配置 DispatcherServlet（即未在 web.xml 或者使用 Servlet 3.0+ 的注解方式中指定）时，Spring MVC 框架会使用默认的配置方式来初始化 DispatcherServlet。以下是默认配置情况下的工作方式：



​	1.	**约定的Servlet名称和URL映射**：

​	•	如果没有显式配置 <servlet> 和 <servlet-mapping>，Spring MVC 默认使用名为 dispatcher 的 DispatcherServlet。

​	•	默认情况下，DispatcherServlet 会映射到所有的URL模式 (/)。

​	2.	**默认的初始化参数和配置文件位置**：

​	•	Spring MVC 会尝试查找默认的配置文件，例如 /WEB-INF/{servlet-name}-servlet.xml，其中 {servlet-name} 默认为 dispatcher。

​	•	如果找不到这样的配置文件，Spring MVC 会使用约定的默认配置方式，通常是在类路径下寻找 dispatcher-servlet.xml 或者 dispatcher-servlet.xml 的文件。

​	3.	**适应性和灵活性**：

​	•	Spring MVC 框架旨在通过自动配置尽可能简化开发人员的工作。默认情况下，它会尝试合理地处理大部分常见的应用程序情况，而不需要开发人员明确地配置每个细节。



**能够正常使用**：



​	•	如果没有在 web.xml 中显式配置 DispatcherServlet，Spring MVC 框架会尝试使用默认的配置来处理请求。这意味着在大多数情况下，你的应用程序仍然可以正常工作，特别是对于简单的应用程序和默认配置的需求而言。



**特殊情况考虑**：



​	•	在某些特定情况下，例如需要自定义 DispatcherServlet 的名称、URL映射或其他特定的配置需求时，可能需要显式配置 web.xml 或者使用 Servlet 3.0+ 的注解方式来确保 DispatcherServlet 的正确初始化和配置。



综上所述，没有显式配置 DispatcherServlet 的情况下，Spring MVC 框架可以通过默认的方式来处理大多数应用程序的请求，从而允许你的应用程序正常运行。
# Spring理解

我想起刚开始学习MVC的痛苦了, 刚开始的时候,还是Thymeleaf视图解析, 需要有页面跳转,配置一堆东西,根本看不懂,什么过滤器,视图解析,静态资源处理,组件扫描,还有表单隐藏作用域

过滤器和拦截器是不同的,可以采用普通的Filter注册到Spring,也可以用MVC提供的拦截器,这种拦截器过滤器, 都需要指定,默认容器不会执行, 视图解析不需要了,静态资源默认在static下了,组件扫描在Mvc的配置类上,自动配置了表单作用域的处理类

通常web容器需要一个web.xml文件,但是,Servlet3提出了注解配置,采用类来配置,这个类就是ServletContainerInitializer,Spring通过实现这个接口来取消了web.xml配置,

![image-20240919144136265](https://p.ipic.vip/r3ihri.png)

### **依靠这种方法,我们就知道`SpringMVC`如何简化配置了**

![image-20240919144512932](https://p.ipic.vip/s9eqe5.png)

**`WebAppInitializer`**就负责配置Spring,MVC,Mybatis,最初是在web.xml里面指定mvc的配置文件位置,现在是在AbstractAnnotationConfigDispatcherServletInitializer子类里面指定mvc路径,该子类代替了web.xml,是Servlet层的接口,Spring提供,而WebMvcConfigurer是Spring里面配置拦截器的,脱离Servlet的接口

![image-20240919145646625](https://p.ipic.vip/s8c9sb.png)

### 这段DOCTYPE的声明只是为了idea可以有语法提示,不写也没有问题

![image-20240919150721457](https://p.ipic.vip/6jxino.png)



## AOP

静态代理就是和原始类实现同一个接口,然后把原始类作为属性注入后,在方法里调用原始类的方法,Spring中的AOP调用时,已经是代理对象了,AOP的核心其实就是,什么方法执行什么切面

![image-20240920150551912](https://p.ipic.vip/0kck7c.png)

切面的定义需要实现`MethodBeforeAdvice`或者``MethodIntercepter``

在 Spring AOP 中，`MethodInvocation` 是 `org.aopalliance.intercept.MethodInvocation` 接口的一个实现类，用于封装一个**方法调用**，并且提供对该方法调用过程的控制。它在 Spring AOP 的动态代理机制中起到了核心作用，特别是当你定义了切面（Aspect）时，Spring 使用它来处理方法的拦截、增强以及最终的调用。

### `MethodInvocation` 包装了以下内容：

1. **被代理对象（Target Object）**：
   - `MethodInvocation` 中包含了目标对象（即正在被代理的原始对象）。当一个方法被代理时，这个对象就是被拦截的目标对象。
2. **被调用的方法（Method）**：
   - `MethodInvocation` 包装了目标对象上的那个具体的 `Method` 实例，它代表了要执行的业务逻辑方法。你可以通过 `getMethod()` 方法获取该被调用的方法。
3. **方法的参数（Arguments）**：
   - 被调用的方法的参数也被封装在 `MethodInvocation` 中，使用 `getArguments()` 方法可以获取到传递给目标方法的参数列表。
4. **拦截器链（Interceptor Chain）**：
   - `MethodInvocation` 还包装了执行增强逻辑的拦截器链（Advice Chain）。这些拦截器按照顺序执行，最后才执行目标方法本身。拦截器通常包含前置通知（Before Advice）、后置通知（After Advice）等增强逻辑。
5. **代理对象（Proxy Object）**：
   - `MethodInvocation` 中可以包含代理对象本身，这是由 Spring AOP 生成的动态代理，它负责管理代理过程中的方法调用和增强处理。

### 执行过程

当代理对象的方法被调用时，`MethodInvocation` 会依次调用拦截器链中的增强逻辑，最终通过 `proceed()` 方法执行目标方法。这个 `proceed()` 方法实际上会继续调用下一个拦截器或最终的目标方法。

### 核心方法

1. **`proceed()`**:
   - 负责向下执行拦截器链，最终调用被包装的目标方法。
2. **`getMethod()`**:
   - 获取当前调用的方法实例。
3. **`getArguments()`**:
   - 获取方法调用的参数。
4. **`getThis()`**:
   - 返回被代理的对象。

通过 `MethodInvocation`，Spring AOP 可以灵活地在方法调用之前、之后甚至替代方法本身来执行增强逻辑。这种设计使得切面（Aspect）可以无缝地和业务逻辑解耦，同时又不影响业务方法的执行。

## `Aop`的切点表达式

`* *(**)`分别为修饰符,方法名,和参数,一个*只可以处理一个包,如果要表示后代包,需要\*..,同时还有对方法切入的arg和对类切入的within

![image-20240920152620280](https://p.ipic.vip/8a9fa3.png)

![image-20240920153414819](https://p.ipic.vip/lo30zg.png)

还可以采用注解方式,自定义一个注解,然后注册这个注解,该注解注解的方法就会成为切面,这个切入点函数还可以使用逻辑运算符,and 和 or, Aop依靠postProcessAfterInitialiazation来做代理,

![image-20240920154216076](https://p.ipic.vip/iwwaao.png)

只要可以理解AOP是对什么方法执行什么额外功能,就明白注解怎么完成切面, 定义一个切面类,指定额外功能和切点就可以,默认是不会扫描aspect注解,所以才需要在配置文件配置

![image-20240920160029186](https://p.ipic.vip/jbb5mh.png)

## Mybatis的整合

Mybatis中就是在这样完成代理的,AOP和Mybatis,都是利用PostProcess,利用JDK的动态代理,  前面提到FactoryBean用来创造复杂类,可以看到他实现了以下的接口来创建SqlsessionFactory,不过我疑惑的,它并没有写配置文件,或者标注解纳入Spring容器呢



![image-20240920171748469](https://p.ipic.vip/tdpbnw.png)

![image-20240920172041153](https://p.ipic.vip/4v3ln7.png)

查询后咋们知道了,是使用类来完成注册进容器的,接下来的问题就是,如何被扫描到的呢

![image-20240920172517313](/Users/leojackasher/Library/Application Support/typora-user-images/image-20240920172517313.png)

Spring对Mybatis做的事情到底是什么,我们到底想要Mybatis做的是什么,核心是mapper,mapper的方法,也就是说,Spring直接为我们提供Mapper,要什么,直接Spring容器里面取,这就是Spring做的事情,编程的核心就是数据的表达与传递,Mybatis核心的数据就是,数据源,Mapper包位置, 实体类别名,原本我们需要创建Sqlsession,需要配置文件的信息,现在这个信息交给了sqlSessionfactoryBean来生成SqlsessionFactory,而在注解开发中,不需要在主程序获取,而是直接依赖注入,这就是Spring对Mybatis的整合

![image-20240920174630509](https://p.ipic.vip/b6bdte.png)

## Spring的注解

前面提到bean的生命周期,实现InitializingBean接口,然后将其注册到Spring的容器里面,就可以在定义Bean的初始化和销毁的时候的操作,现在我们只需要在定义的类方法打上注解就可以,@PostConstruct,@PreDestory,这两个注解是javaee的标准,只是Spring兼容了

![image-20240921163326949](https://p.ipic.vip/7eajkl.png)

### @PropertySource注解

这个注解用来指定配置文件地址

## AOP实操

本来说的是要在主类添加切面注解,但是好像只要加了Aspect可以被扫描到就可以了

![image-20240922002710044](https://p.ipic.vip/vxabbp.png)

为什么不需要注册AOP驱动,因为SPringBoot帮我们做了,在AspectAutoConfiguration里面配置了

![image-20240922004846439](https://p.ipic.vip/vn8em5.png)

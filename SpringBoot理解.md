# SpringBoot理解

@Configuration代表以前的配置文件,Bean注解代表Bean标签,@Import是导入类,直接把类导入到容器里面,

@ConfigurationProperties, 让该组件与配置文件绑定,以prefix的前缀属性值会绑定在属性里面,



![image-20240919155711845](https://p.ipic.vip/yffr73.png)

## SpringBoot如何自动装配

1. 导入Starter
2. xxxAutoConfiguration生效
3. 组件
4. xxxproperties
5. 配置文件

## 要将自己的框架整合进 Spring Boot 中，可以按照以下步骤进行：

### 1. **创建 Spring Boot Starter**

为了让 Spring Boot 自动加载你的框架，最好的方式是创建一个**Spring Boot Starter**，即自定义的 Spring Boot 自动配置模块。步骤如下：

#### 1.1 **定义自动配置类**

在你的框架中，创建一个自动配置类，使用 `@Configuration` 注解，这样 Spring Boot 会自动配置你的框架组件。

```java

复制代码
@Configuration
public class MyFrameworkAutoConfiguration {

    @Bean
    public MyFrameworkComponent myFrameworkComponent() {
        return new MyFrameworkComponent();  // 假设这是你的框架核心组件
    }
}
```

#### 1.2 **创建 `spring.factories` 文件**

在 `src/main/resources/META-INF/spring` 目录下创建一个 org.springframework.boot.autoconfigure.AutoConfiguration.imports 文件。这个文件用于告诉 Spring Boot 在启动时加载你的自动配置类。

```properties

org.springframework.boot.autoconfigure.EnableAutoConfiguration=\
com.example.myframework.MyFrameworkAutoConfiguration
```

#### 1.3 **确保你的依赖是可自动加载的**

将你的框架打包为一个可以依赖的 jar 文件，并在 Spring Boot 项目中添加该依赖。Spring Boot 会自动扫描并加载 org.springframework.boot.autoconfigure.AutoConfiguration.imports 文件中的配置。

### 2. **整合 `@Conditional` 注解（可选）**

为了让你的框架更加灵活，可以通过 `@Conditional` 注解来控制配置是否生效，例如在某个配置项启用时才加载某些 Bean。

```java

@Configuration
@ConditionalOnProperty(name = "myframework.enabled", havingValue = "true", matchIfMissing = true)
public class MyFrameworkAutoConfiguration {
    // 框架的配置
}
```

### 3. **提供默认配置（可选）**

如果你的框架有一些默认配置，可以通过在 `application.properties` 或 `application.yml` 文件中提供默认值。

```properties

myframework.enabled=true
myframework.someProperty=defaultValue
```

### 4. **在 Spring Boot 应用中引入你的框架**

发布或将你的框架打包成 Maven/Gradle 可引入的依赖，添加到 Spring Boot 项目中即可。例如：

**Maven:**

```xml

<dependency>
    <groupId>com.example</groupId>
    <artifactId>myframework-spring-boot-starter</artifactId>
    <version>1.0.0</version>
</dependency>
```



所以SpringBoot是通过读取 `src/main/resources/META-INF/` 目录下 `org.springframework.boot.autoconfigure.AutoConfiguration.imports` 文件,来纳入Spring的,



## 外部配置文件

如果想要更改项目不需要重新编译,只需要引入外部配置文件,`/config`,`./`,以及运行时指定配置文件地址

![image-20240922190023203](https://p.ipic.vip/w2hlu6.png)

## 总结手写starter

首先打开一个SpringBoot项目,然后删改主程序,然后定义自己的程序,最后在一个AutoConfiguration类里面引入所有的组件和配置类,配置类上的注解`@ConfigurationProperties(prefix = "jack")`,用于绑定spring配置文件,jack开头的属性会被注入到属性里面

![image-20240922210104442](https://p.ipic.vip/8cn7e5.png)



![image-20240922210129756](https://p.ipic.vip/ruhfmw.png)

昨天晚上弄了很久都没有搞好,反思一下,一直在程序里显示没有Jack类型的bean,只有手动导入后,才可以使用, 明明很明显的问题就是spring并没有将其注册到容器,我都没有怀疑是META-INF里面的文件出问题,因为不理解Spring的源码才会这样



## Swagger文档

之前一直很疑惑前后端的接口怎么做,谁来写,写起来不是很复杂吗,原来市面上有自动生成文档的库,而且原理不难,扫描Controller的注解就可以,我的SpringBoot是配了/warehouse路径的,所以要访问127.0.0.1/warehouse/swageer-ui.html,并且要在拦截器放行所有请求,具体怎么放行,我也不知道,我只直接把拦截器给取消了

![image-20240923134903649](https://p.ipic.vip/nv4urn.png)

![image-20240923135101005](https://p.ipic.vip/nek61b.png)
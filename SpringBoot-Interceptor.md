# SpringBoot-Interceptor

这个类被用于配置`SPringMVC`的内容

```java
@Configuration
public class AppConfig implements WebMvcConfigurer {
  //配置拦截器
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        LoginInterceptor loginInterceptor = new LoginInterceptor();
        registry.addInterceptor(loginInterceptor).addPathPatterns("/user").excludePathPatterns("/test");
    }
}
```

其实我不理解的是,为什么已经实现了mvc的接口,还要配置声明这个类
# Spring Aop切面类

通过注解表示该方法的增强类型,并制定Aop的方法

```java
package org.example.service;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

/**
 * @author Jackasher
 * @version 1.0
 * @className LogAspect
 * @since 1.0
 **/

@Component
@Aspect
@Order(2)
public class LogAspect {

    //定义通用切点表达式
    @Pointcut("execution (* org.example.service.UserService.*(..))")
    public void genernalAspect(){

    }

    //前置通知
    @Before("genernalAspect()")
    public void advice(){
        System.out.println("我是一个前置通知");
    }
    //后置通知
    @AfterReturning("execution (* org.example.service.UserService.*(..))")
    public void afterReturningAdvice(){
        System.out.println("我是一个后置通知");
    }
    //环绕通知
    @Around("execution (* org.example.service.UserService.*(..))")
    public void aroundAdvice(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        System.out.println("前环绕");
        proceedingJoinPoint.proceed();
        System.out.println("后环绕");

    }
    //异常通知
    //最终通知
    @After("execution (* org.example.service..*(..))")
    public void afterAdvice(){
        System.out.println("最终通知");

    }
}

```


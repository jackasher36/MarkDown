# JDK动态代理

代理主程序

```java
 @Test
    public void ProxyTest() throws InterruptedException {
        OrderServiceImpl target = new OrderServiceImpl();

      //传入代理类
        MyinvokationHander myinvokationHander = new MyinvokationHander(target);
      
      //转型为接口,接口可以得到方法
        OrderService orderService = (OrderService) Proxy.newProxyInstance(target.getClass().getClassLoader(), target.getClass().getInterfaces(), myinvokationHander);

        orderService.detail();
        orderService.modify();
        orderService.generate();

    }
```

InvocationHander

```java
package org.example.sercice;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;

/**
 * @author Jackasher
 * @version 1.0
 * @className MyinvokationHander
 * @since 1.0
 **/
public class MyinvokationHander implements InvocationHandler {

  //接口接受实现类
    private OrderService orderService;

    public MyinvokationHander(OrderService orderService) {
        this.orderService = orderService;
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {

        long begin = System.currentTimeMillis();
      
      //方法四要素,对象,参数,返回值,哪个方法
        Object value = method.invoke(orderService, args);
        long end = System.currentTimeMillis();
        System.out.println("该方法用时:" + (end - begin) + "ms");
        System.out.println();
        return value;
    }
}

```


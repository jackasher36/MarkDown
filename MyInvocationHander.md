# MyInvocationHander

这是JDK代理的切面操作

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

    private OrderService orderService;

    public MyinvokationHander(OrderService orderService) {
        this.orderService = orderService;
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {

        long begin = System.currentTimeMillis();
        Object value = method.invoke(orderService, args);
        long end = System.currentTimeMillis();
        System.out.println("该方法用时:" + (end - begin) + "ms");

        return value;
    }
}

```

测试调用

```java
  @Test
    public void ProxyTest() throws InterruptedException {
        OrderServiceImpl target = new OrderServiceImpl();

        MyinvokationHander myinvokationHander = new MyinvokationHander(target);
        OrderService orderService = (OrderService) Proxy.newProxyInstance(target.getClass().getClassLoader(), target.getClass().getInterfaces(), myinvokationHander);

        orderService.detail();
        orderService.modify();
        orderService.generate();

    }
```


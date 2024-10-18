# SpringMVC的传参

通常使用pojo类传参

```java
  @RequestMapping("/b")
    public String loginTests(User user){
        System.out.println(user);
        return "okay.html";
    }
```

SpringMVC会自动创建User对象,并且用set方法传入参数,可以有多余的属性,但是这个表单数据名和set方法要一致,例如表单数据username,会找到user类后,使用method.invoke(User,args...);

```cmd
User{id=0, username='sdfdf', password='Sfs'}
```

还有几种方法,一种是在传参中写入HttpServletRequest,

一种是@RequestParm,可以给传入参数注入值,该方法如果表单数据和属性名相同,则是可以省略的,根据表单数据例如

还有一种是RESTFul风格url的传值,注解是@PathVariable,一共四种
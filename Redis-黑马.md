# Redis-黑马

直接跳过基本操作和 Jedis 操作开始实战,然后我们重点是学会 redis 的思想,而不是编码,所以直接拿着现成项目学习, 而不是一个一个敲,



## 手机号模拟验证码和登入

把生成验证码保存到 session 后, 返回给前端, 前端输入验证码,服务器进行验证

```java
@Override
public Result sedCode(String phone, HttpSession session) {
    //1. 校验手机号
    if (RegexUtils.isPhoneInvalid(phone)) {
        //2.如果不符合，返回错误信息
        return Result.fail("手机号格式错误");
    }

    //3. 符合，生成验证码
    String code = RandomUtil.randomNumbers(6);
    //4. 保存验证码到session
    session.setAttribute("code",code);
    //5. 发送验证码
    log.debug("发送短信验证码成功，验证码:{}",code);
    //返回ok
    return Result.ok();
}

@Override
public Result login(LoginFormDTO loginForm, HttpSession session) {
    //1. 校验手机号
    String phone = loginForm.getPhone();
    if (RegexUtils.isPhoneInvalid(phone)) {
        return Result.fail("手机号格式错误");
    }
    //2. 校验验证码
    Object cacheCode = session.getAttribute("code");
    String code = loginForm.getCode();
    if (cacheCode == null || !cacheCode.toString().equals(code)){
        //3. 不一致，报错
        return Result.fail("验证码错误");
    }

    //4.一致，根据手机号查询用户
    User user = query().eq("phone", phone).one();

    //5. 判断用户是否存在
    if (user == null){
        //6. 不存在，创建新用户
        user = createUserWithPhone(phone);
    }

    //7.保存用户信息到session
    session.setAttribute("user",BeanUtil.copyProperties(user,UserDTO.class));
    return Result.ok();
}
```

## Session 到底是个什么

用户打开浏览器, 默认会有一个 sessionid, 在发生请求时, 自动发送到服务器, 所以不需要一个返回凭证

## 拦截器

```java
public class LoginInterceptor implements HandlerInterceptor
```

这是 Spring 配置拦截器的类,注册到容器里

```java
package com.hmdp.config;

import com.hmdp.utils.LoginInterceptor;
import com.hmdp.utils.RefreshTokenInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.annotation.Resource;

@Configuration
public class MvcConfig implements WebMvcConfigurer {

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 登录拦截器
        registry.addInterceptor(new LoginInterceptor())
                .excludePathPatterns(
                        "/shop/**",
                        "/voucher/**",
                        "/shop-type/**",
                        "/upload/**",
                        "/blog/hot",
                        "/user/code",
                        "/user/login"
                );
    }
}
```

## BeanUtil

这是 javaJDk 提供的包, 可以把一个对象的属性粘贴在另一个对象, 也可以把 bean 转成 map, 把 map 转出 bean

```java
UserDTO userDTO = BeanUtil.copyProperties(user, UserDTO.class);

Map<String, Object> stringObjectMap = BeanUtil.beanToMap(userDTO);

Map<String, Object> stringObjectMap = BeanUtil.beanToMap(userDTO);
```

## StrUtil

StrUtil.isBlank(token) 是来自 **Hutool** 工具库的一个方法，它的作用是检查字符串是否为以下三种情况之一：

​	•null

​	•字符串（""）

​	•仅包含空白字符（如空格、制表符等）

## Redis 速度

首先看看从数据库查数据的返回速度,可以看到是 884ms,听说 redis 是微秒级别的,我们来看看吧

![image-20241003214338666](https://p.ipic.vip/a4pyih.png)

可以看到第二次的查询速度直接数量级的下降了,直接变成 71ms 了,这就是 redis 的速度

![image-20241003214448039](https://p.ipic.vip/rt55pm.png)

## 缓存穿透

缓存穿透是指, 客户请求的数据不存在, 每一次请求都会打到数据库, 解决方法是布隆过滤和缓存空对象, 这里的演示缓存空对象, 原理就是把这个不存在 的 key 放在 redis

```java
@Override
    public Result queryById(Long id) {
        // 根据ID查询店铺信息的缓存键
        String key = CACHE_SHOP_KEY + id;
    
        // 从redis查询店铺信息的JSON字符串
        String shopJson = stringRedisTemplate.opsForValue().get(key);
        // 判断查询结果是否非空
        if (StrUtil.isNotBlank(shopJson)) {
            // 如果redis中存在该店铺信息，则将其转换为Shop对象并直接返回
            Shop shop = JSONUtil.toBean(shopJson, Shop.class);
            System.out.println("redis 存在该数据");
            return Result.ok(shop);
        }
    
        // 如果查询结果为空字符串，则返回店铺不存在的错误信息
        if (shopJson != null) {
            return Result.fail("店铺不存在");
        }
    
        // 如果redis中不存在该店铺信息，则从数据库中查询
        Shop shop = getById(id);
    
        // 如果数据库中也不存在该店铺信息，则在redis中写入null值，以避免重复查询数据库
        if (shop == null) {
            stringRedisTemplate.opsForValue().set("cache:shop:" + id, "", 5L, TimeUnit.MINUTES);
            return Result.fail("店铺不存在");
        }
    
        // 如果数据库中存在该店铺信息，则将其转换为JSON字符串并写入redis，同时设置过期时间
        if (shop != null) {
            stringRedisTemplate.opsForValue().set("cache:shop:" + id, JSONUtil.toJsonStr(shop), CACHE_SHOP_TTL, TimeUnit.MINUTES);
            return Result.ok(shop);
        }
    
        // 返回查询结果，此处返回的shop可能为null，表示店铺信息不存在
        return Result.ok(shop);
    }


```

通过格式校验也可以解决缓存穿透,还有`SpringCloud`的限流

![image-20241003224840416](https://p.ipic.vip/nqjuvd.png)

## 缓存雪崩

缓存雪崩就是 redis 宕机了,或者同一时间大量缓存 key 过期,造成大量访问数据库了, 

### 解决方案

+ 给 Key 的 ttl 设置不同的时间段
+ 集群
+ 限流
+ 多级缓存



## 缓存击穿

缓存击穿, 就是某一个常用的 key 失效了, 然后大量请求直接打向数据库



## BooleanUtil.isTrue

`BooleanUtil` 的 `isTrue` 方法用于判断传入的布尔值是否为 `true`。它通常用来简化布尔值的判断逻辑，避免对 `null` 值进行显式的处理。

具体而言，`isTrue` 方法的实现通常会判断传入的对象是否为 `true`，并且会自动处理 `null` 的情况。伪代码如下：

```java
public static boolean isTrue(Boolean bool) {
    return bool != null && bool;
}
```

### 功能总结：
- 如果传入的值为 `true`，返回 `true`。
- 如果传入的值为 `false` 或 `null`，返回 `false`。

这个方法可以防止 `NullPointerException`，避免手动去写 `bool != null && bool == true` 的复杂判断。

## 结束

决定不听了,实在是讲的太差了, 真的不知道怎么回去推荐黑马的课程,太荒唐了, 根本不是给初学者看的

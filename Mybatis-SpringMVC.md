# Mybatis-SpringMVC

## 错误

我犯了个错误,`namespace`的地方我后缀加了java,

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "https://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.example.springboot.dao.StudentDao">
    <select id="selectById" resultType="com.example.springboot.pojo.User">
        select * from users where id = #{id}
    </select>
</mapper>
```

`boot`的起步依赖会加载mybatis类,连代理类都不用自己生成,在`boot`配置文件配好数据源,会自动完成数据库连接,实在是厉害

```properties
spring.application.name=springboot
jdbc.url=jdbc:mysql://localhost:3306
jdbc.driver=com.jdbc.cj.mysql.Driver
jdbc.username=root
jdbc.password=casio233.

spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
spring.datasource.url=jdbc:mysql://localhost:3306/jack
spring.datasource.username=root
spring.datasource.password=casio233.

//指定mapper位置
mybatis.mapper-locations=classpath:mapper/*.xml

```




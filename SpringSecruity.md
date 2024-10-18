# SpringSecruity

## 基本使用

**总体框架**

![IMG_1321](https://p.ipic.vip/g9cpll.png)

先导入 jar 包, SpringSecruity-starterde

```xml
<dependencies>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter</artifactId>
    </dependency>
    <dependency>
        <groupId>mysql</groupId>
        <artifactId>mysql-connector-java</artifactId>
        <version>8.0.33</version>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-test</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-web</artifactId>
    </dependency>

    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-security</artifactId>
    </dependency>

    <!-- https://mvnrepository.com/artifact/com.baomidou/mybatis-plus-spring-boot3-starter -->
    <dependency>
        <groupId>com.baomidou</groupId>
        <artifactId>mybatis-plus-spring-boot3-starter</artifactId>
        <version>3.5.5</version>
    </dependency>
    <dependency>
        <groupId>org.projectlombok</groupId>
        <artifactId>lombok</artifactId>
    </dependency>


</dependencies>
```

然后自定义UserDetailService,用于获取用户信息的,如果不重写,则会返回一个 user账户和默认密码

![IMG_1322](https://p.ipic.vip/jgyill.png)

重写后,需要返回一个UserDetail

```java
@Service
public class UserDetailServiceImpl implements UserDetailsService {


    @Resource
    private UserMapper userMapper;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userMapper.selectOne( new LambdaQueryWrapper<User>().eq(User::getUsername, username));
        if (Objects.isNull(user)) {
            throw new RuntimeException("user查询为 Null");
        }
        return new LoginUser(user);
    }
}
```

该 UserDetail 会得到账号和密码,这个 UserDetail 会被拿来认证

```java
@Data
@AllArgsConstructor
@NoArgsConstructor
public class LoginUser implements UserDetails {

    private User user;
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return null;
    }

    @Override
    public String getPassword() {
        return null;
    }

    @Override
    public String getUsername() {
        return null;
    }
}
```

如果没有配置密码加密会提示

```sh
java.lang.IllegalArgumentException: You have entered a password with no PasswordEncoder. If that is your intent, it should be prefixed with `{noop}`.
```

## Idea导入 SpringBoot 项目大量爆红

你敢相信是因为加了`<relativePath/>`导致找不到父工程,所以报错............
# Redis Start-尚硅谷

Redis可以把数据存在内存中,不需要IO操作,可以操作频繁读写的数据,这是redis的一些应用,目前只用过手机验证码的过期设置

![image-20240923140146122](https://p.ipic.vip/epuf90.png)

## 远程连接

redis默认无法远程访问,需要开放权限

![image-20240923191841437](https://p.ipic.vip/fes67a.png)

### 防火墙开放端口

**使用 `firewalld`**（CentOS/RHEL 7+）：

```bash
sudo firewall-cmd --permanent --add-port=6379/tcp
sudo firewall-cmd --reload
```

最后阿里云也要开放安全组,然后使用命令连接

```cmd
redis-cli -h 8.137.145.18 -p 6379
```

最后完成后重启服务

```sh
sudo systemctl restart redis
```

## RPM包管理

前面在找不到redis配置文件时,时,使用rpm可以告诉我们软件包的信息

```cmd
rpm -ql redis
```

![image-20240923193246071](https://p.ipic.vip/s33feh.png)

## 基础操作

```cmd
select

//key操作
keys *
exists <key>
type <key>
del <key>
expire <key>
ttl <key>

//数据库操作
dbsize
flushdb
dlushall
```

## String数据结构操作

String是线程安全的,最大为512MB

### 命令

````cmd
get <key>
set <key> <value>
mget k1 k2 k3
mset k1 v1 k2 v2
msernx k1 v1 k2 v2

append <key> <abc>
strlen key
setnx <key> <value>
setex k1 <expiretime> v1

//原子操作
incr key 
decr key
````

## List数据结构

List底层是一个双向链表,通过索引取中间值会比较慢, k1代表链表

```cmd
//这种数据结构会变成 v3 v2 v1
lpush k1 v1 v2 v3
lrange k1 0 -1

//这种数据结果会变成v1 v2 v3
rpush k1 v1 v2 v3
lrange k1 0 -1

lpop
rpop

//把k1的右边取出来,插到k2左边
rpoplpush k1 k2

lindex k1 <index>
linsert k1 before <v1> <newValue>
lrem k1 <num> v1 

```



## Set数据结构



```cmd
sadd k1 v1 v2 v3
smembers
sismember

//返回集合元素个数
scard k1
srem k1 v1 v2

//随机吐出一个值
spopo k1

//随机取出n个值,不会删除
srandmember k1 <num>

smove k1 k2 v1

//取交集
sinter

//取并集
sunion

//取差集
sdiff
```

## Hash数据结构操作

hash有点像key里面放Map

![image-20240923151445956](https://p.ipic.vip/v2o6mq.png)

### 常用操作

```cmd
hset user:1001 k1 v1 k2 v2
hget user:1001 k1
hget user:1001 k2

//判断k1里面有没有k1
hexists k1 v1

hkeys
hvals
hincrby k1 v1 <increment>

hsetnx


```



## Zset数据结构

zad是有序的集合

```sh
zadd k1 v1 k2 v2
zrange 0 -1 withscores
zrangebyscore topn 300 500 withscores
zrevrangebyscore topn 500 200 withscores
zrem
zcount 
```

# Reids配置

tcp的连接数

```sh
tcp-backlog 511
```

tcp检测心跳,

```java
tcp-keepalive 300
```

## 事务

`multi`开启事务, `exec`执行事务, `discard`回滚,类似与mysql的`begin`, `commit`,` rollback`, 与mysql不同的是, 如果事务中,执行失败时, 只有失败的不会执行,甚至错误后面的也会执行,我想redis可以这样是因为, 每个指令都是原子指令, 不依赖前面的指令

### 悲观锁

悲观锁就是悲观认为别人都要修改,所以自己修改时上锁,不准别人修改,

### 乐观锁

乐观锁是给数据库加版本号, 每一次更改都要更新版本号, 版本号不一致就不允许修改,这很像git的原理啊,乐观锁用于多读的类型,抢票就是最好的例子, 当进入支付那一刻,别人可以抢,但是不可以操作了,watch可以对某个key做监视

### 并发测试

没想到我的SpringBoot项目,只能承受150个并发? 不过这样看来处理5亿的并发也只要100多亿而已啊,也就是说,技术优化后,也许10亿就可以处理全球的业务,

```sh
ab -n 500 -c 300 http://127.0.0.1:81/gateway-server/free
```



## 配置文件

edis-server 启动时，默认情况下它不会主动使用配置文件，Redis 会以默认设置运行。一般情况下，如果你没有指定配置文件，Redis 使用的是内置的默认参数。

## 主从复制

因为 redis 是非关系数据库,所以主从复制也太简单了吧! 一句命令就可以了

```sh
slaveof 127.0.0.1 6380
//查看本库主从关系
info replication
```

成为主从关系后,连自己的数据都会被清除

![image-20240929175028356](https://p.ipic.vip/4zviam.png)

主从关系建立后,从服务器默认不能写了

```sh
127.0.0.1:6379> set c c
(error) READONLY You can't write against a read only replica.
```

我不知道为什么 redis 会知道 dump.db 文件在哪里

```sh
leojackasher@LeoJackAshers-MacBook-Air bin % redis-cli CONFIG GET dir
1) "dir"
2) "/opt/homebrew/var/db/redis"
leojackasher@LeoJackAshers-MacBook-Air bin % 

```

## 哨兵

哨兵就是监视一个节点,出问题就把从服务器升级为主服务器,在 redis-entinel.conf里面配置监视节点

```sh
sentinel monitor mymaster 127.0.0.1 6380 1
```

通过 slave 配置文件的 slave-proiority 的值来决定优先级,越小优先级越高

vim 改配置文件时,可以%s/6379/6380来做替换



## 权限

```sh
acl list

acl cat

acl cat string

acl setuser lucy
```


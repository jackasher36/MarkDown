# Linux命令

## 防火墙命令

```cmd
 sudo firewall-cmd --list-all
```

![image-20240924033031611](https://p.ipic.vip/hh4ku7.png)



## 防火墙增加端口

```cmd
sudo firewall-cmd --add-port=5672/tcp --permanent
sudo firewall-cmd --reload
```

## RabbitMq安装

直接yum下载rabbitmq-server,然后配置环境变量后,启动,打开15672端口,打开插件

![image-20240924034229189](https://p.ipic.vip/bn95xi.png)


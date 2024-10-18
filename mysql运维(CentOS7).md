# mysql运维(CentOS7)

首先获取mysql的仓库

```sh
wget http://dev.mysql.com/get/mysql80-community-release-el7-5.noarch.rpm
rpm -ivh mysql80-community-release-el7-5.noarch.rpm
yum install mysql-community-server
```

然后下载

```sh
sudo yum install mysql-server --nogpgcheck
```

找到密码启动

```sh
cat /var/log/mysqld.log | grep password
```

启动后

```sh
 输入以下语句，进入mysql库：

use mysql
3. 更新域属性，’%’表示允许任意IP地址访问：

update user set host='%' where user ='root';
4. 执行以上语句之后再执行：

FLUSH PRIVILEGES;
5. 再执行授权语句：

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'WITH GRANT OPTION;
```

mysql也是一个程序,也是一个包,包里面有常见的命令, mysql的所有命令

```sh
-rwxr-xr-x 1 mysql mysql   3062401 12月 18 2021 ibd2sdi
-rwxr-xr-x 1 mysql mysql   2342100 12月 18 2021 innochecksum
-rwxr-xr-x 1 mysql mysql   1789154 12月 18 2021 lz4_decompress
-rwxr-xr-x 1 mysql mysql  10167435 12月 18 2021 myisamchk
-rwxr-xr-x 1 mysql mysql   9642675 12月 18 2021 myisam_ftdump
-rwxr-xr-x 1 mysql mysql   9415217 12月 18 2021 myisamlog
-rwxr-xr-x 1 mysql mysql   9760246 12月 18 2021 myisampack
-rwxr-xr-x 1 mysql mysql   1899076 12月 18 2021 my_print_defaults
-rwxr-xr-x 1 mysql mysql  13188322 12月 18 2021 mysql
-rwxr-xr-x 1 mysql mysql  12184808 12月 18 2021 mysqladmin
-rwxr-xr-x 1 mysql mysql  15015674 12月 18 2021 mysqlbinlog
-rwxr-xr-x 1 mysql mysql  12292411 12月 18 2021 mysqlcheck
-rwxr-xr-x 1 mysql mysql      5085 12月 18 2021 mysql_config
-rwxr-xr-x 1 mysql mysql   1933908 12月 18 2021 mysql_config_editor
-rwxr-xr-x 1 mysql mysql 396670925 12月 18 2021 mysqld
-rwxr-xr-x 1 mysql mysql 381253157 12月 18 2021 mysqld-debug
-rwxr-xr-x 1 mysql mysql     27492 12月 18 2021 mysqld_multi
-rwxr-xr-x 1 mysql mysql     29157 12月 18 2021 mysqld_safe
-rwxr-xr-x 1 mysql mysql  12431788 12月 18 2021 mysqldump
-rwxr-xr-x 1 mysql mysql      7669 12月 18 2021 mysqldumpslow
-rwxr-xr-x 1 mysql mysql  12170821 12月 18 2021 mysqlimport
-rwxr-xr-x 1 mysql mysql  13134887 12月 18 2021 mysql_migrate_keyring
-rwxr-xr-x 1 mysql mysql  17144352 12月 18 2021 mysqlpump
-rwxr-xr-x 1 mysql mysql  12138024 12月 18 2021 mysql_secure_installation
-rwxr-xr-x 1 mysql mysql  12163799 12月 18 2021 mysqlshow
-rwxr-xr-x 1 mysql mysql  12222826 12月 18 2021 mysqlslap
-rwxr-xr-x 1 mysql mysql   2108578 12月 18 2021 mysql_ssl_rsa_setup
-rwxr-xr-x 1 mysql mysql   1474011 12月 18 2021 mysql_tzinfo_to_sql
-rwxr-xr-x 1 mysql mysql  13251821 12月 18 2021 mysql_upgrade
-rwxr-xr-x 1 mysql mysql   2616570 12月 18 2021 perror
-rwxr-xr-x 1 mysql mysql   1465672 12月 18 2021 zlib_decompress
```



当你运行 my_print_defaults mysqld 命令时，MySQL 会读取 my.cnf 或其他配置文件中的 [mysqld] 部分，并输出所有配置选项的默认值。这些是 MySQL 服务器在启动时会加载的参数。这个命令非常有用，用来查看当前配置文件中定义的参数和设置，以便你知道服务器在启动时使用了哪些配置。

```sh
/usr/local/mysql/bin/my_print_defaults mysqld
```

```sh
/usr/local/mysql/bin/mysqldump -u root -p database_name > backup.sql
```

```sh
/usr/local/mysql/bin/mysqld --user=mysql &
```

```sh
/usr/local/mysql/bin/mysqld_safe --user=mysql &
```

## 主从复制

首先给主库设置id, 打开二进制日志,选定复制数据库

```sh
[mysqld]
server-id = 1                 # 设置主库的唯一 ID
log_bin = mysql-bin           # 开启二进制日志
binlog_do_db = your_database   # 需要复制的数据库名（可选）
```

然后重启服务后,创建授权用户

```sh
CREATE USER 'replica_user'@'%' IDENTIFIED BY 'your_password';  # 创建用户
GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';         # 授予复制权限
FLUSH PRIVILEGES;                                             # 刷新权限
```

记录主库状态

```sql
SHOW MASTER STATUS;
```

记下file和position的值比如

```yml
File: mysql-bin.000001
Position: 154
```

### 从库同理设置id后重启,然后连接主库

```yml
CHANGE MASTER TO
    MASTER_HOST='8.137.145.18',            # 主库的 IP 地址
    MASTER_USER='replica_user',         # 在主库上创建的复制用户
    MASTER_PASSWORD='your_password',     # 用户密码
    MASTER_LOG_FILE='binlog.000012', # 主库上记录的二进制日志文件名
    MASTER_LOG_POS=3787;                  # 主库上记录的位置
```

启动复制进程

```sql
START SLAVE;
```

检查状态

```sql
SHOW SLAVE STATUS\G;
```

成功的标志

```yml
SHOW SLAVE STATUS\G;
*************************** 1. row ***************************
               Slave_IO_State: Waiting for source to send event
                  Master_Host: 8.137.145.18
                  Master_User: replica_user
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: binlog.000012
          Read_Master_Log_Pos: 2294
               Relay_Log_File: LeoJackAshers-MacBook-Air-relay-bin.000002
                Relay_Log_Pos: 323
        Relay_Master_Log_File: binlog.000012
             Slave_IO_Running: Yes
            Slave_SQL_Running: Yes
              Replicate_Do_DB: 
          Replicate_Ignore_DB: 
           Replicate_Do_Table: 
       Replicate_Ignore_Table: 
      Replicate_Wild_Do_Table: 
  Replicate_Wild_Ignore_Table: 
                   Last_Errno: 0
                   Last_Error: 
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 2294
              Relay_Log_Space: 553
              Until_Condition: None
               Until_Log_File: 
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File: 
           Master_SSL_CA_Path: 
              Master_SSL_Cert: 
            Master_SSL_Cipher: 
               Master_SSL_Key: 
        Seconds_Behind_Master: 0
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 0
                Last_IO_Error: 
               Last_SQL_Errno: 0
               Last_SQL_Error: 
  Replicate_Ignore_Server_Ids: 
             Master_Server_Id: 1
                  Master_UUID: 0a035bc0-2120-11ef-8f06-00163e053ba9
             Master_Info_File: mysql.slave_master_info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
      Slave_SQL_Running_State: Replica has read all relay log; waiting for more updates
           Master_Retry_Count: 86400
                  Master_Bind: 
      Last_IO_Error_Timestamp: 
     Last_SQL_Error_Timestamp: 
               Master_SSL_Crl: 
           Master_SSL_Crlpath: 
           Retrieved_Gtid_Set: 
            Executed_Gtid_Set: 
                Auto_Position: 0
         Replicate_Rewrite_DB: 
                 Channel_Name: 
           Master_TLS_Version: 
       Master_public_key_path: 
        Get_master_public_key: 0
            Network_Namespace: 
1 row in set, 1 warning (0.01 sec)

ERROR: 
No query specified

```

拷贝数据库

```sql
mysqldump -u username -p --all-databases > all_databases_backup.sql

mysqldump -u username -p nacos > backup_file.sql
```

错误日志

```sql
SELECT * FROM performance_schema.replication_applier_status_by_worker;
```

大致就是要获取到主库的一个状态,然后从库的数据库结构必须一样, 否则就无法同步,而且这三个必须是在最前面

```sql
[mysqld]
server-id = 1                 # 设置主库的唯一 ID
log_bin = mysql-bin           # 开启二进制日志
binlog_do_db = your_database   # 需要复制的数据库名（可选）
```


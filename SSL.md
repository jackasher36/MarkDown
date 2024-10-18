#  SSL

通过openssl生成私钥

```
openssl genrsa -out server.key 1024
```

根据私钥生成证书申请文件csr

```
openssl req -new -key server.key -out server.csr
```

使用私钥对证书申请进行签名从而生成证书

```
openssl x509 -req -in server.csr -out server.crt -signkey server.key -days 3650
```

```shell
# Settings for a TLS enabled server.

    server {
        listen       443 ssl http2;
        listen       [::]:443 ssl http2;
        server_name  _;
        root         /usr/share/nginx/html;

        ssl_certificate "/etc/nginx/conf.d/ssl/server.crt";
        ssl_certificate_key "/etc/nginx/conf.d/ssl/server.key";
        ssl_session_cache shared:SSL:1m;
        ssl_session_timeout  10m;
        ssl_ciphers HIGH:!aNULL:!MD5;
        ssl_prefer_server_ciphers on;

        # Load configuration files for the default server block.
        include /etc/nginx/default.d/*.conf;

        error_page 404 /404.html;
            location = /40x.html {
        }

        error_page 500 502 503 504 /50x.html;
            location = /50x.html {
        }
    }


```


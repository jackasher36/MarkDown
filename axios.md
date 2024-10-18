# axios

```js
     btn3.onclick = function (){
            axios({
                method: "get",
                url: "http://127.0.0.1:3000/student",

            }).then((res) => {
                console.log(res);
                console.log(res.data);
            }).catch((err) => {
                console.log(err);
            })
        }
```

axios会自动设置请求头Application和对对返回做promise处理
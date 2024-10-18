# JSONP跨域完成获取信息

### 服务器端返回函数信息

```js
app.get("/jsonp",(req,res) => {
    res.type("application/javascript") 
    res.send("addTestOfDiv()")
})
```

### 动态创建script获取数据返回,执行回调函数

```html
<html>

<head>
    <script src="typejavascript.js"></script>
</head>

<body>
    <input type="text">
    <button id="button">发送jsonp请求</button>
    <div id="div"></div>
    <script>
        function addTestOfDiv(){
            const div = document.getElementById("div")
            div.innerText = "Hi Jsonp"
        }

        const button = document.getElementById("button")
        button.onclick = function(){
            const script = document.createElement('script')
            console.log("点击了!!!");
            script.src = "http://127.0.0.1:3000/jsonp"

            document.body.append(script)
        }
        

    </script>
</body>

</html>
```


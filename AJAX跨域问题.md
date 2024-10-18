# AJAX跨域问题

请求可以到达服务器,服务器正常响应,只是被浏览器拦截下来,浏览器为了保护浏览器,需要浏览器授权,我们可以看到是要求服务器设置响应头

![image-20240719184303320](https://p.ipic.vip/hgmfmn.png)

所以在路由中设置响应头就可以解决了

```js
//设置路由
app.get("/student", (req,res) => {

    console.log("收到get请求");

    res.setHeader("Access-Control-Allow-Origin","*")

    res.send({
        status: "ok",
        result: STU_ARR
    })
    
})
```

最基本的ajax请求,正是因为是异步请求,才必须依靠回调函数来接受响应

```js
   <script>
            const btn = document.getElementById("btn")

            const root = document.documentElement
            btn.onclick = () => {
                const xhr = new XMLHttpRequest()

                //设置请求行
                xhr.open("get","http://127.0.0.1:3000/student")

                xhr.send()

                xhr.responseType = "json"

                // console.log(xhr.response);

                xhr.onload = function(){

                         //将字符串转为对象
                    // const stuList = JSON.parse(xhr.response)
                    // console.log(xhr.response);
                    // console.log("----------------");
                    // console.log(stuList);
                    console.log(xhr.response);
                    const result = xhr.response

                    const ul = document.createElement("ul")
                    root.appendChild(ul)

                    for (const stu of result.data) {
                        ul.insertAdjacentHTML("beforeend",`<li>${stu.id}-${stu.name}-${stu.age}-${stu.gender}-${stu.address}</li>`)
                    }



                   

                }
            }
    


        </script>
```


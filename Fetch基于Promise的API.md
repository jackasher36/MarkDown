# Fetch基于Promise的API

### Fetch是浏览器原生支持的Api,类似于ajax的发送请求

```html
<!DOCTYPE html> 
<html>
    <head>
        <style>
            table {
                border-collapse: collapse;
                width: 100;
                
            }

            td, th {
                text-align: center;
                border: 1px solid #000;
            }
        </style>
    </head>
    <body>
        这是客户端
        <button id="btn">点我加载数据</button>
        <script>
            const btn = document.getElementById("btn")

            const root = document.documentElement
            btn.onclick = function(){
                fetch("http://127.0.0.1:3000/student")
                .then((res ) => {
                    return res.json()
                }).then ((res) => {
                    const table = document.createElement("table")
                    root.appendChild(table)
                    table.insertAdjacentHTML("beforeend","<caption>血色浪漫</caption>")
                    table.insertAdjacentHTML("beforeend",
                    `
                        <thead>
                            <tr>
                                <th>1</th> 
                                <th>2</th> 
                                <th>3</th> 
                                <th>4</th> 
                                <th>5</th>    
                            </tr>
                        </thead>
                    `)

                    const tbody  = document.createElement("tbody")
                    table.appendChild(tbody)

                    for (const stu of res.data) {
                        tbody.insertAdjacentHTML("beforeend",
                        `
                            <tr>
                                <td>${stu.id}</td>
                                <td>${stu.name}</td>
                                <td>${stu.age}</td>
                                <td>${stu.gender}</td>
                                <td>${stu.address}</td>
                            </tr>

                        `)
                    }
                })
                .catch((err) => {
                    console.log(err);
                })

            }
                
    


        </script>
    </body>
</html>
```

**其实我们可以看到,前端渲染方式和,后端原始Servlet渲染很像,手写一大段HTML代码,然后加入数据,而且是在js里面写,那么Vue就是解决数据和视图之间的问题,双向绑定和视图渲染**
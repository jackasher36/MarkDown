# Float横向布局

试着利用float完成页面的布局,这样就可以开始完成基本的页面了

![image-20240730103847752](https://p.ipic.vip/5ebbxt.png)

浮动的解决基本就是clear,然后垂直居中显示可以用line-height

```html
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .header {
            margin: auto;
            display: flex;
            float: left;
            height: 80px;
            margin-bottom: 10px;
        }

        .logo,
        .banner1,
        .banner2 {
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .logo {
            border: 1px;
            background-color: grey;
            width: 210px;
        }

        .banner1 {
            background-color: grey;
            border: 1px;
            width: 560px;
            margin-left: 10px;
            margin-right: 10px;
        }

        .banner2 {
            background-color: grey;
            border: 1px;
            width: 210px;
        }

        .menu {
            background-color: grey;
            clear: both;
            text-align: center;
            margin-bottom: 10px;
            width: 1000px;
        }

        /* .main {
            margin-right: 10px;
        } */

        .list-height-370{
            height: 200px;
            width: 370px;
            border: 1px solid black;
            float: left;
            margin: 10px;

        }

        .left-sider {
            width: 790px;
            float: left;
        }

        .right-sider {
            margin: 10px;
        }

        body {
            margin: 10px;
        }

        .clearfloat {
            clear: both;
        }

        .list-height-180 {
            height: 200px;
            width: 180px;
            border: 1px solid black;
            float: left;
            margin: 7px;
        }

        .list-height-130 {
            height: 125px;
            width: 200px;
            border: 1px solid black;
            float: left;
            margin: 10px;
        }

        .footer {
            height: 60px;
            width: 1000px;
            border: 1px solid black;
            clear: both;
            background-color: grey;
            text-align: center;
            line-height: 60px;
        }
    </style>
</head>

<body>
    <div class="header">
        <div class="logo">logo</div>
        <div class="banner1">banner1</div>
        <div class="banner2">banner2</div>
    </div>

    <div class="menu">菜单</div>

    <div class="main">
        <div class="left-sider">
            <div class="list-height-370">栏目一</div>
            <div class="list-height-370">栏目二</div>
            <div class="clearfloat"></div>

            <div class="list-height-180">栏目三</div>
            <div class="list-height-180">栏目四</div>
            <div class="list-height-180">栏目五</div>
            <div class="list-height-180">栏目六</div>
        </div>
        <div class="right-sider">
            <div class="list-height-130">栏目七</div>
            <div class="list-height-130">栏目八</div>
            <div class="list-height-130">栏目九</div>
        </div>

    </div>



    <div class="footer">页脚</div>
</body>

</html>
```

​	

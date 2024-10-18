# jsonp原理及实现方法 

### 一、 同源策略

所有支持Javascript的浏览器都会使用同源策略这个安全策略。看看百度的解释：

```mipsasm
同源策略，它是由Netscape提出的一个著名的安全策略。
现在所有支持JavaScript 的浏览器都会使用这个策略。所谓同源是指，域名，协议，端口相同。
当一个浏览器的两个tab页中分别打开百度和谷歌的页面
当一个百度浏览器执行一个脚本的时候会检查这个脚本是属于哪个页面的
即检查是否同源，只有和百度同源的脚本才会被执行。
```

而解决这种同源策略的方法称之为**跨域**
跨域的方法有很多种,这里介绍一下最经典的jsonp跨域

### 二、JSON和JSONP

JSONP和JSON好像啊，他们之间有什么联系吗？

JSON(JavaScript Object Notation) 是一种轻量级的数据交换格式。对于JSON大家应该是很了解了吧，不是很清楚的朋友可以去[json.org](http://www.json.org/json-zh.html)上了解下，简单易懂。

**JSONP是JSON with Padding的略称。它是一个非官方的协议，它允许在服务器端集成Script tags返回至客户端，通过javascript callback的形式实现跨域访问（这仅仅是JSONP简单的实现形式）。**--来源百度

　　JSONP就像是JSON+Padding一样(Padding这里我们理解为填充)， 我们先看下面的小例子然后再详细介绍。
　　

### 三、跨域的简单原理

光看定义还不是很明白，那首先我们先来手动做个简单易懂的小测试。新建一个asp.net的web程序，添加**sample.html**网页和一个**test.js**文件，代码如下：

sample.html的代码：

```xml
//sample.html
<!DOCTYPE>
<html>
<head>
    <title>test</title>
    <script type="text/javascript" src="test.js"></script>
</head>
<body>
</body>
</html>
```

test.js的代码：

```scss
//test.js

alert("success");
```

打开sample.html后会跳出"success”这样的这样的信息框，这似乎并不能说明什么， 跨域问题到底怎么解决呢？

好，现在我们模拟下**非同源的环境**，刚才我们不是已经用Visual Studio新建了一个Web程序吗(这里我们叫A程序)，现在我们再打开一个新的Visual Studio再新建一个Web程序(B程序)，将我们的之前的test.js文件从A程序中移除然后拷贝到B程序中。

两个程序都运行起来后，Visual Studio会启动内置服务器，假设A程序是localhost:20001,B程序是localhost:20002，这就模拟了一个非同源的环境了(虽然域名相同但端口号不同，所以是非同源的)。

OK，我们接下来应该改下sample.html里的代码，因为test.js文件在B程序上了，url也就变成了localhost:20002。

sample.html部分代码:

```xml
<script type="text/javascript" src="http://localhost:20002/test.js"></script>
```

请保持AB两个Web程序的运行状态，当你再次刷新localhost:20001/sample.html的时候，和原来一样跳出了"success"的对话框.

是的，成功访问到了**非同源的localhost:20002/test.js**这个所谓的远程服务了。到了这一步，相信大家应该已经大概明白如何跨域访问了的原理了。

　　<script>标签的src属性并不被同源策略所约束，所以可以获取任何服务器上脚本并执行。

### 四、JSONP的实现模式--CallBack

刚才的小例子讲解了跨域的原理，我们回上去再看看JSONP的定义说明中讲到了`javascript callback`的形式。那我们就来修改下代码，如何实现JSONP的javascript callback的形式。

程序A中sample的部分代码：

```xml
<script type="text/javascript">
//回调函数
function callback(data) {
    alert(data.message);
}
</script>
<script type="text/javascript" src="http://localhost:20002/test.js"></script>
```

程序B中test.js的代码：

```scss
//调用callback函数，并以json数据形式作为阐述传递，完成回调

callback({message:"success"});
```

这其实就是JSONP的简单实现模式，或者说是JSONP的原型：**创建一个回调函数，然后在远程服务上调用这个函数并且将JSON 数据形式作为参数传递，完成回调。**

**将JSON数据填充进回调函数**，这就是JSONP的JSON+Padding的含义吧。

一般情况下，我们希望这个script标签能够动态的调用，而不是像上面因为固定在html里面所以没等页面显示就执行了，很不灵活。我们可以通过javascript动态的创建script标签，这样我们就可以灵活调用远程服务了。

程序A中sample的部分代码：

```xml
<script type="text/javascript">
   function callback(data) {
       alert(data.message);
   }
   //添加<script>标签的方法
   function addScriptTag(src){
   var script = document.createElement('script');
       script.setAttribute("type","text/javascript");
       script.src = src;
       document.body.appendChild(script);
   }
   
   window.onload = function(){
       addScriptTag("http://localhost:20002/test.js");
   }
</script>
```

程序B的test.js代码不变，我们再执行下程序，是不是和原来的一样呢。

如果我们再想调用一个远程服务的话，只要添加`addScriptTag`方法，传入远程服务的src值就可以了。

这里说明下为什么要将addScriptTag方法放入到`window.onload`的方法里，原因是addScriptTag方法中有句`document.body.appendChild(script);`，这个script标签是被添加到body里的，由于我们写的javascript代码是在head标签中，document.body还没有初始化完毕呢，所以我们要通过window.onload方法先初始化页面，这样才不会出错。

上面的例子是最简单的JSONP的实现模型


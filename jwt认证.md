# Jwt认证

```javascript
// 导入 express 模块
const express = require("express");
// 创建 express 的服务器实例
const app = express();

// TODO_01：安装并导入 JWT 相关的两个包，分别是 jsonwebtoken 和 express-jwt
const jwt = require("jsonwebtoken");
const  {expressjwt}  = require("express-jwt");

// 允许跨域资源共享
const cors = require("cors");
app.use(cors());

// 解析 post 表单数据的中间件
const bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({ extended: false }));

// TODO_02：定义 secret 密钥，建议将密钥命名为 secretKey
const secretKey = "Hello";


// TODO_04：注册将 JWT 字符串解析还原成 JSON 对象的中间件
// 注意：只要配置成功了 express-jwt 这个中间件，就可以把解析出来的用户信息，挂载到 req.user 属性上
app.use(
  expressjwt({ secret: secretKey, algorithms: ["HS256"] }).unless({
    path: [/^\/api\//],
  })
);



// 登录接口
app.post("/api/login", function (req, res) {
  // 将 req.body 请求体中的数据，转存为 userinfo 常量
  const userinfo = req.body;
  console.log(req.body.username, userinfo.password);
  // 登录失败
//   if (userinfo.username !== "admin" || userinfo.password !== "000000") {
//     return res.send({
//       status: 400,
//       message: "登录失败！",
//     });
//   }
  // 登录成功
  // TODO_03：在登录成功之后，调用 jwt.sign() 方法生成 JWT 字符串。并通过 token 属性发送给客户端
  // 参数1：用户的信息对象
  // 参数2：加密的秘钥
  // 参数3：配置对象，可以配置当前 token 的有效期
  // 记住：千万不要把密码加密到 token 字符中
  const tokenStr = jwt.sign({ username: userinfo.username }, secretKey, {
    expiresIn: "3000s",
    algorithm: "HS256", // 指定算法为 HS256，这是默认算法，可根据需要修改
  });
  
  res.send({
    status: 200,
    message: "登录成功！",
    token: tokenStr, // 要发送给客户端的 token 字符串
  });
});

// 这是一个有权限的 API 接口
app.get("/admin/getinfo", function (req, res) {
  // TODO_05：使用 req.user 获取用户信息，并使用 data 属性将用户信息发送给客户端
  console.log(req.user);
  res.send({
    status: 200,
    message: "获取用户信息成功！",
    data: req.auth, // 要发送给客户端的用户信息
  });
});



// 调用 app.listen 方法，指定端口号并启动web服务器
app.listen(3000, function () {
  console.log("Express server running at http://127.0.0.1:3000");
});


```


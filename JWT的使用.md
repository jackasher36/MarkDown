# JWT的使用

```js
const { log } = require("console");
const jwt = require("jsonwebtoken")

const obj = {
    name: "Boss",
    age: "22"
}

const str = jwt.sign(obj,"Hello")

console.log(str);

const decodeData = jwt.verify(str,"Hello")
console.log(decodeData);
```

token一般通过请求头发送,可以通过localstorge存储在浏览器

```js
const token = localStorage.getItem("token")
```


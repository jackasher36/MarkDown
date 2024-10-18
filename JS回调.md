# JS回调

```js
function sum(a,b,cb){
    const nowTime = Date.now()

    setTimeout(() => {
        cb(a + b)
    },3000)
}

console.log("1111111111");

const sumResult = sum(123,456,(result) => {
    console.log(result);
})

console.log("2222222222");
```

**本质JS回调是把函数作为参数,在异步内容中调用函数**

## 回调地狱就是依赖回调的结果不断在内部嵌套

**回调函数本身就是结果本身**
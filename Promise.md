# Promise

## Promise的存在意义

就是来解决回掉地狱的问题,通过Resolve()来存取数据,then会在Promise状态为fullfill的时候执行,异步取数据的关键在什么时候取,直接取可能还没有数据

## 用promise解决回掉地狱

```js
function sum(a,b){
    return new Promise((resolve,reject) => {
        setTimeout(() => {
            resolve(a + b)
        })
    })
}

const result = sum(123,456)

const promise = result
.then((result) => {
    return result += 7
})
.then((result) => {
    return result += 8
})

setTimeout(() => {
    console.log(promise);    
},3000)
```


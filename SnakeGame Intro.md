# SnakeGame Intro

这是一个用javascript写的贪吃蛇游戏,可以直接在浏览器上运行,也可以在nodejs环境下运行,介绍核心代码

### 改变的x,y的变量,并未直接改变蛇的坐标

```js
function changeFood() {
            const x = (Math.floor(Math.random() * 30)) * 10
            const y = (Math.floor(Math.random() * 30)) * 10
            console.log(x, y);
            food.style.left = x + 'px'
            food.style.right = y + 'px'
        }
```

### 

### 接受方向键前判断,这个方向键和当前蛇的方向是否相同

```js
 document.addEventListener('keydown', (event) => {
            //如果按键与方向相同才会继续接受
            if (reObj[dir] !== event.key && keyActive) {
                dir = event.key
                keyActive = false
            }

        })
```



## 这是最核心的蛇移动代码

### 将蛇尾部挪到头部,改变蛇尾成蛇头

```js
 const tail = snakes[snakes.length - 1]
            tail.style.left = x + "px"
            tail.style.top = y + "px"

						//在div元素的开始第一个插入tail元素
            snake.insertAdjacentElement("afterbegin", tail)
```



### 这个地方的KeyActive是为了阻止同时按下两个键,下一次循环开始又会把KeyActive设为true

```js
document.addEventListener('keydown', (event) => {
            //如果按键与方向相同才会继续接受
            if (reObj[dir] !== event.key && keyActive) {
                dir = event.key
                keyActive = false
            }

        })
```


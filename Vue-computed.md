# Vue-computed

这是Vue的计算属性,与Method的区别在于,计算属性的get方法只会调用一次,提高效率,

```js
 const myVue = new Vue({

            data: {
                name: "jack",
                age: 22,
                lead: {
                    name: '高启强',
                    age: 41
                },
                info: ""
            },
            methods: {
                reverseInfo() {
                    console.log("method被调用");
                    return this.info.split('').reverse().join('')
                   
                }
            },

            computed: {
              //这是一个计算属性,使用属性时自动调用get方法
                reverseInfo2: {
                    get(){
                        console.log("computed被调用");
                        return this.info.split('').reverse().join('')
                        
                    },
                
                }
            }

        })
        myVue.$mount('#app')
```

这是一个代理机制,让我们再回顾一下代理机制,

```js
Object.defineProperty(proxy,'name',{
  get: funtion(){
		
	},
  set: function(val){
  	
	}
})
```

该例子是将`name`属性添加到proxy对象中,访问proxy对象,实则会调用`get`方法,是不是有异曲同工之妙,同时还有一种简写方式

```js
computed: {
  reserveInfo2(){
  	return this.info.split('').reverse().join('')
	}
}
	
```

但是记住,计算属性时属性,不是方法,这只是一种 简写机制
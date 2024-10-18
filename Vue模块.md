# Vue模块

+ 父子间通信,可以通过props将回调函数传给子组件,通过参数获取子组件的数据
+ 也可以通过绑定自定义实现,为子组件绑定事件方法,通过$emit调用,同样也是通过参数获取数据
+ ```js
  handleEdit(todo){
     
        this.$set(todo,'isEdit',true)
        console.log(todo);
      }
  //添加受vue管理的属性
  ```





```js
  handleDelete(id){
      if(confirm("Sure to delete ?")) {
        this.$bus.$emit('deleteTodo',id)
      }
    },
      //在bus数据总线调用事件
```



```js
mounted(){
    this.$bus.$on('checkTodo',this.checkTodo)
    this.$bus.$on('deleteTodo',this.deleteTodo)
    pubsub.subscribe('hello',function(name,data){
      console.log("hello emit by someone! data is ",name, data);
    })
  }

//给bus总线绑定事件

```


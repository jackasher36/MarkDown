# 鸿蒙开发QuickStart

基础的一个登入注册页面,比HTML好太多,已经配好了样式,其实手机系统已经决定了,软件的美观

```typescript

@Entry
@Component
struct Index {
  @State message: string = 'Huawei..';

  build() {
    Column({space: 15}) {

      Image("http://jackasher.com/img/jack.png")
        .width(100)
      TextInput({
        placeholder: "请输入用户名"
      })

      TextInput({
        placeholder: "密码"
      }).type(InputType.Password)

      Button("登入")
        .width(200)

      Row({space: 15}){
        Text("注册")
        Text("忘记密码")
      }



    }
    .padding(30)
  }
}
```


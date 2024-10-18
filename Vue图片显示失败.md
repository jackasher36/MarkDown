# Vue图片显示失败

首先要知道该问题,首先要知道显示图片的位置在哪里,以及怎样实现上传图片的, 下面这段负责展现列表页面

![image-20240725001733485](https://p.ipic.vip/uxilg3.png)

可以看到图片信息依赖于``scope``,但是并看不出什么东西,也不知道scope是什么

![image-20240725002435574](https://p.ipic.vip/tjfgso.png)



接着查看上传模块,打开修改用户的模块查看,发现这里是上传图片,上传地址是/user/img上传图片后,上传成功后才能执行执行``handleUpdateAvatarSuccess``和``saveUser``函数,

![image-20240725002735560](https://p.ipic.vip/jdlq4e.png)

在后端查看/user/img的处理逻辑,其实就是把文件保存在电脑后又返回文件地址

![image-20240725003721376](https://p.ipic.vip/1z1yt8.png)

接着进入到``handlerAvatarSucess``函数查看,其实就是把前面后端的返回值赋给res,也就是文件路径,

this是当前对象,也就是调用该函数的组件vc,为vc的属性赋值

![](https://p.ipic.vip/yelcql.png)

进入到``saveUser``查看

![image-20240725002842490](https://p.ipic.vip/1ushqi.png)

发现添加信息时的信息向/user/add发送,继续来看后端如何处理该请求

![image-20240725002955202](https://p.ipic.vip/rftoke.png)



可以看到调用了addUser方法,此时这个User对象会被放入数据库,包括刚才的url地址,以上大致就是上传图片的逻辑,



## **接着来到最重要的展示图片的方法**,向服务器发/user/page的请求获取页面

![image-20240725004634192](https://p.ipic.vip/hrv15b.png)

而这是响应回来的数据

![image-20240725004818581](https://p.ipic.vip/izyllr.png)

然后我们看看后端如何处理/user/page的请求

![image-20240725004928694](https://p.ipic.vip/us8qbf.png)

注意到这个row了吗?正是前面展示image的scope.row,由此得知,这个row里面的数据一定就是关键

![image-20240725005015802](https://p.ipic.vip/6w3882.png)

我们回到前端查看,是如何接受这个row的,是通过userlist来接受

![image-20240725005147259](https://p.ipic.vip/thfj9t.png)

### 然后通过输出userlist,终于发现了问题所在,这个userlist是用户数组,但唯独少了图片url的信息

```json
userlist:{"total":33,"rows":[{"address":"3345","age":21,"createBy":"admin","createTime":"2024-07-15T15:15:35","id":1,"password":"123456","sex":"男","username":"admin"},{"address":"34","age":22,"createBy":"杜","createTime":"2024-07-21T09:16:04","id":2,"password":"234567","sex":"男","username":"李建林"},{"address":"345","age":22,"createBy":"杜","createTime":"2024-07-21T09:16:36","id":3,"password":"345678","sex":"男","username":"李皓宇"},{"address":"345","age":22,"createBy":"杜","createTime":"2024-07-21T09:17:01","id":4,"password":"456789","sex":"男","username":"吴扬"},{"address":"345","age":22,"createBy":"杜","createTime":"2024-07-21T09:17:20","id":5,"password":"567890","sex":"男","username":"吴震"}]}
```



可以正常查询到数据库的信息但是没有返回URL字段,一定是查询数据库环节有问题,前面提到后端通过``pageUser.getRecords()``似乎就获取到了数据库信息,并封装在了row里面,**怎么怎么做到的 ?怎么查询的 ?sql语句是什么 ?**

![image-20240725005821654](https://p.ipic.vip/3knixt.png)



经过摸索,``pageUser.getRecords()``是mybatis-plus的插件方法,而mybatis可以自动为你生成sql语句,也就是``select * from user`` ,这也意味着所有的mapper.xml都不用看了,mybatis不会使用这些语句,可是为什么``select * from user`` 唯独没有返回img_url字段? 理应获取所有字段呀?

有没有思考过,通过mybatis框架返回的数据,都会使用类来接受,这也是配置type属性的原因

![image-20240725010532042](https://p.ipic.vip/fq8upo.png)



那这个类如何才能接受到mybatis返回的数据 ?,有两种,通过set方法或者构造器

+ user.setName("name")
+ new user("name")

可是数据库的字段名是``img_url``,mybatis怎么会知道你的set方法名字是什么?如何通过set方法为user类赋值 ?只能够靠默认规则,即将_去掉,第二个字母大写,即setImgUrl,可是User里面的字段是img_url

![image-20240725012643565](https://p.ipic.vip/0pztbs.png)

 对应的set方法是setImg_url,而mybatis试图调用setImgUrl,所以无法将图片地址赋值给user类,因此查出来的图片地址就为null,

![image-20240725012719253](https://p.ipic.vip/fhacmq.png)



最后只要把字段名改成imgUrl就解决问题
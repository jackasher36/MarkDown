# SpringBoot仓库管理项目

## 关于Mybatis的使用

在``mybatis``中对代理的理解,``NameSpace``要指明到具体的mapper接口,这应该也是最容易犯错的

![image-20240913153715607](https://p.ipic.vip/cash35.png)

在``SpringBoot``项目中,不再需要创建``Sqlsession``等的类,让人很迷惑,只需要一个接口,然后告诉``Spring``接口在哪里,``Spring``就会自动生成代理类,Mapper生成的类,直接就是代理类

我猜测,在调用**userMapper**时,Spring的``PostProcesser``会生成代理方法,完成对接口的实现

![image-20240913154623877](https://p.ipic.vip/xhnimt.png)

## JWT Token的使用

Token分为生成和解码,生成时需要密匙,提供算法,在包装类使用



## Http封装Servlet

封装以后会多方法,例如我想获取请求路径,原生Servlet没有这个方法,

![image-20240913215554541](https://p.ipic.vip/d8ku1n.png)

## 关于Filter的注册

在本项目中,Filter是通过继承原生Filter后,将该Filter注册在Spring中实现的

![image-20240913220033866](https://p.ipic.vip/g77ndz.png)

## sql Limit使用

limit通常是限制返回条数,也有limit 5 offset 10用法,在MySQL中,则是反着来的

![image-20240914202955107](https://p.ipic.vip/fypojd.png)

## 分类数的实现

### 首先在数据库我们建立表时,指定自己的id和父id

![image-20240916144344965](https://p.ipic.vip/s59z4o.png)

然后我们可以首先获取父id为0的全部元素,然后将该元素集合再次遍历,获取它的子元素并赋值给自己,这是一种递归的使用方法

![image-20240916145041269](https://p.ipic.vip/fdy38v.png)

## 关于浏览器的跨域问题

刚刚我在上传图片时发现跨域错误,可是由于没有配置过滤器,压根就没有进入`` Controller``层,为什么还是会报跨域错误

![image-20240916154213064](https://p.ipic.vip/dreo2d.png)

于是我们知道了,在浏览器发送跨域请求之前,会先发送option请求,判断是否运行跨域,如果没有收到正确响应就会出现跨域问题,Spring提供的跨域方案请求里有@CrossOrigin注解,该注解可以自动生成对应的响应,浏览器接受运行跨域的响应

![image-20240916154418797](https://p.ipic.vip/vntckd.png)

## Mybatis的代理

我们发现mapper有的加了param参数,有些没有,而xml中,有些直接使用属性名,有些需要加对象名,用param1,param2,本质是如果是直接的属性名,就会使用get方法



![image-20240918170955199](https://p.ipic.vip/uglqdl.png)		

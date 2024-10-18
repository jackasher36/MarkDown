# Vue的数据代理

Vue中的data属性会被放在_data里面,通过一个observer(data)传入data后,封装到__data里面,同时改变data自己与_data相同,vm的外部属性,是从_data里面代理得到的,监测数据是由getter实现的,数组的数据是不可以被检测的,需要由数组方法更改

+ Vue会监视data所有层级数据
  + setter监视,通过Vue.set( )追加属性,但是不可以给vm的根属性添加
+ 数组监测是靠包裹后的Push Pop等方法,与Array的Prototype不一样
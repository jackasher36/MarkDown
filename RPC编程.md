# RPC编程

# 单体架构

其实我做的325论坛就是一个单体架构,而且是前后端不分离的模版,在后台渲染数据后展现视图,所有板块打成一个jar包,在单体架构的扩展就是水平 架构,我们可以打成三个jar包,在不同的服务器运行,但是公用一个数据库

## 垂直架构

垂直架构就是将不同的子系统放在不同的进程中,相互独立,可以通过http调用进入另一个模块,缺点是无法复用模块,相关的数据库操作,监控,日志等代码都需要重新写

## RPC

所有有了rpc的出现,通过网络通信可以实现一个进程对另一个进程的某个类,方法调用
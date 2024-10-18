# SpringAMQP

基于``Spring``实现的MQ消息队列发送与接受,首先要配置``MQ``的信息,端口,用户,密码,主机,和虚拟``Host``,

```yaml
spring:
  rabbitmq:
    host: 127.0.0.1
    port: 5672
    username: itcast
    password: 123321
    virtual-host: /
```

接下来是生产者,很简单,主要是``rabbitTemplate``类,使用``convertSend``方法传入交换机的名字和``key``,以及消息

```java
    public void fountSend2(){
        String exchangeName = "itcast_direct";
        String msg = "Hello everyone!!!";
        rabbitTemplate.convertAndSend(exchangeName,"red",msg);
    }
```

那么这个交换机哪里来的,一种是``Spring``的``Bean``的配置,二是采用注解,首先是``Bean``的配置

```java
   //创建队列 
   @Bean
    public FanoutExchange fanoutExchange(){
        return new FanoutExchange("itcast.fanout");
    }

    @Bean
    public Queue queue1(){
        return new Queue("fanout.queue1");
    }
    //交换机绑定队列,自动注入队列
    @Bean
    public Binding fanoutBinding1(Queue queue1, FanoutExchange fanoutExchange){
        return BindingBuilder.bind(queue1).to(fanoutExchange);
    }
```

接下来是注解形式

```java
 @RabbitListener(bindings = @QueueBinding(
                 //创建队列
                 value = @Queue("direct_queue1"),
                 //创建并绑定交换机和key
                 exchange = @Exchange(name = "itcast_direct", 
                                      type = ExchangeTypes.DIRECT),
                                      key = {"red","blue"}
    ))
    public void listenSimpleQueue5(String msg) throws InterruptedException {
        System.out.println("consumer5 has received:" +  msg + LocalDateTime.now());

    }
```


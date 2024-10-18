# JVM理解

我们常说的栈呀,堆呀,方法区,其实就是java运行时,划分的几块物理空间来存储数据, 每个区域存储的数据不一样,比如栈存的进程,在进程里面存储方法,及其方法变量, 堆里面存对象,方法区里面存类信息



### 栈存的是方法, 基本数据类型和引用

+ 栈内存中存储局部变量和方法调用信息，包括对象的引用（指针）以及原始类型的数据（如 int、char 等）

------



#### 而堆存储的是实例对象,像是数组,集合等

+ Java 使用堆（Heap）来存储动态分配的对象。堆是一块较大的内存区域，用于存储所有对象实例和数组。

+ 当使用 new 关键字创建对象时，这个对象被分配到堆上，并由垃圾收集器管理其生命周期。
+ 对象在堆中存活的时间取决于它们的引用是否还存在。堆中的对象不一定会马上被销毁，只有当没有任何引用指向该对象时，垃圾收集器（Garbage Collector）才会标记并清除它。

------



字符串对象有特殊的存储机制。使用字面量创建的字符串，例如：

```java
String str = "Hello";
```

<u>这个字符串 "Hello" 会存储在**字符串常量池**中，而不是直接在堆中。</u>

+ 常量池存储在堆的特殊区域中，它可以避免创建重复的字符串对象。如果你使用相同的字符串字面量创建多个 String 对象，JVM 会复用常量池中的字符串对象。

------



### 方法区存储的是类的元数据

在 **Java SE 8 之前**，方法区通常被称为**永久代（Permanent Generation）**,而从 **Java SE 8 开始**，永久代被移除，方法区的实现被称为**元空间（Metaspace）**所以我们可以知道,方法区一定存储的是永久性的信息,

1. **例如类的元信息,**

+ **类的结构信息**：包括类名、父类名、接口实现信息、类的修饰符（如 public、abstract 等）。
+ **方法信息**：类中定义的方法名、修饰符、参数类型、返回值类型等。
+ **字段信息**：类中定义的所有字段的名称、类型和修饰符。

------



2. **运行时常量池（Runtime Constant Pool）**

+ *常量池**存储的是编译期间生成的一些常量和符号引用，主要包括：
+ 字符串常量
+ 基本数据类型的常量
+ 方法和字段的符号引用（方法名、字段名、类名等）
+ 字符串字面量

------



3. **方法的字节码（Bytecode）**

+ 方法区还保存类的每个方法的字节码。JVM 在执行方法时，先从方法区中获取该方法的字节码，然后将其解释执行或即时编译为机器码。

------



4. **静态变量**

+ 静态变量是类级别的变量，所有该类的实例共享这些变量。静态变量在类加载时被分配存储空间，存在于方法区。

------



5. **类的加载信息**

+ 包括类加载器的信息，类是由哪个类加载器加载的（比如系统类加载器、扩展类加载器等）。

------



6. **编译后的代码（JIT 编译后的本地代码）**

+ 当 JVM 对某些热点方法进行**即时编译（Just-In-Time compilation, JIT）**时，编译后的本地机器码也可能会存储在方法区中。JIT 编译器会将这些频繁调用的方法转换为机器代码，以加快执行速度。



### JVM的全景

![image-20240926012505921](https://p.ipic.vip/wzx7nf.png)

## 程序计数器

程序计数器,就是指令寄存机,用于存取下一条指令的地址, 

## 栈

一个线程对应一个栈,一个方法对应一个栈帧, 默认的栈大小是1024kB, -Xss设置栈大小, 

![image-20240925232042309](https://p.ipic.vip/rt5hhc.png)

垃圾回收不负责栈的回收,栈在方法的执行和消失自动出栈入栈, 如果我们的电脑有500MB,分配的栈是1MB,那么可以生成500个栈, 内存太大,导致栈数量减少,线程数减少, 但是可以增加递归的调用, 局部变量是线程安全的,但是作为方法的参数和返回值时,是不安全的, 

## 栈内存溢出

### **原因**

+ 栈帧过多
+ 栈帧过大

我们来看着这段代码,栈在45429的时候溢出, 

![image-20240925234250901](/Users/leojackasher/Library/Application Support/typora-user-images/image-20240925234250901.png)

当我们把栈设置为256k时,栈帧数量就被减少到**2198**

## 线程诊断

学到一个很有意思的东西, top是用来查看进程的, 而ps是查看线程的

![image-20240926000524565](https://p.ipic.vip/ctobtk.png)

1. **PID** 的全称是 Process ID，它是操作系统分配给每个运行中的进程的唯一标识符。
2. **TID** 的全称是 Thread ID，它是操作系统分配给每个运行中的线程的唯一标识符。在某些系统中，`ps` 命令可能使用 `tid` 来表示线程组ID（Thread Group ID），这与线程ID是不同的概念。
3. **`-eo`** 的全称是 `--output-format`，这是一个GNU `ps`命令的选项，允许你指定输出格式。在使用`-eo`选项时，你可以自定义输出的列，例如`pid,tid,%mem,%cpu`。

![image-20240926000753928](https://p.ipic.vip/j72exk.png)

#### 可以看到我的Hexo博客,开了这么多线程

![image-20240926001032628](https://p.ipic.vip/tnv4ze.png)

#### 可以使用jstack查看java进程的线程,可以看到有271个线程

```sh
2024-09-26 00:18:56
Full thread dump Java HotSpot(TM) 64-Bit Server VM (21.0.1+12-LTS-29 mixed mode, sharing):

Threads class SMR info:
_java_thread_list=0x0000600003bcae00, length=271, elements={
0x000000015903d000, 0x0000000159042600, 0x000000015903f800, 0x0000000159040000,
0x0000000159040800, 0x0000000159902e00, 0x0000000159903600, 0x0000000149010c00,
0x0000000149011400, 0x00000001599bd400, 0x00000001593c1e00, 0x0000000159a07400,
0x000000015998aa00, 0x00000001593a8a00, 0x00000001495adc00, 0x0000000159bd6200,
0x000000012b008200, 0x0000000159236400, 0x0000000129808200, 0x00000001495bda00,
0x00000001495be200, 0x0000000149387600, 0x0000000149387e00, 0x00000001493fb800,
0x00000001493fc000, 0x0000000149090800, 0x00000001496a5600, 0x00000001497a0200,
0x000000014978f200, 0x00000001496c0a00, 0x00000001290adc00, 0x000000014973fc00,
0x00000001293a2400, 0x00000001293a2c00, 0x0000000149772a00, 0x00000001293a3400,
0x000000015913f400, 0x0000000159367600, 0x0000000159486c00, 0x00000001593da600,
0x00000001592a3400, 0x0000000149386a00, 0x0000000149369800, 0x0000000149694c00,
0x00000001493e8400, 0x0000000149573000, 0x0000000159c1b200, 0x0000000159bb1e00,
0x0000000159c7c800, 0x0000000159047200, 0x000000014942aa00, 0x00000001596d0c00,
0x00000001293ca800, 0x0000000159f95400, 0x00000001596e2400, 0x0000000159e6e600,
0x000000012a809a00, 0x0000000159212800, 0x0000000159e57400, 0x0000000124cd5e00,
0x0000000124ca3200, 0x0000000124ca3a00, 0x0000000159213000, 0x00000001592bb400,
0x00000001594e5200, 0x00000001597ff600, 0x00000001493fa200, 0x00000001491af400,
0x00000001492bec00, 0x00000001492bf400, 0x0000000159665200, 0x000000014935f200,
0x0000000159904a00, 0x0000000159969e00, 0x0000000159905200, 0x00000001592baa00,
0x00000001599b7800, 0x0000000159f5f200, 0x000000011d912e00, 0x0000000159b54a00,
0x00000001493bd800, 0x000000012922b600, 0x00000001493a2a00, 0x00000001596aa200,
0x00000001594dea00, 0x00000001491aec00, 0x00000001495e6200, 0x00000001591d1600,
0x00000001496a6600, 0x0000000159de3c00, 0x0000000159de7a00, 0x000000015966f800,
0x00000001493c8e00, 0x0000000129279200, 0x0000000159f12a00, 0x000000014932f200,
0x00000001492bb400, 0x00000001493bce00, 0x000000015936be00, 0x000000012935e800,
0x0000000124d60a00, 0x0000000124df5e00, 0x0000000159239a00, 0x0000000124da8c00,
0x0000000124da9400, 0x000000011d912600, 0x000000012935e000, 0x000000012910c600,
0x00000001590a9a00, 0x000000012a00e800, 0x00000001593c1200, 0x0000000159f94400,
0x0000000159352e00, 0x0000000159353600, 0x000000015938d600, 0x000000014962a400,
0x000000015938de00, 0x0000000124045e00, 0x0000000159234800, 0x000000011d9a1600,
0x0000000159fb7e00, 0x0000000159fbda00, 0x00000001591be400, 0x0000000159f9dc00,
0x0000000159730600, 0x000000011d998200, 0x0000000159779400, 0x00000001294c4800,
0x000000011d9c3800, 0x0000000129342c00, 0x0000000159748800, 0x000000015977a400,
0x0000000159779c00, 0x000000011da19200, 0x00000001597ae000, 0x0000000124cea800,
0x00000001597ae800, 0x0000000159797000, 0x000000011d9c9600, 0x0000000124d26e00,
0x0000000129812c00, 0x00000001597ccc00, 0x0000000159718c00, 0x00000001597cd400,
0x000000012948f000, 0x00000001597a3000, 0x000000015959be00, 0x00000001595c1800,
0x00000001595c2000, 0x00000001595ac200, 0x000000011d884400, 0x0000000124810e00,
0x0000000124c34000, 0x0000000159704600, 0x000000011d878600, 0x000000011d881c00,
0x00000001494ba400, 0x00000001494bac00, 0x0000000149706c00, 0x000000012b00e600,
0x00000001595eba00, 0x00000001595aca00, 0x0000000159fff400, 0x0000000124cc7400,
0x00000001596f1e00, 0x000000012a808200, 0x00000001596f2600, 0x00000001596f2e00,
0x0000000159717400, 0x0000000159717c00, 0x0000000159718400, 0x000000015971ba00,
0x000000012927c800, 0x0000000129523a00, 0x000000012934b600, 0x0000000159e88a00,
0x0000000124866a00, 0x0000000159b95200, 0x00000001240c6e00, 0x0000000159b95a00,
0x0000000124126200, 0x00000001242f3e00, 0x0000000159e4fa00, 0x0000000159e50200,
0x0000000159e50a00, 0x00000001243c0200, 0x00000001243c2a00, 0x0000000159b94600,
0x00000001243c3c00, 0x000000011d818200, 0x000000012a80ba00, 0x000000012b00de00,
0x000000012a00ce00, 0x000000012b009a00, 0x0000000159b5c600, 0x000000011d840800,
0x000000012a025a00, 0x00000001243e0600, 0x00000001243dea00, 0x00000001243c4400,
0x000000012a029a00, 0x0000000159e51a00, 0x000000012982b200, 0x0000000129821800,
0x000000012b033600, 0x000000012b036e00, 0x000000012b082000, 0x000000012b082800,
0x000000012a835c00, 0x000000012a028800, 0x000000012a06bc00, 0x000000012b083000,
0x000000012a836400, 0x000000012a83a600, 0x000000012a836c00, 0x0000000129817c00,
0x0000000124205a00, 0x0000000124207a00, 0x000000011dcd2200, 0x0000000124208200,
0x000000011dbfd200, 0x000000011dcd2a00, 0x0000000124c06200, 0x0000000129419c00,
0x0000000124cc6800, 0x0000000124cf4c00, 0x0000000124d4b000, 0x000000012a837400,
0x000000012b02e800, 0x000000012981f400, 0x0000000129819400, 0x000000012a04c400,
0x000000012b02f600, 0x000000012b032400, 0x000000012b031200, 0x000000012a94fe00,
0x000000012a052c00, 0x000000012a8eb200, 0x000000012b025e00, 0x000000012b026600,
0x00000001298c7a00, 0x000000012a8e9000, 0x00000001298c8800, 0x000000012a857200,
0x000000012a054600, 0x0000000159baf200, 0x0000000159ebf800, 0x000000011dce3800,
0x000000012a0ce400, 0x0000000124052e00, 0x00000001290c1e00, 0x0000000124206200,
0x00000001292c5c00, 0x00000001294c8800, 0x000000012a260600, 0x0000000159b12e00,
0x000000012b2ed000, 0x000000012a0dde00, 0x00000001293a9800, 0x000000011d889e00,
0x0000000129936e00, 0x000000012923de00, 0x00000001290b8800, 0x00000001293d0200,
0x000000012a3d6e00, 0x000000012a3d7600, 0x000000012480e800, 0x0000000129821000,
0x00000001298e9800, 0x00000001496e5600, 0x00000001243c8a00
}

```

## 本地方法栈

#### Java有一本分代码不是java写的,而是c,这些使用的方法就是本地方法栈, 为naive方法,例如clone, notify, hashCode,

![image-20240926012429887](https://p.ipic.vip/3xxuar.png)

## 堆(Heap)

### 堆是对象的空间,是共享的,

![image-20240926013020253](https://p.ipic.vip/7s8noj.png)

例如设置内存、垃圾回收行为等。-X 后面接的选项属于 JVM 特定的功能，但可能并不在不同的 JVM 实现中通用。

例如：

​	•-Xmx：设置最大堆内存大小。

​	•-Xms：设置初始堆内存大小。

​	•-Xss：设置每个线程的栈大小。

2048mb只够27次添加

![image-20240926014005545](https://p.ipic.vip/auuq31.png)

### 查看堆内存

+ jps
+ jmap
+ jconsole

### jconsole也太厉害了

![image-20240926015401842](https://p.ipic.vip/ewbv1u.png)

#### 当使用`new Byte[1024 * 1024 * 10]`时,会创建10MB的堆空间, 除了jconsole以外,还有一个工具,jvisualvm,只不过在JDK8之后被移除了,需要单独下载,这个有个分析堆的功能,可以找到占用堆最大的类

![image-20240926144503022](https://p.ipic.vip/no8uy6.png)

## 方法区

#### 在JVM1.6时,方法区是在JVM里面, 但是1.8后,就把方法区放在了本地内存, 由元空间实现(**Metaspace**),使用`-XX:MaxMetaspaceSize=8m`设置方法区大小

![image-20240926145518118](https://p.ipic.vip/fttqj1.png)

### 二进制字节码包括了类的基本信息, 常量池,类方法定义,包含虚拟机指令,我们可以通过javap,反编译一个文件看看,可以看到有构造器和主方法

```java
leojackasher@LeoJackAshers-MacBook-Air example % javap  Main.class 
  
Compiled from "Main.java"
public class org.example.Main {
  public org.example.Main();
  public static void main(java.lang.String[]);
}
```

### 使用`javap -v`完整反编译后得到

```sh
leojackasher@LeoJackAshers-MacBook-Air example % javap -v Main.class
Classfile /Users/leojackasher/IdeaProjects/JVM/target/classes/org/example/Main.class
  Last modified 2024年9月25日; size 1153 bytes
  SHA-256 checksum 5a5c7458846ffeabb04f901273578e395e30cb8f3661afaa1ad552019fbdfcc6
  Compiled from "Main.java"
public class org.example.Main
  minor version: 0
  major version: 61
  flags: (0x0021) ACC_PUBLIC, ACC_SUPER
  this_class: #29                         // org/example/Main
  super_class: #2                         // java/lang/Object
  interfaces: 0, fields: 0, methods: 2, attributes: 3
Constant pool:
   #1 = Methodref          #2.#3          // java/lang/Object."<init>":()V
   #2 = Class              #4             // java/lang/Object
   #3 = NameAndType        #5:#6          // "<init>":()V
   #4 = Utf8               java/lang/Object
   #5 = Utf8               <init>
   #6 = Utf8               ()V
   #7 = Fieldref           #8.#9          // java/lang/System.out:Ljava/io/PrintStream;
   #8 = Class              #10            // java/lang/System
   #9 = NameAndType        #11:#12        // out:Ljava/io/PrintStream;
  #10 = Utf8               java/lang/System
  #11 = Utf8               out
  #12 = Utf8               Ljava/io/PrintStream;
  #13 = String             #14            // Hello and welcome!
  #14 = Utf8               Hello and welcome!
  #15 = Methodref          #16.#17        // java/io/PrintStream.printf:(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
  #16 = Class              #18            // java/io/PrintStream
  #17 = NameAndType        #19:#20        // printf:(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
  #18 = Utf8               java/io/PrintStream
  #19 = Utf8               printf
  #20 = Utf8               (Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
  #21 = InvokeDynamic      #0:#22         // #0:makeConcatWithConstants:(I)Ljava/lang/String;
  #22 = NameAndType        #23:#24        // makeConcatWithConstants:(I)Ljava/lang/String;
  #23 = Utf8               makeConcatWithConstants
  #24 = Utf8               (I)Ljava/lang/String;
  #25 = Methodref          #16.#26        // java/io/PrintStream.println:(Ljava/lang/String;)V
  #26 = NameAndType        #27:#28        // println:(Ljava/lang/String;)V
  #27 = Utf8               println
  #28 = Utf8               (Ljava/lang/String;)V
  #29 = Class              #30            // org/example/Main
  #30 = Utf8               org/example/Main
  #31 = Utf8               Code
  #32 = Utf8               LineNumberTable
  #33 = Utf8               LocalVariableTable
  #34 = Utf8               this
  #35 = Utf8               Lorg/example/Main;
  #36 = Utf8               main
  #37 = Utf8               ([Ljava/lang/String;)V
  #38 = Utf8               i
  #39 = Utf8               I
  #40 = Utf8               args
  #41 = Utf8               [Ljava/lang/String;
  #42 = Utf8               StackMapTable
  #43 = Utf8               SourceFile
  #44 = Utf8               Main.java
  #45 = Utf8               BootstrapMethods
  #46 = MethodHandle       6:#47          // REF_invokeStatic java/lang/invoke/StringConcatFactory.makeConcatWithConstants:(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite;
  #47 = Methodref          #48.#49        // java/lang/invoke/StringConcatFactory.makeConcatWithConstants:(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite;
  #48 = Class              #50            // java/lang/invoke/StringConcatFactory
  #49 = NameAndType        #23:#51        // makeConcatWithConstants:(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite;
  #50 = Utf8               java/lang/invoke/StringConcatFactory
  #51 = Utf8               (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite;
  #52 = String             #53            // i = \u0001
  #53 = Utf8               i = \u0001
  #54 = Utf8               InnerClasses
  #55 = Class              #56            // java/lang/invoke/MethodHandles$Lookup
  #56 = Utf8               java/lang/invoke/MethodHandles$Lookup
  #57 = Class              #58            // java/lang/invoke/MethodHandles
  #58 = Utf8               java/lang/invoke/MethodHandles
  #59 = Utf8               Lookup
{
  public org.example.Main();
    descriptor: ()V
    flags: (0x0001) ACC_PUBLIC
    Code:
      stack=1, locals=1, args_size=1
         0: aload_0
         1: invokespecial #1                  // Method java/lang/Object."<init>":()V
         4: return
      LineNumberTable:
        line 11: 0
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
            0       5     0  this   Lorg/example/Main;

  public static void main(java.lang.String[]);
    descriptor: ([Ljava/lang/String;)V
    flags: (0x0009) ACC_PUBLIC, ACC_STATIC
    Code:
      stack=3, locals=2, args_size=1
         0: getstatic     #7                  // Field java/lang/System.out:Ljava/io/PrintStream;
         3: ldc           #13                 // String Hello and welcome!
         5: iconst_0
         6: anewarray     #2                  // class java/lang/Object
         9: invokevirtual #15                 // Method java/io/PrintStream.printf:(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
        12: pop
        13: iconst_1
        14: istore_1
        15: iload_1
        16: iconst_5
        17: if_icmpgt     38
        20: getstatic     #7                  // Field java/lang/System.out:Ljava/io/PrintStream;
        23: iload_1
        24: invokedynamic #21,  0             // InvokeDynamic #0:makeConcatWithConstants:(I)Ljava/lang/String;
        29: invokevirtual #25                 // Method java/io/PrintStream.println:(Ljava/lang/String;)V
        32: iinc          1, 1
        35: goto          15
        38: return
      LineNumberTable:
        line 15: 0
        line 18: 13
        line 22: 20
        line 18: 32
        line 24: 38
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
           15      23     1     i   I
            0      39     0  args   [Ljava/lang/String;
      StackMapTable: number_of_entries = 2
        frame_type = 252 /* append */
          offset_delta = 15
          locals = [ int ]
        frame_type = 250 /* chop */
          offset_delta = 22
}
SourceFile: "Main.java"
BootstrapMethods:
  0: #46 REF_invokeStatic java/lang/invoke/StringConcatFactory.makeConcatWithConstants:(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite;
    Method arguments:
      #52 i = \u0001
InnerClasses:
  public static final #59= #55 of #57;    // Lookup=class java/lang/invoke/MethodHandles$Lookup of class java/lang/invoke/MethodHandles

```

#### 该部分为类的基本信息

```sh
Classfile /Users/leojackasher/IdeaProjects/JVM/target/classes/org/example/Main.class
  Last modified 2024年9月25日; size 1153 bytes
  SHA-256 checksum 5a5c7458846ffeabb04f901273578e395e30cb8f3661afaa1ad552019fbdfcc6
  Compiled from "Main.java"
public class org.example.Main
  minor version: 0
  major version: 61
  flags: (0x0021) ACC_PUBLIC, ACC_SUPER
  this_class: #29                         // org/example/Main
  super_class: #2                         // java/lang/Object
  interfaces: 0, fields: 0, methods: 2, attributes: 3
```

#### 然后是常量池

```sh
Constant pool:
   #1 = Methodref          #2.#3          // java/lang/Object."<init>":()V
   #2 = Class              #4             // java/lang/Object
   #3 = NameAndType        #5:#6          // "<init>":()V
   #4 = Utf8               java/lang/Object
   #5 = Utf8               <init>
   #6 = Utf8               ()V
   #7 = Fieldref           #8.#9          // java/lang/System.out:Ljava/io/PrintStream;
   #8 = Class              #10            // java/lang/System
   #9 = NameAndType        #11:#12        // out:Ljava/io/PrintStream;
  #10 = Utf8               java/lang/System
  #11 = Utf8               out
  #12 = Utf8               Ljava/io/PrintStream;
  #13 = String             #14            // Hello and welcome!
  #14 = Utf8               Hello and welcome!
  #15 = Methodref          #16.#17        // java/io/PrintStream.printf:
```

#### 最后是方法信息

```sh
{
  public org.example.Main();
    descriptor: ()V
    flags: (0x0001) ACC_PUBLIC
    Code:
      stack=1, locals=1, args_size=1
         0: aload_0
         1: invokespecial #1                  // Method java/lang/Object."<init>":()V
         4: return
      LineNumberTable:
        line 11: 0
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
            0       5     0  this   Lorg/example/Main;

  public static void main(java.lang.String[]);
    descriptor: ([Ljava/lang/String;)V
    flags: (0x0009) ACC_PUBLIC, ACC_STATIC
    Code:
      stack=3, locals=2, args_size=1
         0: getstatic     #7                  // Field java/lang/System.out:Ljava/io/PrintStream;
         3: ldc           #13                 // String Hello and welcome!
         5: iconst_0
         6: anewarray     #2                  // class java/lang/Object
         9: invokevirtual #15                 // Method java/io/PrintStream.printf:(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
        12: pop
        13: iconst_1
        14: istore_1
        15: iload_1
        16: iconst_5
        17: if_icmpgt     38
        20: getstatic     #7                  // Field java/lang/System.out:Ljava/io/PrintStream;
        23: iload_1
        24: invokedynamic #21,  0             // InvokeDynamic #0:makeConcatWithConstants:(I)Ljava/lang/String;
        29: invokevirtual #25                 // Method java/io/PrintStream.println:(Ljava/lang/String;)V
        32: iinc          1, 1
        35: goto          15
        38: return
      LineNumberTable:
        line 15: 0
        line 18: 13
        line 22: 20
        line 18: 32
        line 24: 38
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
           15      23     1     i   I
            0      39     0  args   [Ljava/lang/String;
      StackMapTable: number_of_entries = 2
        frame_type = 252 /* append */
          offset_delta = 15
          locals = [ int ]
        frame_type = 250 /* chop */
          offset_delta = 22
}
```

我们可以理解为,方法区和常量池都在.class文件里面, 常量池就是一张表,虚拟机通过指令找到这张表的类名,方法,常量等, 虚拟机运行时,常量池会被加载进运行常量池,虚拟地址,变成真实地址

## StringTable

这是JVM用来存放字符串常量的地方,这个时候还没有加载进java的字符串常量,可以通过-XX:StringtableSize来设置大小,该对象底层也是hashTable,当Size设置过小,会导致加大冲突,减少运行效率

.	**哈希计算**：

​	•	当插入一个键值对时，Hashtable 使用哈希函数计算键的哈希值，并将其映射到数组中的一个索引。

​	2.	**插入**：

​	•	如果该桶为空，直接将新的 Entry 放入。

​	•	如果该桶已经有一个或多个 Entry（即发生了哈希冲突），则在链表的末尾插入新的 Entry。

​	3.	**查找**：

​	•	通过哈希函数计算键的哈希值，找到对应的桶。如果桶中有多个 Entry，则遍历链表查找对应的键。

​	4.	**删除**：

​	•	找到对应的桶和链表中的 Entry，将其从链表中移除。

我们可以写一段代码来感受一下, 这个常量池的应用, 传说,推特原本是要存储用户地址,预计是30G, 但是使用了字符串常量池后, 减少到了300MB,真是巨大的进步啊, 我们可以大量读取文本文件来做实验

```java
package org.example;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Jackasher
 * @version 1.0
 * @className _StirngTable
 * @since 1.0
 **/
public class _StirngTable {
    public static void main(String[] args) throws IOException {
        List<String> address = new ArrayList<>();
        System.in.read();
        for (int i = 0; i < 1000000; i++) {

            try (BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream("/Users/leojackasher/jmeter.log")));) {

                String line = null;
                while (true) {
                    line = bufferedReader.readLine();
                    if (line == null) {
                        break;
                    }
                    address.add(line);
                }
            }


        }

    }
}

```



运行该项目,进行阻塞,查看String占的堆内存, 可以看到初始时只有800KB

![image-20240926192300848](https://p.ipic.vip/q2j059.png)

当我们开始运行程序,达到162MB,非常的大了

![image-20240926192700107](/Users/leojackasher/Desktop/Markdown/JVM理解.assets/image-20240926192700107.png)

而我们如果把数据放入常量池

```java
address.add(line.intern());
```

那么再来看看String内存占用是多少,一下子缩减到了12MB,这个进步可就大了

![image-20240926192903247](https://p.ipic.vip/gaylc1.png)

## 直接内存

直接内存就是,直接调用操作系统的内存,最好的例子就是, ByteBuffer, 这个直接内存被操作系统和java可以直接访问,所以读写速度就会更快,原本的读取,是需要从操作系统的缓冲器拷贝到java的缓冲区,,这样就会慢很多,不过直接内存是不受JVM回收管理的

![image-20240926194435251](https://p.ipic.vip/93k39s.png)

## 垃圾回收

### 如何判断对象可以回收


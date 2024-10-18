# String的一些事

首先我们看看这一段代码相等吗

```java
public class _String {
    public static void main(String[] args) {
        String s1 = "a";
        String s2 = "b";
        String s3 = "ab";
        String s4 = s1 + s2;
        System.out.println(s3 == s4);
    }
}
```

我们对其反编译看看字节码

```java
 public static void main(java.lang.String[]);
    descriptor: ([Ljava/lang/String;)V
    flags: (0x0009) ACC_PUBLIC, ACC_STATIC
    Code:
      stack=3, locals=5, args_size=1
         0: ldc           #7                  // String a
         2: astore_1
         3: ldc           #9                  // String b
         5: astore_2
         6: ldc           #11                 // String ab
         8: astore_3
         9: aload_1
        10: aload_2
        11: invokedynamic #13,  0             // InvokeDynamic #0:makeConcatWithConstants:(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
        16: astore        4
        18: getstatic     #17                 // Field java/lang/System.out:Ljava/io/PrintStream;
        21: aload_3
        22: aload         4
        24: if_acmpne     31
        27: iconst_1
        28: goto          32
        31: iconst_0
        32: invokevirtual #23                 // Method java/io/PrintStream.println:(Z)V
        35: return
      LineNumberTable:
        line 11: 0
        line 12: 3
        line 13: 6
        line 14: 9
        line 15: 18
        line 16: 35
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
            0      36     0  args   [Ljava/lang/String;
            3      33     1    s1   Ljava/lang/String;
            6      30     2    s2   Ljava/lang/String;
            9      27     3    s3   Ljava/lang/String;
           18      18     4    s4   Ljava/lang/String;

```

##### Java8版本，通过`StringBuilder`的append来实现字符串拼接，然后调用toString(), toString()调用 new String()，从而返回一个新引用，而不是字符串池中的引用。

最后字节码会生成,而toString方法会new String(),通过new出来的String不会在引用原来常量池,所以,不是一个对象

```java
StringBuilder sb = new StringBuilder();
sb.append("Hello, ");
sb.append("world!");
String result = sb.toString();
```



#### **Java9**开始，使用`StringConcatFactory`来替代`StringBuilder`

字节码会调用invokedynamic, 最后调用的是StringConcatFactory也就是

```java
 11: invokedynamic #13,  0             // InvokeDynamic #0:makeConcatWithConstants:(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
```



StringConcatFactory 会根据上下文生成一个适合的拼接方法。它能够处理不同类型和数量的字符串参数。生成的拼接逻辑通常会采用以下两种方式之一：

1.**使用** StringBuilder：

+ 对于多个字符串的拼接，StringConcatFactory 会生成一个使用 StringBuilder 的实现。
+ StringBuilder 提供了一个可变的字符序列，允许高效地拼接字符串，而不必在每次拼接时创建新的字符串对象。

2.**使用常量直接拼接**：

+ 对于常量字符串（如 "Hello, " + "world!"），StringConcatFactory 可能会直接生成一个返回常量的实现，从而避免不必要的对象创建。

**3. 生成拼接方法**

+ StringConcatFactory 使用 java.lang.invoke.MethodHandles API 来动态生成方法句柄。这些方法句柄指向实际的拼接实现。

**4. 执行拼接**

+ 通过引导的拼接方法，StringConcatFactory 会将输入的字符串参数传递给拼接逻辑并执行，最终返回拼接后的字符串。

这应该是优化了常量字符串的拼接,常量拼接在编译时就已经确定优化了, 但是变量拼接时,还是调用的StringBuilder


# CSS选择器

## 通用选择器

```css
 /* 所有后代元素 */
        ul li {
            color: red
        }
```

##  子代选择器

```css
  /*子代选择器,只选子代*/
        ul > li {
            color: red;
        }
```

## 交集,并集选择器

```css
 /*交集选择,标签和类*/
        ul.li {
            columns: auto;
        }
				ul,li {
				}
```

## 兄弟选择器

```css
 /*兄弟选择器,只选紧紧相连的,直往下看,必须紧紧相邻*/
        div + p {
            columns: auto;
        }

        /*兄弟选择器,选择所有后面的兄弟元素*/
        div ~ p {
            columns: auto;
        }
```

## 属性选择器

```css
  /*属性选择器,选择所有有title属性的,可以赋值,也可以不赋值 ^=是以什么开头的,$=是结尾,*=是包含*/
        [title="jack"] {
            column-rule: aliceblue;
        }
```

## 伪类选择器-动态

这是一种元素状态的特殊描述

```css
  /*没有访问过的a*/
        a:link {
            color: rebeccapurple;
        }

          /*访问过的a*/
        a:visited {
            columns: auto;
        }

        /*选择的是鼠标悬浮的a元素*/
        a:hover {
            columns: auto;
        }

        /*按下a时的状态*/
        a:active {
            columns: auto;
        }

        /*获取焦点,输入东西的标签才可以用*/
        input:focus {
            columns: auto;
        }
```

## 伪类选择器-结构

```css
/*所有层级的第一个p会被选中*/
        p:first-child {
            counter-reset: a;
        }

        /*所有层级的最后一个p会被选中,不在最后一个就选不到*/
        p:first-child {
            counter-reset: a;
        }

        /*选第三个p*/
        p:nth-child(3){
            align-self: start;
        }

        /*第一个出现的p元素*/
        p:first-of-type {
            color: #000;
            background-color: red;
        }

        /*第三个出现的p*/
        p:nth-of-type(3) {
            columns: auto;
        }

        /*倒着的第三个*/
        p:nth-last-child(3) {
            counter-reset: a;
        }

        /*没有兄弟的p*/
        p:only-child {
            clear: both;
        }

        /*没有同类型兄弟的p*/
        p:only-of-type {
            clear: both;
        }

        /*什么都没有的p*/
        p:empty {
            clear: both;
        }


```

**child通常是直接的第一个,不在乎类型** 

## 否定伪类

```css
 /*排除的是类名伪fail的p,还可以写[title^="Jack"]*/
        p:not(.fail) {
            clear: both;
        }
```

## UI伪类

```css
   /*勾选的input*/
        input:checked {
            clear: both;
        }
```

## 目标伪类

```css
 /*目标为div的时候*/
        div:target {
            clear: both;
        }
```

## 语言选择器

```css
 /*只选择英文*/
        div:lang(en) {
            columns: auto;
        }
```

## 伪元素选择器

```css
/*div里面的第一个文字,选择的甚至不是元素*/
        div::first-letter {
            clear: both;
        }

        /*被鼠标选中的*/
        div::selection

        /*input里面元素文字*/
        div::placeholder

        /*p元素内容前加$*/
        p::before {
            content: "$";
        }

        p::after {
            content: ".00";
        }

```


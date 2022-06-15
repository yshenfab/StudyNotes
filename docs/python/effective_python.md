
# Table of Contents

1.  [用Pythonic方式来思考](#org6060994)
    1.  [用生成器表达式来改写数据量较大的列表推导](#org9642f8c)
2.  [函数](#org838e35d)
    1.  [尽量用exception表示特殊情况，而不要返回None](#orgfa7f6a8)
3.  [类与继承](#orgd69f33c)
4.  [元类及属性](#orge6364d9)
5.  [并发及并行](#org181f6cc)
6.  [内置模块](#org8f3acb7)
7.  [协作开发](#org780e74a)
8.  [部署](#org9bfc166)



<a id="org6060994"></a>

# 用Pythonic方式来思考


<a id="org9642f8c"></a>

## 用生成器表达式来改写数据量较大的列表推导

value = [len(x) for x in open('test.txt')]
print(value)

it = (len(x) for x in open('test.txt'))
print(it)

print(next(it))

print(next(it))

roots = ((x, x\*\*0.5) for x in it)


<a id="org838e35d"></a>

# 函数


<a id="orgfa7f6a8"></a>

## 尽量用exception表示特殊情况，而不要返回None


<a id="orgd69f33c"></a>

# 类与继承


<a id="orge6364d9"></a>

# 元类及属性


<a id="org181f6cc"></a>

# 并发及并行


<a id="org8f3acb7"></a>

# 内置模块


<a id="org780e74a"></a>

# 协作开发


<a id="org9bfc166"></a>

# 部署


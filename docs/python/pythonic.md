
# Table of Contents

1.  [pythonic](#org0bf1f2c)
    1.  [string](#org19857ed)
    2.  [zip](#orgbd6257d)
    3.  [enumerate](#org2dee251)
    4.  [reverse list](#org97c3e20)
    5.  [open file](#org6a3d887)
    6.  [iter()](#org0be1df0)
    7.  [for&#x2026;else](#org753874c)
    8.  [dict](#org1885f81)
    9.  [update sequence](#org333728c)
    10. [装饰器/修饰符/注解 decorator](#org79f543e)
    11. [使用ignored()代替pass exception](#org724885d)
    12. [简洁的单句表达](#org2cf442b)
    13. [列表推导与循环](#orgd6e22a9)
    14. [函数嵌套定义](#orgde32908)
    15. [with语句](#orgd6402e5)
    16. [any](#org4af418e)
    17. [namedtuple](#orgdceace8)
    18. [map/filter/reduce与列表推导](#org516c1b9)
    19. [lambda表达式](#orgbdf274b)
    20. [yield, generator](#org893e35e)
    21. [monkey patching](#org87624a3)
    22. [books](#orgec5fdf1)
2.  [Books](#org2166b8d)
    1.  [Idiomatic](#orgb55ea94)
        1.  [list comprehensions](#org6467c65)
        2.  [iterators](#org25d631f)
        3.  [generators](#org8368087)
        4.  [assert](#org429d39e)


<a id="org0bf1f2c"></a>

# pythonic


<a id="org19857ed"></a>

## string

-   ''.join()


<a id="orgbd6257d"></a>

## zip

-   list(zip(a,b))
-   dict(zip(a,b))


<a id="org2dee251"></a>

## enumerate

-   for idx, value in enumerate(a):
    print(idx, value)


<a id="org97c3e20"></a>

## reverse list

-   a[::-1]


<a id="org6a3d887"></a>

## open file

-   with open('test.txt', 'r') as f:
    f.read()


<a id="org0be1df0"></a>

## iter()

-   连续调用函数


<a id="org753874c"></a>

## for&#x2026;else

-   try else, while else


<a id="org1885f81"></a>

## dict

-   popitem()是原子操作

while d:
      key, value = d.popitem()

-   连接多个字典

d = ChainMap(command<sub>line</sub><sub>args</sub>, os.environ, defaults)


<a id="org333728c"></a>

## update sequence

-   deque更有效，两端都可操作
-   Q = collections.deque()
    Q.append(1)
    Q.appendleft(2)
    Q.extend([3,4])
    Q.extendleft([5,6]) # deque([6,5,2,1,3,4])
    Q.pop() # 4
    Q.popleft() # 6


<a id="org79f543e"></a>

## 装饰器/修饰符/注解 decorator

-   使用装饰器分离出管理逻辑

@cache
def web<sub>lookup</sub>(url):
    return urllib.urlopen(url).read()

-   装饰器事实上就是一个函数到另一个函数的映射，可以在不修改原函数代码的情况下为其增加新的功能
    本质上，decorator就是一个返回函数的高阶函数
-   def func():
        print("I have a dream!")
    现在想知道执行函数的时候打印时间，那么就定义一个装饰器
    def log<sub>time</sub>(func):
        def wrapper(\*args, \*\*kw):
    	print("run %s() and time is: " % func.\_<sub>name</sub>\_\_ + str(datetime.datetime.now()))
    	return func(\*args, \*\*kw)
        return wrapper

@log<sub>time</sub>
def func():
    print("I have a dream!")


<a id="org724885d"></a>

## 使用ignored()代替pass exception

-   try:
        os.remove('somefile.tmp')
    except OSError:
        pass
    改成
    with ignored(OSError):
        os.remove('somefile.tmp')


<a id="org2cf442b"></a>

## 简洁的单句表达

-   两个冲突的原则：
    1.一行不要有太多逻辑
    2.不要把单一的想法拆分成多个部分
-   Raymond的原则：
    一行代码的逻辑等价于一句自然语言
-   列表解析和生成器
    sum(i\*\*2 for i in range(10))


<a id="orgd6e22a9"></a>

## 列表推导与循环

-   new<sub>list</sub> = []
    for v in old<sub>list</sub>:
        if v[2]:
    	new<sub>list.append</sub>(v[1])
    写成
    new<sub>list</sub> = [v[1] for v in old<sub>list</sub> if v[2]]


<a id="orgde32908"></a>

## 函数嵌套定义

-   def my<sub>func</sub>():
    def subfunc():
       &#x2026;
    subfunc()
    &#x2026;


<a id="orgd6402e5"></a>

## with语句

-   with比起try&#x2026;finally&#x2026;来说，更强调“作用域”


<a id="org4af418e"></a>

## any

-   def has<sub>primary</sub><sub>key</sub>():
    return any(row[1] `=0 and row[9] !` 'YES' for row in rows:)


<a id="orgdceace8"></a>

## namedtuple

-   Point = collections.namedtuple('Point', ['x', 'y'])
    p = Point(x=1.0, y=2.0)
    p.x
    p.y


<a id="org516c1b9"></a>

## map/filter/reduce与列表推导

-   map是从一个集合到另一个集合的映射，比如已知集合lst，要得到每一项平方组成的新集合：
    lst = [1,2,3]
    map(lambda item: item\*\*2, lst)
    [item\*\*2 for item in lst]
-   filter也可以通过列表推导来实现，比如已知集合lst，要得到奇数的平方的新集合：
    [item\*\*2 for item in lst if item % 2]
    map(lambda item: item\*\*2, filter(lambda item: item % 2, lst))
-   reduce把结果继续和序列的下一个元素做累积计算
    reduce(f, [x1, x2, x3, x4]) = f(f(f(x1, x2), x3), x4)
    from functools import reduce
    reduce(lambda x,y: x+y, [1,2,3,4]) # 10


<a id="orgbdf274b"></a>

## lambda表达式

add = lambda x, y: x + y


<a id="org893e35e"></a>

## yield, generator

-   yield的作用就是把一个函数变成一个generator
-   使用yield的好处在于，它返回的是一个generator生成器
-   generator生成器，列表推导用[]进行生成，把[]换成()，就创建了一个generator：
    L = [x\*x for x in range(10)] # [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
    g = (x\*x for x in range(10)) # <generator object <genexpr> at 0x7fd2264607d8>
    L是一个list，g是一个generator，而generator是可迭代的


<a id="org87624a3"></a>

## monkey patching

-   Monkey patching means modifying some code at runtime.


<a id="orgec5fdf1"></a>

## books

-   <https://intermediate-and-advanced-software-carpentry.readthedocs.io/en/latest/idiomatic-python.html>
-   <http://book.pythontips.com/en/latest/index.html>

generators,map,reduce,lambda ,decorators, \*args

-   《编写高质量代码：改善Python程序的91个建议》
-   《Effective Python:编写高质量Python代码的59个有效方法》


<a id="org2166b8d"></a>

# Books


<a id="orgb55ea94"></a>

## Idiomatic

<https://intermediate-and-advanced-software-carpentry.readthedocs.io/en/latest/idiomatic-python.html>


<a id="org6467c65"></a>

### list comprehensions

[ expression for var in list if conditional ]


<a id="org25d631f"></a>

### iterators


<a id="org8368087"></a>

### generators

-   Generators are a Python implementation of coroutines. Essentially, they’re functions that let you suspend execution and return a result.


<a id="org429d39e"></a>

### assert

Assert is pretty simple: it takes a boolean, and if the boolean evaluates to False, it fails (by raising an AssertionError exception). assert True is a no-op.

<a id="org429d39e"></a>

### Tips

- string.join()
- zip
- enumerate
- set
- with open() as f:
- for/else, try/else, while/else
- decorator
- exception: try/except, try/except/finally, try/except/else/finally
- comprehensions: list, dict, set, generator
- collections: deque, namedtuple, counter, defaultdict, etc.
- map/filter/reduce: from functools import map/filter/reduce
- lambda var1, var2: expression
- generator & yield
- monkey patching: modify code at runtime
- __slots__ Magic: save RAM instead of using dict

# Table of Contents

1. [Tutorial](#org43e4e58)
    1. [Chap. 1-4](#orgeafa2f4)
        1. [列表 list[]](#org83bf5cd)
        2. [if elif else](#orgd261232)
        3. [range()](#org6465294)
        4. [循环和 try 都可以有 else 语句！](#org9134575)
        5. [pass 啥也不干，留空](#org32d618c)
        6. [def fib(n): 可以直接用 f = fib 然后调用 f(100)](#org1301336)
        7. [def func(kind, \*arguments, \*\*keywords)](#orgbb84fe5)
        8. [可变参数列表 def func(a, b, \\\*args)](#orgcde8770)
        9. [参数列表的分拆](#orgd3e8442)
        10. [Lambda 形式](#orgb9e33d9)
        11. [荐类名用驼峰命名，函数和方法名用小写<sub>和</sub><sub>下划线</sub>。总是用 self 作为方法的第一个参数](#org5ef71e8)
    2. [Chap. 5 数据结构](#orgab3ac9e)
        1. [List 更多用法](#org268fe41)
        2. [del 语句](#orgf8216fe)
        3. [元组和序列 tuple](#org5b1bf4b)
        4. [集合 set](#org75c4461)
        5. [字典 dict](#org0e67c3c)
        6. [循环技巧](#org0c7e225)
        7. [深入条件控制](#org031797a)
        8. [比较序列和其他类型](#orgf283fdd)
    3. [Chap. 6 模块](#org409fa0f)
        1. [深入模块](#orgd824820)
        2. [dir()函数](#org9579e34)
        3. [包](#org8fcc2fc)
    4. [Chap. 7 输入和输出](#org0db3759)
        1. [格式化输出](#orgd6f76e2)
        2. [文件读写](#orga50d06b)
    5. [Chap. 8 错误和异常](#orgd9d9dbb)
        1. [语法错误(syntax errors)](#orgad33772)
        2. [异常(exceptions)](#org107aacd)
        3. [异常处理](#orgcfa5ac0)
        4. [抛出异常](#orgb84bbb1)
        5. [用户自定义异常](#orgf987301)
        6. [定义清理行为](#org29c51ac)
        7. [预定义清理行为](#org2711638)
    6. [Chap. 9 类](#org298451e)
        1. [Python 作用域和命名空间](#orgeccb034)
        2. [初识类](#orgad6a776)
        3. [一些说明](#orgdd486e8)
        4. [继承](#org142518b)
        5. [私有变量](#org30b69a9)
        6. [补充](#org055091f)
        7. [异常也是类](#org314375b)
        8. [迭代器](#orged0caba)
        9. [生成器 Generator](#org9214b5b)
        10. [生成器表达式](#org6ea4048)
    7. [Chap. 10 Python 标准库概览](#orgb14592c)
        1. [操作系统接口](#org0f17999)
        2. [文件通配符](#orgba3ff84)
        3. [命令行参数](#org269dc5a)
        4. [错误输出重定向和程序终止](#orgc71e01b)
        5. [字符串正则匹配](#org214dd61)
        6. [数学](#orge7092eb)
        7. [互联网访问](#orge641e16)
        8. [日期和时间](#org924e1aa)
        9. [数据压缩](#org9130a0e)
        10. [性能度量](#orgf1be11a)
        11. [质量控制](#orgb02e511)
    8. [Chap. 11 标准库浏览-Part 2](#org432b527)
        1. [输出格式](#orgcc78813)
        2. [模板](#orgfa29acb)
        3. [使用二进制数据记录布局](#orgacca7ba)
        4. [多线程](#orgd0e9f10)
        5. [日志](#orga0b2e6e)
        6. [弱引用](#orga4e0525)
        7. [列表工具](#org4e50430)
        8. [十进制浮点数算法](#org8621569)
    9. [Chap. 12 虚拟环境和包](#org764bd64)
        1. [简介](#orga161679)
        2. [创建虚拟环境](#org25bd72a)
        3. [使用 pip 管理包](#orgb58e847)
2. [10 idioms](#orgfc5f61d)
    1. [Make a script both importable and executable](#orgce51d8c)
    2. [Test for “truthy” and “falsy” values](#orgfde7299)
    3. [Use in where possible](#org171b75a)
    4. [Swap values without temp variable](#org78a27aa)
    5. [Build strings using sequence](#orgca50116)
    6. [EAFP is preferable to LBYL](#org53d0a04)
    7. [Enumerate](#orgc1c463a)
    8. [Build lists using list comprehensions](#org3493f12)
    9. [Create dict from keys and values using zip](#org6e0f5df)
    10. [And the rest&#x2026;!](#orgebb118c)
3. [Debug](#orgee351b2)
    1. [log](#orgcb86d63)
    2. [trace](#orgb298cd8)
    3. [debugger (pdb)](#org045425a)
    4. [refer to http://blog.jobbole.com/51062/](#org7e39b2d)
4. [python 高效编程技巧举例](#org6b2ee56)
    1. [字典推导和集合推导（dict vs. set）](#org18f07bc)
    2. [计数时用 counter 计数对象](#org6bdde72)
    3. [漂亮的打印出 json](#orgefd654b)
    4. [创建一次性的、快速的小型 web 服务](#orgdbe3eb9)

<a id="org43e4e58"></a>

# Tutorial

<a id="orgeafa2f4"></a>

## Chap. 1-4

<a id="org83bf5cd"></a>

### 列表 list[]

- a = [1, 4, 9, 16, 25]
- 列表的元素不必是同一类型
- a + [36, 49, 64, 81, 100]
  [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
- a.append(121) 效率比 a + [121] 高
- a[2:5] = [1,2,3] 替换元素
- a[2:5] = [] 删除元素
- a[:] = [] 清空列表
- 嵌套列表 x = [1,3,5] y = [2,4,6] z = [x,y]
  z[0] ([1,3,5]) z[0][1] ('b')
- a.insert(index, value)

<a id="orgd261232"></a>

### if elif else

<a id="org6465294"></a>

### range()

- range(0,5) range(5)
- range(0,100,10)
- list(range(5)) [0,1,2,3,4]

<a id="org9134575"></a>

### 循环和 try 都可以有 else 语句

<a id="org32d618c"></a>

### pass 啥也不干，留空

<a id="org1301336"></a>

### def fib(n): 可以直接用 f = fib 然后调用 f(100)

<a id="orgbb84fe5"></a>

### def func(kind, \*arguments, \*\*keywords)

- 带\*的参数接收元组
- 带\*\*的参数接收字典

<a id="orgcde8770"></a>

### 可变参数列表 def func(a, b, \\\*args)

<a id="orgd3e8442"></a>

### 参数列表的分拆

- 用\*拆分元组
  args = [3,6]
  list(range(\*args))
- 用\*\*拆分字典
  def func(a, b='xxx', c='yyy')
  d = {"a":"qqq", "b":"www", "c":"eee"}
  func(\*\*d)

<a id="orgb9e33d9"></a>

### Lambda 形式

- 通过 lambda 关键字
- lambda a,b: a+b 返回两个参数的和
- Lambda 形式可以用于任何需要的函数对象
- 语义上讲，它们只是普通函数定义中的一个语法技巧
- 类似于嵌套函数定义
- def func(n):
  return lambda x: x+n
  f = func(10)
  f(0) # 10
  f(1) # 11

<a id="org5ef71e8"></a>

### 荐类名用驼峰命名，函数和方法名用小写<sub>和</sub><sub>下划线</sub>。总是用 self 作为方法的第一个参数

<a id="orgab3ac9e"></a>

## Chap. 5 数据结构

<a id="org268fe41"></a>

### List 更多用法

1. 常用函数

    - list.append(x) 添加元素 x 到列表结尾
    - list.extend(L) 将一个给定列表 L 中的所有元素都添加到列表 list 末尾
    - list.insert(i,x) 指定位置插入元素
    - list.remove(x) 删除列表中值为 x 的第一个元素，如果没有返回错误
    - list.pop(i) 从指定位置删除元素，并将其返回
      list.pop() 删除并返回最后一个元素
    - list.clear() 删除所有元素
    - list.index(x) 返回列表中第一个值为 x 的元素的索引
    - list.count(x) 返回 x 在列表中出现的次数
    - list.sort() 元素排序
    - list.reverse() 倒序
    - list.copy() 返回一个浅拷贝

2. 列表当堆栈使用

    - append 和 pop

3. 列表当队列使用

    - 要实现队列，使用 collections.deque，它为在首尾两端快速插入和删除而设计
    - from collections import deque
    - queue = deque(["Eric", "John", "Michael"])
    - queue.append("Yang")和 queue.popleft()

4. 列表推导式

    - squares = []
      for x in range(10):
      squares.append(x\*\*2)
      这个 for 循环完毕后，变量 x 依然存在
    - squares = list(map(lambda x: x\*\*2, range(10)))则不会产生任何的副作用
      或者等价于 squares = [x\*\*2 for x in range(10)]

<a id="orgf8216fe"></a>

### del 语句

- del list[idx] 删除列表中给定索引的值
- del list[2:4]
- del list[:] 清空 list，此时 list = []
- del list 删除整个变量，此后再引用 list 就会报错，直到再给 list 赋值

<a id="org5b1bf4b"></a>

### 元组和序列 tuple

- python 中的序列类型：list 列表、tuple 元组、range 序列
- **一个元组由数个逗号分隔的值组成**
- t = 12345, 54321, 'hello!' # (12345, 54321, 'hello!')
- 可通过 t[i]访问元组元素
- 元组可以嵌套：u = t, (1,2,3,4,5) # ((12345, 54321, 'hello!'), (1,2,3,4,5))
- **元组不可改变** 如 t[0] = 8888 报错！即元组元素不可被赋值
- t2 = ([1,2,3], [3,2,1]) 可行
- empty = () 空元组
- singleton = 'hello', 特殊情况：构造包含 1 个元素的元组，结尾需要有个逗号

<a id="org75c4461"></a>

### 集合 set

- **无序不重复元素的集** 基本功能包括关系测试和消除重复元素
- 支持并集、交集、差集、对称差集等运算
- **用大括号{}或者 set()来创建集合，空集合只能用 set()来创建而不能用{}，{}用于创建空字典**
- a - b 在 a 不在 b 中
  a | b 在 a 或在 b 中
  a & b 在 a 也在 b 中
  a ^ b 在 a 或在 b 中但不同时在 a 和 b 中

<a id="org0e67c3c"></a>

### 字典 dict

- 序列是以连续的整数为索引，字典以关键字为索引，关键字可以是任意不可变类型，通常用字符串或数值
- key:value
- tel = {'yang': 1234, 'shen':5678}
  tel['leon'] = 4321
  del tel['shen']
  list(tel.keys())
  sorted(tel.keys())
  'yang' in tel # True
- 用 dict()构造函数直接从 key-value 对中创建字典
  dict([('a',1), ('b',2), ('c',3)])
- 如果 key 都是简单的字符串，则可以
  dict(aves=1, pam=2, yang=3)

<a id="org0c7e225"></a>

### 循环技巧

1. items()

    字典中循环时，key-value 可以用 items()同时解读：
    for k,v in dict.items():
    print(k, v)

2. enumerate()

    序列中循环时，索引位置和对应值可以使用 enumerate()同时得到：
    for i,v in enumerate(['a','b','c']):
    print(i, v)
    0 a
    1 b
    2 c

3. zip()

    同时循环多个序列，可以用 zip()整体打包：
    questions = ['name', 'sex', 'score']
    answers = ['yang', 'male', '100']
    for q, a in zip(questions, answers):
    print(q, a)

4. reversed()

    逆向循环序列
    for i in reversed(range(1,10)):
    print i

5. sorted()

    对序列进行顺序排序，不改动原序列，而是生成一个新的已排序的序列
    for x in sorted(set(list)):
    print x

<a id="org031797a"></a>

### 深入条件控制

1. 比较操作符

    - in 和 not in 审核值是否在一个区间之内
    - is 和 is not 较两个对象是否相同
    - 所有的比较操作符具有相同的优先级，低于所有的数值操作
    - 比较操作可以传递，a < b == c 审核是否 a 小于 b 并且 b 等于 c

2. 逻辑操作符

    - and/or/not
    - 优先级低于比较操作符，not 优先级最高，or 优先级最低
    - and 和 or 也叫短路操作符，参数从左向右解析，一旦结果确定就停止

<a id="orgf283fdd"></a>

### 比较序列和其他类型

- (1,2,3) < (1,2,4)
- [1,2,3] < [1,2,4]
- 'ABC' < 'C' < 'Pascal' < 'Python'
- (1,2,3,4) < (1,2,4)
- (1,2) < (1,2,-1) 前面相同，后者更长
- (1,2,3) == (1.0,2.0,3.0)
- (1,2,('aa','ab')) < (1,2,('abc','a'),4)

<a id="org409fa0f"></a>

## Chap. 6 模块

模块中的定义可以导入到另一个模块或主模块中
模块是包括 Python 定义和声明的文件
文件名就是模块名加上.py 后缀
模块的模块名（字符串）可以由全局变量\_<sub>name</sub>\_<sub>得到</sub>
例：fibo.py

def fib(n): # write Fibonacci series up to n
a, b = 0, 1
while b < n:
print(b, end=' ')
a, b = b, a+b
print()

def fib2(n): # return Fibonacci series up to n
result = []
a, b = 0, 1
while b < n:
result.append(b)
a, b = b, a+b
return result

使用：
import fibo
fibo.fib(100)
fibo.fib2(1000)
fibo.\_<sub>name</sub>\_\_ # 'fibo'
如果频繁使用一个函数，可以将它赋予一个本地变量：
xxx = fibo.fib
xxx(500)

<a id="orgd824820"></a>

### 深入模块

- 好的习惯：所有 import 语句放在模块/脚本的开始，但并非强制
- 被导入的模块名会放入当前模块的全局符号表中
- from fibo import \*
  导入所有除了以下划线<sub>开头的命名</sub>，实践中不鼓励使用导入\*

1. 模块的搜索路径

    - 比如 import spam
    - 解释器先在当前目录中搜索 spam.py 文件
    - 如果没有，接着到 sys.path 查找
    - sys.path 变量的初值来自于：
      输入脚本的目录（当前目录 pwd）
      环境变量 PYTHONPATH 表示的目录列表中搜索
      python 默认安装路径

2. “编译的”Python 文件

    - 为了加快加载模块的速度，python 会在\_<sub>pycache</sub>\_<sub>目录下以 module.version.pyc 名字缓存每个模块编译后的版本</sub>，通常包含 python 版本号
    - 部分高级技巧：
      1. 为了减少一个编译模块的大小，在 python 命令行中用-O 或者-OO，-O 删除了断言语句，-OO 删除了断言语句和\_<sub>doc</sub>\_<sub>字符串</sub>，优化的模块后缀为.pyo
      2. .pyc 和.pyo 文件程序不会比.py 文件运行更快，只在加载的时候更快
      3. compileall 模块可以为指定目录中的所有模块创建.pyc 文件（或-O 创建.pyo 文件）

<a id="org9579e34"></a>

### dir()函数

- dir()用于按模块名搜索模块定义，返回一个字符串类型的存储列表
- 例：
  import fibo
  dir(fibo) # ['<span class="underline"><span class="underline">name</span></span>', 'fib', 'fib2']
- 无参数时，dir()返回当前定义的命名
- dir()不会列出内置函数和变量名，如果想列出，用标准模块 builtins
- import builtins
  dir(builtins)

<a id="org8fcc2fc"></a>

### 包

- A.B 表示名为 A 的包中的名为 B 的子模块
- 例：
  import sound.effects.echo 必须通过完整的名称来引用
  from sound.effects import echo 这样就可以直接用 echo
- from Package import specific<sub>submodule 没有错误</sub>！除非导入的模块需要使用其它包中的同名子模块，否则这是推荐的写法。

<a id="org0db3759"></a>

## Chap. 7 输入和输出

<a id="orgd6f76e2"></a>

### 格式化输出

- 标准模块 string
- Template 方法
- 将值转化为字符串：python 有将任意值转化为字符串的方法 repr()或 str()
- str()用于将值转化为适于人阅读的形式
- repr()转化为供解释器读取的形式
- str.format()用法： 1.大括号被替换成 str.format()的参数
  print('We are the {} who say "{}!"'.format('coders', 'hello world')) 2.大括号中的数值指定参数的哪一个
  print('{1} and {0}'.format('me', 'you')) # you and me 3.使用关键字
  print('This {food} is {adj}'.format(food='spam', adj='very horrible')) 4.位置参数和关键字参数随意组合
  print('The story of {0}, {1} and {other}'.format('Yang', 'Scarlett', other='Shen'))
  5.'!a'应用 ascii() '!s'应用 str() '!r'应用 repr()可以在格式化之前转换值
  import math
  print('The value of PI is approximately {}'.format(math.PI))
  print('The value of PI is approximately {!r}'.format(math.PI)) 6.字段名后允许可选的':'和格式指令
  print('The value of PI is approximately {0:.3f}'.format(math.PI))

  7.字段后的':'后面加一个整数会限定该字段的最小宽度（美化表格）
  table = {'Sjoerd': 4127, 'Jack': 4098, 'Dcab': 7678}
  for name, phone in table.items():
  print('{0:10} ==> {1:10d}'.format(name, phone)) 8.旧式字符串格式化
  print('PI is approximately %5.3f' % math.pi)

<a id="orga50d06b"></a>

### 文件读写

1. open(filename, mode)

    - 返回文件对象，如 f = open('workfile', 'w')
    - mode: 默认为'r'
      'r'只读取文件
      'w'只写入文件(已存在的同名文件将被删除)
      'a'打开文件进行追加，写入的内容会自动添加到文件末尾
      'r+'打开文件进行读取和写入
      以上默认文件读写为特定编码方式（默认 UTF-8）
      'b'以二进制模式打开文件，数据以字节对象的形式进行读写（应用于所有不包含文本的文件）
    - 文本模式下： 1.读取时，默认将平台有关的行结束符（Unix 是\n，Windows 是\r\n）转换为\n 2.写入时，默认将出现的\n 转换成平台有关的行结束符 3.这种修改对 ASCII 文本文件没问题，但会损坏 JPEG 或 EXE 这样的二进制文件中的数据

2. 文件对象方法

    1. f.read(size)

        - size 指定读取字符串长度，如没有指定或指定为负数，则读取并返回整个文件
        - 当文件大小为当前极其内存 2 倍时，就会产生问题，反之会尽可能按比较大的 size 读取和返回数据

    2. f.readline()

        - 读取一行，字符串结尾会自动加上\n
        - for line in f:
          print(line, end='')

    3. f.readlines()

        - 把文件中所有行读到一个列表中，也可以使用 list(f)

    4. f.write(string)

        - 将 string 内容写入文件，并返回写入字符的长度
        - 写入其他内容时，用 str(other<sub>content</sub>)先转换为 string

    5. f.tell()

        - 返回一个整数，代表文件对象在文件中的指针位置，该数值计量了自文件开头到指针处的比特数

    6. f.seed(offset, from<sub>what</sub>)

        - 改变文件对象指针，从指定的引用位置 from<sub>what 移动 offset 比特</sub>
        - from<sub>what 为 0 表示自文件起始处开始</sub>，1 表示自当前文件指针位置开始，2 表示自文件末尾开始
        - from<sub>what 可以忽略</sub>，默认为 0

    7. f.close()

        - 关闭文件并释放其占用的所有系统资源

    8. 关键字 with

        - 用关键字 with 处理文件对象是个好习惯
        - 先进之处在于文件用完后会 **自动关闭** ，就算发生异常也没关系
        - 它是 try-finally 块的简写：
          with open('filename', 'r') as f:
          read<sub>data</sub> = f.read()

3. 使用 json 存储结构化数据

    标准模块 json 可以接受 Python 数据结构，并将它们转换为字符串表示形式
    此过程称为 **序列化**
    从字符串表示形式重新构建数据结构称为 **反序列化**

    1. json.dumps()

        - json.dumps([1, 'simple', 'list'])查看 json 字符串表示形式

    2. json.dump()

        - json.dump(x, f) 直接将对象 x 序列化到文件 f

    3. json.load()

        - json.load(f) 重新解码对象

    4. pickle 模块

        与 JSON 不同，pickle 是一个协议，它允许任意复杂的 Python 对象的序列化。
        因此，它只能用于 Python 而不能用来与其他语言编写的应用程序进行通信。
        默认情况下它也是不安全的：如果数据由熟练的攻击者精心设计，
        反序列化来自一个不受信任源的 pickle 数据可以执行任意代码。

<a id="orgd9d9dbb"></a>

## Chap. 8 错误和异常

<a id="orgad33772"></a>

### 语法错误(syntax errors)

<a id="org107aacd"></a>

### 异常(exceptions)

异常也有不同的类型，异常类型做为错误信息的一部分显示出来

<a id="orgcfa5ac0"></a>

### 异常处理

- try:
  &#x2026;
  except xxxError:
  &#x2026;
  except yyyError: # 一个 try 可以带有多个 except
  &#x2026;
  except (aaaError, bbbError, cccError): # 一个 except 可以包含多种 error
  &#x2026;
  else: # try&#x2026;except 可以带有一个 else 语句，只能放在所有 except 子句之后，当 try 没有抛出异常并需要执行一段代码时使用
  &#x2026;
- 为 except 指定一个变量，这个变量绑定于一个异常实例，一旦异常发生，会在抛出前绑定所有指定的属性
  try:
  raise Exception('spam', 'egg')
  except Exception as inst:
  print(type(inst)) # <class 'Exception'>
  print(inst.args) # ('spam', 'eggs')
  print(inst) # ('spam', 'eggs')
  x, y = inst.args
  print(x) # spam
  print(y) # eggs

<a id="orgb84bbb1"></a>

### 抛出异常

- raise 语句允许强制抛出一个指定的异常，如 raise NameError('HiThere')

<a id="orgf987301"></a>

### 用户自定义异常

创建新的异常类型来命名自己的异常，异常类通常应该直接或间接从 Exception 类派生：
class MyError(Exception):
def \_<sub>init</sub>\_<sub>(self, value)</sub>:
self.value = value
def \_<sub>str</sub>\_<sub>(self)</sub>:
return repr(self.value)

try:
raise MyError(2\*2)
except MyError as e:
print('My exception occurred, value:', e.value)

<a id="org29c51ac"></a>

### 定义清理行为

try 语句还有一个可选的句子 finally，目的在于定义在任何情况下都一定要执行的功能，如：
try:
raise KeyboardInterrupt
finally:
print('Goodbye, world!')
即便 try 语句经由 break, continue 或 return 语句，退出时也会执行 finally
在真实场景的应用程序中，finally 子句用于释放外部资源（文件或网络连接之类的），无论它们的使用过程中是否出错。

<a id="org2711638"></a>

### 预定义清理行为

for line in open("myfile.txt"):
print(line)
上面代码执行完后没有立即关闭打开的文件，脚本里没什么，大型程序就会出问题，改用 with 确保总能及时准确清理：
with open("myfile.txt") as f:
for line in f:
print(line)
语句执行后，文件 f 总会被关闭，即使处理文件中的数据时出错也一样

<a id="org298451e"></a>

## Chap. 9 类

<a id="orgeccb034"></a>

### Python 作用域和命名空间

- 命名空间是从命名到对象的映射
- z.real “.”之后的命名称为属性
- 内置命名的模块为 builtins
- Python 的一个特别之处在于：如果没有使用 global 语法，其赋值操作总是在最里层的作用域
- import 语句和函数定义将模块名或函数绑定于局部作用域（可以使用 global 语句将变量引入到全局作用域）。
- global 语句用以指明某个特定的变量为全局作用域，并重新绑定它
- nonlocal 语句用以指明某个特定的变量为封闭作用域，并重新绑定它

<a id="orgad6a776"></a>

### 初识类

1. 类定义语法

    class ClassName:
    <statement-1>
    &#x2026;
    &#x2026;
    <statement-N>

2. 类对象

    class MyClass:
    """A simple example class"""
    i = 12345
    def f(self):
    return 'hello world'

    - MyClass.i 和 MyClass.f 分别返回一个整数和一个方法对象
    - MyClass.\_<sub>doc</sub>\_<sub>返回类的文档字符串</sub>"A simple example class"
    - 类的实例化使用函数符号 x = MyClass()
    - 很多类都倾向于将对象创建为有初始状态的，因此类会定义一个名为\_<sub>init</sub>\_<sub>()</sub>的特殊方法：
      def \_<sub>init</sub>\_<sub>(self)</sub>:
      self.data = []
    - 举例：

    class Complex:
    def \_<sub>init</sub>\_<sub>(self, realpart, imagpart)</sub>:
    self.r = realpart
    self.i = imagpart

    x = Complex(3.0, -4.5)
    x.r, x.i # (3.0, -4.5)

3. 实例对象

    x.counter = 1
    while x.counter < 10:
    x.counter = x.counter \* 2
    print(x.counter)
    del x.counter

4. 方法对象

    - 方法通过右绑定方式调用： x.f() # 打印 hello world
    - 也可以先存储起来以后调用
      xf = x.f
      print(xf())
    - 调用 x.f()相当于 MyClass.f(x)

5. 类和实例变量

    **实例变量用于对每一个实例都是唯一的数据，类变量用于类的所有实例共享的属性和方法**
    class Dog:
    kind = 'canine'
    tricks = []
    def \_<sub>init</sub>\_<sub>(self, name)</sub>:
    self.name = name
    def add<sub>trick</sub>(self, trick):
    self.tricks.append(trick)
    d = Dog('Fido')
    e = Dog('Buddy')
    d.kind # canine
    e.kind # canine
    d.name # Fido
    e.name # Buddy
    d.add<sub>trick</sub>('roll over')
    e.add<sub>trick</sub>('play dead')

    d.tricks # ['roll over', 'play dead']
    类正确设计：
    class Dog:
    def \_<sub>init</sub>\_<sub>(self, name)</sub>:
    self.name = name
    self.tricks = []
    def add<sub>trick</sub>(self, trick):
    self.tricks.append(trick)
    d.tricks # ['roll over']
    e.tricks # ['play dead']

<a id="orgdd486e8"></a>

### 一些说明

- 数据属性会覆盖同名的方法属性，难 debug，约定：
  大写方法名称的首字母，使用一个唯一的小字符串（也许只是一个下划线）作为数据属性名称的前缀，或者方法使用动词而数据属性使用名词。
- 方法的第一个参数被命名为 self。这仅仅是一个约定：对 Python 而言，名称 self 绝对没有任何特殊含义

<a id="org142518b"></a>

### 继承

- 派生类的定义：
  class DerivedClassName(BaseClassName):
  <statement-1>
  &#x2026;
  &#x2026;
  <statement-N>

其中 BaseClassName 为基类名，必须与派生类定义在一个作用域内。
除了类，还可以用表达式，基类定义在另一个模块中时这一点非常有用：
class DerivedClassName(modname.BaseClassName):

- 派生类可能会覆盖其基类的方法
- 对于 C++ 程序员来说，Python 中的所有方法本质上都是 virtual 方法
- 两个用于继承的函数：
  1. isinstance()用于检查实例类型，例如 isinstance(obj, int)只有在 obj.\_<sub>class</sub>\_<sub>是 int 或其他从 int 继承的类型</sub>
  2. issubclass()用于检查类继承，例如 issubclass(bool, int)返回 True，因为 bool 是 int 的子类，
      而 issubclass(float, int)返回 False，因为 float 不是 int 的子类

1. 多继承

    class DerivedClassName(Base1, Base2, Base3):
    <statement-1>
    &#x2026;
    &#x2026;
    <statement-N>

    - 搜索属性从父类继承的深度优先，左到右，而不是搜索两次在同一个类层次结构中，其中有一个重叠
    - super()可以动态改变解析顺序

<a id="org30b69a9"></a>

### 私有变量

- 只能从对像内部访问的“私有”实例变量，在 Python 中不存在
- 有一个变通的访问用于大多数 Python 代码：
  以一个下划线开头的命名（例如<sub>spam</sub>）会被处理为 API 的非公开部分（无论它是一个函数、方法或数据成员）。它会被视为一个实现细节，无需公开。

<a id="org055091f"></a>

### 补充

- C 中的结构体 struct，用一个空的类定义实现：
  class Employee:
  pass
  john = Employee() # create an empty Employee record

  john.name = 'John Doe'
  john.dept = 'computer lab'
  john.salary = 1000

<a id="org314375b"></a>

### 异常也是类

- 有效的（语义上的）异常抛出形式，使用 raise 语句：
  raise Class 或 raise Instance

<a id="orged0caba"></a>

### 迭代器

- for item in [1,2,3]:
  for item in (1,2,3):
  for key in {'one':1, 'two':2}:
  for char in "123":
  for line in open('myfile.txt'):
- 在后台，for 语句在容器对象中调用 iter()

<a id="org9214b5b"></a>

### 生成器 Generator

- Generator 是创建迭代器的简单而强大的工具。它们写起来就像是正规的函数，需要返回数据的时候使用 yield 语句
  def reverse(data):
  for index in range(len(data)-1, -1, -1):
  yield data[index]

<a id="org6ea4048"></a>

### 生成器表达式

- sum(i\*i for i in range(10)) # sum of squares
- xvec = [10,20,30]
  yvec = [7,5,3]
  sum(x\*y for x,y in zip(xvec, yvec)) # dot product

<a id="orgb14592c"></a>

## Chap. 10 Python 标准库概览

<a id="org0f17999"></a>

### 操作系统接口

import os
os.getcwd() # return pwd
os.chdir('_home/yang_') # change directory
os.system('mkdir test')

- 应该用 import os 而非 from os import \*，这样可以保证随操作系统不同而有所变化的 os.open()不会覆盖内置函数 open()
- 针对日常的文件和目录管理任务，shutil 模块提供了一个易于使用的高级接口：
  import shutil
  shutil.copyfile('data.db', 'archive.db')
  shutil.move('/build/executables', 'installdir')

<a id="orgba3ff84"></a>

### 文件通配符

glob 模块提供了一个函数用于从目录通配符搜索中生成文件列表：
import glob
glob.glob('\*.py') # ['xxx.py', 'aaa.py', 'test.py']当前目录下的

<a id="org269dc5a"></a>

### 命令行参数

- 通用工具脚本经常调用命令行参数。这些命令行参数以链表形式存储于 sys 模块的 argv 变量。
  import sys
  print(sys.argv)
  例如在命令行执行 python demo.py one two three 将得到：
  ['demo.py', 'one', 'two', 'three']
- getopt 模块使用 Unix getopt()函数处理 sys.argv
- 更多的复杂命令行处理由 argparse 模块提供

<a id="orgc71e01b"></a>

### 错误输出重定向和程序终止

sys 还有 stdin，stdout 和 stderr 属性，即使在 stdout 被重定向时，后者也可以用于显示警告和错误信息：
sys.stderr.write('Warning: xxxxxxx\n')
大多脚本的直接终止都使用 sys.exit()

<a id="org214dd61"></a>

### 字符串正则匹配

- import re
  re.findall(r'\bf[a-z]\*', 'which foot or hand fell fastest') # ['foot', 'fell', 'fastest']
  re.sub(r'(\b[a-z]+) \\1', r'\\1', 'cat in the the hat') # 'cat in the hat'
- 只需简单的操作时，字符串方法最好用，因为它们易读，又容易调试：
  'tea for too'.replace('too', 'two') # 'tea for two'

<a id="orge7092eb"></a>

### 数学

- math 模块为浮点运算提供了对底层 C 函数库的访问
  import math
  math.cos(math.pi / 4.0)
  math.log(1024, 2)
- random 提供了生成随机数的工具
  import random
  random.choice(['apple','pear','banana'])
  random.sample(range(100),10)
  random.random() # random float
  random.randrange(6)
- SciPy 数值计算模块

<a id="orge641e16"></a>

### 互联网访问

- urllib 从 urls 接收数据
- smtplib 发送电子邮件
  import smtplib
  server = smtplib.SMTP('localhost')
  server.sendmail('<xxx@jlinno.com>', '<yyy@jlinno.com>',
  """ To: <yyy@jlinno.com>
  From: xxx.jlinno.com
  blablabla&#x2026;
  """)
  server.quit()

需要在 localhost 运行一个邮件服务器

<a id="org924e1aa"></a>

### 日期和时间

- datetime 支持日期和时间算法的同时，实现的重点放在更有效的处理和格式化输出。该模块还支持时区处理。
  from datetime import date
  now = date.today()
  now # datetime.date(2003, 12, 2)
  now.strftime("%m-%d-%y. %d %b %Y is a %A on the %d day of %B.") # '12-02-03. 02 Dec 2003 is a Tuesday on the 02 day of December.'
  birthday = date(1990, 10, 1)
  age = now - birthday
  age.days

<a id="org9130a0e"></a>

### 数据压缩

- 数据打包和压缩模块：zlib, gzip, bz2, lzma, zipfile, tarfile

<a id="orgf1be11a"></a>

### 性能度量

- timeit 模块
  from timeit import Timer
  Timer('t=a; a=b; b=t', 'a=1; b=2').timeit() # 0.57535828626024577
  Timer('a,b = b,a', 'a=1; b=2').timeit() # 0.54962537085770791
- 相对于 timeit 的细粒度，profile 和 pstats 模块提供了针对更大代码块的时间度量工具

<a id="orgb02e511"></a>

### 质量控制

- doctest 模块
- unittest 模块

<a id="org432b527"></a>

## Chap. 11 标准库浏览-Part 2

<a id="orgcc78813"></a>

### 输出格式

- reprlib 模块为大型的或深度嵌套的容器缩写显示提供了:repr()函数的一个定制版本:
  import reprlib
  reprlib.repr(set('supercalifragilisticexpialidocious')) # "set(['a', 'c', 'd', 'e', 'f', 'g', &#x2026;])"
- pprint 模块给老手提供了一种解释器可读的方式深入控制内置和用户自定义对象的打印
  import pprint
  t = [[[['black', 'cyan'], 'white', ['green', 'red']], [['magenta', 'yellow'], 'blue']]]
  pprint.pprint(t, width=30)
- textwrap 模块格式化文本段落以适应设定的屏宽
  import textwrap
  doc = """The wrap() method is just like fill() except that it returns
  a list of strings instead of one big string with newlines to separate
  the wrapped lines."""
  print(textwrap.fill(doc, width=40))
- locale 模块按访问预定好的国家信息数据库
  import locale
  locale.setlocale(locale.LC<sub>ALL</sub>, 'English<sub>United</sub> States.1252')
  conv = locale.localeconv() # get a mapping of conventions
  x = 1234567.8
  locale.format("%d", x, grouping=True) # '1,234,567'
  locale.format<sub>string</sub>("%s%.\*f", (conv['currency<sub>symbol</sub>'], conv['frac<sub>digits</sub>'], x), grouping=True) # '$1,234,567.80'

<a id="orgfa29acb"></a>

### 模板

- string 提供了一个灵活多变的模板类 Template
  from string import Template
  t = Template('${village}folk send $$110 to $cause')
  t.substitute(village='Nottingham', cause='the ditch fund') # 'Nottinghamfolk send $10 to the ditch fund.'

<a id="orgacca7ba"></a>

### 使用二进制数据记录布局

- struct 模块为使用变长的二进制记录格式提供了 pack()和 unpack()函数

<a id="orgd0e9f10"></a>

### 多线程

- import threading
- 任务协调的首选方法是把对一个资源的所有访问集中在一个单独的线程中，然后使用 queue 模块用那个线程服务其他线程的请求

<a id="orga0b2e6e"></a>

### 日志

- import logging
  logging.debug('Debugging information')
  logging.info('Informational message')
  logging.warning('Warning: file %s not found', 'server.conf')
  logging.error('Error occurred')
  logging.critical('Critical error &#x2013; shutting down')

<a id="orga4e0525"></a>

### 弱引用

- weakref 模块提供了不用创建引用的跟踪对象工具，一旦对象不再存在，它自动从弱引用表上删除并触发回调

<a id="org4e50430"></a>

### 列表工具

- from array import array
- from collections import deque
  从左边 append/pop 更快，内部查询更慢，适用于队列实现和广度优先的树搜索
- import bisect 存储链表
- heapq 提供了基于正规链表的堆实现
  from heapq import heapify, heappop, heappush

<a id="org8621569"></a>

### 十进制浮点数算法

from decimal import \*

<a id="org764bd64"></a>

## Chap. 12 虚拟环境和包

<a id="orga161679"></a>

### 简介

virtualenv

<a id="org25bd72a"></a>

### 创建虚拟环境

用于创建和管理虚拟环境的脚本叫做 pyvenv

<a id="orgb58e847"></a>

### 使用 pip 管理包

- Python Package Index
- pip search xxx
- pip install xxx
- pip install requests==2.6.0
- pip install &#x2013;upgrade
- pip uninstall xxx yyy zzz
- &#x2026;

<a id="orgfc5f61d"></a>

# 10 idioms

<http://safehammad.com/downloads/python-idioms-2014-01-16.pdf>

<a id="orgce51d8c"></a>

## Make a script both importable and executable

- if <span class="underline"><span class="underline">name</span></span> == '<span class="underline"><span class="underline">main</span></span>':

<a id="orgfde7299"></a>

## Test for “truthy” and “falsy” values

- if x:
- if not x:

<a id="org171b75a"></a>

## Use in where possible

- if x in items:
- for x in items:

<a id="org78a27aa"></a>

## Swap values without temp variable

- a,b = b,a

<a id="orgca50116"></a>

## Build strings using sequence

- ''.join(some<sub>strings</sub>)

<a id="org53d0a04"></a>

## EAFP is preferable to LBYL

It's Easier to Ask for Forgiveness than Permission.
Look Before You Leap.

- try except vs. if

<a id="orgc1c463a"></a>

## Enumerate

- for i, item in enumerate(items):

<a id="org3493f12"></a>

## Build lists using list comprehensions

- [i\*3 for i in data if i>10]

<a id="org6e0f5df"></a>

## Create dict from keys and values using zip

- d = dict(zip(keys, values))

<a id="orgebb118c"></a>

## And the rest&#x2026

- while True:
  break
- Generators and generator expressions.
- Avoid: from module import \*
  Prefer: import numpy as np; import pandas as pd
- Use \_ for “throwaway” variables e.g.:
  for k, \_ in [('a', 1), ('b', 2), ('c', 3)]
- dict.get() and dict.setdefault()
- collections.defaultdict
- Sort lists using l.sort(key=key<sub>func</sub>)

<a id="orgee351b2"></a>

# Debug

<a id="orgcb86d63"></a>

## log

- 代码里的 print 别用了，换用 logging.debug

<a id="orgb298cd8"></a>

## trace

- 标准库里的 trace 模块，可以打印运行时包含在其中的模块里所有执行到的语句
- python -mtrace -trace xxx.py (会产生大量输出，grep 自己感兴趣的内容)

<a id="org045425a"></a>

## debugger (pdb)

- import pdb
- pdb.set<sub>trace</sub>()

或者

- try:
  一段抛出异常的代码
  except:
  import pdb
  pdb.pm() # 或者 pdb.post<sub>mortem</sub>()

或者

- python -mpdb xxx.py

<a id="org7e39b2d"></a>

## refer to <http://blog.jobbole.com/51062/>

<a id="org6b2ee56"></a>

# python 高效编程技巧举例

<a id="org18f07bc"></a>

## 字典推导和集合推导（dict vs. set）

- list<sub>a</sub> = [1,2,3,4,5]
- list<sub>b</sub> = [x+1 for x in list<sub>a</sub>]
  [2,3,4,5,6]
- some<sub>list</sub> = [1,2,3,4,5,2,5,1,4,8]
- even<sub>set</sub> = {x for x in some<sub>list</sub> if x % 2 == 0}
  set([8, 2, 4]) {8,2,4}
- d = {x : x % 2 == 0 for x in range(1,11)}
  {1: False, 2: True, 3: False, 4: True, 5: False, 6: True, 7: False, 8: True, 9: False, 10: True}
- my<sub>set</sub> = {1,2,1,2,3,4}
  set([1, 2, 3, 4])

<a id="org6bdde72"></a>

## 计数时用 counter 计数对象

- from collections import Counter
- c = Counter('hello world')
- Counter({'l': 3, 'o': 2, ' ': 1, 'e': 1, 'd': 1, 'h': 1, 'r': 1, 'w': 1})
- c.most<sub>common</sub>(2)
  [('l', 3), ('o', 2)]

<a id="orgefd654b"></a>

## 漂亮的打印出 json

- import json
- print(json.dumps(data)) # no indention
- print(json.dumps(data, indent=2)) # with indention

<a id="orgdbe3eb9"></a>

## 创建一次性的、快速的小型 web 服务

服务器端

- from SimpleXMLRPCServer import SimpleXMLRPCServer
- def file<sub>reader</sub>(file<sub>name</sub>):
  with open(file<sub>name</sub>, 'r') as f:
  return f.read()
- server = SimpleXMLRPCServer(('localhost', 8000))
- server.register<sub>introspection</sub><sub>functions</sub>()
- server.register<sub>function</sub>(file<sub>reader</sub>)
- server.serve<sub>forever</sub>()

客户端

- import xmlrpclib
- proxy = xmlrpclib.ServerProxy('<http://localhost:8000/>')
- proxy.file<sub>reader</sub>('/tmp/secret.txt')

以上就得到了一个远程文件读取工具

# Pythonic

[Idiomatic Python](https://intermediate-and-advanced-software-carpentry.readthedocs.io/en/latest/idiomatic-python.html)

- reverse list a: `a[::-1]`
- `string.join(iterable)`
- use `zip`, `list(zip(a,b))`, `dict(zip(a,b))`
- open file
```python
with open('filename', 'r') as f:
    f.read()
```
- `iter()`连续调用函数
- for/else, try/else, while/else
- dict: 
popitem()是原子操作
```python
while d:
    key, value = d.popitem()
```
连接多个字典
`d = ChainMap(command_line_args, os.environ, defaults)`

- deque更有效，两端都可操作，`Q = collections.deque()`，`append(), appendleft(),
    extend(), extendleft(), pop(), popleft()`
- collections: deque, namedtuple, counter, defaultdict, etc.

- decorator: 装饰器事实上就是一个函数到另一个函数的映射，可以在不修改原函数代码的情况下为其增加新的功能。本质上，decorator就是一个返回函数的高阶函数。

- 使用ignored()代替pass exception，例如
```python
try:
    os.remove('somefile.tmp')
except OSError:
    pass
```
改成
```python
with ignored(OSError):
    os.remove('somefile.tmp')
```

- 两个冲突的原则：
  1.一行不要有太多逻辑
  2.不要把单一的想法拆分成多个部分
- Raymond的原则：一行代码的逻辑等价于一句自然语言
- 列表解析和生成器`sum(i**2 for i in range(10))`
- 函数嵌套定义
```python
def my_func():
    def subfunc():
        ...
    subfunc()
    ...
```
- with比起try...finally...来说，更强调"作用域"

- any
```py
def has_primary_key():
    return any(row[1] ==0 and row[9] != 'YES' for row in rows:)
```
- namedtuple
```python
Point = collections.namedtuple('Point', ['x', 'y'])
p = Point(x=1.0, y=2.0)
p.x
p.y
```
- map/filter/reduce与列表推导

- map是从一个集合到另一个集合的映射，比如已知集合lst，要得到每一项平方组成的新集合：
```python
  lst = [1,2,3]
  map(lambda item: item**2, lst)
  [item**2 for item in lst]
```
- filter也可以通过列表推导来实现，比如已知集合lst，要得到奇数的平方的新集合：
```python
  [item**2 for item in lst if item % 2]
  map(lambda item: item**2, filter(lambda item: item % 2, lst))
```
- reduce把结果继续和序列的下一个元素做累积计算
```python
  reduce(f, [x1, x2, x3, x4]) = f(f(f(x1, x2), x3), x4)
  from functools import reduce
  reduce(lambda x,y: x+y, [1,2,3,4]) # 10
```
- lambda表达式 `add = lambda x,y : x+y`
- yield的作用就是把一个函数变成一个generator，使用yield的好处在于，它返回的是一个generator生成器
- generator生成器，列表推导用[]进行生成，把[]换成()，就创建了一个generator：
```python
  # L是一个list，g是一个generator，而generator是可迭代的
  L = [x*x for x in range(10)] # [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
  g = (x*x for x in range(10)) # <generator object <genexpr> at 0x7fd2264607d8>
```
- `__slots__` Magic: save RAM instead of using dict
- List comprehensions: `[expression for var in list if conditional]`
- **Generators** are a Python implementation of coroutines. Essentially, they’re functions that let you suspend execution and return a result.
- **Assert** is pretty simple: it takes a boolean, and if the boolean evaluates to False, it fails (by raising an AssertionError exception). assert True is a no-op.

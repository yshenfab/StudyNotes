# Pythonic

## Idiomatic Python

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

- deque 更有效，两端都可操作，`Q = collections.deque()`，`append(), appendleft(),
extend(), extendleft(), pop(), popleft()`
- collections: deque, namedtuple, counter, defaultdict, etc.

- decorator: 装饰器事实上就是一个函数到另一个函数的映射，可以在不修改原函数代码的情况下为其增加新的功能。本质上，decorator 就是一个返回函数的高阶函数。

- 使用 ignored()代替 pass exception，例如

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

- 两个冲突的原则： 1.一行不要有太多逻辑 2.不要把单一的想法拆分成多个部分
- Raymond 的原则：一行代码的逻辑等价于一句自然语言
- 列表解析和生成器`sum(i**2 for i in range(10))`
- 函数嵌套定义

```python
def my_func():
    def subfunc():
        ...
    subfunc()
    ...
```

- with 比起 try...finally...来说，更强调"作用域"

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

- map/filter/reduce 与列表推导

- map 是从一个集合到另一个集合的映射，比如已知集合 lst，要得到每一项平方组成的新集合：

```python
  lst = [1,2,3]
  map(lambda item: item**2, lst)
  [item**2 for item in lst]
```

- filter 也可以通过列表推导来实现，比如已知集合 lst，要得到奇数的平方的新集合：

```python
  [item**2 for item in lst if item % 2]
  map(lambda item: item**2, filter(lambda item: item % 2, lst))
```

- reduce 把结果继续和序列的下一个元素做累积计算

```python
  reduce(f, [x1, x2, x3, x4]) = f(f(f(x1, x2), x3), x4)
  from functools import reduce
  reduce(lambda x,y: x+y, [1,2,3,4]) # 10
```

- lambda 表达式 `add = lambda x,y : x+y`
- yield 的作用就是把一个函数变成一个 generator，使用 yield 的好处在于，它返回的是一个 generator 生成器
- generator 生成器，列表推导用[]进行生成，把[]换成()，就创建了一个 generator：

```python
  # L是一个list，g是一个generator，而generator是可迭代的
  L = [x*x for x in range(10)] # [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
  g = (x*x for x in range(10)) # <generator object <genexpr> at 0x7fd2264607d8>
```

- `__slots__` Magic: save RAM instead of using dict
- List comprehensions: `[expression for var in list if conditional]`
- **Generators** are a Python implementation of coroutines. Essentially, they’re functions that let you suspend execution and return a result.
- **Assert** is pretty simple: it takes a boolean, and if the boolean evaluates to False, it fails (by raising an AssertionError exception). assert True is a no-op.

## Python Tips

Tips collected from [python tips](http://book.pythontips.com/en/latest/index.html)

- `*args` and `**kwargs`

`*args`: non-keyworded
`**kwargs`: allow you to pass keyworded variable length of arguments to a
function.

- Debugging: python debugger (pdb)

running from command line:

`python -m pdb my_code.py`

running inside a script:

```python
import pdb
def make_bread():
    pdb.set_trace() # set break points
    return "I don't have time"

print(make_bread())
```

- pdb usage

| shortcut | meaning                                                                                 |
| -------- | --------------------------------------------------------------------------------------- |
| c        | continue execution                                                                      |
| w        | show context of current line it is executing                                            |
| a        | print the argument list of current function                                             |
| s        | execute the current line and stop at the first possible occasion                        |
| n        | continue execution until the next line in the current function is reached or it returns |

- Ternary Operators

Ternary operators are more commonly known as conditional expressions in
Python.

`condition if true if condition else condition if false`

`state = "nice" if condition else "not nice"`

- Decorators are functions which modify the functionality of other functions.

      1) Define functions within functions;

      2) Return functions from within functions;

      3) Give a function as an argument to another function.

- Don't use global.
- Mutable means "able to be changed", immutable means "constant". In Python, the default arguments are evaluated once when the function is defined, not each time the function is called. You should never define default arguments of mutable type unless you know what you are doing.

|           | Data types                      |
| --------- | ------------------------------- |
| mutable   | list, dict, set                 |
| immutable | int, float, bool, string, tuple |

- `__slots__` Magic

Python uses dict to store an object's instance attributes, which sucks a lot of
RAM. Using `__slots__` to tell python not to use a dict, and only allocate space
for a fixed set of attributes, i.e., save RAM instead of using dict.

Example:

```python
# without __slots__
class MyClass(object):
    def __init__(self, name, uid):
        self.name = name
        self.id = uid
        self.set_up()

# with __slots__ (40%-50% reduction of RAM)
class MyClass(object):
    __slots__ = ['name', 'uid']
    def __init__(self, name, uid):
        self.name = name
        self.id = uid
        self.set_up()
```

- Collections, container data types (defaultdict, OrderedDict, counter, deque,
  namedtuple, enum.Enum)

- Object introspection

  1. `dir(list)` to get all the methods of a list;

  2. `type(object)` returns the type of an object, `id(object)` returns the
     unique id of an object;

  3. insepct module, `import inspect`,
     `inspect.getmembers(str)`

- list/dict/set/generator comprehensions

- Exceptions

1. try/except

```python
try:
    file = open(filename, 'rb')
except IOError as e:
    print(f'An IOError occured. {e.args[-1]}')
```

2. Handling multiple exceptions

```python
# method 1
except (IOError, EOFError) as e:
    print(f'An Error occured. {e.args[-1]}')
    raise e
# method 2
except IOError as e:
    print("An IO error occurred.")
    raise e
except EOFError as e:
    print("An EOF error occurred.")
    raise e
# method 3
except (IOError, EOFError) as e:
    # some logging
    raise e
```

3. finally

```python
try:
    file = open('test.txt', 'rb')
except IOError as e:
    print('An IOError occurred. {}'.format(e.args[-1]))
finally:
    print("This would be printed whether or not an exception occurred!")
```

4. try/else

```python
try:
    print('I am sure no exception is going to occur!')
except Exception:
    print('exception')
else:
    # any code that should only run if no exception occurs in the try,
    # but for which exceptions should NOT be caught
    print('This would only run if no exception occurs. And an error here '
          'would NOT be caught.')
finally:
    print('This would be printed in every case.')
```

- Lambdas (one line functions, anoymous), blueprint: `lambda arguments: manipulate(arguments)`
- Profiling a script. This can be extremely helpful in pinpointing the bottlenecks in your script:

`python -m cProfile my_script.py`

(cProfile is a faster implementation of profile as it is written in C)

- for/else: else condition executes when no break happens
- Python C extensions: ctypes
- `open()`, syntax: `open(filename, mode)`

| mode | description    |
| ---- | -------------- |
| r    | read           |
| r+   | read and write |
| w    | overwrite      |
| a    | append         |
| b    | binary         |

- Coroutines: similar to generators with a few differences. Generators are data
  producers. Coroutines are data consumers

```python
# generator
def fib():
    a,b = 0,1
    while 1:
        yield a
        a,b = b,a+b
# coroutine
def grep(pattern):
    print("Searching for", pattern)
    while 1:
        line = (yield)
        if pattern in line:
            print(line)

search = grep('coroutine')
next(search)
search.send("hahaha")
search.send("I love coroutines!")
# ...
search.close()
```

- Function Caching: Function caching allows us to cache the return values of a function depending on the arguments.

```python
from functools import lru_cache

@lru_cache(maxsize=32)
def fib(n):
    if n < 2:
        return n
    return fib(n-1) + fib(n-2)

print([fib(n) for n in range(10)])
# Output: [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
fib.cache_clear()
```

- Context Managers: Context managers allow you to allocate and release resources precisely when you want to. The most widely used example of context manager is `with`.

```python
# Implementing a Context Manager as a Class
# a context manager has an __enter__ and __exit__ method defined
class File(object):
    def __init__(self, file_name, method):
        self.file_obj = open(file_name, method)
    def __enter__(self):
        return self.file_obj
    def __exit__(self, type, value, traceback):
        return self.file_obj.close()

with File('demo.txt', 'w') as opened_file:
    opened_file.write('Hola!')

# Handling Exceptions
class File(object):
     def __init__(self, file_name, method):
         self.file_obj = open(file_name, method)
     def __enter__(self):
         return self.file_obj
     def __exit__(self, type, value, traceback):
         print("Exception has been handled")
         self.file_obj.close()
         return True

with File('demo.txt', 'w') as opened_file:
    opened_file.undefined_function()

# Implementing a Context Manager as a generator
from contextlib import contextmanager

@contextmanager
def open_file(name):
    f = open(name, 'w')
    yield f
    f.close()

with open_file('some_file') as f:
    f.write('hola!')
```

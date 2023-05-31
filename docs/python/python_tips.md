# Python Tips

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

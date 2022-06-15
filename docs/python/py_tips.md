
# Table of Contents

1.  [\*args and \*\*kwargs](#org4249881)
2.  [Debugging](#org554c1ff)
3.  [Generators](#org6bab0dd)
    1.  [Iterable](#org88088d4)
    2.  [Iterator](#orgb9fe8a6)
    3.  [Iteration](#orgf080c9b)
    4.  [Generators](#org492648f)
4.  [Map, Filter and Reduce](#org781b845)
    1.  [Map](#orgd0dfe12)
    2.  [Filter](#org59ce364)
    3.  [Reduce](#org661e6e7)
5.  [**set** Data Structure](#orgaf351a2)
6.  [Ternary Operators](#orgcd6d2d3)
7.  [Decorators](#org2f978a2)
    1.  [Everything in Python is an object](#org95378f4)
    2.  [Defining functions within functions](#orgb329dfe)
    3.  [Returning functions from within functions](#org863464a)
    4.  [Giving a function as an argument to another function](#org56728cc)
    5.  [Writing your first decorator](#orgea3e8c1)
        1.  [Blueprint](#org72d6697)
        2.  [Use-cases](#orgb756967)
    6.  [Decorators with Arguments](#org7210ebb)
8.  [Global & Return](#org8f162b6)
    1.  [namedtuple](#orga3d717c)
9.  [Mutation](#org3ad7a9d)
10. [\_<sub>slots</sub>\_\_ Magic](#org4ecfe01)
11. [Virtual Environment](#org8d405eb)
12. [Collections](#org0238805)
    1.  [defaultdict](#org2c88ef2)
    2.  [OrderedDict](#orgef8ff1f)
    3.  [counter](#org657312e)
    4.  [deque](#org328c0c2)
    5.  [namedtuple](#org539d71c)
    6.  [enum.Enum](#orgdc89a59)
13. [Enumerate](#org8a6ec65)
14. [Object introspection](#orgd8c8003)
    1.  [dir](#org92b2dd6)
    2.  [type and id](#org0562517)
    3.  [inspect module](#org04faf03)
15. [Comprehensions](#org8338f88)
    1.  [list comprehensions](#orgf7f2b28)
    2.  [dict comprehensions](#org7c8cc8e)
    3.  [set comprehensions](#orgd35f7ad)
    4.  [generator comprehensions](#orgc027d98)
16. [Exceptions](#org6f4d80d)
    1.  [try/except](#org7364953)
    2.  [Handling multiple exceptions](#org738a53a)
        1.  [method 1](#org0cc9b59)
        2.  [method 2](#orgf9e2086)
        3.  [method 3 (This can be helpful when you have no idea about the exceptions which may be thrown by your program.)](#org045e79f)
    3.  [finally](#orgf7a7d53)
    4.  [try/else](#orga1a8ad5)
17. [Classes](#orgafe052a)
    1.  [Instance & Class variables](#orgfb362e9)
    2.  [New style classes (Python 3 only has new-style classes)](#orgdce7028)
    3.  [Magic Methods](#orgd3cb5c8)
        1.  [\_<sub>init</sub>\_\_](#orge6f99e0)
        2.  [\_<sub>getitem</sub>\_\_](#org852b9c6)
18. [Lambdas](#org0321bd7)
19. [One-Liners](#orgb67f240)
    1.  [Simple Web Server](#org060c857)
    2.  [Pretty Printing](#org9ec55c1)
    3.  [Profiling a script](#orgbc9db6d)
    4.  [CSV to json](#orgf322479)
    5.  [List Flattening](#orgf816c15)
    6.  [One-Line Constructors](#org8519c56)
20. [for/else](#org69d8863)
21. [Python C extensions](#orgd81e36d)
    1.  [CTypes](#org44afe6d)
    2.  [SWIG](#orgbd5edff)
    3.  [Python/C API](#org4a44412)
22. [**open** Function](#orgec2e17b)
23. [Targeting Python 2+3](#orgb775cf8)
    1.  [future imports](#org815834d)
    2.  [dealing with module renaming](#orga98d233)
    3.  [obsolete python2 builtins](#org2f4e65c)
    4.  [external standard-library backports](#org58a4ba8)
24. [Coroutines](#orge096ff0)
25. [Function caching](#org259f4a9)
26. [Context Managers](#org979ac9e)
    1.  [Implementing a Context Manager as a Class](#org202c83f)
    2.  [Handling Exceptions](#org023ea78)
    3.  [Implementing a Context Manager as a Generator](#org862d226)

<http://book.pythontips.com/en/latest/index.html>


<a id="org4249881"></a>

# \*args and \*\*kwargs

-   \*args: non-keyworded
    \*\*kwargs: allow you to pass keyworded variable length of arguments to a function


<a id="org554c1ff"></a>

# Debugging

-   python debugger (pdb)
-   running from command line:
    python -m pdb my<sub>script.py</sub>
-   running from inside a script: (using pdb.set<sub>trace</sub>() to set break points)
    import pdb
    def make<sub>bread</sub>():
        pdb.set<sub>trace</sub>()
        return "I don't have time"
    
    print(make<sub>bread</sub>())
-   commands:
    c: continue execution
    w: show context of current line it is executing
    a: print the argument list of current function
    s: execute the current line and stop at the first possible occasion
    n: continue execution until the next line in the current function is reached or it returns


<a id="org6bab0dd"></a>

# Generators

An iterator is an object that enables a programmer to traverse a container, particularly lists.
However, an iterator performs traversal and gives access to data elements in a container, but does not perform iteration.


<a id="org88088d4"></a>

## Iterable

An iterable is any object in Python which has an <span class="underline"><span class="underline">iter</span></span> or a <span class="underline"><span class="underline">getitem</span></span> method defined which returns an iterator or can take indexes.
In short an iterable is any object which can provide us with an iterator.


<a id="orgb9fe8a6"></a>

## Iterator

An iterator is any object in Python which has a next (Python2) or <span class="underline"><span class="underline">next</span></span> method defined.


<a id="orgf080c9b"></a>

## Iteration

In simple words it is the process of taking an item from something e.g a list. When we use a loop to loop over something it is called iteration. It is the name given to the process itself.


<a id="org492648f"></a>

## Generators

Generators are iterators, but you can only iterate over them once.
It’s because they do not store all the values in memory, they generate the values on the fly.
You use them by iterating over them, either with a ‘for’ loop or by passing them to any function or construct that iterates.
Most of the time generators are implemented as functions. However, they do not return a value, they **yield** it.
Generators are best for calculating large sets of results (particularly calculations involving loops themselves) where you don’t want to allocate the memory for all results at the same time.
Fibonacci example:
def fibon(n):
    a = b = 1
    for i in range(n):
        yield a
        a, b = b, a+b

for x in fibon(1000):
    print(x)

-   next() allows us to access next element of a sequence


<a id="org781b845"></a>

# Map, Filter and Reduce


<a id="orgd0dfe12"></a>

## Map

-   Map applies a function to all the items in an input<sub>list</sub>.
    map(function<sub>to</sub><sub>apply</sub>, list<sub>of</sub><sub>inputs</sub>)
-   exp:
    items = [1,2,3,4,5]
    squared = list(map(lambda x: x\*\*2 , items))


<a id="org59ce364"></a>

## Filter

-   Filter creates a list of elements for which a function returns true.
-   exp:
    number<sub>list</sub> = range(-5,5)
    less<sub>than</sub><sub>zero</sub> = list(filter(lambda x: x<0, number<sub>list</sub>))


<a id="org661e6e7"></a>

## Reduce

-   Reduce applies a rolling computation to sequential pairs of values in a list.
-   exp:
    from functools import reduce
    product = reduce((lambda x,y: x\*y), [1,2,3,4]) # 24


<a id="orgaf351a2"></a>

# **set** Data Structure

-   set is similary to list, but it can't contain duplicate values
-   exp:
    valid = set(['yellow', 'red', 'blue', 'green', 'black'])
    input<sub>set</sub> = set(['red', 'brown'])
    input<sub>set.intersection</sub>(valid) # set(['red'])
    input<sub>set.difference</sub>(valid) # set(['brown'])


<a id="orgcd6d2d3"></a>

# Ternary Operators

-   Ternary operators are more commonly known as conditional expressions in Python.
-   Blueprint:
    condition<sub>if</sub><sub>true</sub> if condition else condition<sub>if</sub><sub>false</sub>
-   exp:
    condition = True
    state = "nice" if condition else "not nice"
-   ShortHand Ternary
    True or "Some" # True
    False or "Some" # 'Some'
    output = None
    msg = output or "No data returned" # No data returned


<a id="org2f978a2"></a>

# Decorators

Decorators are functions which modify the functionality of other functions.


<a id="org95378f4"></a>

## Everything in Python is an object


<a id="orgb329dfe"></a>

## Defining functions within functions


<a id="org863464a"></a>

## Returning functions from within functions


<a id="org56728cc"></a>

## Giving a function as an argument to another function

-   Decorators let you execute code before and after a function.
-   exp:
    def hi():
        return "hi yang!"
    
    def doSomethingBeforeHi(func):
        print("doing sth before executing hi()")
        print(func())
    
    doSomethingBeforeHi(hi)


<a id="orgea3e8c1"></a>

## Writing your first decorator


<a id="org72d6697"></a>

### Blueprint

from functools import wraps
def decorator<sub>name</sub>(f):
    @wraps(f)
    def decorated(\*args, \*\*kwargs):
        if not can<sub>run</sub>:
            return "Function will not run"
        return f(\*args, \*\*kwargs)
    return decorated

@decorator<sub>name</sub>
def func():
    return("Function is running")


<a id="orgb756967"></a>

### Use-cases

-   web authorization
-   logging


<a id="org7210ebb"></a>

## Decorators with Arguments


<a id="org8f162b6"></a>

# Global & Return

Don't use global.


<a id="orga3d717c"></a>

## namedtuple

from collections import namedtuple
def profile():
    Person = namedtuple('Person', 'name age')
    return Person(name="Danny", age=31)

p = profile()

p.name, p.age

p[0], p[1]

name, age = profile()


<a id="org3ad7a9d"></a>

# Mutation

mutable means ‘able to be changed’ and immutable means ‘constant’

-   In Python the default arguments are evaluated once when the function is defined, not each time the function is called.
    You should never define default arguments of mutable type unless you know what you are doing.


<a id="org4ecfe01"></a>

# \_<sub>slots</sub>\_\_ Magic

Python uses a dict to store an object's instance attributes, which sucks a lot of RAM.
Using <span class="underline"><span class="underline">slots</span></span> to tell python not to use a dict, and only allocate space for a fixed set of attributes.
Exp:

class MyClass(object):
    def \_<sub>init</sub>\_<sub>(self, name, id)</sub>:
        self.name = name
        self.id = id
        self.set<sub>up</sub>()

class MyClass(object):
    <span class="underline"><span class="underline">slots</span></span> = ['name', 'id']
    def \_<sub>init</sub>\_<sub>(self, name, id)</sub>:
        self.name = name
        self.id = id
        self.set<sub>up</sub>()


<a id="org8d405eb"></a>

# Virtual Environment

virtualenv


<a id="org0238805"></a>

# Collections

container data types


<a id="org2c88ef2"></a>

## defaultdict

-   Unlike dict, with defaultdict you do not need to check whether a key is present or not
-   One other very important use case is when you are appending to nested lists inside a dictionary.

If a key is not already present in the dictionary then you are greeted with a KeyError. 
defaultdict allows us to circumvent this issue in a clever way.

-   Exp:

some<sub>dict</sub> = []
some<sub>dict</sub>['colours']['favourite'] = "yellow" # Raises KeyError: 'colours'

from collections import defaultdict
tree = lambda: defaultdict(tree)
some<sub>dict</sub> = tree()
some<sub>dict</sub>['colours']['favourite'] = "yellow"

import json
print(json.dumps(some<sub>dict</sub>))


<a id="orgef8ff1f"></a>

## OrderedDict

OrderedDict keeps its entries sorted as they are initially inserted.
Overwriting a value of an existing key doesn’t change the position of that key.
However, deleting and reinserting an entry moves the key to the end of the dictionary.

-   Problem:

colours =  {"Red" : 198, "Green" : 170, "Blue" : 160}
for key, value in colours.items():
    print(key, value)

Solution:
from collections import OrderedDict
colours = OrderedDict([("Red", 198), ("Green", 170), ("Blue", 160)])
for key, value in colours.items():
    print(key, value)


<a id="org657312e"></a>

## counter

Counter allows us to count the occurrences of a particular item.

-   exp:

from collections import Counter

colours = (
    ('Yasoob', 'Yellow'),
    ('Ali', 'Blue'),
    ('Arham', 'Green'),
    ('Ali', 'Black'),
    ('Yasoob', 'Red'),
    ('Ahmed', 'Silver'),
)

favs = Counter(name for name, colour in colours)
print(favs)

-   exp:

with open('filename', 'rb') as f:
    line<sub>count</sub> = Counter(f)
print(line<sub>count</sub>)


<a id="org328c0c2"></a>

## deque

from collections import deque
d = deque()
d.append()
d.extend()
d.extendleft()
d.popleft()
d.pop()


<a id="org539d71c"></a>

## namedtuple

from collections import namedtuple
Animal = namedtuple('Animal', 'name age type')
perry = Animal(name="perry", age=31, type="cat")
print(perry)

print(perry.name)

perry.<sub>asdict</sub>() # convert to dict

-   attributes in namedtuples are immutable


<a id="orgdc89a59"></a>

## enum.Enum

from collections import namedtuple
from enum import Enum

class Species(Enum):
    cat = 1
    dog = 2
    horse = 3
    owl = 4
    dragon = 5
    kitten = 1
    puppy = 2

Animal = namedtuple('Animal', 'name age type')
perry = Animal(name="Perry", age=31, type=Species.cat)
tom = Animal(name="Tom", age=2, type=Species.kitten)

-   three ways to access enumeration members:
    Species[1]
    Species['cat']
    Species.cat


<a id="org8a6ec65"></a>

# Enumerate

for counter, value in enumerate(some<sub>list</sub>):
    print(counter, value)

for counter, value in enumerate(some<sub>list</sub>, start<sub>index</sub>):
    print(counter, value)


<a id="orgd8c8003"></a>

# Object introspection


<a id="org92b2dd6"></a>

## dir

my<sub>list</sub> = [1,2,3]
dir(my<sub>list</sub>)


<a id="org0562517"></a>

## type and id

-   The type function returns the type of an object. For example:
    print(type(''))
    print(type([]))
    print(type(3))
-   id returns the unique ids of various objects. For instance:
    name = "Yang"
    print(id(name)


<a id="org04faf03"></a>

## inspect module

import inspect
print(inspect.getmembers(str))


<a id="org8338f88"></a>

# Comprehensions


<a id="orgf7f2b28"></a>

## list comprehensions

-   Blueprint:
    variable = [out<sub>exp</sub> for out<sub>exp</sub> in input<sub>list</sub> if out<sub>exp</sub> == 2]
-   exp:
    multiples = [i for i in range(30) if i%3 == 0]
    squared = [x\*\*2 for x in range(10)]


<a id="org7c8cc8e"></a>

## dict comprehensions

{v:k for k,v in some<sub>dict.items</sub>()}


<a id="orgd35f7ad"></a>

## set comprehensions

squared = {x\*\*2 for x in [1,1,2]}


<a id="orgc027d98"></a>

## generator comprehensions

multiples<sub>gen</sub> = (i for i in range(30) if i%3 == 0)
for x in multiples<sub>gen</sub>:
    print(x)


<a id="org6f4d80d"></a>

# Exceptions


<a id="org7364953"></a>

## try/except

try:
    file = open('test.txt', 'rb')
except IOError as e:
    print('An IOError occurred. {}'.format(e.args[-1]))


<a id="org738a53a"></a>

## Handling multiple exceptions


<a id="org0cc9b59"></a>

### method 1

try:
    file = open('test.txt', 'rb')
except (IOError, EOFError) as e:
    print("An error occurred. {}".format(e.args[-1]))


<a id="orgf9e2086"></a>

### method 2

try:
    file = open('test.txt', 'rb')
except EOFError as e:
    print("An EOF error occurred.")
    raise e
except IOError as e:
    print("An error occurred.")
    raise e


<a id="org045e79f"></a>

### method 3 (This can be helpful when you have no idea about the exceptions which may be thrown by your program.)

try:
    file = open('test.txt', 'rb')
except Exception as e:

raise e


<a id="orgf7a7d53"></a>

## finally

try:
    file = open('test.txt', 'rb')
except IOError as e:
    print('An IOError occurred. {}'.format(e.args[-1]))
finally:
    print("This would be printed whether or not an exception occurred!")


<a id="orga1a8ad5"></a>

## try/else

try:
    print('I am sure no exception is going to occur!')
except Exception:
    print('exception')
else:

    print('This would only run if no exception occurs. And an error here '
          'would NOT be caught.')
finally:
    print('This would be printed in every case.')


<a id="orgafe052a"></a>

# Classes


<a id="orgfb362e9"></a>

## Instance & Class variables

-   Instance variables are for data which is unique to every object
-   Class variables are for data shared between different instances of a class

class Cal(object):

pi = 3.142

def \_<sub>init</sub>\_<sub>(self, radius)</sub>:

self.radius = radius

def area(self):
    return self.pi \* (self.radius \*\* 2)

-   do not use mutable class variables


<a id="orgdce7028"></a>

## New style classes (Python 3 only has new-style classes)

-   Differences:
    1.  old base classes do not inherit from anything
    2.  New style base classes inherit from **object**
-   Exp:
    class OldClass():
        def \_<sub>init</sub>\_<sub>(self)</sub>:
    	print('I am an old class')
    
    class NewClass(object):
        def \_<sub>init</sub>\_<sub>(self)</sub>:
    	print('I am a new class')
    
    old = OldClass()
    new = NewClass()


<a id="orgd3cb5c8"></a>

## Magic Methods

Python’s classes are famous for their magic methods, commonly called **dunder** (double underscore) methods.


<a id="orge6f99e0"></a>

### \_<sub>init</sub>\_\_

class initializer, whenever an instance of a class is created, its <span class="underline"><span class="underline">init</span></span> method is called


<a id="org852b9c6"></a>

### \_<sub>getitem</sub>\_\_

Implementing getitem in a class allows its instances to use the [] (indexer) operator.
Exp:
class GetTest(object):
    def \_<sub>init</sub>\_<sub>(self)</sub>:
        self.info = {
            'name':'Yasoob',
            'country':'Pakistan',
            'number':12345812
        }

def \_<sub>getitem</sub>\_<sub>(self,i)</sub>:
    return self.info[i]

foo = GetTest()

foo['name']

foo['number']


<a id="org0321bd7"></a>

# Lambdas

-   lambdas are one line functions, they are anonymous
-   Blueprint:
    lambda argument: manipulate(argument)
-   Exp:
    add = lambda x,y: x+y
    a.sort(key=lambda x: x[1])


<a id="orgb67f240"></a>

# One-Liners


<a id="org060c857"></a>

## Simple Web Server

python -m SimpleHTTPServer

python -m http.server


<a id="org9ec55c1"></a>

## Pretty Printing

from pprint import pprint


<a id="orgbc9db6d"></a>

## Profiling a script

This can be extremely helpful in pinpointing the bottlenecks in your script:
python -m cProfile my<sub>script.py</sub>
(cProfile is a faster implementation of profile as it is written in C)


<a id="orgf322479"></a>

## CSV to json

python -c "import csv,json;print json.dumps(list(csv.reader(open('csv<sub>file.csv</sub>'))))"


<a id="orgf816c15"></a>

## List Flattening

You can quickly and easily flatten a list using **itertools.chain.from<sub>iterable</sub>** from the **itertools** package.
Exp:
a<sub>list</sub> = [[1, 2], [3, 4], [5, 6]]
print(list(itertools.chain.from<sub>iterable</sub>(a<sub>list</sub>)))

print(list(itertools.chain(\*a<sub>list</sub>)))


<a id="org8519c56"></a>

## One-Line Constructors

Avoid a lot of boilerplate assignments when initializing a class.

class A(object):
    def <span class="underline"><span class="underline">init\_<sub>(self, a, b, c, d, e, f)</sub>:
        self.\_<sub>dict</sub></span></span>.update({k: v for k, v in locals().items() if k != 'self'})


<a id="org69d8863"></a>

# for/else

-   else condition executes when no break happens
-   exp:

for item in container:
    if search<sub>something</sub>(item):

        process(item)
        break
else:

not<sub>found</sub><sub>in</sub><sub>container</sub>()

-   exp:

for n in range(2,10):
    for x in range(2,n):
        if n%x == 0:
            print(n, 'equals', x, '\*', n/x)
            break
    else:

print(n, 'is a prime number')


<a id="orgd81e36d"></a>

# Python C extensions

-   three key methods to call C functions from python code
-   C is about 50x faster than python
-   certain legacy C libraries work well, no need to rewrite in python
-   certain low level resource access &#x2013; from memory to file interfaces


<a id="org44afe6d"></a>

## CTypes

//file: add.c
//sample C file to add 2 numbers - int and floats

\#include <stdio.h>

int add<sub>int</sub>(int, int);
float add<sub>float</sub>(float, float);

int add<sub>int</sub>(int num1, int num2){
    return num1 + num2;
}

float add<sub>float</sub>(float num1, float num2){
    return num1 + num2;
}

-   compile the C file to .so/.dll file:
    gcc -shared -Wl,-soname,adder -o adder.so -fPIC add.c
-   now in python code:
    from ctypes import \*
    
    \#load the shared object file
    adder = CDLL('./adder.so')
    
    \#Find sum of integers
    res<sub>int</sub> = adder.add<sub>int</sub>(4,5)
    print "Sum of 4 and 5 = " + str(res<sub>int</sub>)
    
    \#Find sum of floats
    a = c<sub>float</sub>(5.5)
    b = c<sub>float</sub>(4.1)
    
    add<sub>float</sub> = adder.add<sub>float</sub>
    add<sub>float.restype</sub> = c<sub>float</sub>
    print "Sum of 5.5 and 4.1 = ", str(add<sub>float</sub>(a, b))


<a id="orgbd5edff"></a>

## SWIG


<a id="org4a44412"></a>

## Python/C API


<a id="orgec2e17b"></a>

# **open** Function

-   open(filename, mode)
    mode:
    r read
    r+ read and write
    overwrite w
    append a
    binary b
-   always use "with":
    with open('test.jpg', 'r+') as f:
        jpgdata = f.read()
-   pay attention to **encoding**


<a id="orgb775cf8"></a>

# Targeting Python 2+3

some tricks to make your program compatible with both python2 and python3


<a id="org815834d"></a>

## future imports

\_<sub>future</sub>\_\_ import allows you to import python3 functionality in python2
from <span class="underline"><span class="underline">future</span></span> import with<sub>statement</sub>


<a id="orga98d233"></a>

## dealing with module renaming

try:
    import urllib.request as urllib<sub>request</sub>  # for Python 3
except ImportError:
    import urllib2 as urllib<sub>request</sub>  # for Python 2


<a id="org2f4e65c"></a>

## obsolete python2 builtins

from future.builtins.disabled import \*


<a id="org58a4ba8"></a>

## external standard-library backports


<a id="orge096ff0"></a>

# Coroutines

Coroutines are similar to generators with a few differences. The main differences are:

1.  generators are data producers
2.  coroutines are data consumers
3.  generator exp:
    def fib():
        a,b = 0,1
        while 1:
    	yield a
    	a,b = b,a+b
4.  coroutine exp:
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
    
    search.close()


<a id="org259f4a9"></a>

# Function caching

Function caching allows us to cache the return values of a function depending on the arguments.

-   exp:
    from functools import lru<sub>cache</sub>
    
    @lru<sub>cache</sub>(maxsize=32)
    def fib(n):
        if n < 2:
    	return n
        return fib(n-1) + fib(n-2)
    
    >>> print([fib(n) for n in range(10)])
-   fib.cache<sub>clear</sub>()


<a id="org979ac9e"></a>

# Context Managers

Context managers allow you to allocate and release resources precisely when you want to.
The most widely used example of context manager is **with**.


<a id="org202c83f"></a>

## Implementing a Context Manager as a Class

-   a context manager has an <span class="underline"><span class="underline">enter</span></span> and <span class="underline"><span class="underline">exit</span></span> method defined
-   exp:
    class File(object):
        def \_<sub>init</sub>\_<sub>(self, file<sub>name</sub>, method)</sub>:
    	self.file<sub>obj</sub> = open(file<sub>name</sub>, method)
        def \_<sub>enter</sub>\_<sub>(self)</sub>:
    	return self.file<sub>obj</sub>
        def \_<sub>exit</sub>\_<sub>(self, type, value, traceback)</sub>:
    	return self.file<sub>obj.close</sub>()
    
    with File('demo.txt', 'w') as opened<sub>file</sub>:
        opened<sub>file.write</sub>('Hola!')


<a id="org023ea78"></a>

## Handling Exceptions

class File(object):
     def \_<sub>init</sub>\_<sub>(self, file<sub>name</sub>, method)</sub>:
         self.file<sub>obj</sub> = open(file<sub>name</sub>, method)
     def \_<sub>enter</sub>\_<sub>(self)</sub>:
         return self.file<sub>obj</sub>
     def \_<sub>exit</sub>\_<sub>(self, type, value, traceback)</sub>:
         print("Exception has been handled")
         self.file<sub>obj.close</sub>()
         return True

with File('demo.txt', 'w') as opened<sub>file</sub>:
    opened<sub>file.undefined</sub><sub>function</sub>()


<a id="org862d226"></a>

## Implementing a Context Manager as a Generator

from contextlib import contextmanager

@contextmanager
def open<sub>file</sub>(name):
    f = open(name, 'w')
    yield f
    f.close()

with open<sub>file</sub>('some<sub>file</sub>') as f:
    f.write('hola!')


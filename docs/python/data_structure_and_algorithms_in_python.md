# Data Structure and Algorithms in Python

## Chapter 1 Python Primer

### Built-in classes

|Class|Description|Immutable?|
|---|---|---|
|bool|boolean value|yes|
|int|integer|yes|
|float|floating-point number|yes|
|list|mutable sequence of objects|no|
|tuple|immutable sequence of objects|yes|
|str|character string|yes|
|set|unordered set of distinct objects|no|
|frozenset|immutable form of set class|yes|
|dict|associative mapping|no|

### Equality operators

|operator|desciption|
|---|---|
|`is`|same identity|
|`is not`|different identity|
|`==`|equivalent (value)|
|`!=`|not equivalent|

The expression a is b evaluates to true, precisely when identifiers a and b are
aliases for the same object. The expression a==b tests a more general notion of
equivalence (values are deemed equivalent).

### Sequence operators (str, tuple, list)

|operator syntaxes|description|
|---|---|
|s[j]|element at index j|
|s[start:stop]|slice including indices [start,stop)|
|s[start:stop:step]|slice with step|
|s+t|concatenation of sequences|
|k*s|shorthand for s+s+s+... (k times)|
|val in s|containment check|
|val not in s|non-containment check|

### Operators for dict

|operator syntaxes|description|
|---|---|
|d[key]|value associated with given key|
|d[key]=value|set (or reset) the value associated with given key|
|del d[key]|remove key and its associated value from dict|
|key in d|containment check|
|key not in d|non-containment check|
|d1==d2|d1 is equivalent to d2|
|d1!=d2|d1 is not equivalent to d2|

### Exception handling

|Exception name|Description|
|---|---|
|Exception|a base class for most error types|
|AttributeError|raised by syntax obj.foo if obj has no member named foo|
|EOFError|raised if "end of file" readed for console or file input|
|IOError|raised upon failure of I/O operation (e.g., opening file)|
|IndexError|raised if index to sequence is out of bounds|
|KeyError|raised if nonexistent key requested for set or dict|
|KeyboardInterrupt|raised if user types ctrl-C while program is executing|
|NameError|raised if nonexistent identifier used|
|StopIteration|raise by next(iterator) if no element|
|TypeError|raised when wrong type of parameter is sent to a function|
|ValueError|raised when parameter has invalid value|
|ZeroDivisionError|raised when any division operator used with 0 as divisor|

### Iterators and Generators

An iterator is an object that manages an iteration through a series of
values. `next(iterator)` produces a subsequent element with a StopIteration
exception raised to indicate that there are no further elements.

An iterable is an object, that produces an iterator via the syntax
iter(obj).

An instance of a list is an iterable, but not itself an iterator. With 
`data=[1,2,3,4]`, it's not legal to call `next(data)`. However, an iterator
object can be produced with syntax `i=iter(data)`, and then each subsequent
call to `next(i)` will return an element of that list.

The most convenient technique for creating iterators in Python is through the use of generators.

A generator is implemented with a syntax that is very similar to a function,
but instead of returning values, a `yield` statement is executed to indicate
each element of the series.

### Additional Python Conveniences

- Conditional Expressions `expr 1 if condition else expr2`
- Comprehension Syntax `[expression for value in iterable if condition]`
- Packing and Unpacking of Sequences
    ```python
    data = 2,4,6,8 # same as data = (2,4,6,8)
    return x,y # returns a tuple (x,y)
    a,b,c,d = range(7,11) # a=7,b=8,c=9,d=10
    ```

## Chapter 2 Object-Oriented Programming

- OO design goals: robustness, adaptability, and reusability
- OO design principles: modularity, abstraction, encapsulation

## Chapter 3 Algorithm Analysis

Big-O notation

## Chapter 4 Recursion



## Chapter 5 Array-Based Sequences

## Chapter 6 Stacks, Queues, and Deques

## Chapter 7 Linked Lists

## Chapter 8 Trees

## Chapter 9 Priority Queues

## Chapter 10 Maps, Hash Tables, and Skip Lists

## Chapter 11 Search Trees

## Chapter 12 Sorting and Selection

## Chapter 13 Text Processing

## Chapter 14 Graph Algorithms

## Chapter 15 Memory Management and B-Trees

# Data Structure and Algorithms in Python

## Chapter 1 Python Primer

### Built-in classes

| Class     | Description                       | Immutable? |
| --------- | --------------------------------- | ---------- |
| bool      | boolean value                     | yes        |
| int       | integer                           | yes        |
| float     | floating-point number             | yes        |
| list      | mutable sequence of objects       | no         |
| tuple     | immutable sequence of objects     | yes        |
| str       | character string                  | yes        |
| set       | unordered set of distinct objects | no         |
| frozenset | immutable form of set class       | yes        |
| dict      | associative mapping               | no         |

### Equality operators

| operator | desciption         |
| -------- | ------------------ |
| `is`     | same identity      |
| `is not` | different identity |
| `==`     | equivalent (value) |
| `!=`     | not equivalent     |

The expression a is b evaluates to true, precisely when identifiers a and b are
aliases for the same object. The expression a==b tests a more general notion of
equivalence (values are deemed equivalent).

### Sequence operators (str, tuple, list)

| operator syntaxes  | description                          |
| ------------------ | ------------------------------------ |
| s[j]               | element at index j                   |
| s[start:stop]      | slice including indices [start,stop) |
| s[start:stop:step] | slice with step                      |
| s+t                | concatenation of sequences           |
| k\*s               | shorthand for s+s+s+... (k times)    |
| val in s           | containment check                    |
| val not in s       | non-containment check                |

### Operators for dict

| operator syntaxes | description                                        |
| ----------------- | -------------------------------------------------- |
| d[key]            | value associated with given key                    |
| d[key]=value      | set (or reset) the value associated with given key |
| del d[key]        | remove key and its associated value from dict      |
| key in d          | containment check                                  |
| key not in d      | non-containment check                              |
| d1==d2            | d1 is equivalent to d2                             |
| d1!=d2            | d1 is not equivalent to d2                         |

### Exception handling

| Exception name    | Description                                               |
| ----------------- | --------------------------------------------------------- |
| Exception         | a base class for most error types                         |
| AttributeError    | raised by syntax obj.foo if obj has no member named foo   |
| EOFError          | raised if "end of file" readed for console or file input  |
| IOError           | raised upon failure of I/O operation (e.g., opening file) |
| IndexError        | raised if index to sequence is out of bounds              |
| KeyError          | raised if nonexistent key requested for set or dict       |
| KeyboardInterrupt | raised if user types ctrl-C while program is executing    |
| NameError         | raised if nonexistent identifier used                     |
| StopIteration     | raise by next(iterator) if no element                     |
| TypeError         | raised when wrong type of parameter is sent to a function |
| ValueError        | raised when parameter has invalid value                   |
| ZeroDivisionError | raised when any division operator used with 0 as divisor  |

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

Recursion is a technique by which a function makes one or more calls to itself during execution, or by which a data structure relies upon smaller instances of the very same type of structure in its representation.

In general, an algorithm uses recursion typically has the following form: 1)
Test for base case; 2) Recur.

Tail recursion: a recursion is a tail recursion if any recursive call that is
made from one context is the very last operation in that context, with the
return value of the recursive call (if any) immediately returned by the
enclosing recursion. A tail recursion must be a linear recursion.

若函数在尾位置调用自身（或是一个尾调用本身的其他函数等等），则称这种情况为尾递归。特点：1）在尾部调用的是函数自身 (self-called)；2）可通过优化，使得计算仅占用常量栈空间 (stack space)。

```python
def recsum(x):
    if x == 1:
        return x
    else:
        return x + recsum(x - 1)


def tail_recsum(x, running_total=0):
    if x == 0:
        return running_total
    else:
        return tail_recsum(x - 1, running_total + x)
```

尾递归，比线性递归多一个参数，这个参数是上一次调用函数得到的结果；所以，关键点在于，尾递归每次调用都在收集结果，避免了线性递归不收集结果只能依次展开消耗内存的坏处。

## Chapter 5 Array-Based Sequences

Built-in "sequence" classes: list, tuple, str.

An implementation of a DynamicArray class, using a raw array from the _ctypes_
module as storage.

```python
import ctypes


class DynamicArray(object):
    def __init__(self):
        self._n = 0  # count actual elements
        self._capacity = 1  # default array capacity
        self._A = self._make_array(self._capacity)  # low-level array

    def __len__(self):
        return self._n

    def __getitem__(self, k):
        if not 0 <= k < self._n:
            raise IndexError('invalid index')
        return self._A[k]

    def append(self, obj):
        if self._n == self._capacity:  # not enough room
            self._resize(2 * self._capacity)
        self._A[self._n] = obj
        self._n += 1

    def _resize(self, c):
        """ resize internal array to capacity c """
        B = self._make_array(c)
        for k in range(self._n):
            B[k] = self._A[k]
        self._A = B
        self._capacity = c

    def _make_array(self, c):
        return (c * ctypes.py_object)()

    def insert(self, k, value):
        """ insert value at index k, shifting subsequent values rightward """
        # assume 0<=k<=n
        if self._n == self._capacity:
            self._resize(2 * self._capacity)
        for j in range(self._n, k, -1):
            self._A[j] = self._A[j - 1]
        self._A[k] = value
        self._n += 1

    def remove(self, value):
        """ remove first occurrence of value (or raise ValueError) """
        for k in range(self._n):
            if self._A[k] == value:
                for j in range(k, self, _n - 1):  # shift others to fill gap
                    self._A[j] = self._A[j + 1]
                self._A[self._n - 1] = None  # garbage collection
                self._n -= 1
                return
            raise ValueError('value not found')
```

## Chapter 6 Stacks, Queues, and Deques

- Stacks (LIFO)

  ADT

| Operation    | Description                                                                                          |
| ------------ | ---------------------------------------------------------------------------------------------------- |
| S.push(e)    | add element e to the top of stack S                                                                  |
| S.pop()      | remove and return the top element from stack S; an error occurs if the stack is empty                |
| S.top()      | return a reference to the top element of stack S, without removing it; an error occurs if S is empty |
| S.is_empty() | return True if stack S does not contain any elements                                                 |
| len(S)       | return number of elements in stack S                                                                 |

- Queues (FIFO)

  ADT

| Operation                                          | Description                                                                             |
| -------------------------------------------------- | --------------------------------------------------------------------------------------- |
| Q.enqueue(e)                                       | add element e to the back of queue Q                                                    |
| Q.dequeue()                                        | remove and return the first element from queue Q; an error occurs if the stack is empty |
| Q.first()                                          | return a reference to the element at the front of queue Q, without                      |
| removing it; an error occurs if the queue if empty |
| Q.is_empty()                                       | return True if Queue Q does not contain any elements                                    |
| len(Q)                                             | return number of elements in queue Q                                                    |

- Deques (Double-Ended Queues)

  ADT

| Operation        | Description                                                                                      |
| ---------------- | ------------------------------------------------------------------------------------------------ |
| D.add_first(e)   | add element e to the front of deque D                                                            |
| D.add_last(e)    | add to the back                                                                                  |
| D.delete_first() | remove and return the first element from deque D; an error occurs if the deque is empty          |
| D.delete_last()  | remove and return the last element from deque D; an error occurs if the deque is empty           |
| D.first()        | return (but do not remove) the first element from deque D; an error occurs if the deque is empty |
| D.last()         | return (but do not remove) the last element from deque D; an error occurs if the deque is empty  |
| D.is_empty()     | return True if deque D does not contain any elements                                             |
| len(D)           | return number of elements in dequeue D                                                           |

| collections.deque | Description                        |
| ----------------- | ---------------------------------- |
| len(D)            | number of elements                 |
| D.appendleft()    | add to beginning                   |
| D.append()        | add to end                         |
| D.popleft()       | remove from beginning              |
| D.pop()           | remove from end                    |
| D[0]              | access first element               |
| D[-1]             | access last element                |
| D[j]              | access arbitrary entry by index    |
| D[j]=val          | modify arbitrary entry by index    |
| D.clear()         | clear all contents                 |
| D.rotate(k)       | circularly shift rightward k steps |
| D.remove(e)       | remove first matching element      |
| D.count(e)        | count number of matches for e      |

## Chapter 7 Linked Lists

```python
# a lightweight _Node class for a singly linked list
class _Node(object):
    __slots__ = '_element', '_next'

    def __init__(self, element, next):
        self._element = element
        self._next = next
```

- circularly linked list: tail points to the head
- doubly linked list: each node keeps an explicit reference to the node before it and a reference to the node after it

## Chapter 8 Trees

## Chapter 9 Priority Queues

## Chapter 10 Maps, Hash Tables, and Skip Lists

## Chapter 11 Search Trees

## Chapter 12 Sorting and Selection

## Chapter 13 Text Processing

## Chapter 14 Graph Algorithms

## Chapter 15 Memory Management and B-Trees

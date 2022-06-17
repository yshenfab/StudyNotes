# Python Cookbook (3rd Edition)

## Chap 1 数据结构和算法
list, set, dict, collections module

- 找到最大or最小的n个元素
```python
# nlargest(), nsmallest()
import heapq
nums = [1,8,23,7,-4,18,23,42,37,2]
heapq.nlargest(3, nums) # [42,37,23]
heapq.nsmallest(3, nums) # [-4,1,2]

portfolio = [
    {'name': 'IBM', 'shares': 100, 'price': 91.1},
    {'name': 'APPLE', 'shares': 50, 'price': 543.22},
    {'name': 'FB', 'shares': 200, 'price': 21.09},
    {'name': 'YHOO', 'shares': 35, 'price': 31.75},
    {'name': 'ACME', 'shares': 45, 'price': 16.35}
]
cheap = heapq.nsmallest(3, portfolio, key=lambda s: s['price'])
expensive = heapq.nlargest(3, portfolio, key=lambda s: s['price'])
```

- 实现优先级队列，以给定优先级对元素排序，且每次pop都返回优先级最高的元素
```python
import heapq
class PriorityQueue:
    def __init__(self):
        self._queue = []
        self._index = 0

    def push(self, item, priority):
        heapq.heappush(self._queue, (-priority, self._index, item))
        self._index += 1

    def pop(self):
        return heapq.heappop(self._queue)[-1]
```

- 在dict中将key映射到多个value上(multidict)
```python
d = {
    'a': [1,2,3],
    'b': [4,5]
}

from collections import defaultdict 

d = defaultdict(list)
d['a'].append(1)
d['a'].append(2)
d['b'].append(4)

d = defaultdict(set)
d['a'].add(1)
d['a'].add(2)
d['b'].add(3)
```

- 让字典保持有序
```python
from collections import OrderedDict
d = OrderedDict
d['foo'] = 1
d['bar'] = 2
d['spam'] = 3
d['grok'] = 4

# outputs "foo 1", "bar 2", "spam 3", "grok 4"
for key in d:
    print(key, d[key])

import json
json.dump(d) #  {"foo": 1, "bar": 2, "spam": 3, "grok": 4}
```
OrderedDict内部维护了一个双向链表，根据元素加入的顺序来排列key的位置。第一个新加入的元素被放置在链表的末尾，接下来对已存在的key做重新赋值不会改变key的顺序。OrderedDict的大小是普通dict的2倍。

- dict相关的计算，用zip()，排序用sorted()
```python
prices = {
    'ACME': 45.23,
    'AAPL': 612.78,
    'IBM': 205.55,
    'HPQ': 37.20,
    'FB': 10.75
}

min_price = min(zip(prices.values(), prices.keys()))
# min_price is (10.75, 'FB')
max_price = max(zip(prices.values(), prices.keys()))
# max_price is (612.78, 'AAPL')
prices_sorted = sorted(zip(prices.values(), prices.keys()))
# zip()创建了一个迭代器，它的内容只能被消费一次
prices_and_names = zip(prices.values(), prices.keys())
print(min(prices_and_names))  # OK
print(max(prices_and_names))  # ValueError: max() arg is an empty sequence
```

- 在两个dict中寻找相同点
```python
a = {'x': 1, 'y': 2, 'z': 3}
b = {'w': 10, 'x': 11, 'y': 2}
# keys() or items()
# find keys in common
a.keys() & b.keys()  # {'x', 'y'}
# find keys in a not in b
a.keys() - b.keys()  # {'z'}
# find (key, value) pairs in common
a.items() & b.items()  # {('y', 2)}
# make a new dict with certain keys removed
c = {key: a[key] for key in a.keys() - {'z', 'w'}}
# c is {'x': 1, 'y': 2}
```

- 从序列中去掉重复元素，且保持顺序不变
```python
# if items in sequence is hashable, use set and generator
def dedupe(items):
    seen = set()
    for item in items:
        if item not in seen:
            yield item
            seen.add(item)


a = [1, 5, 2, 1, 9, 1, 5, 10]
list(dedupe(a))  # [1,5,2,9,10]


# if not hashable
def dedupe2(items, key=None):
    seen = set()
    for item in items:
        val = item if key is None else key(item)
        if val not in seen:
            yield item
            seen.add(val)


a = [{'x': 1, 'y': 2}, {'x': 1, 'y': 3}, {'x': 1, 'y': 2}, {'x': 2, 'y': 4}]
list(dedupe2(a, key=lambda d: (d['x'], d['y'])))
# [{'x': 1, 'y': 2}, {'x': 1, 'y': 3}, {'x': 2, 'y': 4}]
list(dedupe2(a, key=lambda d: d['x']))
# [{'x': 1, 'y': 2}, {'x': 2, 'y': 4}]
```

- 找出序列中出现次数最多的元素
```python
from collections import Counter

words = [blablabla]
word_counts = Counter(words)
top_three = word_counts.most_common(3)
```

- 通过公共键对字典列表排序
```python
from operator import itemgetter

rows = [{'name': 'Yang', 'uid': 1001}, {'name': 'James', 'uid': 1003}]

rows_by_name = sorted(rows, key=itemgetter('name'))
rows_by_uid = sorted(rows, key=itemgetter('uid'))
# use lambda expression to replace itemgetter (itemgetter runs faster)
rows_by_name = sorted(rows, key=lambda r: r['name'])
rows_by_uid = sorted(rows, key=lambda r: r['uid'])
```


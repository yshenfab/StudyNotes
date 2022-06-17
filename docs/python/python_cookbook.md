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

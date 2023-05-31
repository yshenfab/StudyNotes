# Effective Python: 59 Specific Ways to Write Better Python

Effective Python: 编写高质量 Python 代码的 59 个有效方法

## 用 Pythonic 方式来思考

用生成器表达式来改写数据量较大的列表推导

```python
value = [len(x) for x in open('test.txt')]
print(value) # [100, 57, 15, 1, 11]
it = (len(x) for x in open('test.txt'))
print(it) # <generator object <genexpr> at 0x101b81480>
print(next(it)) # 100
print(next(it)) # 57
roots = ((x, x**0.5) for x in it)
```

## 函数

尽量用 exception 表示特殊情况，而不要返回 None

## Other Books

- Fluent Python (流畅的 Python)
- Core Python programming (Python 核心编程)
- Python Cookbook
- 编写高质量代码：改善 Python 程序的 91 个建议

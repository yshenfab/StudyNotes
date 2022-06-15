# Dive into Deep Learning

## Preface
Key components: data, model, objective function, algorithm (调整模型参数以优化目标函数)

### 监督学习
#### 回归Regression
- 问题类型的本质是输出决定的，输出是一个实值
- 判断回归问题的一个很好的经验法则是，任何有关“多少”的问题很可能就是回归问题
- 例：手术需要多少小时？未来6小时会有多少降雨量？预测用户对一部电影的评分是多少？
- 学习最小化“预测值和实际标签值的差异”的模型，关注最小化平方误差损失函数(MSE)

#### 分类Classification
- “哪一个？”的问题叫做分类，模型预测样本属于哪个类别
- 分类问题常见的损失函数是交叉熵cross-entropy

R## 无监督学习
数据中不含有"目标"的问题为无监督学习
- 聚类 clustering
- 主成分分析 principal component analysis
    (PCA)：找到少量参数准确捕捉数据的线性相关属性
- 因果关系 causality
- 概率图模型 probabilistic graphical models
- 生成对抗网络 GAN

### 强化学习

## 预备知识
- 范数norm：一个向量的范数告诉我们一个向量有多大。向量范数是将向量映射到标量的函数。L1范数表示向量元素的绝对值之和，L2范数表示向量元素平方和的平方根。深度学习中经常使用L2范数的平方。
- optimization用模型拟合数据 + generalization运用于训练数据外的数据

## 线性神经网络
回归（regression）是能为一个或多个自变量与因变量之间关系建模的一类方法，回归经常用来表示输入和输出之间的关系。

梯度下降（gradient descent）通过不断地在损失函数递减的方向上更新参数来降低误差。梯度下降最简单的用法是计算损失函数（数据集中所有样本的损失均值） 关于模型参数的导数（在这里也可以称为梯度）。 但实际中的执行可能会非常慢：因为在每一次更新参数之前，我们必须遍历整个数据集。 因此，我们通常会在每次需要计算更新的时候随机抽取一小批样本， 这种变体叫做小批量随机梯度下降（minibatch stochastic gradient descent）。

可以调整但不在训练过程中更新的参数称为超参数（hyperparameter），比如batch size, learning rate等。

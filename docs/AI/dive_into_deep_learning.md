# Dive into Deep Learning 动手学深度学习

- [d2l](https://d2l.ai/) [github](https://github.com/d2l-ai/d2l-en)
- [d2l cn](https://zh.d2l.ai/) [github](https://github.com/d2l-ai/d2l-zh)
- [online course](https://space.bilibili.com/1567748478/channel/seriesdetail?sid=358497)

## Introduction

### Key components

- data
- models: how to transform the data
- objective functions: usually minimize a loss function or cost function, quantifies how well (or badly) the model is doing
- optimization algorithms: adjust the model’s parameters to optimize the objective function (gradient descent)

### Supervised Learning

- Regression 回归: 输出是一个scalar的问题

  判断回归问题的一个很好的经验法则是，任何有关“多少”的问题很可能就是回归问题，例：手术需要多少小时？未来 6 小时会有多少降雨量？预测用户对一部电影的评分是多少？

  学习最小化“预测值和实际标签值的差异”的模型，关注最小化平方误差损失函数(MSE)

- Classification: “哪一个？”的问题叫做分类，模型预测样本属于哪个类别(输出是一个类别)，分类问题常见的损失函数是交叉熵 cross-entropy
- Tagging 标记: multi-label classification
- Search
- Recommender Systems
- Sequence Learning

### Supervised & Self-Supervised Learning

数据中不含有"目标"的问题为无监督学习

- Clustering 聚类
- Principal Component Analysis (PCA) 主成分分析：找到少量参数准确捕捉数据的线性相关属性
- Causality 因果关系
- Probabilistic Graphical Models 概率图模型
- Generative Adversarial Networks (GAN) 生成对抗网络

### Reinfocemen Learning

当环境可被完全观察到时，强化学习问题被称为马尔可夫决策过程（markov decision process）。 当状态不依赖于之前的操作时，我们称该问题为上下文赌博机（contextual bandit problem）。 当没有状态，只有一组最初未知回报的可用动作时，这个问题就是经典的多臂赌博机（multi-armed bandit problem）。

## Preliminaries

- 范数 norm：一个向量的范数告诉我们一个向量有多大。向量范数是将向量映射到标量的函数。L1 范数表示向量元素的绝对值之和，L2 范数表示向量元素平方和的平方根。深度学习中经常使用 L2 范数的平方。
- optimization 用模型拟合数据 + generalization 运用于训练数据外的数据

## 线性神经网络

回归（regression）是能为一个或多个自变量与因变量之间关系建模的一类方法，回归经常用来表示输入和输出之间的关系。

梯度下降（gradient descent）通过不断地在损失函数递减的方向上更新参数来降低误差。梯度下降最简单的用法是计算损失函数（数据集中所有样本的损失均值） 关于模型参数的导数（在这里也可以称为梯度）。 但实际中的执行可能会非常慢：因为在每一次更新参数之前，我们必须遍历整个数据集。 因此，我们通常会在每次需要计算更新的时候随机抽取一小批样本， 这种变体叫做小批量随机梯度下降（minibatch stochastic gradient descent）。

可以调整但不在训练过程中更新的参数称为超参数（hyperparameter），比如 batch size, learning rate 等。

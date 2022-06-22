# DL Notes

## Neural Network Embedding

- 传统DL方法应用在欧氏空间数据的特征方面，许多实际应用场景的数据是从非欧氏空间生成的。
- Neural Network Embedding: 将离散变量转变为连续向量的方式，减少离散变量的空间维数。
- 相对于one-hot来说，one-hot向量维数太大且过于稀疏，one-hot映射之间完全独立，不能表示不同类别之间的关系。
- Embedding方便可视化，比如通过降维到2-3维，popular的降维技术是t-Distributed
    Stochastic Neighbor Embedding (TSNE)

## Graph Neural Network (GNN)

[GNN Intro](https://zhuanlan.zhihu.com/p/136521625)

[GNN Survey](https://zhuanlan.zhihu.com/p/75307407)

- Graph Convolution Networks (GCN)

    将卷积从传统数据推广到图数据，核心思想是学习一个函数映射$f(.)$，通过映射，graph中的节点$v_i$可以聚合它自己的特征$x_i$与它的邻居特征$x_j,\ j\in N(v_i)$来生成节点$v_i$的新表示。

    GCN方法分两大类，基于谱 (spectral-based)和基于空间 (spatial-based)。后者近年来更popular。

- Graph Attention Networks

    通过注意力机制，放大数据中最重要的部分的影响。GNN在聚合过程中使用注意力，整合多个模型的输出，并生成面向重要目标的随机行走。

- Graph Autoencoders

    图自动编码器是一类Graph Embedding方法，目的是利用神经网络结构将图的顶点表示为低维向量。典型解决方案是利用多层感知机作为编码器来获取节点embedding，
    其中解码器重建节点的邻域统计信息。目前基于GCN的自编码器方法主要有Graph
    Autoencoder (GAE)和Adversarially Regularized Graph Autoencoder (ARGA)。

- Graph Generative Networks

    图生成网络的目标是在给定一组观察到的图的情况下生成新的图。图生成网络的许多方法都是特定于领域的。

- Graph Spatial-temporal Networks

    图时空网络同时捕捉时空图的时空相关性。时空图具有全局图结构，每个节点的输入随时间变化。

## Visualization

1. [PlotNeuralNet](https://github.com/HarisIqbal88/PlotNeuralNet) 
2. powerpoint/keynote/google docs，导出成矢量pdf

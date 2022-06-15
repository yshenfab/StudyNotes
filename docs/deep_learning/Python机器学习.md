
# Table of Contents

1.  [Notes](#org7c11c3e)
    1.  [深度学习基础](#org7dec9a6)
    2.  [深度学习实践](#orgee9f4b1)
        1.  [计算机视觉](#org179658e)
        2.  [文本和序列](#org4bfd420)
        3.  [高级实践](#org5d58489)
        4.  [生成式深度学习](#orga52d29a)
2.  [Algorithms](#org8f26f10)
3.  [Tools](#orgd73aa5c)



<a id="org7c11c3e"></a>

# Notes


<a id="org7dec9a6"></a>

## 深度学习基础

-   相对于传统基于规则的符号主义（输入规则+数据，输出结果），机器学习是一种新的编程范式（输入数据+结果，输出规则）。
-   标量=0D张量，向量=1D张量，矩阵=2D张量，多个矩阵组合成一个新的数组=3D张量，多个3D张量组合成一个数组=4D张量，etc.
    深度学习一般处理0～4D张量，视频数据可能会遇到5D张量
-   神经网络的4个方面：1）层，多个层组合成网络or模型；2）输入数据和目标；3）损失函数，用于学习的反馈信号；4）优化器，决定学习过程如何进行。
-   损失函数:
    对于二分类问题，你可以使用二元交叉熵(binary crossentropy)损 失函数;
    对于多分类问题，可以用分类交叉熵(categorical crossentropy)损失函数;
    对于回归 问题，可以用均方误差(mean-squared error)损失函数;
    对于序列学习问题，可以用联结主义 时序分类(CTC，connectionist temporal classification)损失函数
-   K-fold validation: 样本数量少时，将数据划分划分为K个分区，对于每个分区i，在剩余的K-1个分区上训练模型，然后在分区i上评估模型，最终分数等于K个分数的平均值。
-   iterated K-fold validation with shuffling：类似K-fold，每次划分数据前先将数据打乱，计算代价较大
-   降低过拟合：深度学习模型擅长拟合训练数据，挑战在于泛化。
    1）减小网络/模型大小；
    2）权重正则化：让模型参数只能取较小的值，从而限制模型复杂度，使得权重值的分布更加规则。实现方法是在损失函数中加入与较大权重值相关的cost，常见的有L1，L2 regularization；
    1.  dropout正则化：对某一层使用dropout，就是在训练过程中随机将该层的一些输出特征舍弃（设置为0）。dropout比率一般在0.2~0.5。
-   常见问题及最后一层激活函数和损失函数
    
    <table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
    
    
    <colgroup>
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    </colgroup>
    <thead>
    <tr>
    <th scope="col" class="org-left">问题</th>
    <th scope="col" class="org-left">最后一层激活</th>
    <th scope="col" class="org-left">损失函数</th>
    </tr>
    </thead>
    
    <tbody>
    <tr>
    <td class="org-left">二分类问题</td>
    <td class="org-left">sigmoid</td>
    <td class="org-left">binary<sub>crossentropy</sub></td>
    </tr>
    
    
    <tr>
    <td class="org-left">多分类、单标签问题</td>
    <td class="org-left">softmax</td>
    <td class="org-left">categorical<sub>crossentropy</sub></td>
    </tr>
    
    
    <tr>
    <td class="org-left">多分类、多标签问题</td>
    <td class="org-left">sigmoid</td>
    <td class="org-left">binary<sub>crossentropy</sub></td>
    </tr>
    
    
    <tr>
    <td class="org-left">回归到任意值</td>
    <td class="org-left">无</td>
    <td class="org-left">mse</td>
    </tr>
    
    
    <tr>
    <td class="org-left">回归到0-1范围内的值</td>
    <td class="org-left">sigmoid</td>
    <td class="org-left">mse / binary<sub>crossentropy</sub></td>
    </tr>
    </tbody>
    </table>
-   模型正则化与调节超参数（最费时间）
    1）添加dropout；
    2）尝试不同架构：增加or减少层数；
    3）添加L1和/或L2正则化；
    4）尝试不同的超参数（比如每层的单元个数or优化器的学习率）；
    5）（可选）反复做特征工程：添加新特征或删除没有信息量的特征。


<a id="orgee9f4b1"></a>

## 深度学习实践


<a id="org179658e"></a>

### 计算机视觉

-   解决过拟合：数据增强(data augmentation)
-   Models: VGG, ResNet, Inception, Inception-ResNet, Xception, etc.
-   使用预训练模型有两种方法：特征提取（feature extration）和微调模型（fine-tuning）
-   CNN的可视化：中间输出（中间激活）、过滤器、类激活的热力图


<a id="org4bfd420"></a>

### 文本和序列

-   文本向量化，分割成的单元叫做标记(token)，分解的过程叫分词(tokenization)。
-   向量与token关联的方法：1）one-hot encoding；2）token embedding


<a id="org5d58489"></a>

### 高级实践


<a id="orga52d29a"></a>

### 生成式深度学习


<a id="org8f26f10"></a>

# Algorithms

-   LSTM (long short-term memory)
-   Optimizer: SGD, Adagrad, RMSProp
-   Adam


<a id="orgd73aa5c"></a>

# Tools

-   基本库：BLAS, Eigen, CUDA, cuDNN
-   XGBoost
-   Keras


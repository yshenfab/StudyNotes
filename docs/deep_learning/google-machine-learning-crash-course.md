
# Table of Contents

1.  [Google Machine Learning crash course](#orgea58435)
    1.  [编程中的一些参数名说明](#orgdf01523)
    2.  [泛化、防止过拟合](#org4b0e132)
    3.  [表示法：特征工程](#org9bab7cf)
        1.  [良好特征的特点](#orgb4674b1)
        2.  [数据清理](#org22b505b)
    4.  [特征组合(Feature Cross)](#org4b5da39)
    5.  [简化正则化(Regularization for Simplicity)](#org3c29828)
        1.  [降低模型的复杂度](#org5847e37)
        2.  [L2正则化（L2权重衰减）](#org8935182)
    6.  [逻辑回归(Logistic Regression)](#org1e49989)
        1.  [逻辑回归的损失函数是对数损失函数](#org402ca0b)
        2.  [S型函数](#orgb1a5e45)
        3.  [逻辑回归中的正则化](#orgd8bb3c5)
    7.  [分类(Classification)](#org2ee83e7)
        1.  [选定阈值](#orga9999a0)
        2.  [评估指标](#orgf7db782)
    8.  [稀疏性正则化(Regularization for Sparsity)](#orgf50bc4f)
        1.  [L1正则化](#orgfc4c483)
        2.  [L1和L2正则化比较](#org533eaf4)
    9.  [神经网络简介](#org5629540)
    10. [训练神经网络](#orgbfc053b)
    11. [多类别神经网络 (Multi-Class Neural Networks)](#org3a6241c)
        1.  [一个标签与多个标签](#org3553ebc)
    12. [嵌套(Embedding)](#org827f621)


<a id="orgea58435"></a>

# Google Machine Learning crash course

<https://developers.google.cn/machine-learning/crash-course/ml-intro>


<a id="orgdf01523"></a>

## 编程中的一些参数名说明

-   steps: 训练迭代总次数，一步计算一批样本产生的损失，然后用该值修改模型的权重一次
-   batch size: 单步的样本数量（随机选择）
-   total number of trained examples = batch size \* steps
-   periods: 控制报告的粒度。例如periods=7, steps=70，则每7次（或每10步）输出一次损失值
-   number of training examples in each period = batch size \* steps / periods


<a id="org4b0e132"></a>

## 泛化、防止过拟合

-   模型尽量简单
-   训练集、验证集（评估训练集的效果）、测试集（再次检查评估结果）


<a id="org9bab7cf"></a>

## 表示法：特征工程

-   即从原始数据中提取特征，表示为特征向量（大约花费机器学习75%的时间）
-   理想情况下，特征值取到相同范围
-   分箱技术
-   映射分类（枚举）值

例如颜色特征只包含3个可能的值{red, green, blue}
我们可能会将分类特征编码为枚举类型，例如0表示red，1表示green，2表示blue
**但是！机器学习模型通常将每个分类特征表示为单独的布尔值，颜色可以表示为3个单独的布尔值特征：**
x1: 是red吗？x2: 是green吗？x3: 是blue吗？
采用这种方法编码还可以简化某个值可能属于多个分类的情况，例如“非蓝色”对于red和green来说都是True


<a id="orgb4674b1"></a>

### 良好特征的特点

-   避免很少使用的离散特征值

良好的特征值应该在数据集中出现大约5次以上
例如house<sub>type特征可能包含大量样本</sub>，但unique<sub>house</sub><sub>id每个值只使用一次</sub>，就不适合作为特征

-   最好具有清晰明确的含义

例如house<sub>age</sub>: 27，但如果是house<sub>age</sub>: 851472000那就不便于理解了

-   不要将“神奇”的值与实际数据混为一谈

假设一个特征具有0-1之间的浮点值，例如quality<sub>rating</sub>: 0.82
不过，如果用户没有输入quality<sub>rating</sub>，则数据集可能使用如下神奇值来表示不存在该值：quality<sub>rating</sub>: -1
**为了解决遮盖问题，需要将该特征转换为2个特征：**
一个特征只存储质量评分，不含神奇值；一个特征存布尔值，表示是否提供了quality<sub>rating</sub>

-   考虑上游不稳定性

特征的定义不应该随时间发生变化，例如city<sub>id</sub>: "br/sao<sub>paulo</sub>"，但inferred<sub>city</sub><sub>cluster</sub>: "219"在未来运行其他模型时可能轻易发生变化


<a id="org22b505b"></a>

### 数据清理

-   缩放特征值

将多个特征都scale到[0,1]或[-1,1]
可以帮助梯度下降法更快收敛
可以避免NaN错误
可以帮助模型为每个特征确定合适的权重，如果没有进行特征缩放，模型会对范围较大的特征投入过多精力
如果相差范围不大，不用缩放，例如特征A的范围是[-1,1]，特征B的范围是[-3,3]

-   处理极端离群值

例如roomsPerPerson，大多值是1或2，但有个别值是40，可行的方法有：
1.取对数log
2.将特征值限制到4，即最大取4，这样并不意味着忽略大于4的值，而是大于4的值都取4

-   分箱
-   清查

检查遗漏数据，移除错误数据


<a id="org4b5da39"></a>

## 特征组合(Feature Cross)

-   即特征交叉，用来表示非线性组合信息
-   线性学习器如wowpal-wabit, sofia-ml  或  神经网络


<a id="org3c29828"></a>

## 简化正则化(Regularization for Simplicity)

-   即不要过于信赖样本


<a id="org5847e37"></a>

### 降低模型的复杂度

-   结构风险最小化 minimize: Loss(Data|Model) + complexity(Model)

一个是损失项，用于衡量模型与数据的拟合度，另一个是正则化项，用于衡量模型复杂度
旨在减少训练误差，同时平衡复杂度


<a id="org8935182"></a>

### L2正则化（L2权重衰减）

定义模型的复杂度： complexity(Model) = 权重的平方和
$L_2 retularization term = ||w||_2^2 = w_1^2 + w_2^2 + ... + w_n^2$

-   首选较小的权重，减少非常大的权重（会对超大权重进行惩罚）
-   偏离将会产生成本
-   对于线性模型，首选比较平缓的斜率
-   贝叶斯先验概率：权重应该以0为中心，权重应该呈正态分布

1.  L2正则化的损失函数

    正则化项乘以lambda，即
    $L(w, D) + \lambda ||w||_2^2$
    执行L2正则化对模型具有以下影响：
    
    -   使权重值接近于0（但并非正好为0）
    -   使权重的平均值接近于0，且呈正态分布
    
    1.  lambda值的选择
    
        目标是在简单化和训练数据拟合之间达到适当的平衡
        
        -   增加lambda值会增强正则化效果，减小lambda值会得出比较平缓的直方图
        -   lambda值过高，则模型会非常简单，会面临数据欠拟合的风险，模型将无法从训练数据中获得足够的信息来做出有用的预测
        -   lambda值过低，则模型会比较复杂，会面临数据过拟合的风险，模型将因获得过多训练数据特点方面的信息而无法泛化到新数据
        -   **理想的lambda值取决于数据** 因此需要手动或自动进行调整


<a id="org1e49989"></a>

## 逻辑回归(Logistic Regression)

逻辑回归会生成一个介于0到1之间（不包括0和1）的概率值，而不是确切地预测结果是0还是1


<a id="org402ca0b"></a>

### 逻辑回归的损失函数是对数损失函数

（线性回归的损失函数是平方损失）
$LogLoss = \sum_{(x,y)\in D} -ylog(y^')-(1-y)log(1-y^')$


<a id="orgb1a5e45"></a>

### S型函数

输出在0和1之间
$y = 1/(1+e^{-z})$


<a id="orgd8bb3c5"></a>

### 逻辑回归中的正则化

正则化在逻辑回归建模中极其重要。如果没有正则化，逻辑回归的渐近性会不断促使损失在高维度空间内达到0。
因此，大多数逻辑回归模型会使用以下两个策略之一来降低模型复杂性：

-   L2正则化
-   早停法，即，限制训练步数或学习速率。


<a id="org2ee83e7"></a>

## 分类(Classification)


<a id="orga9999a0"></a>

### 选定阈值

即将概率输出转换成二元输出的分类结果


<a id="orgf7db782"></a>

### 评估指标

True Positive, False Positive, False Negative, Ture Negative
以“狼来了”举例，“狼来了”是正类别，“没有狼”是负类别

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">类别</th>
<th scope="col" class="org-left">真实情况</th>
<th scope="col" class="org-left">牧童说</th>
<th scope="col" class="org-left">结果</th>
<th scope="col" class="org-left">解释</th>
<th scope="col" class="org-left">预测是否正确</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">TP</td>
<td class="org-left">受到狼的威胁</td>
<td class="org-left">狼来了</td>
<td class="org-left">牧童是个英雄</td>
<td class="org-left">说有狼，狼确实来了</td>
<td class="org-left">正确</td>
</tr>


<tr>
<td class="org-left">FP</td>
<td class="org-left">没受到狼的威胁</td>
<td class="org-left">狼来了</td>
<td class="org-left">村民因牧童说谎而生气</td>
<td class="org-left">说有狼，但狼没来</td>
<td class="org-left">错误</td>
</tr>


<tr>
<td class="org-left">FN</td>
<td class="org-left">受到狼的威胁</td>
<td class="org-left">没有狼</td>
<td class="org-left">狼吃掉了所有人</td>
<td class="org-left">说没狼，但狼来了</td>
<td class="org-left">错误</td>
</tr>


<tr>
<td class="org-left">TN</td>
<td class="org-left">没受到狼的威胁</td>
<td class="org-left">没有狼</td>
<td class="org-left">大家都没事</td>
<td class="org-left">说没狼，狼也没来</td>
<td class="org-left">正确</td>
</tr>
</tbody>
</table>

1.  准确率（欠佳或具有误导性）

    Accuracy = (TP+TN) / (TP+TN+FP+FN)
    当使用分类不平衡的数据集时（比如正类别标签和负类别标签的数量之间存在明显差异），单单准确率一项并不能反映全面情况

2.  精确率和召回率

    精确率Precision = TP/(TP+FP)
    召回率Recall = TP/(TP+FN)
    提高分类阈值: 假正例FP数量会减少，但假负例FN数量会相应地增加。结果，精确率有所提高，而召回率则有所降低
    降低分类阈值：假正例数量会增加，而假负例数量会减少。结果这一次，精确率有所降低，而召回率则有所提高

3.  ROC(接收者操作特征曲线)和曲线下面积

    绘制真正例率（TPR）和假正例率（FPR）
    TPR = TP/(TP+FN) 即召回率
    FPR = FP/(FP+TN)

4.  预测偏差

    预测偏差指的是这两个平均值之间的差值，即：
    预测偏差 = 预测平均值 - 数据集中相应标签的平均值
    造成预测偏差的可能原因包括：
    
    -   特征集不完整
    -   数据集混乱
    -   模型实现流水线中有错误
    -   训练样本有偏差
    -   正则化过强


<a id="orgf50bc4f"></a>

## 稀疏性正则化(Regularization for Sparsity)

-   特征组合可能会大大增加特征空间


<a id="orgfc4c483"></a>

### L1正则化

-   会对L0权重的范数进行惩罚，非凸优化，NP-hard
-   L1正则化比较放松
-   对绝对值（权重）之和进行惩罚
-   凸优化问题
-   和L2不同，L1鼓励稀疏性
-   使无意义维度的权重正好降至0


<a id="org533eaf4"></a>

### L1和L2正则化比较

1.  L2和L1采用不同的方式降低权重

    -   L2会降低 权重<sup>2</sup> （平方）
    -   L1会降低 |权重| （绝对值）

2.  L2和L1具有不同的导数

    -   L2的导数为2×权重
    -   L1的导数为k（一个常数，其值与权重无关）
    -   可以将L2的导数作用理解为每次移除权重的x%，即使按每次减去x%执行数十亿次减法计算，最后的值也不会绝对为0（即L2通常不会使权重变为0）
    -   可以将L1的导数作用理解为每次从权重中减去一个常数，由于减去的是绝对值，L1在0处具有不连续性，这会导致与0相交的减法结果变为0（例如减法使权重从+0.1变为-0.2，L1便会将权重设为0）
    -   L1正则化——减少所有权重的绝对值——证明对宽度模型非常有效
    -   适用于一维模型


<a id="org5629540"></a>

## 神经网络简介


<a id="orgbfc053b"></a>

## 训练神经网络


<a id="org3a6241c"></a>

## 多类别神经网络 (Multi-Class Neural Networks)

-   逻辑回归可生成介于0和1.0之间的小数。例如，某电子邮件分类器的逻辑回归输出值为0.8，表明电子邮件是垃圾邮件的概率为80%，不是垃圾邮件的概率为20%。
-   Softmax将这一想法延伸到多类别领域。也就是说，在多类别问题中，Softmax会为每个类别分配一个用小数表示的概率。

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">类别</th>
<th scope="col" class="org-right">概率</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">苹果</td>
<td class="org-right">0.001</td>
</tr>


<tr>
<td class="org-left">熊</td>
<td class="org-right">0.04</td>
</tr>


<tr>
<td class="org-left">糖果</td>
<td class="org-right">0.008</td>
</tr>


<tr>
<td class="org-left">狗</td>
<td class="org-right">0.95</td>
</tr>


<tr>
<td class="org-left">鸡蛋</td>
<td class="org-right">0.001</td>
</tr>
</tbody>
</table>

-   Softmax层是紧挨着输出层之前的神经网络层。Softmax层必须和输出层拥有一样的节点数。
-   Softmax方程：p(y=j|x) = \frac{e^(w_j^T x+b_j)}{&sum;<sub>k &isin; K</sub> e<sup>(w<sub>k</sub><sup>T</sup> x+b<sub>k</sub>)</sup>}
-   Softmax变体：
    完整Softmax是我们一直以来讨论的Softmax；也就是说，Softmax针对每个可能的类别计算概率。
    候选采样指Softmax针对所有正类别标签计算概率，但仅针对负类别标签的随机样本计算概率。例如，如果我们想要确定某个输入图片是小猎犬还是寻血猎犬图片，则不必针对每个非狗狗样本提供概率。
-   类别数量较少时，完整Softmax代价很小，但随着类别数量的增加，它的代价会变得极其高昂。候选采样可以提高处理具有大量类别的问题的效率。


<a id="org3553ebc"></a>

### 一个标签与多个标签

Softmax假设每个样本只是一个类别的成员。但是，一些样本可以同时是多个类别的成员。对于此类示例

-   您不能使用Softmax
-   您必须依赖多个逻辑回归


<a id="org827f621"></a>

## 嵌套(Embedding)

嵌套是一种相对低维的空间，您可以将高维矢量映射到这种低维空间里。通过使用嵌套，可以让在大型输入（比如代表字词的稀疏矢量）上进行机器学习变得更加容易。在理想情况下，嵌套可以将语义上相似的不同输入映射到嵌套空间里的邻近处，以此来捕获输入的语义。一个模型学习到的嵌套，也可以被其他模型重用。


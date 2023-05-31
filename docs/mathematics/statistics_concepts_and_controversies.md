# Table of Contents

1. [前言：什么是统计？](#orgf990878)
2. [产生数据](#org5598991)
3. [数据从何而来？](#org7a868e3)
4. [好样本与坏样本](#orgd09ffec)
5. [样本告诉我们什么？](#orgfa2bd83)
    1. [总结](#org0703a2e)
6. [真实世界中的抽样调查](#orgc817aa8)
7. [实验面面观](#org1c4c509)
8. [真实世界中的实验](#org5ab873b)
9. [数据伦理](#orga531f3a)
10. [度量](#orgf24e9c0)
11. [数字合不合理](#orgf9fd9ed)
12. [整合数据](#org46db55f)
13. [好的图和坏的图](#org695cd2a)
14. [用图形呈现分布](#org4c6459f)
15. [用数字描述分布](#orgeb491c6)
16. [正态分布](#org09de31d)
17. [描述相关关系的方法：散布图和相关系数](#org68e55f6)
18. [描述相关关系：回归、预测及因果关系](#org544d2ba)
19. [消费者物价指数和政府统计](#org928b3e2)
20. [机遇](#org3aabd91)
21. [考虑可能性](#org2cae31e)
22. [概率模型](#orge682c44)
23. [模拟](#org2ca302e)
24. [赌场的优势：期望值（expected value）](#org3e98396)
25. [推论](#orga4b63fb)
26. [什么是置信区间](#orgce55214)
27. [什么是显著性检验](#org1d33c94)
28. [统计推论的使用与滥用](#org62c39cc)
29. [双向表及卡方检验](#orgec5975b)
30. [有关总体平均数的推论](#org86ebc54)

<a id="orgf990878"></a>

# 前言：什么是统计？

统计是从数据中找出信息，并且做出结论。

<a id="org5598991"></a>

# 产生数据

<a id="org7a868e3"></a>

# 数据从何而来？

- 观测研究(observational study)：观察一些个体，并度量变量
- 抽样调查(sample survey)：检查一部分来得知全体
- 普查(census)：是企图把整个总体纳入样本的抽样调查

<a id="orgd09ffec"></a>

# 好样本与坏样本

- 有偏(biased)抽样法，bad
- 简单随机样本(simple random sample, SRS)，消除 bias

<a id="orgfa2bd83"></a>

# 样本告诉我们什么？

- 样本无法告诉我们总体的准确信息，但会提供一个误差界限(margin of error)
- 从样本到总体：用样本的事实，当做真实信息的估计(estimate)
- 多次随机抽样，样本的变异状况会遵循某种可预测的形态(pattern) -> 较大样本所得结果的变异会更小
- 偏差 bias 是当我们取很多样本时，统计量一直朝同一个方向偏离总体的参数值
  变异性 variability 描述的是当取很多样本时，统计量的值会离散到什么程度（多次随机抽样看结果分布情况）
- 一个好的抽样应该同时具备偏差小和变异性小
- 降低偏差：随机抽样(SRS)即可，得到无偏估计值(unbiased estimate)
  降低变异性：增大样本
- 误差界限(margin of error)：样本离总体参数有多远
  例如多次随机抽样，样本中有 95%所得的结果在总体真实值的+-3%范围内（即有 95%的信心）
- 置信叙述(confidence statement)包含 2 个部分：误差界限和置信水平(level of confidence)
  置信水平：所有可能样本中有多少百分比满足这样的误差界限
  较高置信水平的代价是较大的误差界限，相同置信水平下要降低误差界限则取更大的样本

<a id="org0703a2e"></a>

## 总结

- 好样本:偏差小 & 变异性小，SRS 降低偏差，增大样本降低变异性
- 置信叙述：描述精确程度

<a id="orgc817aa8"></a>

# 真实世界中的抽样调查

现实世界中 SRS 并不简单，也不一定随机！

- 抽样会发生误差 1.抽样误差(sampling error)：抽样这个动作所造成的误差，抽样误差使样本结果与普查结果不同。 2.随机抽样误差(random sampling error)：样本统计量和总体参数之间的差距，选取样本时造成。置信叙述中的误差界限只包含随机抽样误差。 3.非抽样误差(nonsampling error)：和“从总体取样”无关的误差。
- 抽样误差来源：涵盖不全(undercoverage)，漏掉了某些群体
  非抽样误差来源：处理误差(processing error) & 回应误差(response error)
  无回应(nonresponse)：缺少数据 -> 数据稀疏
- 应对非抽样误差：给回应加权，以期导正偏差来源
- 真实世界中的抽样设计：分层抽样(stratified sampling)，分层指根据某些性质分类，优于 SRS 的 2 点：1.可以得到有关各层的个别信息 2.误差界限通常比 SRS 小（同层的相似度比总体大，所以可消除样本中某些变异性）
- 概率样本(probability sample)：利用概率抽取样本。要先知道哪些样本是可能的，以及它们被抽中的概率。

<a id="org1c4c509"></a>

# 实验面面观

- 反应变量/因变量(dependent variable)：用来度量研究结果的变量
  解释变量/独立变量/自变量(independent variable)：可以解释 or 造成反应变量变化的变量
  潜在变量：对其他变量有重要影响，却未被列为解释变数的变量
- 交叉：当两个变量对反应变数的影响混在一起无法区分时，我们称这两个变量是交叉的
  交叉变量可以是解释变量，也可以是潜在变量
- 安慰剂效应(placebo effect)
- 随机化比较实验
- 统计实验设计原则： 1.控制潜在变量的影响，最简单的方法是同时比较至少 2 个处理 2.随机化：用非人为的随机方法来指派受试对象到不同的处理组 3.每一组的受试对象要足够多，以减低结果中的机遇变异
- 统计显著性(statistical significance)：观察到的效果大到某种程度，光靠机遇产生这种结果的概率很小时，我们就称此结果具有统计显著性。
- 因果 cause and effect

<a id="org5ab873b"></a>

# 真实世界中的实验

- 双盲实验(double-blind experiment)
- 真实世界中的实验设计：完全随机化设计、配对设计、区集设计

<a id="orga531f3a"></a>

# 数据伦理

<a id="orgf24e9c0"></a>

# 度量

单位、数值、精确度、有效/无效度量、误差、可靠度

<a id="orgf9fd9ed"></a>

# 数字合不合理

<a id="org46db55f"></a>

# 整合数据

<a id="org695cd2a"></a>

# 好的图和坏的图

- 统计是处理数字的，我们用表和图来呈现数字
- 数据表、饼状图(pie chart)、柱状图(bar graph)
- 类别变量(categorical variable)和数量变量(quantitative variable)
- 线图(line graph)：变量随时间而变化

<a id="org4c6459f"></a>

# 用图形呈现分布

- 茎叶图（stemplot/stem-and-leafplot）
- 直方图（histogram）

<a id="orgeb491c6"></a>

# 用数字描述分布

- 中位数（median） M
- 四分位数（quartile） Q1 Q2
- min-max
- 五数综合：min Q1 M Q2 max
- 箱形图（boxplot）：画五数综合
- 平均数（mean）
- 标准差（standard deviation）：度量离度，与平均数相距的平均距离
- 方差（variance）：标准差的平方
- 正态分布（normal distributions）

<a id="org09de31d"></a>

# 正态分布

- 正态分布（normal distribution）也叫高斯分布（Gaussian distribution）
- 正态曲线（normal curve）
- 密度曲线（density curve）
- 正态密度曲线
- 68-95-99.7 规则：
  在任何正态分布中，大约有
  68%的观测值，落在距平均数一个标准差的范围内
  95%的观测值，落在距平均数两个标准差的范围内
  99.7%的观测值，落在距平均数三个标准差的范围内
- 标准计分（standard score）= （观测值-平均值）/标准差

<a id="org68e55f6"></a>

# 描述相关关系的方法：散布图和相关系数

- 散布图（scatter plot）
- 正相关（positive association）和负相关（negative association）
- 相关系数（correlation）：描述两个数值变量之间的直线相关的方向和强度，用于度量相关性。
- 相关系数 r = 1/(n-1) &sum; (x-\bar{x})/s<sub>x</sub> (y-\bar{y})/s<sub>y</sub>
- r 的正/负表示正/负相关，值在[-1,1]

<a id="org544d2ba"></a>

# 描述相关关系：回归、预测及因果关系

- 回归（regression）：替数据匹配模型，以便做预测
- 回归直线
- 最小二乘法（least-squares method）
- 回归直线的预测功能，视相关系数强度而定
- 统计及因果的几大事实： 1.强相关性也不一定代表因果关系 2.相关性常常受潜在变量（lurking variable）的影响 3.建立因果关系最好的证据，来自随机化比较实验 4.两个变量的相互关系，可能来自于直接因果关系（direct causation）、共同反应（common response）或是交叉。也可能是几种因素的组合。 5.观察到的相互关系不管是不是因果，都可以拿来做预测，只要从以前的数据找出来的形态仍然适用。

<a id="org928b3e2"></a>

# 消费者物价指数和政府统计

- 消费者物价指数（Customer Price Index, CPI）
- 指数（index number）：以变量在某个基期的值为标准，该变量对于基期值的比值大小
  指数 = 变量值/基期值 \* 100

<a id="org3aabd91"></a>

# 机遇

机遇（chance）的数学叫做概率（probability）。

<a id="org2cae31e"></a>

# 考虑可能性

- 短期无法预测，长期则会呈现有规则且可预测的模式

<a id="orge682c44"></a>

# 概率模型

<a id="org2ca302e"></a>

# 模拟

simulation

- 独立

<a id="org3e98396"></a>

# 赌场的优势：期望值（expected value）

- 赢的概率、赢多少
- 大数法则（law of large numbers）：如果结果为数值的随机现象独立地重复许多次，实际观测到的结果其平均值会趋近期望值。
- 赌场、保险公司都是算好了期望，根据大数定理来长期获利，但个人参与的次数太少了

<a id="orga4b63fb"></a>

# 推论

<a id="orgce55214"></a>

# 什么是置信区间

置信区间 confidence interval

- 置信区间估计一个未知参数，可以提供我们该估计的不确定程度

<a id="org1d33c94"></a>

# 什么是显著性检验

- 检验要判断样本数据是否提供了不利于断言的证据，即检验样本证据强度的数值量度
- 要证明总体中有某种特定的效应，统计检验会先假设该效应不存在
- 显著性检验：检验是设计来评估，否定原假设的证据有多强
  第一步，先列出一个断言，即原假设（null hypothesis），设为 H<sub>0</sub>
  取代 H<sub>0 的备择假设</sub>（alternative hypothesis）H<sub>a</sub>
  显著性检验会找对 H<sub>0 不利</sub>，但对 H<sub>a 有利的证据</sub>
- 统计检验的 P 值（P-value）是在 H<sub>0 为真的假设下</sub>，所得样本结果会像实际观测结果那么极端 or 更极端的概率。
  P 值越小，则否定 H<sub>0 的证据就越强</sub>
- 显著水平（significance level），通常用\alpha 表示
  如果 P <= &alpha;，则称该组数据有\alpha 的统计显著性水平
- P<0.10 代表有一些证据不利于原假设
  P<0.05 代表适度证据
  O<0.01 代表有力证据
- 显著在统计上的意义：代表“光靠机遇不容易发生”

<a id="org62c39cc"></a>

# 统计推论的使用与滥用

- 显著性检验的 P 值不仅和样本大小相关，也和总体真正值相关
- 增大样本对置信区间有直接的影响，通常也会把 P 值变小
- 样本很大时，即使 P 很小也不见得有实际意义；样本小时，总体的重要真实情况可能达不到统计显著性的标准

<a id="orgec5975b"></a>

# 双向表及卡方检验

双向表（two-way table），行列都是类别变量而非数值变量，如：

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">

<colgroup>
<col  class="org-left" />

<col  class="org-right" />

<col  class="org-right" />

<col  class="org-right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">&#xa0;</th>
<th scope="col" class="org-right">Female</th>
<th scope="col" class="org-right">Male</th>
<th scope="col" class="org-right">Total</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">Assistant Prof.</td>
<td class="org-right">126</td>
<td class="org-right">213</td>
<td class="org-right">339</td>
</tr>

<tr>
<td class="org-left">Associate Prof.</td>
<td class="org-right">149</td>
<td class="org-right">411</td>
<td class="org-right">560</td>
</tr>

<tr>
<td class="org-left">Professor</td>
<td class="org-right">60</td>
<td class="org-right">662</td>
<td class="org-right">722</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">Total</td>
<td class="org-right">335(20.7%)</td>
<td class="org-right">1286(79.3%)</td>
<td class="org-right">1621</td>
</tr>
</tbody>
</table>

- 辛普森悖论（Simpson's paradox）：在分组比较中都占优势的一方，在总评（几组数据合并）中有时反而是失势的一方。
  注意潜在变量！
- 卡方（chisquare）检验：用来判断双向表里所出现的相关关系是否有统计显著性

<a id="org86ebc54"></a>

# 有关总体平均数的推论

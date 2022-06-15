
# Table of Contents

1.  [概况](#org6124e4f)
    1.  [什么是区块链](#org986c7e5)
    2.  [基本原理](#org5c1769c)
2.  [应用场景](#org197f78d)
    1.  [金融服务](#orgadba2af)
    2.  [征信和权属管理](#orgd4043be)
    3.  [资源共享](#org32e60a6)
    4.  [投资管理](#orgb601cc0)
    5.  [物联网与供应链](#org27d21a9)
3.  [分布式系统](#orgd897d29)
    1.  [一致性（consistency）问题](#org0059a40)
    2.  [一致性应满足要求](#org3bd3e1b)
    3.  [带约束的一致性](#org31d0f4b)
    4.  [共识算法](#orgfabb3c5)
    5.  [拜占庭错误](#orgfa8fcf3)
    6.  [FLP不可能性原理](#orgffae347)
    7.  [CAP原理](#orgf33240b)
    8.  [ACID原则：Atomicity（原子性）、Consistency（一致性）、Isolation（隔离性）、Durability（持久性）](#org4bbc7d5)
4.  [密码学技术](#org65da68c)
    1.  [Hash算法（Hash又叫做fingerprint、digest）](#orgc60a5a2)
        1.  [MD5(Message Digest)](#orgb766786)
        2.  [SHA-1(Secure Hash Algorithm)](#orgdbdd696)
        3.  [SHA-2](#org619ddc7)
    2.  [算法体系](#org3368527)
        1.  [加解密算法、加密密钥、解密密钥](#org23ebdee)
        2.  [对称加密](#org80127bc)
        3.  [非对称加密](#orgfd4a7ee)
        4.  [混合加密](#orgc53543a)
        5.  [数字签名](#org06ab916)
        6.  [数字证书](#org2a6eaaa)
        7.  [同态加密](#orged94d3a)
5.  [比特币项目](#orgcfa384e)
    1.  [原理和设计](#orgdfda0ad)
        1.  [公共可见记账本，记录发生过的交易的历史信息](#orgb70c390)
    2.  [概念](#orgf235e95)
        1.  [账户/地址](#orgce11a98)
        2.  [交易](#orgade7add)
        3.  [脚本](#org2792b78)
        4.  [区块](#org29a7121)
        5.  [设计理念](#orgf56932e)
        6.  [共识机制](#org8c5ce42)
        7.  [挖矿](#org439c571)
        8.  [闪电网络](#org9fb1cea)
6.  [超级账本——Hyperledger](#org3192802)
7.  [以太坊——Ethereum](#org38e2735)
8.  [区块链即服务](#orgec7b372)
9.  [性能与评测](#orgdeff654)



<a id="org6124e4f"></a>

# 概况


<a id="org986c7e5"></a>

## 什么是区块链

-   wiki: A blockchain &#x2013; originally, block chain is a distributed database that maintains a

continuously growing list of data records hardened against tampering and resivison. It 
consists of data structure blocks &#x2013; which hold exclusively data in initial blockchain 
implementations, and both data and programs in some of the more recent 
implementations &#x2013; with each block holding batches of individual transactions and the 
results of any blockchain executables. Each block contains a timestamp and information 
linking it to a previous block.


<a id="org5c1769c"></a>

## 基本原理

-   交易（Transaction）：一次操作，导致账本状态的一次改变,如添加一条记录;
-   区块(Block):记录一段时间内发生的交易和状态结果,是对当前账本状态的一次共识;
-   链(Chain):由一个个区块按照发生顺序串联而成,是整个状态变化的日志记录。
-   基于算力的共识机制Proof of Work（PoW）


<a id="org197f78d"></a>

# 应用场景

从区块链特性出发：在不引入第三方中介机构的前提下，去中心化、不可篡改、安全可靠。因此所有直接/间接依赖于第三方担保信任机构的活动，均可能从区块链技术中获益。


<a id="orgadba2af"></a>

## 金融服务

-   降低交易成本，减少跨组织交易风险


<a id="orgd4043be"></a>

## 征信和权属管理

-   大型社交平台、保险公司梦寐以求，目前缺乏足够数据来源、可靠的平台和有效的数据分析和管理


<a id="org32e60a6"></a>

## 资源共享

-   降低管理成本（如airbnb）


<a id="orgb601cc0"></a>

## 投资管理

-   公募/私募基金用来降低管理成本和管控风险


<a id="org27d21a9"></a>

## 物联网与供应链

-   租赁、物流等


<a id="orgd897d29"></a>

# 分布式系统


<a id="org0059a40"></a>

## 一致性（consistency）问题

-   多个服务节点，给定一系列操作，在协议（共识算法）保障下，试图使得它们对处理结果达成某种程度的一致
-   解决方法的背后思想，都是将可能引发不一致的并行操作串行化，这是现在计算机系统里处理分布式一致性问题的基础思路和唯一秘诀


<a id="org3bd3e1b"></a>

## 一致性应满足要求

-   可终止性：一致的结果在有限时间内能完成
-   共识性：不同节点最终完成决策的结果应该相同
-   合法性：决策的结果必须是其他进程提出的提案


<a id="org31d0f4b"></a>

## 带约束的一致性

-   绝对理想的强一致性代价很大，等同于一台机器，越强的一致性要求往往性能越弱


<a id="orgfabb3c5"></a>

## 共识算法

-   靠共识算法来保障系统满足不同程度的一致性
-   共识算法是对某个提案大家达成一致意见，提案：如多个事件发生的顺序、某个键对应的值、谁是领导等等


<a id="orgfa8fcf3"></a>

## 拜占庭错误

-   故障（不响应）的情况称为“非拜占庭错误”
-   错误（恶意的响应）情况称为“拜占庭错误”，对应节点为拜占庭节点


<a id="orgffae347"></a>

## FLP不可能性原理

-   在网络可靠,存在节点失效(即便只有一个)的最小化异步模型系统中,不存在一个可以解决一致性问题的确定性算法


<a id="orgf33240b"></a>

## CAP原理

-   分布式计算系统不可能同时确保一致性（Consistency）、可用性（Availablity）和分区容忍性（Partition），设计中往往要弱化对某个特征的保证。
-   一致性：任何操作应该都是原子的，发生在后面的事件能看到前面事件发生导致的结果
-   可用性：有限时间内，任何非失败节点都能应答请求
-   分区容忍性：网络可能发生分区，即节点之间的通信不可保障


<a id="org4bbc7d5"></a>

## ACID原则：Atomicity（原子性）、Consistency（一致性）、Isolation（隔离性）、Durability（持久性）


<a id="org65da68c"></a>

# 密码学技术


<a id="orgc60a5a2"></a>

## Hash算法（Hash又叫做fingerprint、digest）

-   将任意长度的二进制值（明文）映射为较短的固定长度的二进制值（Hash值），并且不同的明文很难映射为相同的Hash值。
-   流行的Hash算法包括MD5、SHA-1、SHA-2


<a id="orgb766786"></a>

### MD5(Message Digest)

-   输出128位，不具备强抗碰撞性


<a id="orgdbdd696"></a>

### SHA-1(Secure Hash Algorithm)

-   hash函数族，输出160位hash值，不具备强抗碰撞性


<a id="org619ddc7"></a>

### SHA-2

-   推荐至少使用SHA2-256算法


<a id="org3368527"></a>

## 算法体系


<a id="org23ebdee"></a>

### 加解密算法、加密密钥、解密密钥

-   算法是固定不变、公开可见的；密钥长度越长、加密强度越大
-   加密过程中，通过加密算法和加密密钥，对明文加密获得密文
-   解密过程中，通过解密算法和解密密钥，对密文解密获得明文
-   根据加解密的密钥是否相同，算法分为对称加密和非对称加密


<a id="org80127bc"></a>

### 对称加密

-   优点：加解密效率高（速度快、空间占用小），加密强度高
-   缺点：参与多方都需要持有密钥，一旦泄露则破坏安全性；如何在不安全通道下分发密钥也是问题
-   从实现原理上分为两种：分组密码和序列密码。前者将明文切分为定长数据块作为加密单位，应用最广；后者只对一个字节进行加密，且密码不断变化，只用在特定领域。
-   代表算法：DES、3DES、AES、IDEA等
-   适用于大量数据的加解密；不能用于签名场景；需要提前分发密钥


<a id="orgfd4a7ee"></a>

### 非对称加密

-   公钥公开，私钥个人持有
-   优点：公私钥分开，不安全通道也可使用
-   缺点：加解密速度慢（一般比对称加解密慢3个数量级）；加密强度比对称加密差
-   安全性通过数学问题保障，主要基于大数质因子分解、离散对数、椭圆曲线等
-   代表算法：RSA、EIGamal、ECC等
-   一般适用于签名场景或密钥协商，不适用于大量数据的加解密


<a id="orgc53543a"></a>

### 混合加密

-   先用计算复杂度高的非对称加密协商一个临时的对称加密密钥（会话密钥，一般内容较短），然后双方通过对称加密传递大量数据进行加解密处理
-   典型场景HTTPS


<a id="org06ab916"></a>

### 数字签名

-   用于证实某数字内容的完整性和来源


<a id="org2a6eaaa"></a>

### 数字证书

-   用来证明某个公钥是谁的，并且内容是正确的


<a id="orged94d3a"></a>

### 同态加密

-   对密文加密得到的仍是加密的结果


<a id="orgcfa384e"></a>

# 比特币项目

做设计，很多时候都是在权衡trade-off


<a id="orgdfda0ad"></a>

## 原理和设计


<a id="orgb70c390"></a>

### 公共可见记账本，记录发生过的交易的历史信息


<a id="orgf235e95"></a>

## 概念


<a id="orgce11a98"></a>

### 账户/地址

-   比特币账户采用非对称加密，用户保留私钥，对他发出的交易进行签名确认，并公开公钥
-   比特币账户地址是用户公钥经过一系列hash（HASH160，或先SHA256再RIPEMD160）及编码运算后生成的160位的字符串


<a id="orgade7add"></a>

### 交易

-   一条交易包括：付款人地址、付款人对交易的签字确认（确保交易内容不被篡改）、付款人资金的来源交易ID（从哪个交易的输出作为本次交易的输入）、交易的金额（多少钱，跟输入的差额为交易服务费）、收款人地址（合法）、收款人公钥、时间戳（交易何时能生效）
-   网络节点收到交易信息后，将进行如下检查：
    1、交易是否已经处理过
    2、交易是否合法：包括地址是否合法、发起交易者是输入地址的合法拥有者、是否是UTXO
    3、交易的输入之和是否大于输出之和
    检查都通过，则标记为合法的未确认交易，并在网络中广播


<a id="org2792b78"></a>

### 脚本

-   保障交易（主要检验交易是否合法）完成的核心机制，所依附的交易发生时被触发
-   一个交易包含2个脚本：输出脚本（scriptPubKey）和认领脚本（scriptSig）
-   输出脚本由付款方对交易设置锁定，用来对能动用这笔交易输出（要花费交易的输出）的对象（收款方）进行权限控制，例如限制必须是某个公钥的拥有者才能花费这笔交易
-   认领脚本用来证明自己可以满足交易输出脚本的锁定条件，即对某个交易的输出（比特币）的拥有权


<a id="org29a7121"></a>

### 区块

1.  4字节区块大小信息

2.  80字节区块头信息

    -   版本号：4字节
    -   上一个区块头的SHA256 hash值：链接到一个合法的块上，32字节
    -   包含的所有验证过的交易的Merkle树根的hash值，32字节
    -   时间戳：4字节
    -   难度指标：4字节
    -   Nonce：4字节，PoW问题的答案

3.  交易个数计数器：1-9字节

4.  所有交易的具体内容可变长


<a id="orgf56932e"></a>

### 设计理念

-   避免作恶
-   负反馈调节


<a id="org8c5ce42"></a>

### 共识机制

-   按照块来进行阶段性的确认，提高网络可用性
-   通过进行PoW限制合法提案的个数，提高网络稳定性


<a id="org439c571"></a>

### 挖矿

-   每10min左右生成一个不超过1MB大小的区块（记录10min内发生的验证过的交易内容）


<a id="org9fb1cea"></a>

### 闪电网络

-   交易性能：全网每秒7笔，同时等待6个块的可信确认导致约1小时的最终确认时间

1.  RSMC(Recoverable Sequence Maturity Contract) 可撤销的顺序成熟度合同

    -   解决链下交易的确认问题

2.  HTLC(Hashed Timelock Contract) 哈希的带时钟的合约

    -   解决支付通道的问题


<a id="org3192802"></a>

# 超级账本——Hyperledger


<a id="org38e2735"></a>

# 以太坊——Ethereum


<a id="orgec7b372"></a>

# 区块链即服务


<a id="orgdeff654"></a>

# 性能与评测


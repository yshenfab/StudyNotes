
# Table of Contents

1.  [基础](#orgc35f39c)
    1.  [基础编程模型](#orga8d4382)
        1.  [递归](#orgdcf581e)
    2.  [数据抽象](#org1465479)
    3.  [背包、队列和栈（bag, queue, stack）](#org6319deb)
        1.  [泛型（又叫参数化类型）](#org61e2eb8)
        2.  [链表](#orga85d8f9)
    4.  [算法分析](#org3271174)
    5.  [案例研究：union-find算法](#orgcf1ed70)
2.  [排序](#org6c54496)
    1.  [初级排序算法](#org9bafc8a)
        1.  [选择排序](#orga785c40)
        2.  [插入排序](#orgf9d9658)
        3.  [希尔排序](#org6cf3a50)
    2.  [归并排序](#org2d41af8)
    3.  [快速排序](#org31813d5)
        1.  [基本算法](#org46f45ed)
        2.  [算法改进](#org9c07c56)
    4.  [优先队列](#orge8ff82d)
        1.  [堆(heap)的定义](#org54c2d3f)
    5.  [堆排序](#org864f363)
        1.  [堆的构造](#org0d8df98)
        2.  [下沉排序](#org72d4e4b)
        3.  [先下沉后上浮](#org9cccccf)
3.  [查找](#org81c4a01)
    1.  [符号表（字典）](#org22ac478)
        1.  [无续链表的顺序查找 SequentialSearch](#org4421f64)
        2.  [有序数组的二分查找 BinarySearch](#orga0ec3e3)
        3.  [符号表各种实现的优缺点](#org865f417)
    2.  [二叉查找树 BST (pg263)](#org3194f6b)
    3.  [平衡查找树](#org2702d2a)
    4.  [散列表](#orgc0e36ac)
    5.  [应用](#org3f49b2d)
4.  [图](#orge47cbc5)
    1.  [无向图](#org348a280)
    2.  [有向图](#org9fa450f)
    3.  [最小生成树](#orgff455cf)
    4.  [最短路径](#orge3a9389)
5.  [字符串](#orgf0c36da)
    1.  [字符串排序](#org89d7dbf)
    2.  [单词查找树](#org6a2c6d4)
    3.  [子字符串查找](#org6501e72)
    4.  [正则表达式](#orgab2a488)
    5.  [数据压缩](#orgc4aca36)
6.  [背景](#org4173670)



<a id="orgc35f39c"></a>

# 基础


<a id="orga8d4382"></a>

## 基础编程模型


<a id="orgdcf581e"></a>

### 递归

满足3点：

1.  递归总有一个最简单的情况
2.  递归调用总是去尝试解决一个规模更小的子问题（这样才能收敛到最简单的情况）
3.  递归调用的父问题和尝试解决的子问题之间不应该有交集


<a id="org1465479"></a>

## 数据抽象

-   抽象数据类型（ADT）：类似于Point2D, vec3f等等


<a id="org6319deb"></a>

## 背包、队列和栈（bag, queue, stack）

-   区别在于操作（添加、删除、访问）不同


<a id="org61e2eb8"></a>

### 泛型（又叫参数化类型）

-   集合类的抽象数据类型的一个关键特性是可以存储任意类型的数据：vector<int> vector<float>


<a id="orga85d8f9"></a>

### 链表

-   定义：链表是一种递归的数据结构，它或者为空(null)，或者是指向一个结点(node)的引用，
    该结点含有一个泛型的元素和一个指向另一条链表的引用。
    class Node
    {
        Item item;
        Node next;
    }
-   数组 vs 链表

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">数据结构</th>
<th scope="col" class="org-left">优点</th>
<th scope="col" class="org-left">缺点</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">数组</td>
<td class="org-left">通过索引可以直接访问任意元素</td>
<td class="org-left">初始化时需要知道元素的数量</td>
</tr>


<tr>
<td class="org-left">链表</td>
<td class="org-left">使用的空间大小和元素数量成正比</td>
<td class="org-left">需要通过引用访问任意元素</td>
</tr>
</tbody>
</table>


<a id="org3271174"></a>

## 算法分析

-   时间复杂度、空间复杂度


<a id="orgcf1ed70"></a>

## 案例研究：union-find算法


<a id="org6c54496"></a>

# 排序


<a id="org9bafc8a"></a>

## 初级排序算法


<a id="orga785c40"></a>

### 选择排序

-   找到数组中最小的元素
-   将最小的元素和第1个元素交换位置
-   repeat
-   O(n<sup>2</sup>)


<a id="orgf9d9658"></a>

### 插入排序


<a id="org6cf3a50"></a>

### 希尔排序

改进插入排序，交换不相邻的元素以对数组的局部进行排序，最终用插入排序将局部有序的数组排序


<a id="org2d41af8"></a>

## 归并排序

-   divide and conquer，将两个有序数组归并成一个更大的有序数组（实现递归）
-   时间O(NlogN)，空间O(N)
-   缺点：所需的额外空间和n成正比


<a id="org31813d5"></a>

## 快速排序

-   应用最广：实现简单、适用于各种不同的输入数据、在一般应用中比其他排序算法都要快的多
-   时间O(NlogN)，空间O(lgN)
-   快排的内循环比大多数排序算法都要短小，意味着在理论和实际中都要更快
-   缺点：非常脆弱，实现时要非常小心才能避免低劣的性能


<a id="org46f45ed"></a>

### 基本算法

-   分治：将一个数组分成2个子数组，两部分独立排序
-   **快排和归并排序是互补的**
    归并排序将数组分成2个子数组分别排序，并将有序的子数组归并以将整个数组排序；（递归调用发生在处理整个数组之前，一个数组被等分为两半）
    快排是当2个子数组都有序时，整个数组也就自然有序了。（递归调用发生在处理整个数组之后，切分的位置取决于数组的内容）
-   快排的关键在于切分(partition)，find a pivot


<a id="org9c07c56"></a>

### 算法改进

1.  切换到插入排序

    和大多数递归排序算法一样，改进快排性能的一个简单办法基于以下两点：
    
    1.  对于小数组，快排比插入排序慢；
    2.  因为递归，快排的sort()方法在小数组中也会调用自己。
    
    if(hi <= lo) return; 替换成 if(hi <= lo+M) {Insertion.sort(a,lo,hi); return;}

2.  三取样切分

    -   使用子数组的一小部分元素的中位数来切分数组，这样做切分会更好，代价是需要计算中位数
    -   取样大小设为3并用大小居中的元素切分效果最好

3.  熵最优的排序

    -   实际应用中常会出现含有大量重复元素的数组，采用“三向切分的快速排序”
    -   对于包含大量重复元素的数组，三向切分将排序时间从线性对数级降低到线性级别


<a id="orge8ff82d"></a>

## 优先队列

-   支持操作：删除最大元素、插入元素


<a id="org54c2d3f"></a>

### 堆(heap)的定义

-   **定义** 当一棵二叉树的每个结点都大于等于它的两个子结点时，它被成为堆有序。
-   二叉堆能够很好地实现优先队列的基本操作
-   堆的有序化(reheapifying)，自下而上or自上而下

1.  自下而上（上浮 swim）

    -   当一个结点太大的时候（大于父结点），它需要上浮到堆的更高层
    -   位置k的结点的父结点的位置是k/2向下取整
    -   实现：
    
    void swin(int k)
    {
        while(k>1 && less(k/2,k)) // less: 小于比较 返回boolean
        {
            exch(k/2,k); // exch: exchange 交换变量值
            k=k/2;
        }
    }

2.  自上而下（下沉 sink）

    -   当一个结点比它的子结点小时，它需要和它两个子结点里较大的交换来恢复堆，下沉到堆的更低层
    -   位置k的结点的子结点位于2k和2k+1
    -   void sink(int k)
        {
            while(2\*k <= N)
            {
        	int j = 2\*k;
        	if(j<N && less(j,j+1)) j++;
        	if(!less(k,j)) break;
        	exch(k,j);
        	k=j;
            }
        }

3.  插入元素

    -   将新元素添加到数组末尾，增加堆的大小并让新元素上浮到合适的位置
    -   实现：
        void insert(Key v)
        {
            pq[++N]=v;
            swim(N);
        }

4.  删除最大元素

    -   从数组顶端删去最大的元素并将数组的最后一个元素放到顶端，减小堆的大小并让这个元素下沉到合适的位置
    -   实现：
        Key delMax()
        {
            Key max = pq[1]; */ 从根结点得到最大元素
            exch(1,N&#x2013;); /* 将其和最后一个结点交换
            pq[N+1] = null; */ 防止越界
            sink(1); /* 恢复堆的有序性
            return max;
        }


<a id="org864f363"></a>

## 堆排序

堆排序分2个阶段：

1.  堆的构造阶段，将原始数组重新组织安排进一个堆中；
2.  下沉排序阶段，从堆中按递减顺序取出所有元素并得到排序结果。

排序时将需要排序的数组本身作为堆，因此无需任何额外空间。
时间O(NlogN)，空间O(1)


<a id="org0d8df98"></a>

### 堆的构造

-   从左到右遍历数组，用swim()保证扫描指针左侧的所有元素已经是一棵堆有序的完全树，O(NlogN)
-   一个更聪明高效的方法：从右至左用sink()构造子堆（少于2N次比较以及少于N次交换）
-   堆排序实现：

void heapSort(Comparable[] a)
{
    int N = a.length;
    for(int k=N/2; k>=1; k&#x2013;) // 构造堆
        sink(a, k, N);
    while(N>1)
    {
        exch(a, 1, N&#x2013;);
        sink(a, 1, N);
    }
}


<a id="org72d4e4b"></a>

### 下沉排序

堆排序的主要工作都是在第二阶段完成的，将堆中的堆大元素删除，然后放入堆缩小后数组中空出的位置。


<a id="org9cccccf"></a>

### 先下沉后上浮

**堆排序是唯一能够同时最优地利用空间和时间的方法**

-   当空间十分紧张时用的多，现代系统很少用，因为它无法利用缓存
-   数组元素很少和相邻的其他元素进行比较，因此缓存未命中的次数要远远高于大多数比较都在相邻元素间进行的算法，如快速排序、归并排序，甚至是希尔排序
-   用堆实现优先队列在现代应用程序中越来越重要，因为它能在插入操作和删除最大元素操作混合的动态场景中保证对数级别的运行时间


<a id="org81c4a01"></a>

# 查找


<a id="org22ac478"></a>

## 符号表（字典）

key-value pair

-   **定义** 符号表是一种存储键值对的数据结构，支持2种操作：插入(put)，即将一组新的键值对存入表中；查找(get)，即根据给定的键得到相应的值
-   **查找的成本模型** 统计比较的次数（等价性测试或是键的相互比较），在内循环不进行比较（极少）的情况下，统计数组访问次数


<a id="org4421f64"></a>

### 无续链表的顺序查找 SequentialSearch


<a id="orga0ec3e3"></a>

### 有序数组的二分查找 BinarySearch

1.  二分查找

    -   递归的二分查找
    
    int rank(Key key, int lo, int hi)
    {
        if(hi < lo) return lo;
        int mid = lo + (hi-lo)/2;
        int cmp = key.compareTo(keys[mid]);
        if(cmp<0)
            return rank(key, lo, mid-1);
        else if(cmp>0)
            return rank(key, mid+1, hi);
        else
            return mid;
    }
    
    -   迭代的二分查找
    
    int rank(Key key)
    {
        int lo=0, hi=N-1;
        while(lo <= hi)
        {
            int mid = lo + (hi-lo)/2;
            int cmp = key.compareTo(keys[mid]);
            if(cmp<0)
                hi = mid - 1;
            else if(cmp>0)
                lo = mid + 1;
            else
                return mid;
        }
        return lo;
    }


<a id="org865f417"></a>

### 符号表各种实现的优缺点

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">数据结构</th>
<th scope="col" class="org-left">实现</th>
<th scope="col" class="org-left">优点</th>
<th scope="col" class="org-left">缺点</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">链表（顺序查找）</td>
<td class="org-left">SequentialSearchST</td>
<td class="org-left">适用于小型问题</td>
<td class="org-left">对于大型符号表很慢</td>
</tr>


<tr>
<td class="org-left">有序数组（二分查找）</td>
<td class="org-left">BinarySearchST</td>
<td class="org-left">最优的查找效率和空间需求，</td>
<td class="org-left">插入操作很慢</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">能够进行有序性相关的操作</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">二叉查找树</td>
<td class="org-left">BST</td>
<td class="org-left">实现简单，支持有序性相关操作</td>
<td class="org-left">没有性能上界的保证，链接需要额外的空间</td>
</tr>


<tr>
<td class="org-left">平衡二叉查找树</td>
<td class="org-left">RedBlackBST</td>
<td class="org-left">最优的查找效率和插入效率，</td>
<td class="org-left">链接需要额外的空间</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">能够进行有序性相关的操作</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">散列表</td>
<td class="org-left">SeparateChainHashST</td>
<td class="org-left">能够快速查找和插入常见数据类型</td>
<td class="org-left">需要计算每种类型的数据的散列，无法进行有序性</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">LinearProbingHashST</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">相关操作，链接和空结点需要额外的空间</td>
</tr>
</tbody>
</table>


<a id="org3194f6b"></a>

## TODO 二叉查找树 BST (pg263)


<a id="org2702d2a"></a>

## 平衡查找树


<a id="orgc0e36ac"></a>

## 散列表


<a id="org3f49b2d"></a>

## 应用


<a id="orge47cbc5"></a>

# 图


<a id="org348a280"></a>

## 无向图


<a id="org9fa450f"></a>

## 有向图


<a id="orgff455cf"></a>

## 最小生成树


<a id="orge3a9389"></a>

## 最短路径


<a id="orgf0c36da"></a>

# 字符串


<a id="org89d7dbf"></a>

## 字符串排序


<a id="org6a2c6d4"></a>

## 单词查找树


<a id="org6501e72"></a>

## 子字符串查找


<a id="orgab2a488"></a>

## 正则表达式


<a id="orgc4aca36"></a>

## 数据压缩


<a id="org4173670"></a>

# 背景


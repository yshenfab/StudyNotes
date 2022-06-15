
# Table of Contents

1.  [Numpy Tutorial](#orgc9e4402)
    1.  [The Basics](#org562c378)
    2.  [Example](#org470dd06)
2.  [Tutorial2](#org39d49df)
    1.  [Part 1: Introduction to Arrays](#orgf66a8f2)
        1.  [How to create a numpy array](#orgfa4a52a)
        2.  [How to inspect the size and shape of a numpy array](#org2ca7fd9)
        3.  [How to extract specific items from an array](#org92fad9b)
        4.  [Reshaping and Flattening Multidimensional arrays](#org1dd032e)
        5.  [How to create sequences, repetitions and random numbers using numpy](#org96edcdc)
    2.  [Part 2: Vital Functions for Data Analysis](#org428f60d)
        1.  [How to get index locations that satisfy a given condition using np.where](#org8b39666)
        2.  [How to import and export data as a csv file](#org80d44ae)
        3.  [How to save and load numpy objects](#orgbe7f5b0)
        4.  [How to concatenate two numpy arrays column-wise and row-wise](#orgc404802)
        5.  [How to sort a numpy array based on one or more columns](#org3259aa8)
        6.  [Working with dates](#org9da90e5)
        7.  [Advanced numpy functions](#orge1a06f9)



<a id="orgc9e4402"></a>

# Numpy Tutorial


<a id="org562c378"></a>

## The Basics

In Numpy dimensions are called *axes*. The number of axes is *rank*.
A 3D space point [1,2,1] is an array of rank 1 because it has one axis.
[[1,0,0], [0,1,2]] has rank 2 (2-dimensional), the first dimension(axis) has a length of 2, the second has a length of 3.

-   Numpy's array class is called **ndarray**, also known as by alias **array**.
-   ndarray.ndim: number of axes of the array
-   ndarray.shape: n rows m columns, shape is (n,m)
-   ndarray.size: total num of elements in array
-   ndarray.dtype: data type
-   ndarray.itemsize: size in bytes of each element of the array
-   ndarray.data: buffer containing actual elements of the array


<a id="org470dd06"></a>

## TODO Example

-   a = np.array([1,2,3,4])
-   b = np.array([(1.5,2,3), (4,5,6)])
-   c = np.array( [ [1,2], [3,4] ], dtype=complex )
-   np.zeros( (3,4) )
-   np.ones( (2,3,4), dtype=np.int16 )
-   np.empty( (2,3) )
-   np.arange( 10, 30, 5 )
-   np.arange( 0, 2, 0.3 ) # 不建议用arange()接收float，用linspace代替
-   np.linspace( 0, 2, 9 ) # 9 numbers from 0 to 2
-   a = np.array( [20,30,40,50] )
    b = np.arange( 4 )
    c = a-b # array([20, 29, 38, 47])
    b\*\*2 # array([0, 1, 4, 9])
    10\*np.sin(a) # array([ 9.12945251, -9.88031624,  7.4511316 , -2.62374854])
    a<35 # array([ True, True, False, False], dtype=bool)
-   A = np.array( [[1,1],

&#x2026;             [0,1]] )
  B = np.array( [[2,0],
&#x2026;             [3,4]] )
  A\*B                         # elementwise product
array([[2, 0],
       [0, 4]])
  A.dot(B)                    # matrix product
array([[5, 4],
       [3, 4]])
  np.dot(A, B)                # another matrix product
array([[5, 4],
       [3, 4]])

-   a.sum() a.max() a.min()
    b.sum(axis=0)                            # sum of each column
    b.min(axis=1)                            # min of each row
    b.cumsum(axis=1)                         # cumulative sum along each row
-   until: Search "Iterating over multidimensional arrays is done with respect to the first axis:" in <https://docs.scipy.org/doc/numpy-dev/user/quickstart.html>
-   <http://cs231n.github.io/python-numpy-tutorial/>
-   <http://www.scipy-lectures.org/>


<a id="org39d49df"></a>

# Tutorial2


<a id="orgf66a8f2"></a>

## Part 1: Introduction to Arrays


<a id="orgfa4a52a"></a>

### How to create a numpy array

import numpy as np

list1 = [0,1,2,3,4]
arr1d = np.array(list1) # np.array([0,1,2,3,4])

list2 = [[0,1,2], [3,4,5], [6,7,8]]
arr2d = np.array(list2)

arr2d<sub>f</sub> = np.array(list2, dtype='float') # dtype: float, int, bool, str, object, float32, float64, int8, int16, int32&#x2026;

arr2d<sub>f.astype</sub>('int')

arr2d<sub>f.astype</sub>('int').astype('str')

arr2d<sub>b</sub> = np.array([1,0,10], dtype='bool') # True, False, True

arr1d<sub>obj</sub> = np.array([1,'a'], dtype='object')

arr1d<sub>obj.tolist</sub>() # [1,'a']


<a id="org2ca7fd9"></a>

### How to inspect the size and shape of a numpy array

list2 = [[1, 2, 3, 4],[3, 4, 5, 6], [5, 6, 7, 8]]
arr2 = np.array(list2, dtype='float')

arr2.shape # (3,4)

arr2.dtype # float64

arr2.size # 12

arr2.ndim # 2


<a id="org92fad9b"></a>

### How to extract specific items from an array

arr2[:2, :2] # array([1, 2], [3, 4])

b = arr2 > 4
b # array([[False, False, False, False],[False, False,  True,  True],[ True,  True,  True,  True]], dtype=bool)
arr2[b] # array([ 5.,  6.,  5.,  6.,  7.,  8.])

1.  How to reverse the rows and the whole array

    arr2[::-1, ] # array([[ 5.,  6.,  7.,  8.], [ 3.,  4.,  5.,  6.], [ 1.,  2.,  3.,  4.]])
    
    arr2[::-1, ::-1] # array([[ 8.,  7.,  6.,  5.], [ 6.,  5.,  4.,  3.], [ 4.,  3.,  2.,  1.]])

2.  How to represent missing values and infinite

    -   missing values: np.nan
    -   infinite: np.inf
    
    arr2[1,1] = np.nan
    arr2[1,2] = np.inf
    
    missing<sub>bool</sub> = np.isnan(arr2) | np.isinf(arr2)
    arr2[missing<sub>bool</sub>] = -1
    \#> array([[ 1.,  2.,  3.,  4.],
    \#>        [ 3., -1., -1.,  6.],
    \#>        [ 5.,  6.,  7.,  8.]])

3.  How to compute mean, min, max on the ndarray

    arr2.mean()
    arr2.min()
    arr2.max()
    
    np.amin(arr2, axis=0) # [1. -1. -1. 4.] column wise minimum，每一列的min
    np.amin(arr2, axis=1) # [1. -1. 5.] row wise minimum，每一行的min
    
    np.cumsum(arr2) # array([  1.,   3.,   6.,  10.,  13.,  12.,  11.,  17.,  22.,  28.,  35., 43.])

4.  How to create a new array from an existing array

    If you just assign a portion of an array to another array, the new array you just created actually refers to 
    the parent array in memory. That means, if you make any changes to the new array, it will reflect in the parent array as well.
    So to avoid disturbing the parent array, you need to make a copy of it using copy().
    
    arr2a = arr2[:2,:2]
    arr2a[:1,:1] = 100 # 100 will reflect in arr2
    \#> array([[ 100.,    2.,    3.,    4.],
    \#>        [   3.,   -1.,   -1.,    6.],
    \#>        [   5.,    6.,    7.,    8.]])
    
    arr2b = arr2[:2,:2].copy()
    arr2b[:1,:1] = 101 # 101 will not reflect in arr2
    \#> array([[ 100.,    2.,    3.,    4.],
    \#>        [   3.,   -1.,   -1.,    6.],
    \#>        [   5.,    6.,    7.,    8.]])


<a id="org1dd032e"></a>

### Reshaping and Flattening Multidimensional arrays

-   Reshaping: change the arrangement of items, shape changes while maintaining the same number of dimensions
-   Flattening: convert a multi-dimensional array to a flat 1d array, and not any other shape

arr2.reshape(4,3)
\#> array([[ 100.,    2.,    3.],
\#>        [   4.,    3.,   -1.],
\#>        [  -1.,    6.,    5.],
\#>        [   6.,    7.,    8.]])

1.  What is the difference between flatten() and ravel()

    -   two ways to implement flattening: flatten() and ravel()
    -   diff: the new array created using ravel is a reference to the parent array, changes to new array will affect the parent,
        but is memory efficient since it doesn't create a copy
    
    arr2.flatten() # array([100., 2., 3., 4., 3., -1., -1., 6., 5., 6., 7., 8.]) # or use arr2.ravel()


<a id="org96edcdc"></a>

### How to create sequences, repetitions and random numbers using numpy

-   np.arange() to create sequences as ndarray

np.arange(5) # [0 1 2 3 4]
np.arange(0,10) # [0 1 2 3 4 5 6 7 8 9]
np.arange(0,10,2) # [0 2 4 6 8]
np.arange(10,0,-1) # [10  9  8  7  6  5  4  3  2  1]

-   np.linspace

np.linspace(start=1,stop=50,num=10,dtype=int)
\#> array([ 1,  6, 11, 17, 22, 28, 33, 39, 44, 50])

-   np.logspace: base<sup>start</sup>, base<sup>stop</sup>, default base 10

np.set<sub>printoptions</sub>(precision=2)

np.logspace(start=1,stop=50,num=10,base=10)
\#> array([  1.00e+01,   2.78e+06,   7.74e+11,   2.15e+17,   5.99e+22,
\#>          1.67e+28,   4.64e+33,   1.29e+39,   3.59e+44,   1.00e+50])

-   np.zeros() and np.ones()

np.zeros([2,2])
\#> array([[ 0.,  0.],
\#>        [ 0.,  0.]])
np.ones([2,2])
\#> array([[ 1.,  1.],
\#>        [ 1.,  1.]])

1.  How to create repeating sequences

    -   np.tile: repeat a whole list or array n times
    -   np.repeat: repeat each item n times
    
    a = [1,2,3]
    
    np.tile(a,2) # [1 2 3 1 2 3]
    np.repeat(a,2) # [1 1 2 2 3 3]

2.  How to generate random numbers

    np.random.rand(2,2)
    
    np.random.randn(2,2)
    
    np.random.randint(0,10,size=[2,2])
    
    np.random.random()
    
    np.random.random(size=[2,2])
    
    np.random.choice(['a','e','i','o','u'],size=10)
    
    np.random.choice(['a', 'e', 'i', 'o', 'u'], size=10, p=[0.3, .1, 0.1, 0.4, 0.1]) # picks more o's
    
    -   set seed & random state
    
    rn = np.random.RandomState(100)
    
    rn.rand(2,2)
    
    np.random.seed(100)
    
    np.random.rand(2,2)

3.  How to get the unique items and the counts

    -   np.unique
    
    np.random.seed(100)
    arr<sub>rand</sub> = np.random.randint(0,10,size=10)
    \#> [8 8 3 7 7 0 4 2 5 2]
    
    uniqs, counts = np.unique(arr<sub>rand</sub>, return<sub>counts</sub>=True)
    \#> Unique items :  [0 2 3 4 5 7 8]
    \#> Counts       :  [1 2 1 1 1 2 2]


<a id="org428f60d"></a>

## Part 2: Vital Functions for Data Analysis


<a id="org8b39666"></a>

### How to get index locations that satisfy a given condition using np.where

-   np.where: locates the positions in the array where a given condition holds true

arr<sub>rand</sub> = np.array([8, 8, 3, 7, 7, 0, 4, 2, 5, 2])

index<sub>gt5</sub> = np.where(arr<sub>rand</sub> > 5) # (array([0, 1, 3, 4]),)

arr<sub>rand.take</sub>(index<sub>gt5</sub>) # array([ [8,8,7,7]])

np.where(arr<sub>rand</sub>>5,'gt5','le5')
\#> array(['gt5', 'gt5', 'le5', 'gt5', 'gt5', 'le5', 'le5', 'le5', 'le5', 'le5'],
      dtype='<U3')

np.argmax(arr<sub>rand</sub>) # 0
np.argmin(arr<sub>rand</sub>) # 5


<a id="org80d44ae"></a>

### How to import and export data as a csv file

-   import: np.genfromtxt() or np.loadtxt(), np.genfromtxt() is more powerful, while np.loadtxt() assumes the dataset has no missing values

np.set<sub>printoptions</sub>(suppress=True)

path = 'https://raw.githubusercontent.com/selva86/datasets/master/Auto.csv'

data = np.genfromtxt(path, delimiter=',', skip<sub>header</sub>=1, filling<sub>values</sub>=-999, dtype='float')
data[:3] # see first 3 rows

1.  How to handle datasets that has both numbers and text columns

    -   set dtype as 'object' or None
    
    data2 = np.genfromtxt(path, delimiter=',', skip<sub>header</sub>=1, dtype='object')
    data2 = np.genfromtxt(path, delimiter=',', skip<sub>header</sub>=1, dtype=None)
    data2[:3]  # see first 3 rows
    
    np.savetxt("out.csv", data, delimiter=",")


<a id="orgbe7f5b0"></a>

### How to save and load numpy objects

Numpy provides the .npy and the .npz file types for this purpose.

-   If you want to store a single ndarray object, store it as a .npy file using np.save. This can be loaded back using the np.load.
-   If store more than 1 ndarray object in a single file, save it as a .npz file using np.savez.

np.save('myarray.npy', arr2d)

np.savez('array.npz', arr2d<sub>f</sub>, arr2d<sub>b</sub>)

a = np.load('myarray.npy')

b = np.load('array.npz')
print(b.files) # ['arr<sub>0</sub>','arr<sub>1</sub>']
b['arr<sub>0</sub>']
\#> array([[ 0.,  1.,  2.],
\#>        [ 3.,  4.,  5.],
\#>        [ 6.,  7.,  8.]])


<a id="orgc404802"></a>

### How to concatenate two numpy arrays column-wise and row-wise

There are 3 different ways of concatenating two or more numpy arrays.

-   Method 1: np.concatenate by changing the axis parameter to 0 and 1
-   Method 2: np.vstack and np.hstack
-   Method 3: np.r\_ and np.c\_

All three methods provide the same output.
One key difference: unlike the other 2 methods, np.r\_ and np.c\_ use [] to stack arrays

a = np.zeros([4,4])
b = np.ones([4,4])

np.concatenate([a,b], axis=0)
np.vstack([a,b])
np.r\_[a,b]
\#> array([[ 0.,  0.,  0.,  0.],
\#>        [ 0.,  0.,  0.,  0.],
\#>        [ 0.,  0.,  0.,  0.],
\#>        [ 0.,  0.,  0.,  0.],
\#>        [ 1.,  1.,  1.,  1.],
\#>        [ 1.,  1.,  1.,  1.],
\#>        [ 1.,  1.,  1.,  1.],
\#>        [ 1.,  1.,  1.,  1.]])

np.concatenate([a,b], axis=1)
np.hstack([a,b])
np.c\_[a,b]
\#> array([[ 0.,  0.,  0.,  0.,  1.,  1.,  1.,  1.],
\#>        [ 0.,  0.,  0.,  0.,  1.,  1.,  1.,  1.],
\#>        [ 0.,  0.,  0.,  0.,  1.,  1.,  1.,  1.],
\#>        [ 0.,  0.,  0.,  0.,  1.,  1.,  1.,  1.]])

np.r\_[[1,2,3], 0, 0, [4,5,6]]
\#> array([1, 2, 3, 0, 0, 4, 5, 6])


<a id="org3259aa8"></a>

### How to sort a numpy array based on one or more columns

arr = np.random.randint(1,6, size=[8, 4]) # 8 rows, 4 columns
\#> array([[3, 3, 2, 1],
\#>        [1, 5, 4, 5],
\#>        [3, 1, 4, 2],
\#>        [3, 4, 5, 5],
\#>        [2, 4, 5, 5],
\#>        [4, 4, 4, 2],
\#>        [2, 4, 1, 3],
\#>        [2, 2, 4, 3]])

np.sort(arr, axis=0)
\#> array([[1, 1, 1, 1],
\#>        [2, 2, 2, 2],
\#>        [2, 3, 4, 2],
\#>        [2, 4, 4, 3],
\#>        [3, 4, 4, 3],
\#>        [3, 4, 4, 5],
\#>        [3, 4, 5, 5],
\#>        [4, 5, 5, 5]])

1.  How to sort a numpy array based on 1 column using argsort

    -   np.argsort() returns the index positions of that would make a given 1d array sorted.
    
    x = np.array([1,10,5,2,8,9])
    sort<sub>index</sub> = np.argsort(x) # [0 3 2 4 5 1]
    x[sort<sub>index</sub>] # array([ 1,  2,  5,  8,  9, 10])
    
    sorted<sub>index</sub><sub>1stcol</sub> = arr[:,0].argsort()
    
    arr[sorted<sub>index</sub><sub>1stcol</sub>]
    \#> array([[1, 5, 4, 5],
    \#>        [2, 4, 5, 5],
    \#>        [2, 4, 1, 3],
    \#>        [2, 2, 4, 3],
    \#>        [3, 3, 2, 1],
    \#>        [3, 1, 4, 2],
    \#>        [3, 4, 5, 5],
    \#>        [4, 4, 4, 2]])
    
    arr[sorted<sub>index</sub><sub>1stcol</sub>[::-1]]
    \#> array([[4, 4, 4, 2],
    \#>        [3, 4, 5, 5],
    \#>        [3, 1, 4, 2],
    \#>        [3, 3, 2, 1],
    \#>        [2, 2, 4, 3],
    \#>        [2, 4, 1, 3],
    \#>        [2, 4, 5, 5],
    \#>        [1, 5, 4, 5]])

2.  How to sort a numpy array based on 2 or more columns

    -   np.lexsort: passing a tuple of columns based on which the array should be sorted
    
    lexsorted<sub>index</sub> = np.lexsort((arr[:, 1], arr[:, 0])) 
    arr[lexsorted<sub>index</sub>]


<a id="org9da90e5"></a>

### Working with dates

date64 = np.datetime64('2018-02-04 23:10:10') #> numpy.datetime64('2018-02-04T23:10:10')

dt64 = np.datetime64(date64,'D') #> numpy.datetime64('2018-02-04')

tenminutes = np.timedelta64(10, 'm')  # 10 minutes
tenseconds = np.timedelta64(10, 's')  # 10 seconds
tennanoseconds = np.timedelta64(10, 'ns')  # 10 nanoseconds
print('Add 10 days: ', dt64 + 10)
print('Add 10 minutes: ', dt64 + tenminutes)
print('Add 10 seconds: ', dt64 + tenseconds)
print('Add 10 nanoseconds: ', dt64 + tennanoseconds)
\#> Add 10 days:  2018-02-14
\#> Add 10 minutes:  2018-02-04T00:10
\#> Add 10 seconds:  2018-02-04T00:00:10
\#> Add 10 nanoseconds:  2018-02-04T00:00:00.000000010

np.datetime<sub>as</sub><sub>string</sub>(dt64) #> '2018-02-04'

1.  How to create a sequence of dates

    dates = np.arange(np.datetime64('2018-02-01'), np.datetime64('2018-02-10'))
    print(dates)
    
    np.is<sub>busday</sub>(dates)
    \#> ['2018-02-01' '2018-02-02' '2018-02-03' '2018-02-04' '2018-02-05'
    \#>  '2018-02-06' '2018-02-07' '2018-02-08' '2018-02-09']
    array([ True,  True, False, False,  True,  True,  True,  True,  True], dtype=bool)

2.  How to convert numpy.datetime64 to datetime.datetime object

    import datetime
    dt = dt64.tolist() #> datetime.date(2018, 2, 4)
    print('Year: ', dt.year)  
    print('Day of month: ', dt.day)
    print('Month of year: ', dt.month)  
    print('Day of Week: ', dt.weekday())  # Sunday
    \#> Year:  2018
    \#> Day of month:  4
    \#> Month of year:  2
    \#> Day of Week:  6


<a id="orge1a06f9"></a>

### Advanced numpy functions

1.  vectorize – Make a scalar function work on vectors

    def foo(x):
        if x % 2 == 1:
            return x\*\*2
        else:
            return x/2
    
    print('x = 10 returns ', foo(10)) # 5.0
    print('x = 11 returns ', foo(11)) # 121
    
    foo<sub>v</sub> = np.vectorize(foo, otypes=[float])
    print('x = [10, 11, 12] returns ', foo<sub>v</sub>([10, 11, 12]))
    print('x = [[10, 11, 12], [1, 2, 3]] returns ', foo<sub>v</sub>([[10, 11, 12], [1, 2, 3]]))
    \#> x = [10, 11, 12] returns  [   5.  121.    6.]
    \#> x = [[10, 11, 12], [1, 2, 3]] returns  [[ 5. 121. 6.] [ 1.  1.  9.] ]

2.  apply<sub>along</sub><sub>axis</sub> – Apply a function column wise or row wise

    np.random.seed(100)
    arr<sub>x</sub> = np.random.randint(1,10,size=[4,10])
    \#> array([[9, 9, 4, 8, 8, 1, 5, 3, 6, 3],
    \#>        [3, 3, 2, 1, 9, 5, 1, 7, 3, 5],
    \#>        [2, 6, 4, 5, 5, 4, 8, 2, 2, 8],
    \#>        [8, 1, 3, 4, 3, 6, 9, 2, 1, 8]])
    
    def max<sub>minus</sub><sub>min</sub>(x):
        return np.max(x) - np.min(x)
    
    print('Row wise: ', np.apply<sub>along</sub><sub>axis</sub>(max<sub>minus</sub><sub>min</sub>, 1, arr=arr<sub>x</sub>))
    \#> Row wise:  [8 8 6 8]
    
    print('Column wise: ', np.apply<sub>along</sub><sub>axis</sub>(max<sub>minus</sub><sub>min</sub>, 0, arr=arr<sub>x</sub>))
    \#> Column wise:  [7 8 2 7 6 5 8 5 5 5]

3.  searchsorted – Find the location to insert so the array will remain sorted

    -   np.searchsorted() gives the index position at which a number should be inserted in order to keep the array sorted.
    
    x = np.arange(10)
    print('Where should 5 be inserted?: ', np.searchsorted(x, 5))
    \#> Where should 5 be inserted?:  5
    print('Where should 5 be inserted (right)?: ', np.searchsorted(x, 5, side='right'))
    \#> Where should 5 be inserted (right)?:  6
    
    lst = range(10000)  # the list
    probs = np.random.random(10000); probs /= probs.sum()  # probabilities
    %timeit lst[np.searchsorted(probs.cumsum(), np.random.random())]
    %timeit np.random.choice(lst, p=probs)
    \#> 36.6 µs ± 3.93 µs per loop (mean ± std. dev. of 7 runs, 10000 loops each)
    \#> 1.02 ms ± 7.16 µs per loop (mean ± std. dev. of 7 runs, 1000 loops each)

4.  How to add a new axis to a numpy array

    -   np.newaxis
    
    x = np.arange(5)
    print('Original array: ', x)
    
    x<sub>col</sub> = x[:, np.newaxis]
    print('x<sub>col</sub> shape: ', x<sub>col.shape</sub>)
    print(x<sub>col</sub>)
    
    x<sub>row</sub> = x[np.newaxis, :]
    print('x<sub>row</sub> shape: ', x<sub>row.shape</sub>)
    print(x<sub>row</sub>)
    \#> Original array:  [0 1 2 3 4]
    \#> x<sub>col</sub> shape:  (5, 1)
    \#> [[0]
    \#>  [1]
    \#>  [2]
    \#>  [3]
    \#>  [4]]
    \#> x<sub>row</sub> shape:  (1, 5)
    \#> [[0 1 2 3 4] ]

5.  More Useful Functions

    -   Digitize
    
    Use np.digitize to return the index position of the bin each element belongs to.
    
    x = np.arange(10)
    bins = np.array([0, 3, 6, 9])
    
    np.digitize(x, bins)
    \#> array([1, 1, 1, 2, 2, 2, 3, 3, 3, 4])
    
    -   Clip
    
    Use np.clip to cap the numbers within a given cutoff range. All number lesser than the lower 
    limit will be replaced by the lower limit. Same applies to the upper limit also.
    
    np.clip(x, 3, 8)
    \#> array([3, 3, 3, 3, 4, 5, 6, 7, 8, 8])
    
    -   Histogram and Bincount
    
    Both histogram() and bincount() gives the frequency of occurences. But with certain differences.
    While histogram() gives the frequency counts of the bins, bincount() gives the frequency count of all the 
    elements in the range of the array between the min and max values. Including the values that did not occur.
    
    x = np.array([1,1,2,2,2,4,4,5,6,6,6]) # doesn't need to be sorted
    np.bincount(x) # 0 occurs 0 times, 1 occurs 2 times, 2 occurs thrice, 3 occurs 0 times, &#x2026;
    
    counts, bins = np.histogram(x, [0, 2, 4, 6, 8])
    print('Counts: ', counts)
    print('Bins: ', bins)
    \#> Counts:  [2 3 3 3]
    \#> Bins:  [0 2 4 6 8]


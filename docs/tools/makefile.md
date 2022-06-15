
# Table of Contents

1.  [Makefile](#orge4bd9d6)
    1.  [概述](#orga8fcdf9)
    2.  [关于程序的编译和链接](#orgde4089b)
    3.  [Makefile介绍](#org9db7582)
    4.  [Makefile总述](#orgf20546c)
    5.  [书写规则](#orgf1e2597)
    6.  [书写命令](#orgee36bab)
    7.  [使用变量](#org492bbdb)
    8.  [使用条件判断](#org1fa0019)
    9.  [使用函数](#org47b5f87)
    10. [make的运行](#orgfbe4503)
    11. [隐含规则](#org140df06)
    12. [使用make更新函数库文件](#orgdce9234)
    13. [后序](#orgdb4c6a9)



<a id="orge4bd9d6"></a>

# Makefile


<a id="orga8fcdf9"></a>

## 概述

-   Windows的IDE都为你做了这个工作
-   makefile关系到了整个工程的编译规则
-   一个工程中的源文件不计数，其按类型、功能、模块分别放在若干个目录中，makefile定义了一系列的规则来指定
    哪些文件需要先编译，哪些文件需要后编译，哪些文件需要重新编译，甚至于进行更复杂的功能操作，
    因为makefile就像一个Shell脚本一样，其中也可以执行操作系统的命令
-   自动化编译，一个make命令，整个工程完全自动编译，makefile都成为了一种在工程方面的编译方法


<a id="orgde4089b"></a>

## 关于程序的编译和链接

-   编译：把源文件编译成中间代码文件，在Windows下也就是.obj文件，UNIX下是.o 文件，即Object File
-   链接：把大量的Object File合成执行文件
-   编译时，编译器需要的是语法的正确，函数与变量的声明的正确；
    链接，需要告诉编译器头文件的所在位置(头文件中应该只是声明，而定义应该放在C/C++文件中)
-   链接时，主要是链接函数和全局变量，目标文件(O文件或是OBJ文件)来链接我们的应用程序，链接器并不管函数所在的源文件，
    只管函数的中间目标文件，在大多数时候，由于源文件太多，编译生成的中间目标文件太多，而在链接时需要明显地指出中间目标文件名，
    这对于编译很不方便，所以我们要给中间目标文件打个包，在Windows下这种包叫“库文件”(Library File)，
    也就是.lib 文件，在UNIX下是Archive File，也就是.a文件


<a id="org9db7582"></a>

## Makefile介绍

规则：

1.  如果工程没有被编译过，那么所有C文件都要编译并被链接
2.  如果某几个C文件被修改，那么只编译被修改的C文件，并链接目标程序
3.  如果头文件被修改，那么需要编译引用了这几个头文件的C文件，并链接目标程序

1.  Makefile的规则

    -   target &#x2026;: prerequisites &#x2026;
        command
        &#x2026;
        &#x2026;
    -   target也就是一个目标文件,可以是 Object File,也可以是执行文件。还可以是一个标签(Label)
    -   prerequisites 就是,要生成那个 target 所需要的文件或是目标
    -   command 也就是 make 需要执行的命令(任意的 Shell 命令)
    -   这是一个文件的依赖关系,也就是说target这一个或多个的目标文件依赖于prerequisites中的文件,
        其生成规则定义在command中。说白一点就是说prerequisites中如果有一个以上的文件比target文件要新的话,
        command所定义的命令就会被执行。这就是Makefile的规则。也就是Makefile中最核心的内容。

2.  一个示例

    -   make会比较targets文件和prerequisites文件的修改日期,如果prerequisites文件的日期要比targets文件的日期要新,
        或者target不存在的话,那么make就会执行后续定义的命令

3.  make是如何工作的

    1.  make会在当前目录下找名字叫“Makefile”或“makefile”的文件。
    2.  如果找到,它会找文件中的第一个目标文件(target),在上面的例子中,他会找到“edit”这个文件,并把这个文件作为最终的目标文件。
    3.  如果 edit 文件不存在,或是 edit 所依赖的后面的 .o 文件的文件修改时间要比 edit这个文件新,那么,他就会执行后面所定义的命令来生成 edit 这个文件。
    4.  如果 edit 所依赖的.o 文件也存在,那么 make 会在当前文件中找目标为.o 文件的依赖性,如果找到则再根据那一个规则生成.o 文件。(这有点像一个堆栈的过程)
    5.  当然,你的 C 文件和 H 文件是存在的啦,于是 make 会生成 .o 文件,然后再用 .o 文件生命 make 的终极任务,也就是执行文件 edit 了。

4.  makefile中使用变量

    -   makefile的变量也就是一个字符串,理解成C语言中的宏可能会更好
    -   example:
    
    edit : main.o kbd.o command.o display.o \\
    insert.o search.o files.o utils.o
    cc -o edit main.o kbd.o command.o display.o \\
    insert.o search.o files.o utils.o
    上面一堆.o文件，用一个变量表示：
    objects = main.o kbd.o command.o display.o \\
    insert.o search.o files.o utils.o
    然后在makefile中以"$(objects)"的方式使用变量
    edit: $(objects)
    cc -o edit $(objects)

5.  让make自动推导

    GNU的make很强大，如果make找到一个whatever.o，那么whatever.c就会是whatever.o的依赖文件，并且
    cc -c whatever.c也会被推导出来。
    
    -   example:
    
    objects = main.o kbd.o command.o display.o \\
    insert.o search.o files.o utils.o
    
    edit: $(objects)
    cc -o edit $(objects)
    
    main.o: defs.h
    kbd.o: defs.h command.h
    command.o: defs.h command.h
    display.o: defs.h buffer.h
    insert.o: defs.h buffer.h
    search.o: defs.h buffer.h
    files.o: defs.h buffer.h command.h
    utils.o: defs.h
    
    .PHONY: clean
    clean:
    rm edit $(objects)
    
    -   隐晦规则
    -   伪目标文件：.PHONY

6.  另类风格的makefile

    上面的例子里：
    $(objects): defs.h
    kbd.o command.o files.o: command.h
    display.o insert.o search.o files.o: buffer.h
    但是这样文件依赖关系就显得有些凌乱

7.  清空目标文件的规则

    clean从来都是放在文件的最后
    
    -   一般风格：
    
    clean:
    rm edit $(objects)
    
    -   更稳健的做法：
    
    .PHONY: clean
    clean:
    -rm edit $(objects)
    其中减号"-"表示忽略遇到的错误


<a id="orgf20546c"></a>

## Makefile总述

1.  Makefile里有什么

    主要包含了5个东西：
    
    1.  显式规则
        如何生成一个或多的的目标文件，指明要生成的文件、文件的依赖文件、生成的命令
    2.  隐晦规则
        利用make的自动推导功能，简略书写makefile
    3.  变量的定义
        定义字符串，类似C语言中的宏
    4.  文件指示
        3个部分：
        1.  一个是在一个Makefile中引用另一个Makefile，就像include一样
        2.  另一个是指根据某些情况指定Makefile中的有效部分，就像C语言中的预编译#if一样
        3.  还有就是定义一个多行的命令
    5.  注释
        “#”注释，“\\#”转义
        Makefile中的命令，\*\*必须要以TAB键开始\*\*

2.  Makefile的文件名

    -   默认为Makefile, makefile或GNUmakefile
    -   也可以自己指定，比如Make.jlinno，以make -f Make.jlinno运行

3.  引用其他的Makefile

    -   语法：include <filename> 没有#号
        filename可以是当前操作系统shell的文件模式（可以包含路径和通配符）
        include前面可以有一些空字符，但绝不能是TAB
    -   example: 有几个Makefile: a.mk, b.mk, c.mk，还有一个文件foo.make，以及一个变量$(bar)包含了e.mk和f.mk
        那么可以写成
        include foo.make \*\*.mk $(bar)

4.  环境变量MAKEFILES

5.  make的工作方式

    执行步骤：
    
    1.  读入所有的Makefile
    2.  读入被include的其它Makefile
    3.  初始化文件中的变量
    4.  推导隐晦规则，并分析所有规则
    5.  为所有的目标文件创建依赖关系链
    6.  根据依赖关系，决定哪些目标要重新生成
    7.  执行生成命令
    
    其中1-5为第一阶段，6-7为第二阶段。


<a id="orgf1e2597"></a>

## 书写规则

规则包含两个部分,一个是依赖关系,一个是生成目标的方法。
Makefile中只应该有一个最终目标，一般第一条规则中的目标被确立为最终目标。

1.  规则举例

    foo.o: foo.c defs.h # foo模块
        cc -c -g foo.c
    1.文件的依赖关系：foo.o依赖于foo.c和defs.h，如果foo.c和defs.h文件日期比foo.o新，或foo.o不存在，那么依赖关系发生
    2.如果生成（或更新）foo.o文件，也就是cc命令，说明了如何生成foo.o这个文件

2.  规则的语法

    targets: prerequisites
    command
    &#x2026;
    或
    targets: prerequisites ; command
    command
    &#x2026;
    
    -   targets是文件名，以空格分开，可以使用通配符，一般目标是一个文件，也可能是多个文件
    -   command是命令行，如果不和targets: prerequisites在一行，必须以TAB开头，在一行则用分号分隔
    -   prerequisites是目标所依赖的文件（或依赖目标）
    -   如果命令太长，可以使用\\换行

3.  在规则中使用通配符

    make支持3个通配符：\*\*  ?  [&#x2026;]
    
    -   常见错误： objects = \*\*.o
    
    这里的[\*\*.o]并不会展开，而是跟宏一样，objects的值就是\*\*.o，可以使用关键字wildcard，
    objects := $(wildcard \*\*.o)

4.  文件搜寻

    大型工程的源文件通常要分类到不同目录中，make需要去寻找文件的依赖关系
    
    -   VPATH特殊变量
        Makefile中特殊变量"VPATH"就是完成这个功能的，如果没有指明，make只在当前目录寻找依赖文件和目标文件
        如果定义了VPATH，make在当前目录找不到的情况下，到指定目录中去寻找文件
        VPATH = src:../headers
        上面指定了2个目录，"src"和"../headers"，目录由冒号分隔（当前目录永远是最高优先搜索的地方）
    -   vpath关键字（更灵活）
        3种使用方法：
        
        1.  vpath <pattern> <directories>
            为符合模式<pattern>的文件指定搜索目录<directories>
        2.  vpath <pattern>
            清除符合模式<pattern>的文件的搜索目录
        3.  vpath
            清除所有已被设置好了的文件搜索目录
        
        <pattern>中需要包含“%”字符，"%"意思是匹配零或若干字符，例如"%.h"表示所有以".h"结尾的文件
        <pattern>指定了要搜索的文件集，而<directories>指定了<pattern>的文件集搜索的目录，例如：
        vpath %.h ../headers
        若多个vpath语句出现相同/重复<pattern>，那么按语句顺序先后执行搜索

5.  伪目标

    -   clean就是一个伪目标，并不生成"clean"这个文件，伪目标只是一个标签
        clean:
        rm \*\*.o temp
    -   通过特殊标记".PHONY"来显示指明一个目标是伪目标：
        .PHONY: clean
        clean:
        rm \*\*.o temp
    -   伪目标一般没有依赖的文件

6.  多目标

    -   自动化变量"$@"，这个变量表示着目前规则中所有的目标的集合
        多个目标同时依赖于一个文件
    -   example:
        bigoutput littleoutput : text.g
        generate text.g -$(subst output,,$@) > $@
          上述规则相当于：
          bigoutput : text.g
          generate text.g -big > bigoutput
          littleoutput : text.g
          generate text.g -little > littleoutput
          其中，-$(subst output,,$@)中的"$"表示执行一个Makefile的函数，函数名为subst，后面的为参数。
        subst函数是截取字符串的意思，"$@"表示目标的集合，就像一个数组，"$@"依次取出目标，并执行命令。

7.  静态模式

    静态模式可以更加容易地定义多目标的规则，可以让我们的规则变得更加有弹性和灵活。
    语法：
    <targets &#x2026;> : <target-pattern> : <prereq-pattern &#x2026;>
    <command>
    &#x2026;
    
    -   targets定义了一系列的目标文件，可以有通配符，是目标的一个集合
    -   target-pattern指明了targets的模式，也就是目标集的模式
    -   prereq-patterns是目标的依赖模式，它对target-pattern形成的模式再进行一次依赖目标的定义
    -   example:
        objects = foo.o bar.o
        all: $(objects)
        $(objects): %.o : %.c
        $(CC) -c $(CFLAGS) $< -o $@
          其中，"$<"表示所有的依赖目标集（也就是"foo.c bar.c"），"$@"表示目标集（也就是"foo.o bar.o"）
        于是，上面的规则展开后等价于：
        foo.o : foo.c
        $(CC) -c $(CFLAGS) foo.c -o foo.o
        bar.o : bar.c
        $(CC) -c $(CFLAGS) bar.c -o bar.o

8.  自动生成依赖性

    gcc -MM xxx.c输出依赖关系


<a id="orgee36bab"></a>

## 书写命令

1.  显示命令

2.  命令执行

    如果要让上一条命令的结果应用在下一条命令，应该用分号分隔两条命令，写在一行，例：
    exec:
    cd /home/yang
    pwd
    和
    exec:
    cd /home/yang ; pwd
    后者正确

3.  命令出错

    -   “-”（在TAB之后）减号标记命令不管出不出错都认为是成功的，如：
        clean:
        -rm -f \*\*.o
    -   make -i 或 &#x2013;ignore-errors参数，全局方法，忽略所有命令的错误
    -   make -k 或 &#x2013;keep-going，如果命令出错，继续执行其他规则

4.  嵌套执行make

    -   大工程可以在不同目录写一个该目录的Makefile，这样不会太乱，方便维护。总控的Makefile可以这样写：
    
    subsystem:
    cd subdir && $(MAKE)
    等价于
    subsystem:
    $(MAKE) -C subdir
    
    -   传递/不传递变量到下级Makefile中
        export <variable &#x2026;>
        unexport <variable &#x2026;>
        例：
        export variable = value
        等价于：
        variable = value
        export variable
        等价于：
        export variable := value
        等价于：
        variable := value
        export variable
    -   如果要传递所有变量，只需要一个export，后面什么都不跟，表示传递所有变量

5.  定义命令包

    如果Makefile中出现一些相同命令序列，那么可以为这些相同的命令序列定义一个变量。
    语法：以define开始，以endef结束，如：
    define run-yacc
    yacc $(firstword $^)
    mv y.tab.c $@
    endef
    这里，run-yacc是命令包的名字，不要和Makefile中变量重名。


<a id="org492bbdb"></a>

## 使用变量

Makefile中变量名可以包含字符、数字、下划线（可以以数字开头）
但不能包含":"、"#"、"="、或是空字符（空格、回车等）
变量是大小写敏感的
传统的Makefile变量名是全大写的命名方式

1.  变量的基础

    变量声明时需要给予初值，使用时需要在变量名前加上"$"符号，但最好用小括号()或大括号{}把变量包起来，
    如果要用"$"字符，用"$$"表示。变量就是“替代”的作用。

2.  变量中的变量

    变量可以使用后面的变量来定义：
    foo = $(bar)
    bar = $(ugh)
    ugh = Huh?
    all:
    echo $(foo)
    
    -   好处：可以把变量的真实值推到后面定义
        CFLAGS = $(include<sub>dirs</sub>) -O
        include<sub>dirs</sub> = -Ifoo -Ibar
    -   坏处：递归定义，无限展开
        CFLAGS = $(CFLAGS) -O
        或
        A = $(B)
        B = $(A)
        为了避免这样，我们使用make中另一种用变量来定义变量的方法，使用":="操作符：
        x := foo
        y := $(x) bar
        x := later
        等价于：
        y := foo bar
        x := later
        这种方法，前面的变量不能使用后面的变量，只能使用前面已定义好了的变量：
        y := $(x) bar
        x := foo
        那么y的值是bar，而不是foo bar

3.  变量高级用法

    1.  变量值的替换
    
        -   替换变量中共有的部分，格式是"$(var:a=b)"或"${var:a=b}"，意思是把变量var中所有以a结尾（空格或结束符）的a替换成b
        -   example
            foo := a.o b.o c.o
            bar := $(foo:.o=.c)
            这里bar的值为a.c b.c c.c
        -   静态模式替换
            foo := a.o b.o c.o
            bar := $(foo:%.o=%.c)
    
    2.  把变量的值再当成变量
    
        简单的例子：
        x = y
        y = z
        a := $($(x))
        复杂的例子：
        x = variable1
        variable2 := Hello
        y = $(subst 1,2,$(x))
        z = y
        a := $($($(z)))

4.  追加变量值

    使用“+=”给变量追加值，如：
    objects = main.o foo.o bar.o utils.o
    objects += another.o
    等同于
    objects = main.o foo.o bar.o utils.o
    objects := $(objects) another.o
    
    -   如果变量之前没有定义过，那么"+="会自动变成"="
    -   如果定义过，那么"+="会继承于前次操作的赋值符
    -   如果前一次是":="，那么"+="会以":="作为其赋值符
    -   example
    
    variable := value
    variable += more
    等价于
    variable := value
    variable := $(variable) more
    但如果是
    variable = value
    variable += more
    此时+=会以=来做为赋值

5.  TODO override指示符(pg38)

6.  多行变量

7.  环境变量

8.  目标变量

9.  模式变量


<a id="org1fa0019"></a>

## 使用条件判断


<a id="org47b5f87"></a>

## 使用函数


<a id="orgfbe4503"></a>

## make的运行


<a id="org140df06"></a>

## 隐含规则


<a id="orgdce9234"></a>

## 使用make更新函数库文件


<a id="orgdb4c6a9"></a>

## 后序


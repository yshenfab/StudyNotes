# Practical Vim

1. . 重复上次修改
2. ;重复查找行内上次 f{char}/t{char}命令所查找的字符，,向前查找
3. &重复执行替换 :s/target/replacement
4. 理想模式：一键移动，一键执行
5. u 撤销的粒度是一次修改，控制 Esc 的使用就可以控制撤销的粒度
6. 删除光标前一个单词 db，删除后一个 dw
7. text objects，例如 aw 表示 a word，daw 可以删除一个单词（无论光标在单词的哪个字母处），as 表示 a sentence，ap 表示 a paragraph
8. <C-a>和<C-x>分别对数字执行+和-操作
9. c 修改，修改完会进入插入模式
10. 插入模式/bash shell 中，<C-h>删除前一个字符，<C-w>删除前一个单词，<C-u>删至行首
11. 切换到普通模式<Esc> 或 <C-[>，切换到插入-普通模式<C-o>，所谓插入-普通模式即 execute one command, return to Insert mode，例如<C-o>zz
12. 重绘屏幕，把当前行显示在窗口正中，z.或 zz，区别是 z.会把光标移动到行内第一个 non-blank 字符处，zz 保持光标位置不变
13. K 查看手册，例如光标位于 ls 上，按 K 相当于 man ls
14. J 把当前行和下一行连接在一起
15. 插入模式下，<C-r>0 把复制的文本粘贴到光标所在位置，寄存器命令的一般格式是<C-r>{register}
16. 表达式寄存器用于计算，插入模式下<C-r>=就可以访问这一寄存器，例：<C-r>=6\*35<CR> 就会插入 210
17. R 替换模式
18. vit 命令 visually select inside the tag，it 命令是一种被称为 text
    object 的特殊动作命令，例 vit 会选中<a href="#">one</a>当中的 one
19. 尽量用操作符命令，而不是可视命令
20. gv 选中上次的高亮选区
21. :{start},{end}，数字表示行号，\%表示当前文件中所有行，\$表示最后一行，.光标所在行
22. yyp 会使用寄存器，用:t.复制当前行不使用寄存器，因此不会覆盖寄存器内容
23. @:重复上次命令，:寄存器总是保存最后执行的命令行命令
24. <C-o> 回到跳转列表中上条记录，即上一次光标所在位置
25. 命令行下，<C-r><C-w>会复制光标下的单词并插入到命令行中
26. A buffer is the in-memory text of a file. A window is a viewport on a buffer. A tab page is a collection of windows.
27. 分割窗口，<C-w>s 水平分割，<C-w>v 垂直分割，:sp {file}水平分割并载入 file，:vsp
    {file}垂直分割并载入 file
28. 关闭窗口，<C-w>c 或:clo[se]关闭活动窗口，<C-w>o 或:on[ly]只保留活动窗口，关闭其他所有窗口
29. resize 窗口，<C-w>=使所有窗口等宽等高，<C-w>*最大化活动窗口高度，<C-w>|最大化活动窗口宽度，[N]<C-w>*高度设为 N，[N]<C-w>|宽度设为 N
30. :lcd {path}设置当前窗口的本地工作目录，:windo lcd {path}为标签页所有窗口设置本地工作目录
31. :tabe[dit] {filename}打开一个新的标签页，:tabc[lose]关闭当前标签页，:tabo[nly]关闭除活动标签页以外的其他标签页
32. 标签页编号从 1 开始，可以用{N}gt 在标签页切换，也可以用:tabn[ext] {N}命令，gt 或:tabn[ext]切换到下一个标签页，gT 或:tabp[revious]切换到上一标签页
33. :tabmove [N]重排标签页
34. :e %<Tab>会自动展开完整文件路径，%代表活动缓冲区的完整文件路径。:e %:h<Tab>会去除文件名，保留路径。
35. :find test.cc
36. :e.打开文件管理器，并显示当前工作目录。:Explore 打开文件管理器，并显示活动缓冲区所在目录
37. <C-g>查看文件状态
38. text object
39. d{motion} aw/as/ap, c{motion} iw/is/ip
40. m{a-zA-Z}设置标记当前光标所在位置，方便快速跳转。小写位置只在每个缓冲区局部可见，大写位置全局可见。'{mark}跳到标记所在行，并把光标移动到第一个非 blank 字符。`{mark}跳到标记所在行，并保持标记时光标所在位置。
41. surround.vim 插件，S"可以用一对双引号把选中的文本括起来，cs}]可以把{London}改成[London]
42. vim 记录跳转前后的位置，<C-o>后退，<C-i>或<Tab>前进，:jumps 查看跳转记录。
43. :changes 查看改变列表
44. 光标移动到文件名上，gf (go to file)
45. vim 寄存器是一组用于保存文本的简单容器，若不指定寄存器，delete/yank/put 操作将使用无名寄存器""
46. blackhole register "\_ ，使用"\_d{motion}会执行真正的删除操作
47. "ayiw 把当前单词复制到寄存器 a 中，"ap 粘贴来自寄存器 a 的单词；"bdd 把当前行剪切到寄存器 b 中，"bp 粘贴来自寄存器 b 的文本
48. 复制专用寄存器"0，使用 y{motion}时，复制的文本不仅被拷贝到无名寄存器中，也被拷贝到了复制专用寄存器中
49. 有名寄存器"a-"z，系统剪切板/加号寄存器"+，表达式寄存器"=
50. 可以高亮选中文本，然后用寄存器中的内容替换高亮选区
51. 黄金法则：在录制一个宏时，要确保每条命令都可被重复执行。
52. 给宏追加命令，例如 qa xxxx q 录制了宏在寄存器 a 中，录制完发现想要追加一个 j，按 qA j q 即可
53. ~切换光标所在处字母的大小写
54. 编辑宏，例如要编辑宏 a，可以用:put a 或"ap 把寄存器 a 里的内容粘贴出来，编辑完后"ay 把内容复制到寄存器 a 即可
55. 用\v 模式使得 vim 正则表达式看起来更直观，例如匹配 16 进制颜色，/\v#([0-9a-fA-F]{6}|[0-9a-fA-F]{3})或者/\v#(\x{6}|\x{3})，其中\x 代替完整字符集[0-9a-fA-F]
    body 　{ color: #3c3c3c; }
    a 　　{ color: #0000EE; }
    strong 　{ color: #000; }
56. 原义开关\V，例如文档中有 a.k.a.，/a.k.a.也会匹配 backward 这样的词，使用/\Va.k.a.就只会匹配 a.k.a.
57. 匹配两个连续重复单词的正则：/\v<(\w+)\_s+\1>
    原理：()内部匹配的文本会被自动保存到一个临时仓库，\1 引用这段被捕获的文本，如果包含多个()，则可以用\2 直到\9，\0 引用整个匹配，\_s 匹配空白符 or 换行符，<>匹配单词的边界
58. /the<CR>会匹配到 the,they,their 中的所有 the，如果想明确匹配 the 这个单词，则用<the>做单词界定，即/\v<the><CR>
59. \w 匹配单词类字符，包括字母数字下划线，\W 匹配除单词类字符以外的其他字符
60. 使用圆括号/\v(And|D)rew 可以匹配 Andrew 或 Drew，如果不想捕获括号内的内容到寄存器\1，可以加一个%，即/\v%(And|D)rew
61. :nohlsearch 或:noh 暂时关闭查找高亮功能，直到执行新的查找命令
62. \C 强制区分大小写
63. q/调出查找历史
64. 替换命令:substitute 语法:[range]s[ubstitute]/{pattern}/{string}/[flags]
65. :s/a/b 替换第一个匹配，:s/a/b/g 替换行内所有匹配，:%s/a/b/g 替换文件内所有匹配，:%s/a/b/gc 每一次替换都需要 confirm
66. 用寄存器内容替换，通过<C-r>{register}可以将寄存器内容插入到命令行，即:%s/aaa/<C-r>0/g，或者通过引用的方式:%s/aaa/\=@0/g
67. 替换的时候忘了加%，例如:s/target/replacement/g，想要重复上一次替换命令对整个文件执行替换，g&，等同于`:%s//~/&`
68. 接 67，另一种重复替换的情况，visual mode 选中需要替换的文本范围，然后:&&
69. 使用子匹配重排 csv 文件的字段，例如要交换列为 email,first name,last name
    last name,first name,email
    neil,drew,<drew@vimcasts.org>
    doe,john,<john@example.com>
    可以用`/v^([^,]*),([^,]*),([^,]*)$`
    然后`:%s//\3,\2,\1`
    其中，`[^,]`会匹配除逗号以外的任意字符
70. global 命令形式`:[range]global[!]/{pattern}/[cmd]`，命令在[range]内的文本行上执行时，先在所有[pattern]匹配行上做标记，再在所有标记的文本上执行[cmd]。缺省 range 默认为整个文件
71. 删除所有包含模式的文本行:g/re/d，grep 一词的来历是:g/re/p，其中 p 是:print 的缩写
72. :g/TODO/yank a 把包含 TODO 的行复制到寄存器 a 中(覆盖原内容)，或者用大写字母 A 附加到寄存器 a 中，或者`:g/TODO/t$`把所有 TODO 项复制到文件末尾
73. vi{ 选中一段由{}包围的文本块
74. :set spell 调用 vim 内置拼写检查器，错误会被高亮，通过[s 和]s 在错误之间反向和正向跳转，光标位于错误单词上时，z=来获取 vim 提供的更正建议列表

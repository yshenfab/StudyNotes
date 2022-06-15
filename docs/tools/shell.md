
# Table of Contents

1.  [search string in files from current directory (use more to view the result)](#org6c1e8e0)
2.  [Creating a Script](#org027a8e9)
3.  [Making a Script Executable](#orgd8c399f)
4.  [Shell Syntax](#orge68a03d)
    1.  [Variables: strings, numbers, environments, and parameters](#org1691637)
        1.  [Quoting](#orgfca909e)
        2.  [Environment Variables](#org5c2e71c)
        3.  [Parameter Variables](#org9bb747c)
    2.  [Conditions: shell Booleans](#org85381c4)
        1.  [The test or [ Command](#orgdbbe57e)
    3.  [Program Control Structures: if, elif, for, while, until, case](#org569d59e)
        1.  [if, elif](#orgdf696e0)
        2.  [for](#org89ff5ae)
        3.  [while](#org3151ce8)
        4.  [until](#orgdcc4686)
        5.  [case](#org1614b09)
        6.  [Lists](#org3f919d1)
    4.  [Functions](#org239ad97)
        1.  [break](#org44d1306)
        2.  [The : Command (colon)](#orgbf1bd95)
        3.  [continue](#orgfc0d01c)
        4.  [The . Command](#org2b3889f)
        5.  [echo](#org48f74d4)
        6.  [eval](#org555e4b9)
        7.  [exec](#org2bff73f)
        8.  [exit n](#org62ac712)
        9.  [export](#orgede636f)
        10. [expr](#org5b59c60)
        11. [printf](#orgf0a4485)
        12. [return](#org1d5143b)
        13. [set](#orgf0136e6)
        14. [shift](#orgd4da9eb)
        15. [trap](#org584b1be)
        16. [unset](#orgcb3f3a0)
    5.  [Commands built into the shell](#org6fc30b9)
        1.  [find](#orgd861049)
        2.  [grep (general regular expression parser)](#org4cdf212)
    6.  [Getting the result of a command](#orge8c1b20)
        1.  [Arithmetic Expansion](#orga9d93f1)
        2.  [Parameter Expansion](#org6e1b578)
    7.  [Here documents](#org27d77aa)



<a id="org6c1e8e0"></a>

# search string in files from current directory (use more to view the result)

-   grep -l STRING \* # replace STRING with the string you want to match
-   more \`grep -l STRING \*\`
-   more $(grep -l STRING \*)
-   grep -l STRING \* | more


<a id="org027a8e9"></a>

# Creating a Script

-   \# as comment
-   first line: #!/bin/bash
    \#! is special, which tellls the system that the argument that follows on the line is the program to be used to execute this file
-   example:
    for file in \*
    do
      if grep -q STRING $file
      then
        echo $file
      fi
    done
    exit 0 # zero denotes success in shell programming
-   script can contain any Linux commands referenced by PATH environment variable
-   script filename doesn't have to be ".sh", use *file* command to check the type of the file


<a id="orgd8c399f"></a>

# Making a Script Executable

-   /bin/bash xxx.sh
-   chmod +x xxx.sh
-   put the script in /home/yang/yangbin, add yangbin to PATH, then you can use the script
-   add script to /usr/local/bin to let other users use it


<a id="orge68a03d"></a>

# Shell Syntax


<a id="org1691637"></a>

## Variables: strings, numbers, environments, and parameters

-   create variables by using them, don't usually declare variables before using them
-   by default, all variables are considered and stored as strings (even they are assigned numeric values)
-   case-sensitive
-   a string must be delimited by quote marks "" if it contains spaces, say "Yang Shen"
-   there can't be any spaces on either side of the equals sign
    myname = "Yang Shen"  ->  wrong
    myname="Yang Shen"  ->  correct
-   assign user input to a variable by using *read* command:
    $ read name
    who's yang?
    $ echo $name
    who's yang?


<a id="orgfca909e"></a>

### Quoting

-   white characters (e.g., a space, a tab, or a newline character)
-   if you want a parameter to contain one or more whitespace characters, you must **quote** the parameter
-   the behavior of variables such as $foo inside quotes depends on the type of quotes you use:
    double quotes: "$foo", it's replaced with its value
    single quotes: '$foo', no substitution takes place, just '$foo'
    remove special meaning of $ symbol by prefacing it with a \\: \\$


<a id="org5c2e71c"></a>

### Environment Variables

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Environment Variable</th>
<th scope="col" class="org-left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">$HOME</td>
<td class="org-left">The home directory of current user</td>
</tr>


<tr>
<td class="org-left">$PATH</td>
<td class="org-left">A colon-separated list of directories to search for commands</td>
</tr>


<tr>
<td class="org-left">$PS1</td>
<td class="org-left">A command prompt, frequently $, but in bash you can use some</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">more complex values; for example, the string [\u@\h \W]$ is a</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">popular default that tells you the user, machine name, and</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">current directory, as well as providing a $ prompt.</td>
</tr>


<tr>
<td class="org-left">$PS2</td>
<td class="org-left">A secondary prompt, used when prompting for additional input,</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">usually &gt;.</td>
</tr>


<tr>
<td class="org-left">$IFS</td>
<td class="org-left">An <b>Input Field Separator</b>. This is a list of characters that</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">are used to separate words when the shell is reading input,</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">usually space, tab, and newline characters.</td>
</tr>


<tr>
<td class="org-left">$0</td>
<td class="org-left">The name of the shell script</td>
</tr>


<tr>
<td class="org-left">$#</td>
<td class="org-left">The number of parameters passed</td>
</tr>


<tr>
<td class="org-left">$$</td>
<td class="org-left">The process ID of the shell script, often used inside a script</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">for generating unique temporary filenames; for example:</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">/tmp/tmpfile_$$</td>
</tr>
</tbody>
</table>


<a id="org9bb747c"></a>

### Parameter Variables

If no parameters are passed, $# still exists but has a value of 0.

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Parameter Variable</th>
<th scope="col" class="org-left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">$1, $2, &#x2026;</td>
<td class="org-left">The parameters given to the script</td>
</tr>


<tr>
<td class="org-left">$*</td>
<td class="org-left">A list of all parameters, in a single variable, separated by the</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">first character in the environment variable IFS. If IFS is</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">modified, then the way $* separates the command line into</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">parameters will change.</td>
</tr>


<tr>
<td class="org-left">$@</td>
<td class="org-left">A subtle variation on $*; it doesn't use the IFS environment</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">variable, so parameters are not run together even if IFS is empty</td>
</tr>
</tbody>
</table>

-   example:
    IFS=''
    set foo bar bam
    echo "$@" # foo bar bam
    echo "$*" # foobarbam
      unset IFS
      echo "$@" # foo bar bam


<a id="org85381c4"></a>

## Conditions: shell Booleans


<a id="orgdbbe57e"></a>

### The test or [ Command

check whether a file exists

-   if test -f xxx.c
    then
    &#x2026;
    fi
-   if [ -f xxx.c ] # you must put spaces between [ braces and the condition being checked
    then
    &#x2026;
    fi
-   \# use semicolon 
    if [ -f xxx.c ]; then &#x2026;; fi

1.  Condition types: *string comparison*, *arithmetic comparison*, and *file conditionals*

    str for string, exp for expression
    
    <table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
    
    
    <colgroup>
    <col  class="org-left" />
    
    <col  class="org-left" />
    </colgroup>
    <thead>
    <tr>
    <th scope="col" class="org-left">String Comparison</th>
    <th scope="col" class="org-left">Result</th>
    </tr>
    </thead>
    
    <tbody>
    <tr>
    <td class="org-left">str1 = str2</td>
    <td class="org-left">&#xa0;</td>
    </tr>
    
    
    <tr>
    <td class="org-left">str1 != str2</td>
    <td class="org-left">&#xa0;</td>
    </tr>
    
    
    <tr>
    <td class="org-left">-n str</td>
    <td class="org-left">True if str is not null</td>
    </tr>
    
    
    <tr>
    <td class="org-left">-z str</td>
    <td class="org-left">True if string is null (an empty string)</td>
    </tr>
    </tbody>
    
    <tbody>
    <tr>
    <td class="org-left">Arithmetic Comparison</td>
    <td class="org-left">Result</td>
    </tr>
    
    
    <tr>
    <td class="org-left">exp1 -eq exp2</td>
    <td class="org-left">True if expressions are equal</td>
    </tr>
    
    
    <tr>
    <td class="org-left">exp1 -ne exp2</td>
    <td class="org-left">True if expressions are not equal</td>
    </tr>
    
    
    <tr>
    <td class="org-left">exp1 -gt exp2</td>
    <td class="org-left">greater than</td>
    </tr>
    
    
    <tr>
    <td class="org-left">exp1 -ge exp2</td>
    <td class="org-left">greater than or equal</td>
    </tr>
    
    
    <tr>
    <td class="org-left">exp1 -lt exp2</td>
    <td class="org-left">less than</td>
    </tr>
    
    
    <tr>
    <td class="org-left">exp1 -le exp2</td>
    <td class="org-left">less than or equal</td>
    </tr>
    
    
    <tr>
    <td class="org-left">! exp</td>
    <td class="org-left">&#xa0;</td>
    </tr>
    </tbody>
    
    <tbody>
    <tr>
    <td class="org-left">File Conditional</td>
    <td class="org-left">Result</td>
    </tr>
    
    
    <tr>
    <td class="org-left">-d file</td>
    <td class="org-left">True if file is a directory</td>
    </tr>
    
    
    <tr>
    <td class="org-left">-e file</td>
    <td class="org-left">True if file exists (not portable, -f usually used)</td>
    </tr>
    
    
    <tr>
    <td class="org-left">-f file</td>
    <td class="org-left">True if file is a regular file</td>
    </tr>
    
    
    <tr>
    <td class="org-left">-g file</td>
    <td class="org-left">True if set-group-id (set-gid) is set on file</td>
    </tr>
    
    
    <tr>
    <td class="org-left">-r file</td>
    <td class="org-left">True if file is readable</td>
    </tr>
    
    
    <tr>
    <td class="org-left">-s file</td>
    <td class="org-left">True if file has nonzero size</td>
    </tr>
    
    
    <tr>
    <td class="org-left">-u file</td>
    <td class="org-left">True if set-user-id (set-uid) is set on file</td>
    </tr>
    
    
    <tr>
    <td class="org-left">-w file</td>
    <td class="org-left">True if file is writable</td>
    </tr>
    
    
    <tr>
    <td class="org-left">-x file</td>
    <td class="org-left">True if file is executable</td>
    </tr>
    </tbody>
    </table>


<a id="org569d59e"></a>

## Program Control Structures: if, elif, for, while, until, case


<a id="orgdf696e0"></a>

### if, elif

if condition
then
  statements # you can use extra white space to indent, shell ignores the additional white space
elif
  statements
else
  statements
fi

1.  A Problem with Variables

    -   example: if [ $answer = "yes" ]
        it's not a valid condition, use if [ "$answer" = "yes" ]

2.  echo command to delete the trailing new line

    bash allows "echo -n" to suppress the new line


<a id="org89ff5ae"></a>

### for

for variable in values
do
  statements
done

1.  example 1

    for foo in bar fud 43
    do
      echo $foo
    done
    exit 0
    
    ---
    
    output: 
    bar
    fud
    43

2.  example 2

    for file in $(ls f\*.sh); do
      lpr $file
    done
    exit 0


<a id="org3151ce8"></a>

### while

while condition do
  statements
done


<a id="orgdcc4686"></a>

### until

until condition
do
  statements
done

-   if a loop should always execute at least once, use while loop;
    if it may not need to execute at all, use an until loop


<a id="org1614b09"></a>

### case

case variable in
  pattern [ | pattern] &#x2026;) statements;; # end with ;;
  pattern [ | pattern] &#x2026;) statements;;
  &#x2026;
esac

-   case executes the first match it finds, not the best match, so put the most explicit matches first and the most general match last
-   example

case "$input" in
    [yY] | [Yy][Ee][Ss]) echo "powerful match";;
    yes) echo "entered yes";;
    no ) echo "entered no";;
    y  ) echo "entered y";;
    n  ) echo "entered n";;
    Y | Yes | YES) echo "hahaha";;
                   echo "you typed Y or Yes or YES"
		         ;;
    n\* | N\*) echo "jajaja";;

-   ) echo "please type yes(y) or no(n)"
    exit 1
    ;; # optional

esac
exit 0

-   ;; before esac is optional


<a id="org3f919d1"></a>

### Lists

-   example 1:

if [ -f this<sub>file</sub> ]; then
  if [ -f that<sub>file</sub> ]; then
    if [ -f the<sub>other</sub><sub>file</sub> ]; then
      echo “All files present, and correct”
    fi
  fi
fi

-   example 2:

if [ -f this<sub>file</sub> ]; then
  foo=”True”
elif [ -f that<sub>file</sub> ]; then
  foo=”True”
elif [ -f the<sub>other</sub><sub>file</sub> ]; then
  foo=”True”
else
  foo=”False”
fi
if [ “$foo” = “True” ]; then
  echo “One of the files exists”
fi

1.  The AND List

    statement1 && statement2 && statement3 && &#x2026;

2.  The OR List

    statement1 || statement2 || statement3 || &#x2026;

3.  Statement Blocks

    enclosing statements in braces {} to make a statement block, for example:
    get<sub>confirm</sub> && {
        grep -v "$cdcatnum" $track<sub>file</sub> > $temp<sub>file</sub>
        cat $temp<sub>file</sub> > $tracks<sub>file</sub>
        echo
        add<sub>record</sub><sub>tracks</sub>
    }


<a id="org239ad97"></a>

## Functions

function<sub>name</sub> () {
  statements
}

-   example:

\#!/bin/bash
foo() {
  echo "Function foo is executing"
}
echo "script starting"
foo
echo "script ended"
exit 0

-   always define a function before invoking it
-   use *return* to return numeric values
-   use *echo* to return strings
-   declare local variables within shell functions by using the *local* keyword (only in scope within the function)

\#!/bin/bash
sample<sub>text</sub>="global variable"
foo() {
  local sample<sub>text</sub>="local variable"
  echo "Function foo is executing"
  echo $sample<sub>text</sub>
}
echo "script starting"
echo $sample<sub>text</sub>
foo
echo "script ended"
echo $sample<sub>text</sub>
exit 0


<a id="org44d1306"></a>

### break

-   Use *break* for escaping from an enclosing for, while, or until loop before the controlling condition has been met.
-   You can give *break* an additional numeric parameter, which is the number of loops to break out of (not suggested)


<a id="orgbf1bd95"></a>

### The : Command (colon)

-   The colon command is a null command. It's occasionally useful to simplify the logic of conditions, being an alias for *true*.
-   Since : is built-in, : runs faster than *true*. For example, *while :* implements an infinite loop (while true)
-   The : construct is also useful in the conditional setting of variables. For example,
    
        ${var:=value}
    
    Without the :, the shell would try to evaluate $var as a command.


<a id="orgfc0d01c"></a>

### continue

-   similar to break


<a id="org2b3889f"></a>

### The . Command

-   The dot(.) command executes the command in the current shell:
    . ./shell<sub>script</sub>
-   works a little like #include in C/C++


<a id="org48f74d4"></a>

### echo

-   echo -n
-   echo -e


<a id="org555e4b9"></a>

### eval

-   evaluate arguments, it's built into the shell and doesn't normally exist as a separate command.
-   example

foo=10
x=foo
y='$'$x
echo $y # $foo
eval y='$'$x
echo $y # 10

-   *eval* is a bit like an extra $
-   *eval* command is very useful, enabling code to be generated and run on-the-fly


<a id="org2bff73f"></a>

### exec

two different uses

1.  typical use is to replace the current shell with a different program

    exec wall "Thanks for all the fish"
    in a script will replace the current shell with the *wall* command. No lines in the script after *exec* will be processed, 
    because the shell that was executing the script no longer exists.

2.  second use is to modify the current file descriptors

    exec 3< afile
    This causes file descriptor three to be opened for reading from file *afile*. It's rarely used.


<a id="org62ac712"></a>

### exit n

-   *exit* command causes the script to exit with exit code n
-   in shell script programming, exit code

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-right" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-right">Exit Code</th>
<th scope="col" class="org-left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-right">0</td>
<td class="org-left">Success</td>
</tr>


<tr>
<td class="org-right">1-125</td>
<td class="org-left">Error codes that can</td>
</tr>


<tr>
<td class="org-right">&#xa0;</td>
<td class="org-left">be used by script</td>
</tr>


<tr>
<td class="org-right">126</td>
<td class="org-left">The file was not executable</td>
</tr>


<tr>
<td class="org-right">127</td>
<td class="org-left">A command was not found</td>
</tr>


<tr>
<td class="org-right">128 and above</td>
<td class="org-left">A signal occurred</td>
</tr>
</tbody>
</table>

Using 0 as success may seem a little unusual to C/C++. The 
big advantage in scripts is that they enable you to use 125
user-defined error codes without the need for a global error
code variable.

-   example

\#!/bin/bash
if [ -f .profile ]; then
    exit 0
fi
exit 1


<a id="orgede636f"></a>

### export

The *export* command makes the variable named as its parameter 
available in subshells. By default, variables created in a shell 
are not available in further (sub)shells invoked from that shell.

-   example

export2.sh
\#!/bin/bash
echo "$foo"
echo "$bar"
export1.sh
\#!/bin/bash
foo="hello"
export bar="hola"
export2
The output is:

hola


<a id="org5b59c60"></a>

### expr

The *expr* command evaluates its arguments as an expression.
It's most commonly used for simple arithmetic in the following form:
x=\`expr $x + 1\`

1.  Expression Evaluation

    -   | & = > >= < <= != + - \* / %
    -   the use of *expr* is normally replaced with the more efficient $((&#x2026;)) syntax


<a id="orgf0a4485"></a>

### printf

-   syntax

printf "format string" parameter1 parameter2 &#x2026;

-   very similar to C/C++, floating point is not supported (all arithmetic in the shell is performed as integers)


<a id="org1d5143b"></a>

### return

-   *return* takes a single numeric parameter that is available to the script calling the function
-   if no parameter is specified, then *return* defaults to the exit code of the last command


<a id="orgf0136e6"></a>

### set

-   The *set* command sets the parameter variables for the shell. It can be a useful way 
    of using fields in commands that output space-separated values.
-   example

\#!/bin/bash
echo the date is $(date) # Tue Feb 6 21:24:31 CST 2018
set $(date)
echo The month is $2 # Feb
exit 0

-   set -x

makes a script display a trace of its currently executing command


<a id="orgd4da9eb"></a>

### shift

The *shift* command moves all the parameter variables down by one, so that $2 becomes $1, 
$3 becomes $2, and so on. The previous value of $1 is discarded, while $0 remains unchanged.
If a numeric parameter is specified in the call to *shift*, the parameters move that 
many spaces. The other variables, $\*, $@, and $#, are also modified in line with 
the new arrangement of parameter variables.

-   *shift* is often useful for scanning through parameters passed into a script
-   if your script requires 10 or more parameters, you'll need *shift* to access the tenth and beyond
-   example

\#!/bin/bash
while [ "$1" != "" ]; do
    echo "$1"
    shift
done
exit 0


<a id="org584b1be"></a>

### trap

The *trap* command is used to specify the actions to take on receipt of signals.
A common use is to tidy up a script when it is interrupted.

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Signal</th>
<th scope="col" class="org-left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">HUP(1)</td>
<td class="org-left">Hang up; usually sent when a terminal goes offline, or a user logs out</td>
</tr>


<tr>
<td class="org-left">INT(2)</td>
<td class="org-left">Interrupt; usually sent by pressing Ctrl+C</td>
</tr>


<tr>
<td class="org-left">QUIT(3)</td>
<td class="org-left">Quit; usually sent by pressing Ctrl+\</td>
</tr>


<tr>
<td class="org-left">ABRT(6)</td>
<td class="org-left">Abort; usually sent on some serious execution error</td>
</tr>


<tr>
<td class="org-left">ALRM(14)</td>
<td class="org-left">Alarm; usually used for handling timeouts</td>
</tr>


<tr>
<td class="org-left">TERM(15)</td>
<td class="org-left">Terminate; usually sent by the system when it' shutting down</td>
</tr>
</tbody>
</table>


<a id="orgcb3f3a0"></a>

### unset

The *unset* command removes variables or functions from the environment.
It can't do this to read-only variables defined by the shell itself, such as IFS.
It's not often used.


<a id="org6fc30b9"></a>

## Commands built into the shell


<a id="orgd861049"></a>

### find

search for files, syntax:
find [path] [options] [tests] [actions]
for example, find ~/ -name test -print

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Option</th>
<th scope="col" class="org-left">Meaning</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">-depth</td>
<td class="org-left">Search the contents of a directory before looking at the directory itself</td>
</tr>


<tr>
<td class="org-left">-follow</td>
<td class="org-left">Follow symbolic links</td>
</tr>


<tr>
<td class="org-left">-maxdepths N</td>
<td class="org-left">Search at most N levels of the directory when searching</td>
</tr>


<tr>
<td class="org-left">-mount (or -xdev)</td>
<td class="org-left">Don't search directories on other file systems</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">Test</td>
<td class="org-left">Meaning</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">-atime N</td>
<td class="org-left">The file was last accessed N days ago</td>
</tr>


<tr>
<td class="org-left">-mtime N</td>
<td class="org-left">The file was last modified N days ago</td>
</tr>


<tr>
<td class="org-left">-name pattern</td>
<td class="org-left">The name of the file, excluding any path, matches the pattern provided.</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">To ensure that the pattern is passed to <i>find</i>, and not evaluated by the</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">shell immediately, the pattern must always be in quotes.</td>
</tr>


<tr>
<td class="org-left">-newer otherfile</td>
<td class="org-left">The file is newer than the file otherfile</td>
</tr>


<tr>
<td class="org-left">-type C</td>
<td class="org-left">The file is of type C, where C can be a particular type; the most common</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">are "d" for a directory and "f" for a regular file.</td>
</tr>


<tr>
<td class="org-left">-user username</td>
<td class="org-left">The file is owned by the user with given name</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">Operator</td>
<td class="org-left">Meaning</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">! or -not</td>
<td class="org-left">Invert the test</td>
</tr>


<tr>
<td class="org-left">-a or -and</td>
<td class="org-left">Both tests must be true</td>
</tr>


<tr>
<td class="org-left">-o or -or</td>
<td class="org-left">Either test must be true</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">Action</td>
<td class="org-left">Meaning</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">-exec command</td>
<td class="org-left">Execute a command. Must be terminated with a \; character pair.</td>
</tr>


<tr>
<td class="org-left">-ok command</td>
<td class="org-left">Like -exec, except that it prompts for user confirmation of each file on</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">which it will carry out the command before executing the command. Also</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">must be terminated with a \; character pair.</td>
</tr>


<tr>
<td class="org-left">-print</td>
<td class="org-left">Print out the name of the file.</td>
</tr>


<tr>
<td class="org-left">-ls</td>
<td class="org-left">Use ls -dils on the current file.</td>
</tr>
</tbody>
</table>

-   find . -newer file2 -type f -exec ls -l {} \\;


<a id="org4cdf212"></a>

### grep (general regular expression parser)

search files for strings, syntax:
grep [options] PATTERN [FILES]
If no filenames are given, it searches standard input.

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Option</th>
<th scope="col" class="org-left">Meaning</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">-c</td>
<td class="org-left">Rather than print matching lines, print a count of the number of lines that match.</td>
</tr>


<tr>
<td class="org-left">-E</td>
<td class="org-left">Turn on extended expressions.</td>
</tr>


<tr>
<td class="org-left">-h</td>
<td class="org-left">Suppress the normal prefixing of each output line with the name of the file it was found in.</td>
</tr>


<tr>
<td class="org-left">-i</td>
<td class="org-left">Ignore case.</td>
</tr>


<tr>
<td class="org-left">-l</td>
<td class="org-left">List the names of the files with matching lines; don't output the actual matched line.</td>
</tr>


<tr>
<td class="org-left">-v</td>
<td class="org-left">Invert the matching pattern to select nonmathcing lines, rather than matching lines.</td>
</tr>
</tbody>
</table>

-   grep in words.txt # find lines with "in" in words.txt

1.  Regular Expressions

    <table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
    
    
    <colgroup>
    <col  class="org-left" />
    
    <col  class="org-left" />
    </colgroup>
    <thead>
    <tr>
    <th scope="col" class="org-left">Character</th>
    <th scope="col" class="org-left">Meaning</th>
    </tr>
    </thead>
    
    <tbody>
    <tr>
    <td class="org-left">^</td>
    <td class="org-left">Anchor to the beginning of a line</td>
    </tr>
    
    
    <tr>
    <td class="org-left">$</td>
    <td class="org-left">Anchor to the end of a line</td>
    </tr>
    
    
    <tr>
    <td class="org-left">.</td>
    <td class="org-left">Any single character</td>
    </tr>
    
    
    <tr>
    <td class="org-left">[ ]</td>
    <td class="org-left">A range of characters, any one of which may be matched.</td>
    </tr>
    </tbody>
    
    <tbody>
    <tr>
    <td class="org-left">Match Pattern</td>
    <td class="org-left">Meaning</td>
    </tr>
    </tbody>
    
    <tbody>
    <tr>
    <td class="org-left">[:alnum:]</td>
    <td class="org-left">Alphanumeric characters</td>
    </tr>
    
    
    <tr>
    <td class="org-left">[:alpha:]</td>
    <td class="org-left">Letters</td>
    </tr>
    
    
    <tr>
    <td class="org-left">[:ascii:]</td>
    <td class="org-left">ASCII characters</td>
    </tr>
    
    
    <tr>
    <td class="org-left">[:blank:]</td>
    <td class="org-left">Space or tab</td>
    </tr>
    
    
    <tr>
    <td class="org-left">[:cntrl:]</td>
    <td class="org-left">ASCII control characters</td>
    </tr>
    
    
    <tr>
    <td class="org-left">[:digit:]</td>
    <td class="org-left">Digits</td>
    </tr>
    
    
    <tr>
    <td class="org-left">[:graph:]</td>
    <td class="org-left">Noncontrol, nonspace characters</td>
    </tr>
    
    
    <tr>
    <td class="org-left">[:lower:]</td>
    <td class="org-left">Lowercase letters</td>
    </tr>
    
    
    <tr>
    <td class="org-left">[:print:]</td>
    <td class="org-left">Printable characters</td>
    </tr>
    
    
    <tr>
    <td class="org-left">[:punct:]</td>
    <td class="org-left">Punctuation characters</td>
    </tr>
    
    
    <tr>
    <td class="org-left">[:space:]</td>
    <td class="org-left">Whitespace characters, including vertical tab</td>
    </tr>
    
    
    <tr>
    <td class="org-left">[:upper:]</td>
    <td class="org-left">Uppercase letters</td>
    </tr>
    
    
    <tr>
    <td class="org-left">[:xdigit:]</td>
    <td class="org-left">Hexadecimal digits</td>
    </tr>
    </tbody>
    </table>
    
    If -E is specified, 
    
    <table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
    
    
    <colgroup>
    <col  class="org-left" />
    
    <col  class="org-left" />
    </colgroup>
    <thead>
    <tr>
    <th scope="col" class="org-left">Option</th>
    <th scope="col" class="org-left">Meaning</th>
    </tr>
    </thead>
    
    <tbody>
    <tr>
    <td class="org-left">?</td>
    <td class="org-left">Match is optional but maybe matched at most once</td>
    </tr>
    
    
    <tr>
    <td class="org-left">*</td>
    <td class="org-left">Must be matched zero or more times</td>
    </tr>
    
    
    <tr>
    <td class="org-left">+</td>
    <td class="org-left">Must be matched one or more times</td>
    </tr>
    
    
    <tr>
    <td class="org-left">{n}</td>
    <td class="org-left">Must be matched n times</td>
    </tr>
    
    
    <tr>
    <td class="org-left">{n,}</td>
    <td class="org-left">Must be matched n or more times</td>
    </tr>
    
    
    <tr>
    <td class="org-left">{n,m}</td>
    <td class="org-left">Must be matched between n or m times, inclusive</td>
    </tr>
    </tbody>
    </table>
    
    -   grep "e$" myfile.txt # list lines end with "e"
    -   grep "<sup>aa</sup>" myfile.txt # list lines start with "aa"
    -   grep "a[ [:blank:] ]" myfile.txt # lines with "a " or "a TAB"
    -   grep ysh. myfile.txt # lines with "ysh.", "." match any single character
    -   grep -E [a-z]\\{10\\} myfile.txt # lines with a range of characters to match a to z, and a reptition of 10 matches, i.e., string [a-z] with length 10


<a id="orge8c1b20"></a>

## Getting the result of a command

Use $(command) syntax.

-   example

\#!/bin/bash
echo pwd is $PWD # PWD is shell environment variable, no need to use ()
echo current user is $(whoami) # need ()
exit 0


<a id="orga9d93f1"></a>

### Arithmetic Expansion

-   using *expr* mentioned above, but it's quite slow because a new shell is invoked to process the *expr* command
-   a newer and better alternative is $((&#x2026;)) expansion, by enclosing the expression you wish to evaluate in $((&#x2026;))
-   example

\#!/bin/bash
x=0
while [ "$x" -ne 10 ]; do
  echo $x
  x=$(($x+1))
done
exit 0


<a id="org6e1b578"></a>

### Parameter Expansion

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Parameter Expansion</th>
<th scope="col" class="org-left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">${param:-default}</td>
<td class="org-left">If param is null, then set it to the value of default.</td>
</tr>


<tr>
<td class="org-left">${#param}</td>
<td class="org-left">Gives the length of param.</td>
</tr>


<tr>
<td class="org-left">${param%word}</td>
<td class="org-left">From the end, removes the smallest part of param that</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">matches <i>word</i> and returns the rest.</td>
</tr>


<tr>
<td class="org-left">${param%%word}</td>
<td class="org-left">From the end, removes the longest part of param that</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">matches <i>word</i> and returns the rest.</td>
</tr>


<tr>
<td class="org-left">${param#word}</td>
<td class="org-left">From the beginning, removes the smallest &#x2026;</td>
</tr>


<tr>
<td class="org-left">${param##word}</td>
<td class="org-left">From the beginning, removes the longest &#x2026;</td>
</tr>
</tbody>
</table>

-   example

\#!/bin/bash
unset foo
echo ${foo:-bar}
foo=fud
echo ${foo:-bar}
foo=/usr/bin/X11/startx
echo ${foo#\*/}
echo ${foo##\*/}
bar=/usr/local/etc/local/networks
echo ${bar%local\*}
echo ${bar%%local\*}
exit 0


<a id="org27d77aa"></a>

## Here documents


# 第五节：xargs

## 功能描述

**擅长将标准输入数据转换成命令行参数**



**管道是实现“将前面的标准输出作为后面的标准输入”；xargs是实现“将标准输入作为命令的参数”。**

## 语法

- 多行变单行 

     xargs的默认命令是[echo](http://man.linuxde.net/echo)，空格是默认定界符

        

- 选项n max-args
     ​    Use  at  most max-args arguments per command line. 默认是用所有的

```powershell
//10 line 
[root@VM-10-112-178-190 test]# seq 1 10 |xargs  -n 2
1 2
3 4
5 6
7 8
9 10
```

- **选项 d** Input  items  are terminated by the specified character

**选项**可以自定义一个定界符



```
echo "nameXnameXnameXname" | xargs -dX -n2
name name
name name

echo "nameXnameXnameXname" |xargs -n 5

```

- **选项-I**  -I replace-str

  Replace  occurrences of replace-str in the initial-arguments with names read from standard input.
  $$
  seq 1 10 |xargs -n1 -I{} sh -c "echo "line=" {}"
  $$

  - `-P *number*`

     

    \- spawn a pool of this many subprocesses



- 并行

 parallel - build and execute shell command lines from standard input in parallel

 xargs - build and execute command lines from standard input

GNU Parallel是一个shell工具，为了在一台或多台计算机上并行的执行计算任务

GNU Parallel保证它的输出与顺序执行计算任务时是一样的

GNU Parallel经常被用于替代xargs或者cat | bash。



find ./ -name "*.sh" | parallel 'wc -l {};'

find ./ -name "*.sh" | xargs -n1 -I {} sh -c 'wc -l {}'

  ## 例子



  - 一个源代码目录中所有[php](http://man.linuxde.net/php)文件的行数：


塔山



- [xargs命令用法](https://blog.csdn.net/gong_xucheng/article/details/80789249)

- [视频 1](https://www.youtube.com/watch?v=OpaiGYxkSuQ&t=43s)



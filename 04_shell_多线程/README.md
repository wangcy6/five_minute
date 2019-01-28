# 第四节：多线程



### 题目：



- 有一个1GB大小的文件，里面的每一行是一个词，词的大小不超过16个字节，内存限制大小是1MB。返回频数最高的100个词

- **海量日志数据，提取出某日访问百度次数最多的那个IP**











### 知识补充

Shell command

##### 1. seq - print a sequence of numbers

seq [OPTION]... FIRST INCREMENT LAST

Print numbers from FIRST to LAST, in steps of INCREMENT.



##### 2. [date](https://renenyffenegger.ch/notes/Linux/shell/commands/datedate )- print or set the system date and time

##### 3. wait Wait until the child process exits 

​     等待所有后台进程都运行完毕

```shell
command1 &
command2 &
wait

```

Q. How do I redirect stderr to stdout? How do I redirect stderr to a file
https://www.cyberciti.biz/faq/redirecting-stderr-to-stdout/

 bash-one-liners-explained-part-three

http://www.catonmat.net/blog/bash-one-liners-explained-part-three

```powershell
command1 > error.log //不正确
command1 2 >error.log//正确，只有错误，正常的print不输出了
command1 &>error.log //ok Redirect both standard output and standard error to a file

command1 &  //不正确 ，这后台执行

command1 2>&1 >error.log //错误：

command1 >error.log 2>&1 //正确 推荐


```

```powershell
command 2> file  //The number 2 stands for stderr.
```

![img](http://www.catonmat.net/images/bash-redirections/redirect-stderr.png)



```
command &> file //Redirect both standard output and standard error to a file
```

![img](http://www.catonmat.net/images/bash-redirections/redirect-stdout-stderr.png)

```
command >file 2>&1
```

![img](http://www.catonmat.net/images/bash-redirections/initial-fd-table.png)

Q.  In the shell, what does “ 2>&1 ” mean?

https://stackoverflow.com/questions/818255/in-the-shell-what-does-21-mean





> Here is one way to remember this construct (although it is not entirely accurate): at first, 2>1 may look like a good way to redirect stderr to stdout. However, 
>
> it will actually be interpreted as "redirect stderr to a file named 1". & indicates that what follows is a file descriptor and not a filename. So the construct becomes: 2>&1.
>
> 意思是说command1 2>1 在屏幕上不显示， command1 2>&1在屏幕上显示

```powershell
2>&1
 
& is the syntax to redirect a stream to another file descriptor
- 0 is stdin, 1 is stdout, and 2 is stderr


 ls -ld /tmp /tnt 2>&1 >/dev/null | sed 's/^.*$/<-- & --->/'
 <-- ls: cannot access /tnt: No such file or directory --->
 ls -ld /tmp /tnt >/dev/null 2>&1 | sed 's/^.*$/<-- & --->/'

```



##### Linux下的&和nohup命令

```
command  >  out.file  2>&1  & 
//所有的标准输出和错误输出都将被重定向到一个叫做out.file 的文件中
nohup command > myout.file 2>&1 & 
```

- fifo - first-in first-out special file, named pipe
- xargs - build and execute command lines from standard input
- parallel - build and execute shell command lines from standard input in parallel

 -P max-procs
​              Run  up to max-procs processes at a time; the default is 1.  

​        If max-procs is 0, xargs will run as many processes as possible at a time.  Use the -n option with -P; otherwise chances are that only
​              one exec will be done.

- split - split a file into pieces

**按行分割**

文本文件还可以以行为单位进行分割，以行数进行分割时会忽略文件大小，并以`-l`参数指定分割后文件的行数：

```
$ split -l 1000 large_file.txt stxt
# wc -l log.txt                 //计算一个文件的总行数；

208363 log.txt
# split -l 120000 log.txt newlog    //通过指定行数，将日志分割成两个文件；
# du -sh *50M     log.txt
29M     newlogaa
22M     newlogab
```



​    

//通过指定行数，将日志分割成两个文件

；

\# 

du -sh *50M     log.txt

29M     newlogaa

22M     newlogab

### 1.2 二进制文件分割

二进制文件分割类似于按大小分割文本文件，不同的是以`-b`参数来指定分割后的文件大小：

```
$ split -b 100M data.bak sdata
```

- uniq



## 参考

- https://blog.csdn.net/v_JULY_v/article/details/7382693
- https://www.jianshu.com/p/33ea8390e7c4 情景linux--shell如何实现多线程？!!!!!!!!!!!!!!
- [linux shell多进程](https://www.jianshu.com/p/0ae013b64e3a)
- [Linux Shell通过fifo实现多进程并发以及并发数控制](https://blog.csdn.net/hbuxiaofei/article/details/85064151)


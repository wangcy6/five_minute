# 第二节：sort

## 小练习

#### [192. 统计词频](https://leetcode-cn.com/problems/word-frequency/) 

写一个 bash 脚本以统计一个文本文件 `words.txt` 中每个单词出现的频率

**示例:**

假设 `words.txt` 内容如下：

```
the day is sunny the the
the sunny is is
```

你的脚本应当输出（以词频降序排列）：

```shell
the 4
is 3
sunny 2
day 1
```

答案：

> awk '{for(i=1;i<=NF;i++) a[$i]++} END{for(i in a) print i,a[i]}' words.txt |sort -k2nr



## 解析

  sort - sort lines of text files

> sort将文件的每一行作为一个单位，相互比较，比较原则是从首字符向后，依次按ASCII码值进行比较，

最后将他们按升序输出。



-r, --reverse
​              reverse the result of comparisons

> sort默认的排序方式是升序，如果想改成降序，就加个-r

 -k, --key=POS1[,POS2]
​              start a key at POS1 (origin 1), end it at POS2 (default end of line)

> 按照多列排序

-t, --field-separator=SEP
​              use SEP instead of non-blank to blank transition

> 间隔符 默认是空格

 -n, --numeric-sort
​              compare according to string numerical value

> 你有没有遇到过10比2小的情况,使用-n选项，来告诉sort，“要以数值来排序”

## shell sort 多列排序

**一、准备素材**

> 第一个域是公司名称，第二个域是公司人数，第三个域是员工平均工资。

```
$ cat duweixin.net.txt
google 110 5000
baidu 100 5000
guge 50 3000
sohu 100 4500
```

**二、 我想让这个文件按公司的字母顺序排序，也就是按第一个域进行排序：（这个duweixin.net.txt文件有三个域）**

```
$ sort -t ‘ ‘ -k 1 duweixin.net.txt
baidu 100 5000
google 110 5000
guge 50 3000
sohu 100 4500
```

就直接用-k 1设定就可以了。（其实此处并不严格，稍后你就会知道）

**三、我想让duweixin.net.txt按照公司人数排序**

```
$ sort -n -t ‘ ‘ -k 2 duweixin.net.txt
guge 50 3000
baidu 100 5000
sohu 100 4500
google 110 5000
```

但是，此处出现了问题，那就是baidu和sohu的公司人数相同，都是100人，这个时候怎么办呢？按照默认规矩，是从第一个域开始进行升序排序，因此baidu排在了sohu前面。

**四、我想让facebook.txt按照公司人数排序 ，人数相同的按照员工平均工资升序排序：**

```
$ sort -n -t ‘ ‘ -k 2 -k 3 duweixin.net.txt
guge 50 3000
sohu 100 4500
baidu 100 5000
google 110 5000
```

加了一个-k2 -k3就解决了问题。对滴，sort支持这种设定，就是说设定域排序的优先级，先以第2个域进行排序，如果相同，再以第3个域进行排序。

**五、我想让facebook.txt按照员工工资降序排序，如果员工人数相同的，则按照公司人数升序排序**

```
$ sort -n -t ‘ ‘ -k 3r -k 2 duweixin.net.txt
baidu 100 5000
google 110 5000
sohu 100 4500
guge 50 3000
```

此处有使用了一些小技巧，你仔细看看，在-k 3后面偷偷加上了一个小写字母r。你想想，再结合我们上一篇文章，能得到答案么？揭晓：r和-r选项的作用是一样的，就是表示逆序。因为sort默认是按照升序排序的，所以此处需要加上r表示第三个域（员工平均工资）是按照降序排序。此处你还可以加上n，就表示对这个域进行排序时，要按照数值大小进行排序，举个例子吧：



```
$ sort -t ‘ ‘ -k 3nr -k 2n duweixin.net.txt
baidu 100 5000
google 110 5000
sohu 100 4500
guge 50 3000
```
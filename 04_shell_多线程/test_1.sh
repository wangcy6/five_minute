#/bin/bash

all_num=8

a=$(date +%H%M%S)

for num in `seq 1 ${all_num}`
do
  {  
    sleep 1
    echo ${num}
  }& 
done

b=$(date +%H%M%S)

echo -e "startTime:\t$a"
echo -e "endTime:\t$b"
echo `expr $b - $a`  

# 随机输出
[root@VM-10-112-178-190 shell]# ./1.sh
startTime:      111706
endTime:        111706
0
[root@VM-10-112-178-190 shell]# 1
2
4
3
5
6
7
8

[root@VM-10-112-178-190 shell]# ./1.sh
startTime:      111948
endTime:        111948
0
[root@VM-10-112-178-190 shell]# 1
2
4
5//
3//
6
7
8


#https://www.jianshu.com/p/33ea8390e7c4
#方案1：使用"&"使命令后台运行 不需要交互和返回值
#在linux中，在命令的末尾加上&符号，则表示该命令将在后台执行，这样后面的命令不用等待前面的命令执行完就可以开始执行了。
#示例中的循环体内有多条命令，则可以以{}括起来，在大括号后面添加&符号。
##startTime:      111507
#endTime:        111507
#0
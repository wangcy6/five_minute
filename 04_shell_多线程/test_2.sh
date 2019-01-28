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

wait

b=$(date +%H%M%S)

echo -e "startTime:\t$a"
echo -e "endTime:\t$b"

echo `expr $b - $a`  

方案2：命令后台运行+wait命令
解决上面的问题，只需要在上述循环体的done语句后面加上wait命令，
该命令等待当前脚本进程下的子进程结束，再运行后面的语句。


[root@VM-10-112-178-190 shell]# ./1.sh
2
1
3
5
4
6
7
8
startTime:      112442
endTime:        112443
1
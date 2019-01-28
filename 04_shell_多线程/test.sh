#/bin/bash

all_num=8

a=$(date +%H%M%S)

for num in `seq 1 ${all_num}`
do
    sleep 1
    echo ${num}
done

b=$(date +%H%M%S)

echo -e "startTime:\t$a"
echo -e "endTime:\t$b"
echo `expr $b - $a`  #计算2个时间的差



[root@VM-10-112-178-190 shell]# ./test.sh 
1
2
3
4
5
6
7
8
9
10
startTime:      112346
endTime:        112356
10
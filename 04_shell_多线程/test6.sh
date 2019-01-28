#/bin/bash


a=$(date +%H%M%S)


parallel -j 5 "sleep 1;echo {}" ::: `seq 1 10`

b=$(date +%H%M%S)

echo -e "startTime:\t$a"
echo -e "endTime:\t$b"
echo `expr $b - $a`

////////////////////////////////
方案5：使用GNU parallel命令控制并发数
GNU parallel命令是非常强大的并行计算命令，使用-j参数控制其并发数
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
startTime:      165808
endTime:        165810
2
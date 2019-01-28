#/bin/bash

all_num=10
# 设置并发的进程数
thread_num=5

a=$(date +%H%M%S)


# mkfifo
tempfifo="my_temp_fifo"
mkfifo ${tempfifo}
# 使文件描述符为非阻塞式
exec 6<>${tempfifo}
rm -f ${tempfifo}

# 为文件描述符创建占位信息
for ((i=1;i<=${thread_num};i++))
do
{
    echo 
}
done >&6 


# 
for num in `seq 1 ${all_num}`
do
{
    read -u6
    {
        sleep 1
        echo ${num}
        echo "" >&6
    } & 
} 
done 

wait

# 关闭fd6管道
exec 6>&-

b=$(date +%H%M%S)

echo -e "startTime:\t$a"
echo -e "endTime:\t$b"


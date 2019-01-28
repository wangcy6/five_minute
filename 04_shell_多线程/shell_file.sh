#! /bin/bash
source /etc/profile;
 
# -----------------------------
 
tempfifo=$$.fifo        # $$表示当前执行文件的PID
begin_date=$1           # 开始时间
end_date=$2             # 结束时间
 
if [ $# -eq 2 ] 
then
    if [ "$begin_date" \> "$end_date" ]
    then
        echo "Error! $begin_date is greater than $end_date"
        exit 1;
    fi
else
    echo "Error! Not enough params."
    echo "Sample: sh loop_kpi 2015-12-01 2015-12-07"
    exit 2;
fi
 
# -----------------------------
 
trap "exec 1000>&-;exec 1000<&-;exit 0" 2
mkfifo $tempfifo
exec 1000<>$tempfifo
rm -rf $tempfifo
 
for ((i=1; i<=8; i++))
do
    echo >&1000
done
#365
while [ $begin_date != $end_date ]
do  
    #8个进程读取365个任务，他们之间如何分配的。
    read -u1000
    {
        echo $begin_date
        hive -f kpi_report.sql --hivevar date=$begin_date
        echo >&1000
    } &
 
    begin_date=`date -d "+1 day $begin_date" +"%Y-%m-%d"`
done
 
wait
echo "done!!!!!!!!!!"

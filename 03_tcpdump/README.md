# 第二节：tcpdump

## 小对话

## ![](D:\doc\国美\doc\today\code\weekly\FQA\pic\20190107.png)

## tcpdump 就是证据

  tcpdump - dump traffic on a network

```
tcpdump -i eth0 '(tcp port 80)' -v  -w dump.pcap （服务器nginx 模拟一次请求）
sz dump.pcap


```



![è¿éåå¾çæè¿°](https://img-blog.csdn.net/20160511235134246)

> 网络层负责ip数据报的产生以及ip数据包在逻辑网络上的路由转发( 选择哪个路径)
>
> 传输层提供端到端通信服务层次,提供可靠及非可靠连接（保证路径上传输可靠 tcp ）

![è¿éåå¾çæè¿°](https://img-blog.csdn.net/20160511235207919)

# 

- TCP序列号（Sequence Number）和确认号（Acknowledgment Number）

> Next sequence number:=Sequence number+len(data)
> Sequence number=Next sequence number
> Acknowledgment number: Sequence number 

为了更好的理解在整个TCP会话期间，TCP序列号和确认号是如何工作的，我们可以使用Wireshark内置的绘制流功能，选择菜单栏中的 **Statistics** ->**Flow Graph...**->**TCP flow** ->**OK**

- 这个是老版本的

![tcp_flow.png](http://media.packetlife.net/media/blog/attachments/429/tcp_flow.png)

![1546942939940](C:\Users\wangchuanyi\AppData\Roaming\Typora\typora-user-images\1546942939940.png)



- 数据传输

  ![1546944626842](C:\Users\wangchuanyi\AppData\Roaming\Typora\typora-user-images\1546944626842.png)

  ![1546944612754](C:\Users\wangchuanyi\AppData\Roaming\Typora\typora-user-images\1546944612754.png)

  > 看序列号完整行

- 连接

  ![1546944383770](C:\Users\wangchuanyi\AppData\Roaming\Typora\typora-user-images\1546944383770.png)

  > 三次握手

- 释放

> 四次握手

参考

1. https://danielmiessler.com/study/tcpdump/
2. [Understanding TCP Sequence and Acknowledgment Numberss](http://packetlife.net/blog/2010/jun/7/understanding-tcp-sequence-acknowledgment-numbers/ ) 
3. https://www.youtube.com/watch?v=AX2D_n1yZko
4. How TCP Works - The Handshake https://www.youtube.com/watch?v=HCHFX5O1IaQ
5. https://blog.csdn.net/a19881029/article/details/38091243



------------------------------------------【未完待续  这是最基本的使用】------------------------------------------------------

## 扩展阅读

#### strace - trace system calls and signals



```
strace -o output.txt -T -tt -e trace=all -p 6107(nginx)

```

```
[10:16:34.228468 -tt 在输出中的每一行前加上时间信息,微秒级] 
[writev(3, [{"HTTP/1.1 304 Not Modified\r\nServe"..., 180}], 1) = 180 -e trace=all
只跟踪指定的系统 调用.例如:-e trace=open,close,rean,write表示只跟踪这四个系统调用.
默认的为set=all.
-e trace=file
只跟踪有关文件操作的系统调用.
-e trace=process
只跟踪有关进程控制的系统调用.
-e trace=network
跟踪与网络有关的所有系统调用.
-e strace=signal
跟踪所有与系统信号有关的 系统调用]  
[ <0.000041> -T 显示每一调用所耗的时间. ]

```

![write成功了](C:\Users\wangchuanyi\AppData\Roaming\Typora\typora-user-images\1546914140549.png)



#### Fiddler
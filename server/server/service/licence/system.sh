#!/bin/bash
#物理cpu个数
#cpu_num=`cat /proc/cpuinfo | grep 'physical id'|sort|uniq|wc -l`
#逻辑cpu数，正是题目所求
cpu_num=`cat /proc/cpuinfo|grep 'processor'|sort|uniq|wc -l`
#echo "cpu num:$cpu_num"

memory_total=`free -h |grep 'Mem'|awk '{print $2}'`
memory_free=`free -m|grep 'Mem'|awk '{print $4}'`
#echo  "memory total:${memory_total}"
#echo  "memory free:${memory_free}M"

disk_size=`df -h / | awk '{print $2}'|grep -E '[0-9]'`
#echo "disk size:$disk_size"

linux_bit=`uname -i`
if [ $linux_bit == 'x86_64' ];then
    system_bit=64
else
    system_bit=32
fi
#echo "system bit:$system_bit"

process=`ps aux|wc -l`
#let process #-- #实际运行进程数
#echo "process:$process"

#已安装软件包数量
software_num=`dpkg -l |wc -l`
#software_num=`yum list installed |wc -l`
#echo "software num:$software_num"

#ip的获取
ip=`ifconfig| grep -A 1 'eth0'|grep 'inet'|awk -F ':' '{print $2}'|awk '{print $1}'`
#echo "ip:$ip" 

# mac
macaddr=`sudo ifconfig |grep HWaddr |head -n 1 | grep -o  "[a-f0-9A-F]\\([a-f0-9A-F]\\:[a-f0-9A-F]\\)\\{5\\}[a-f0-9A-F]"`
#echo "Mac:$macaddr"

# pub_ip

pub_ip=`curl ipecho.net/plain`

#echo "pub_ip:$pub_ip"

echo "pub_ip=$pub_ip&prav_ip=$ip&cpu_num=$cpu_num&mem_num=$memory_total&mac=$macaddr"

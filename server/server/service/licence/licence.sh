#!/bin/bash
# 注册服务器
# 判断 sys.txt 存在否;
# 不存在 ==》 生成sys.txt
#   存在 == 》 验证是否注册 有无
#  
# 请求服务器返回值说明  1 注册成功  2 审核通过 其他未知
#

# 基础配置

lock="lock" # 授权锁定 标示已授权

sysfile='sysinfo' # 生成的系统信息文件名称

url='http://licence.linksame.com' # 授权服务器地址



if [ ! -f "$lock" ];then
	if [ ! -f $sysfile ];then
		exec sh system.sh > $sysfile
	fi		
	string=`head -1 $sysfile`
	md5=$(md5sum $sysfile|cut -d ' ' -f1)
	res=`curl "$url/admin/Index/adddata?md5num=$md5&$string"`
	
	#echo "$url/admin/Index/adddata?md5num=$md5&$string"
	#echo $md5
	#echo $string
	if [ "$res" = "2" ];then
		touch $lock
	elif [ "$res" = "1" ]; then
		kill  1 
	else
		kill  1
	fi
fi
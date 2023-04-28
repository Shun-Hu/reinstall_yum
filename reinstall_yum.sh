#centos安装nginx失败
#终端报错：没有可用软件包 nginx
#原因：应该是yum软件版本导致的错误,需要更新yum版本

#安装 epel-release 包：
sudo yum install epel-release


#卸载yum并重新安装
rpm -aq|grep yum|xargs rpm -e --nodeps

#下载rpm包(如果官网的包更新版本了,则浏览器打开,下载对应升级后的包就行)
wget http://mirrors.aliyun.com/centos/7/os/x86_64/Packages/yum-3.4.3-168.el7.centos.noarch.rpm
wget http://mirrors.aliyun.com/centos/7/os/x86_64/Packages/yum-metadata-parser-1.1.4-10.el7.x86_64.rpm
wget http://mirrors.aliyun.com/centos/7/os/x86_64/Packages/yum-plugin-fastestmirror-1.1.31-54.el7_8.noarch.rpm
wget http://mirrors.aliyun.com/centos/7/os/x86_64/Packages/python-iniparse-0.4-9.el7.noarch.rpm

#安装rpm包
rpm -ivh python-iniparse-0.4-9.el7.noarch.rpm
rpm -ivh yum-metadata-parser-1.1.4-10.el7.x86_64.rpm
rpm -ivh yum-3.4.3-168.el7.centos.noarch.rpm --force --nodeps yum-plugin-fastestmirror-1.1.31-54.el7_8.noarch.rpm

#测试
yum list nginx --showduplicates

#安装nginx
sudo yum install nginx

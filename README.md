环境说明：
1） jdk1.8， 路径/opt/jdk1.8.0_65/
2）maven 3.3
3）taobao_tomcat，路径/usr/local/taobao-tomcat-7.0.59

使用方法：
1、安装docker；
ubuntu安装docker
http://docs.docker.com/engine/installation/ubuntulinux/ 
centos安装docker
http://docs.docker.com/engine/installation/centos/

2、拉取镜像
docker pull index.alauda.cn/snailchen/edas

3、以后台方式运行
docker run -d -p 22 -p 8080:8080 --add-host jmenv.tbsite.net:182.92.100.65 index.alauda.cn/snailchen/edas
这个镜像运行后，会自动运行taobao-tomcat和sshd
测试运行是否正常：
curl localhost:8080/edas_test/hsf.htm
输出以下结果说明运行正常
HSF RPC:ZCY, EDAS test OK: 1447059857612

4、进入容器
查看容器运行状态
root@iZ23ub5rifcZ:/home/test/git/edas-test-docker# docker ps
CONTAINER ID        IMAGE                                             COMMAND               CREATED              STATUS              PORTS                                                                  NAMES
0d30c52c406f          index.alauda.cn/snailchen/edas   "/bin/sh -c '/usr/lo   4 minutes ago       Up 4 minutes      0.0.0.0:8080->8080/tcp, 0.0.0.0:1032->22/tcp   pensive_noyce

有两种方式：
1） docker exec -it <container id or name> /bin/bash
2）通过SSH登入，用户名root，密码DtDream0209，端口号随机分配，看docker ps PORTS字段22端口映射端口是否多少，此处为1032

测试自己应用的方法，将war包放到taobao-tomcat/deploy目录下，并启动tomcat。
如何上传？可以sftp over ssh上传war包。也可以使用ftp工作上传。


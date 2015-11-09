# edas-test-docker
EDAS测试环境Dockerfile

使用方法：
docker pull index.alauda.cn/snailchen/edas

运行：
docker run -d -p 22 -p 8080:8080 --add-host jmenv.tbsite.net:182.92.100.65 zcy/edas

进入容器：
docker exec  -i -t {$container id} /bin/bash

SSH登入：
docker ps查看容器端口22映射到HOST的端口号
CONTAINER ID    IMAGE       COMMAND         CREATED        STATUS         PORTS                     NAMES
385fcada0c46    zcy/edas    "/bin/sh -c '   6 minutes ago  Up 6 minutes   0.0.0.0:8080->8080/tcp, 0.0.0.0:1031->22/tcp   goofy_euclid

ssh地址:{host_ip}:1031
用户名：root
密码：DtDream0209


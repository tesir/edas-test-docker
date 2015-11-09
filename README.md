# edas-test-docker
EDAS测试环境Dockerfile

使用方法：
docker pull index.alauda.cn/snailchen/edas

运行：
docker run -i -t -p 8080:8080 --add-host jmenv.tbsite.net:182.92.100.65 index.alauda.cn/snailchen/edas /bin/bash

进入容器：
docker exec  -i -t {$container id} /bin/bash

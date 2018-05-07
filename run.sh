
docker rm -f test.io1 || echo test.io1 not exists;
docker network create --subnet=172.12.0.0/16 shangTecTest;
docker run -itd \
--privileged=true \
--net shangTecTest --ip 172.12.0.13 \
-v `pwd`:/src \
-w /src \
--name test.io1 \
-p 80:80 \
node:8.11.1 \
/bin/bash -c "node"

docker rm -f back3002 || echo back3002 not exists;
docker network create --subnet=172.11.0.0/16 shangTec;
docker run -itd \
--privileged=true \
--net shangTec --ip 172.11.0.14 \
-v `pwd`:/src \
-p 3002:3000 \
-w /src \
--name back3002 \
node:8.11.1 \
/bin/bash -c "npm run single"
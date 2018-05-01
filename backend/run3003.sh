
docker rm -f back3003 || echo back3003 not exists;
docker network create --subnet=172.11.0.0/16 shangTec;
docker run -itd \
--privileged=true \
--net shangTec --ip 172.11.0.15 \
-v `pwd`:/src \
-p 3003:3000 \
-w /src \
--name back3003 \
node:8.11.1 \
/bin/bash -c "npm run single"
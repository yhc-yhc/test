
docker rm -f back3001 || echo back3001 not exists;
docker network create --subnet=172.11.0.0/16 shangTec;
docker run -itd \
--privileged=true \
--net shangTec --ip 172.11.0.13 \
-v `pwd`:/src \
-p 3001:3000 \
-w /src \
--name back3001 \
node:8.11.1 \
/bin/bash -c "npm run single"
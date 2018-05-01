
docker rm -f back3004 || echo back3004 not exists;
docker network create --subnet=172.11.0.0/16 shangTec;
docker run -itd \
--privileged=true \
--net shangTec --ip 172.11.0.16 \
-v `pwd`:/src \
-p 3004:3000 \
-w /src \
--name back3004 \
node:8.11.1 \
/bin/bash -c "npm run single"
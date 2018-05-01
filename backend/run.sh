
docker rm -f clusterBack || echo clusterBack not exists;
docker network create --subnet=172.11.0.0/16 shangTec;
docker run -itd \
--privileged=true \
--net shangTec --ip 172.11.0.12 \
-v `pwd`:/src \
-p 3000:3000 \
-w /src \
--name clusterBack \
node:8.11.1 \
/bin/bash -c "npm start"
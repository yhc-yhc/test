
docker rm -f clusterBack || echo clusterBack not exists;
docker network create --subnet=172.11.0.0/16 shangTec;
docker run -itd \
--privileged=true \
--net shangTec --ip 172.11.0.12 \
-v `pwd`:/src \
-p 3000:3000 \
-p 3131:3131 \
-p 3132:3132 \
-p 3133:3133 \
-p 3134:3134 \
-w /src \
--name clusterBack \
node:8.11.1 \
/bin/bash -c "npm start"
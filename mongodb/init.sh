
docker rm -f mongodb || echo mongodb not exists;
docker network create --subnet=172.11.0.0/16 shangTec;

docker run -itd \
--privileged=true \
--net shangTec --ip 172.11.0.10 \
-v ~/data/shangTec:/data/db \
-v ~/db/restore:/src \
-p 1007:27017 \
--name mongodb \
mongo:3.2

if [[ $1 = "restore" ]]; then
	echo ===================================== restore mongodb;
	docker exec mongodb /bin/bash -c 'mongorestore -d test --dir /src';
	echo ===================================== restore finished;
fi
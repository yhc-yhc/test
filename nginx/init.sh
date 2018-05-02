
docker rm -f ngx || echo ngx not exists;
docker network create --subnet=172.11.0.0/16 shangTec;
rm -rf `pwd`/ngx_log
docker run \
--privileged=true \
--net shangTec --ip 172.11.0.11 \
-v `pwd`/ngx_log:/usr/local/openresty/nginx/logs \
-v `pwd`/nginx.conf:/usr/local/openresty/nginx/conf/nginx.conf:ro  \
-v `pwd`/conf:/usr/local/openresty/nginx/conf/conf.d \
-p 1111:1111 \
-p 2222:2222 \
--name ngx -d openresty/openresty
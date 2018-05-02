```
172.11.0.10 mongodb
172.11.0.11 nginx
172.11.0.12 clusterBack
172.11.0.13 back3001
172.11.0.14 back3002
172.11.0.15 back3003
172.11.0.16 back3004
```
insert 100W datas to mongodb cost 1039386.033ms

in the container of node:8.11.1
ulimit -n
1048576

```
websocket-bench -a 10 -c 1000 -m 1000 -k -g generator.js   http://localhost:1111/ -o c10000.log
```
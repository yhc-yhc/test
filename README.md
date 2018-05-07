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


```
	nginx的ip_hash是基于ip的前三段进行计算的，也就是说ip只有D段不同的两台客户端一定会连接到同一台服务器上，
这点测试的时候需要注意。
```
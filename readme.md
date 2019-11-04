## 脚本功能
将 base64解过码的/tmp/gfwlist.txt 转换成dnsmasq的配置文件/tmp/gfwlist.conf，其中代理名单为address和ipset-gfwlist名单，address默认dns服务器为127.0.0.1:5335,白名单为address 和 ipset-whitelist名单，其中address为走dnsmasq默认dns的规则，另外会生成一个/tmp/doipset.sh，包含着gfwlist规则里的ip规则，格式为ipset add gfwlist [ip] <br>
完整列表脚本在mt7621上的运行速度input 7974 output 7542+9
```
real    0m 1.54s
user    0m 1.51s
sys     0m 0.01s
```
注：为了效率并没有完整实现adblock的规则，但是已经覆盖到gfwlist所用的而且dnsmasq能够做到的规则

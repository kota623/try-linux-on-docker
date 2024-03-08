## コンピューター同士がネットワーク上に存在しているか確認できるコマンドがあるので覚えておきましょう。

```aidl
docker exec -it fedora_container bash
yum install iputils
```

```aidl
[root@fedora /]# ping 172.20.0.3
PING 172.20.0.3 (172.20.0.3) 56(84) bytes of data.
64 bytes from 172.20.0.3: icmp_seq=1 ttl=64 time=0.539 ms
64 bytes from 172.20.0.3: icmp_seq=2 ttl=64 time=0.083 ms
```

```aidl
[root@fedora /]# ping 172.20.0.9
PING 172.20.0.9 (172.20.0.9) 56(84) bytes of data.
From 172.20.0.4 icmp_seq=1 Destination Host Unreachable
From 172.20.0.4 icmp_seq=2 Destination Host Unreachable
```

```aidl
[root@fedora /]# ping alpine.mydomain.local
PING alpine.mydomain.local (172.20.0.3) 56(84) bytes of data.
64 bytes from alpine_container.untitled_default (172.20.0.3): icmp_seq=1 ttl=64 time=0.678 ms
64 bytes from alpine_container.untitled_default (172.20.0.3): icmp_seq=2 ttl=64 time=0.286 ms
```
## ping 待ち受け
二つ目のターミナルを用意して別のコンテナで先ほどのpingを受け取っているところを確認できます。
```
docker exec -it debian_container bash
apt-get update -y
apt-get install -y iputils-ping
apt-get install -y tcpdump
```
### ping待受
```
tcpdump -i eth0 icmp and icmp[icmptype]=icmp-echo
apt-get install net-tools
```

### alpineでnginxを動かして他のコンテナからアクセスしてみよう。
```
apk update
apk add openrc
apk add nginx

sed -i'.bak' 's/^#rc_sys=""/rc_sys="lxc"/' /etc/rc.conf
sed -i 's/^#rc_provide="!net"/rc_provide="loopback net"/' /etc/rc.conf
sed -i'.bak' '/getty/d' /etc/inittab
sed -i'.bak' 's/mount -t tmpfs/# mount -t tmpfs/' /lib/rc/sh/init.sh
sed -i'.bak' 's/hostname $opts/# hostname $opts/' /etc/init.d/hostname
sed -i'.bak' 's/cgroup_add_service$/# cgroup_add_service/' /lib/rc/sh/openrc-run.sh

# mkdir /run/openrc
# touch /run/openrc/softlevel

/ # sed -i'.bak' 's/return 404;/root html;\n\t\tindex index.html;/'  etc/nginx/http.d/default.conf 
/ # cat etc/nginx/http.d/default.conf

# rc-status
 * Caching service dependencies ...                      [ ok ]
Runlevel: sysinit
Dynamic Runlevel: hotplugged
Dynamic Runlevel: needed/wanted
Dynamic Runlevel: manual
 
# rc-service nginx checkconfig
 * Checking nginx configuration ...
 * /run/nginx: creating directory
 * /run/nginx: correcting owner                          [ ok ]
 
# rc-service nginx start
 * Starting nginx ...                                    [ ok ]
 
# ps -ef | grep nginx
  207 root   0:00 nginx: master process /usr/sbin/nginx -c /etc/nginx/nginx.conf
  208 nginx  0:00 nginx: worker process
  209 nginx  0:00 nginx: worker process
  210 nginx  0:00 nginx: worker process
  211 nginx  0:00 nginx: worker process

apk add curl
curl localhost
...
htmlっぽいものがcliで確認できればOKです。
httpクライアントが立ち上がりました！

```

### 他のコンテナからアクセスしてみましょう
```
root@debian:/# history
    1  curl
    2  apt
    3  apt install curl
    4  apt update
    5  apt install curl
    6  curl 172.20.0.3 # nginxを起動しているalpineのIP
```

lynxというcli でhtmlが表示できるブラウザがあります。
興味があればこちらで表示してみましょう
```
apt-get install lynx
lynx 172.20.0.3
```
`q`で抜けられます。

---
今回は必要最低限の設定を行いました。

実務でnginxなどを使用する際は公式のdocker imageが用意されているのでそちらを参照してください。
docker hub: nginx
https://hub.docker.com/_/nginx
Dockerfileの記述
https://github.com/nginxinc/docker-nginx/blob/1f227619c1f1baa0bed8bed844ea614437ff14fb/mainline/debian/Dockerfile

※通常のLinuxではfirewallの設定が必要だったり、AWSではセキュリティグループの設定が必要になります。
※AWSへのpingはセキュリティグループの許可がないとtimeoutになり分かりづらいので使用するときは意識しておきましょう。

おすすめの本
https://amzn.to/3vcuGqi
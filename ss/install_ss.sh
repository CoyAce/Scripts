yum install python-setuptool
sudo easy_install pip
sudo pip install shadowsocks
ip=`ifconfig eth0| grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'`
echo '''
{
    "server":"host",
    "server_port":8888,
    "local_port":1080,
    "password":"password",
    "timeout":600,
    "method":"aes-256-cfb"
}
'''|sed -e "s/\"server\".*/\"server\":\"$ip\"/"> shadowsocks.json
mv shadowsocks.json /etc/shadowsocks.json

yum install python-setuptool
sudo easy_install pip
sudo pip install shadowsocks
echo '''
{
    "server":"host",
    "server_port":8888,
    "local_port":1080,
    "password":"password",
    "timeout":600,
    "method":"aes-256-cfb"
}
''' > shadowsocks.json

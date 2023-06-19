cat /ssh/key.pub > /root/.ssh/authorized_keys
echo 'HostKeyAlgorithms +ssh-rsa' >> /etc/ssh/sshd_config
echo 'PubkeyAcceptedKeyTypes +ssh-rsa' >> /etc/ssh/sshd_config
service ssh start
sed "s/ss:[0-9]\+/ss:$SSPORT/" /nginx_default.conf > change_port
cat change_port > /nginx_default.conf
sed "s/ss:[0-9]\+/ss:$SSPORT/" /etc/nginx/nginx.conf > change_port
cat change_port > /etc/nginx/nginx.conf
nginx -g "daemon off;"

INTERFACE=$(route | grep '^default' | grep -o '[^ ]*$')
PRIVATEKEY=$(wg genkey | tee /etc/wireguard/privatekey)
echo "[Interface]" > /etc/wireguard/wg0.conf
echo "PrivateKey = $PRIVATEKEY" >> /etc/wireguard/wg0.conf
echo "Address = $1" >> /etc/wireguard/wg0.conf
echo "ListenPort = $2" >> /etc/wireguard/wg0.conf
echo "PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -t nat -A POSTROUTING -o $INTERFACE -j MASQUERADE" >> /etc/wireguard/wg0.conf
echo "PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -t nat -D POSTROUTING -o $INTERFACE -j MASQUERADE" >> /etc/wireguard/wg0.conf
wg-quick down wg0
wg-quick up wg0

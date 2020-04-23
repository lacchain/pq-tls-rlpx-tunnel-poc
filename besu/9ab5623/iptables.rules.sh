ip_stunnel_server=`getent hosts server | awk '{ print $1 }'`
iptables -I INPUT -p tcp ! -s $ip_stunnel_server --dport 30303 -j DROP

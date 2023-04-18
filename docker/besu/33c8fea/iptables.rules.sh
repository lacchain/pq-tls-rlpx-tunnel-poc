ip_stunnel_client=`getent hosts client | awk '{ print $1 }'`
ip_9ab5623=`getent hosts 9ab5623 | awk '{ print $1 }'`
iptables -t nat -A OUTPUT -p tcp -d $ip_9ab5623 -j DNAT --to-destination $ip_stunnel_client:4911

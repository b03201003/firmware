#!/bin/sh
[ -z "$1" ] && echo "Error: should be called from udhcpc" > /dev/console && exit 1
echo [$0] $1 ... > /dev/console
case "$1" in
bound)
	[ -n "$broadcast" ] && BROADCAST="broadcast $broadcast"
	[ -n "$subnet" ] && NETMASK="netmask $subnet"
	ifconfig $interface $ip $BROADCAST $NETMASK
<?
if ($physical==1)
{
	echo "\tlast_wan2_st=`xmldbc -i -g /runtime/wan/inf:2/connectstatus`\n";

	echo "\txmldbc -i -s /runtime/wan/inf:2/ip \"$ip\"\n";
	echo "\txmldbc -i -s /runtime/wan/inf:2/netmask \"$subnet\"\n";
	echo "\txmldbc -i -s /runtime/wan/inf:2/interface \"$interface\"\n";
	echo "\txmldbc -i -s /runtime/wan/inf:2/domain \"$domain\"\n";
	echo "\txmldbc -i -s /runtime/wan/inf:2/lease \"$lease\"\n";
	echo "\txmldbc -i -s /runtime/wan/inf:2/connectstatus connected\n";
}
?>
	echo -n > /etc/resolv.conf
	PDNS="";
	for i in $dns ; do
		echo adding dns $i ... > /dev/console
		echo nameserver $i >> /etc/resolv.conf
		if [ "`chnet $i $subnet`" != "`chnet $ip $subnet`" ]; then
			route add -host $i gw $router dev $interface
		fi
<?
if ($physical==1)
{
		echo "\t\tif [ \"$PDNS\" = \"\" ]; then\n";
		echo "\t\t	xmldbc -i -s /runtime/wan/inf:2/primarydns \"$i\"\n";
		echo "\t\t	PDNS=\"$i\"\n";
		echo "\t\telse\n";
		echo "\t\t	xmldbc -i -s /runtime/wan/inf:2/secondarydns \"$i\"\n";
		echo "\t\tfi\n";
}
?>
	done

	xmldbc -i -s /runtime/wan/phy/ip		$ip
	xmldbc -i -s /runtime/wan/phy/netmask	$subnet

	SERVER=`gethostip -d <?=$server?>`
	if [ "$SERVER" != "" ]; then
		if [ "`chnet $SERVER $subnet`" != "`chnet $ip $subnet`" ]; then
			route add -host $SERVER gw $router dev $interface
		fi
		sh /etc/templates/wan_ppp.sh start $SERVER DHCP > /dev/console
	else
		echo "Can not find server (<?=$server?>) : $SERVER" > /dev/console
	fi

<?
if ($physical==1)
{ 
	echo "\tif [ \"\$last_wan2_st\" != \"connected\" ]; then\n"; 
	echo "\t\t[ -f /etc/templates/dhcpd.sh ] && /etc/templates/dhcpd.sh > /dev/console\n";
	echo "\tfi\n";
}
?>

	;;
deconfig)
	/etc/templates/wan_ppp.sh stop > /dev/console
	ifconfig $interface 0.0.0.0 > /dev/console
	xmldbc -i -s /runtime/wan/phy/ip ""
	xmldbc -i -s /runtime/wan/phy/netmask ""
<?
if ($physical==1)
{
	echo "\txmldbc -i -s /runtime/wan/inf:2/connectstatus disconnceted\n";
	echo "\txmldbc -i -s /runtime/wan/inf:2/ip \"\"\n";
	echo "\txmldbc -i -s /runtime/wan/inf:2/netmask \"\"\n";
	echo "\txmldbc -i -s /runtime/wan/inf:2/gateway \"\"\n";
	echo "\txmldbc -i -s /runtime/wan/inf:2/primarydns \"\"\n";
	echo "\txmldbc -i -s /runtime/wan/inf:2/secondarydns \"\"\n";
	echo "\txmldbc -i -s /runtime/wan/inf:2/domain \"\"\n";
	echo "\txmldbc -i -s /runtime/wan/inf:2/interface \"\"\n";
	echo "\txmldbc -i -s /runtime/wan/inf:2/mtu \"\"\n";

	echo "\t[ -f /etc/templates/dhcpd.sh ] && /etc/templates/dhcpd.sh > /dev/console\n";
}
?>


	;;
esac
exit 0

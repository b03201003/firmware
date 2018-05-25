# flush_main.php >>>
<? /* vi: set sw=4 ts=4: */ ?>
iptables -t mangle -F PREROUTING
iptables -t mangle -F POSTROUTING 
iptables -t nat -F PREROUTING
iptables -t nat -F POSTROUTING
iptables -F FORWARD
iptables -F INPUT
<?
anchor("/runtime/rgfunc");

/* Update main chains */

/* mangle PREROUTING */
if( $wanif != "" )
{ echo "iptables -t mangle -A PREROUTING -j TTL --ttl-inc 1\n"; }
if ($wanip!="")
{
	if(query("vrtsrv") > 0 || query("dmz") > 0)
	{
		echo "iptables -t mangle -A PREROUTING -i ".$lanif." -d ".$wanip." -j PRE_MARK\n";
		if($wan2if!="" && $wan2ip!="")
		{
			echo "iptables -t mangle -A PREROUTING -i ".$lanif." -d ".$wan2ip." -j PRE_MARK\n";
		}
	}
}

/* PREROUTINE */
if (query("macfilter") > 0)
{
	echo "iptables -t nat -A PREROUTING -i ".$lanif." -j PRE_MACFILTER\n";
	echo "iptables -A FORWARD -j FOR_MACFILTER\n";
}
if(query("gzone/macfilter")>0)
{
	echo "iptables -t nat -A PREROUTING -i ".$lan2if." -j PRE_GZ_MACFILTER\n";
}
if ($wanip!="" && query("portt") > 0)
{
	echo "iptables -t nat -A PREROUTING -d ".$wanip." -j PRE_PORTT\n";
}
if($wan2if!="" && $wan2ip!="" && query("portt")>0)
{
	echo "iptables -t nat -A PREROUTING -d ".$wan2ip." -j PRE_PORTT\n";
}
if ($wanif!="" && query("/security/dos/enable")==1)
{
	echo "iptables -t nat -A PREROUTING -i ".$wanif." -j PRE_DOS\n";
	echo "iptables -t nat -A PREROUTING -i ".$wanif." -j PRE_SPI\n";
	if($wan2if!="" && $wan2ip!="")
	{
		echo "iptables -t nat -A PREROUTING -i ".$wan2if." -j PRE_DOS\n";
		echo "iptables -t nat -A PREROUTING -i ".$wan2if." -j PRE_SPI\n";
	}
}
/* Protecting form ARP Flood 
if (query("/security/attack/arp")==1)
{
	echo "echo 5 > /proc/sys/net/ipv4/arp_flood_burst\n";
	echo "echo 20 > /proc/sys/net/ipv4/arp_flood_cost\n";
}*/
if (query("vrtsrv") > 0)
{
	echo "iptables -t nat -A PREROUTING -j PRE_VRTSRV\n";
}

if (query("/upnp/enable") == 1)
{
	echo "iptables -t nat -A PREROUTING -j PRE_UPNP\n";
}

echo "iptables -t nat -A PREROUTING -j PRE_MISC\n"; 

if ($wanip!="" && query("dmz") > 0)
{
	echo "iptables -t nat -A PREROUTING -d ".$wanip." -j PRE_DMZ\n";
}
if($wan2ip!="" && query("dmz")>0)
{
	echo "iptables -t nat -A PREROUTING -d ".$wan2ip." -j PRE_DMZ\n";
}

/* echo "iptables -t nat -A PREROUTING -i ! ".$lanif." -j PRE_DEFAULT\n"; */
$CMDHEAD = "iptables -t nat -A PREROUTING -i "; $CMDTAIL = " -j PRE_DEFAULT\n";
if ($wanphy!="")					{ echo $CMDHEAD.$wanphy.$CMDTAIL;}
if ($wanphy!=$wanif && $wanif!="")	{ echo $CMDHEAD.$wanif.$CMDTAIL; }
if ($wanphy!=$wanif2 && $wanif2!=""){ echo $CMDHEAD.$wanif2.$CMDTAIL;}

/* FORWARD */
if ($wanmode == 3 && $wanif !="")
{
	 $mss=query("/wan/rg/inf:1/pppoe/mtu");
	 if($mss=="")    { $mss=1400; }
	 else           { $mss=$mss-40; }
	 echo "iptables -t mangle -A PREROUTING -i ".$wanif." -p tcp --tcp-flags SYN SYN -m tcpmss --mss ".$mss.":1500 -j TCPMSS --set-mss ".$mss."\n";
     echo "iptables -t mangle -A PREROUTING -i br0 -p tcp --tcp-flags SYN SYN -m tcpmss --mss ".$mss.":1500 -j TCPMSS --set-mss ".$mss."\n";
	 				
 }
if ($wanmode == 4 && $wanif != "")
{
     $mss=query("/wan/rg/inf:1/pptp/mtu");
     if($mss=="")    { $mss=1400; }
     else           { $mss=$mss-40; }
     echo "iptables -t mangle -A PREROUTING -i ".$wanif." -p tcp --tcp-flags SYN SYN -m tcpmss --mss ".$mss.":1500 -j TCPMSS --set-mss ".$mss."\n";
     echo "iptables -t mangle -A PREROUTING -i br0 -p tcp --tcp-flags SYN SYN -m tcpmss --mss ".$mss.":1500 -j TCPMSS --set-mss ".$mss."\n";

 }


if ($wanif!="" && query("portt") > 0)
{	echo "iptables -A FORWARD -o ".$wanif." -j FOR_PORTT\n"; }
if($wan2if!="" && query("portt")>0)
{	echo "iptables -A FORWARD -o ".$wan2if." -j FOR_PORTT\n"; }

if (query("firewall") > 0) 
{ echo "iptables -A FORWARD -j FOR_FIREWALL\n"; }

if (query("ipfilter") > 0)
{ echo "iptables -A FORWARD -j FOR_IPFILTER\n"; }

if (query("vrtsrv") > 0 || query("dmz") > 0 || query("upnp") > 0)
{ echo "iptables -A FORWARD -j FOR_DNAT\n"; }

if (query("urlfilter") > 0)
{ echo "iptables -A FORWARD -i ".$lanif." -p tcp --dport 80 -j FOR_BLOCKING\n"; }

if(query("/runtime/rgfunc/domainfilter")>0)
{ echo "iptables -A FORWARD -i ".$lanif." -p udp --dport 53 -j FOR_BLOCKING\n";
  echo "iptables -A INPUT -i "  .$lanif." -p udp --dport 53 -j INP_BLOCKING\n"; }

if (query("vpn") > 0)
{ echo "iptables -A FORWARD -j FOR_VPN\n"; }

/* POSTROUTING */
if (query("vrtsrv") > 0 || query("dmz") > 0)
{ 
	echo "iptables -t nat -A POSTROUTING -m mark --mark 1 -j PST_VRTSRV\n";
	if($wan2if!="" && $wan2ip!="")
	{
		echo "iptables -t nat -A POSTROUTING -m mark --mark 2 -j PST_VRTSRV2\n";
	}
}

/* POSTROUTING MASQUERADE */
$use_stun = query("/runtime/func/stun/enabled");
$stun_type= query("/runtime/func/stun/type");
if ($use_stun==1 && $stun_type>0 && $stun_type<5) { $MASQ_target = "STUN --type ".$stun_type; }
else { $MASQ_target = "MASQUERADE"; }

if ($wanif!="")	{ echo "iptables -t nat -A POSTROUTING -o ".$wanif." -j ".$MASQ_target."\n"; }
/* Add the MASQUERADE rule for other wan interface. */
if ($wan2if!=""){ echo "iptables -t nat -A POSTROUTING -o ".$wan2if." -j ".$MASQ_target."\n"; }

/* Fast NAT */
echo "echo -1 > /proc/fastnat/forskipsupport\n";
if (query("urlfilter") > 0)		{ echo "echo 80 > /proc/fastnat/forskipsupport\n"; }
if (query("domainfilter") > 0)	{ echo "echo 53 > /proc/fastnat/forskipsupport\n"; }

/* netsniper */
require($template_root."/rg/flush_netsniper.php");
?>
# flush_main.php <<<

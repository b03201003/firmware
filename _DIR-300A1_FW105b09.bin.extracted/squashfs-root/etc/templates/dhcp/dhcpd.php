<?
/* vi: set sw=4 ts=4: */
require("/etc/templates/troot.php");

$dhcpd_pidf ="/var/run/udhcpd-".$dhcpd_if.".pid";
$dhcpd_conf ="/var/run/udhcpd-".$dhcpd_if.".conf";
$dhcpd_lease="/var/run/udhcpd-".$dhcpd_if.".lease";
$dhcpd_patch="/var/run/dhcppatch-".$dhcpd_if.".pid";

if ($generate_start==1)
{
	echo "echo \"Start DHCP server (".$dhcpd_if.") ...\" > /dev/console\n";
	if (query("/runtime/router/enable")!="1")
	{
		echo "echo Router function is off, DHCP server will not be enabled !!! > /dev/console\n";
	}
	else if (query("/lan/dhcp/server/enable") != "1")
	{
		echo "echo DHCP server is disabled! > /dev/console\n";
	}
	else
	{
		$ipaddr=query("/lan/ethernet/ip");
		$netmask=query("/lan/ethernet/netmask");
		anchor("/lan/dhcp/server/pool:1");
		$ipstr=query("startip");
		$ipend=query("endip");
		$dmain=query("domain");
		$wins0=query("primarywins");
		$wins1=query("secondarywins");


		$wan1mode = query("/wan/rg/inf:1/mode");
		$wan1pptp_phy = query("/wan/rg/inf:1/pptp/physical");
		$wan2mode = query("/wan/rg/inf:2/mode");
		$wan1status = query("/runtime/wan/inf:1/connectstatus");
		$wan2status = query("/runtime/wan/inf:2/connectstatus");
		$def_ltime = query("leasetime");
		if ( $wan1mode == "2" ) /*  DHCP (2) */
		{
			if ( $wan1status != "connected") { $ltime="60"; }
			else { $ltime=$def_ltime; }
		}
		else if ( $wan1mode == "3" ) /* PPPoE (3) */
		{
			if ( $wan2mode != "" ) /* Russia PPPoE (dual access)*/
			{
				if ( $wan2mode == "2" && $wan2status != "connected" )
				{ $ltime="60"; } /* if Russia PPPoE(WAN1) plus DHCP(WAN2) and WAN2 is not connected, we set lease time as 60s */
				else { $ltime=$def_ltime; } 
			}
			else /* PPPoE (single access)*/
			{ $ltime=$def_ltime; }
		}
		else if ( $wan1mode == "4" ) /* PPTP (4) */
		{
			if ( $wan1pptp_phy != "" ) /* Russia PPTP (dual access)*/
			{
				if ( $wan1pptp_phy == "1" && query("/wan/rg/inf:1/pptp/mode") == "2" && $wan2status != "connected" )
				{ $ltime="60"; } /* if Russia PPTP(WAN1) plus DHCP(WAN2) and, WAN2 is not connected, we set lease time as 60s */
				else { $ltime=$def_ltime; } 	
			}
			else /* PPTP (single access)*/
			{ $ltime=$def_ltime; }
		}
		else /* others */
		{ $ltime=$def_ltime; }


		if ($ltime == "") { $ltime="8640"; }

		if ($dmain == "") { $dmain=query("/runtime/wan/inf:1/domain"); }

		if ($dmain == "") /* doesn't set domain on device*/
		{
			if ( $wan2mode != "" && $wan2mode == "2") /* WAN type is Russia PPPoE plus DHCP */
			{ $dmain=query("/runtime/wan/inf:2/domain"); }

			if ( $wan1pptp_phy == "1" && query("/wan/rg/inf:1/pptp/mode") == "2")  /* WAN type is Russia PPTP plus DHCP */
			{ $dmain=query("/runtime/wan/inf:2/domain"); }
		} 

		/* clear leases */
		if ($ipaddr != query("/runtime/dhcpserver/lan/ipaddr") ||
			$netmask!= query("/runtime/dhcpserver/lan/netmask")||
			$ipstr	!= query("/runtime/dhcpserver/lan/startip")||
			$ipend	!= query("/runtime/dhcpserver/lan/endip"))
		{
			echo "echo -n > ".$dhcpd_lease."\n";
			set("/runtime/dhcpserver/lan/ipaddr",	$ipaddr);
			set("/runtime/dhcpserver/lan/netmask",	$netmask);
			set("/runtime/dhcpserver/lan/startip",	$ipstr);
			set("/runtime/dhcpserver/lan/endip",	$ipend);
		}

		fwrite( $dhcpd_conf, "start ".		$ipstr."\n");
		fwrite2($dhcpd_conf, "end ".		$ipend."\n");
		fwrite2($dhcpd_conf, "interface ".	$dhcpd_if."\n");
		fwrite2($dhcpd_conf, "lease_file ".	$dhcpd_lease."\n");
		fwrite2($dhcpd_conf, "pidfile ".	$dhcpd_pidf."\n");
		fwrite2($dhcpd_conf, "auto_time ".	"10\n");
		fwrite2($dhcpd_conf, "opt lease ".	$ltime."\n");

		if ($dmain!="")	{ fwrite2($dhcpd_conf, "opt domain ".	$dmain."\n"); }
		if ($netmask!="")	{ fwrite2($dhcpd_conf, "opt subnet ".$netmask."\n"); }
		if ($ipaddr!="")	{ fwrite2($dhcpd_conf, "opt router ".$ipaddr."\n"); }
		if ($wins0!="")		{ fwrite2($dhcpd_conf, "opt wins ".$wins0."\n"); }
		if ($wins1!="")		{ fwrite2($dhcpd_conf, "opt wins ".$wins1."\n"); }

		if (query("/dnsrelay/mode") != "1")
		{
			fwrite2($dhcpd_conf, "opt dns ".$ipaddr."\n");
		}
		else
		{
			$dns = query("/runtime/wan/inf:1/primarydns");
			if ($dns != "")	{ fwrite2($dhcpd_conf, "opt dns ".$dns."\n"); }
			$dns=query("/runtime/wan/inf:1/secondarydns");
			if ($dns != "")	{ fwrite2($dhcpd_conf, "opt dns ".$dns."\n"); }
		}

		if (query("staticdhcp/enable") == 1)
		{
			for ("/lan/dhcp/server/pool:1/staticdhcp/entry")
			{
				if (query("enable") == 1)
				{
					$ip=query("ip");
					$mac=query("mac");
					fwrite2($dhcpd_conf, "static ".$ip." ".$mac."\n");
				}
			}
		}
		
		echo "udhcpd ".$dhcpd_conf." &\n";
		echo "dhcpxmlpatch -f ".$dhcpd_lease." &\n";
		echo "echo $! > ".$dhcpd_patch."\n";

		/* disable and enable LAN ports */
		if (query("/runtime/dhcpd/disable_lan")==1)
		{
			echo "if [ -f /etc/scripts/dislan.sh ]; then\n";
			echo "	/etc/scripts/dislan.sh > /dev/console\n";
			echo "	sleep 3\n";
			echo "fi\n";
			echo "[ -f /etc/scripts/enlan.sh ] && sh /etc/scripts/enlan.sh > /dev/console\n";
			set("/runtime/dhcpd/disable_lan", "");
		}
	}
}
else
{
	echo "echo \"Stop DHCP server (".$dhcpd_if.") ...\" > /dev/console\n";

	if (query("/runtime/router/enable")!="1")
	{
		echo "echo DHCP server is not enabled ! > /dev/console\n";
	}
	else
	{
		echo "if [ -f ".$dhcpd_patch." ]; then\n";
		echo "	pid=`cat ".$dhcpd_patch."`\n";
		echo "	if [ $pid != 0 ]; then\n";
		echo "		kill $pid > /dev/console 2>&1\n";
		echo "	fi\n";
		echo "	rm -f ".$dhcpd_patch."\n";
		echo "fi\n";

		echo "if [ -f ".$dhcpd_pidf." ]; then\n";
		echo "	pid=`cat ".$dhcpd_pidf."`\n";
		echo "	if [ $pid != 0 ]; then\n";
		echo "		kill $pid > /dev/console 2>&1\n";
		echo "	fi\n";
		echo "	rm -f ".$dhcpd_pidf."\n";
		echo "fi\n";
	}
}
?>

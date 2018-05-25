# ppp3g >>>>
<? /* vi: set sw=4 ts=4: */
$rg_script=1;
$ppp3g_session="session1";

if ($generate_start == 1)
{
	anchor("/runtime/layout");
	$wanif=query("wanif");

	/* Generate authentication info */
	echo "[ -f /etc/ppp/chap-secrets ] && rm -f /etc/ppp/chap-secrets\n";
	echo "echo -n > /etc/ppp/pap-secrets\n";
	echo "ln -s /etc/ppp/pap-secrets /etc/ppp/chap-secrets\n";

	/* Prepare ip-up ip-down */
	echo "cp ".$template_root."/ppp/ip-up /etc/ppp/.\n";
	echo "cp ".$template_root."/ppp/ip-down /etc/ppp/.\n";
	echo "cp ".$template_root."/ppp/ppp-status /etc/ppp/.\n";

	set("/runtime/wan/inf:1/connecttype", "3");
	anchor("/runtime/wan/inf:1");
	set("ip", "");
	set("netmask", "");
	set("gateway", "");
	set("primarydns", "");
	set("secondarydns", "");
	set("mtu", "");

	$ppp_linkname	= $ppp3g_session;

	/* Query PPP parameters */
	anchor("/wan/rg/inf:1/ppp3g");
	$ppp_type			= "ppp3g";
/*	if (query("mode")==1)	{ $ppp_staticip = query("staticip"); }
	else					{ $ppp_staticip = ""; } */
	$ppp_staticip 		= "";
	$ppp_modem_type 	= query("/runtime/stats/usb/devices/driver");

	if ($ppp_modem_type == "acm")
	{
		$ppp_modem = "acm";
	}
	else if ($ppp_modem_type == "serial")
	{
		$ppp_modem = "tts";
	}
	else if ($ppp_modem_type == "0")
	{
		$ppp_modem = "0";	
	}
	else
	{
		$ppp_modem = "";
	}
	
	$ppp_pin			= query("pincode");
	$ppp_dialnumber		= query("dialnumber");
	$ppp_apn			= query("apn");
	$ppp_username		= get("s", "username");
	$ppp_password		= get("s", "password");
	$ppp_idle			= query("idletimeout");
	$ppp_persist		= query("autoreconnect");
	$ppp_demand			= query("ondemand");
	$ppp_usepeerdns		= 1 // query("autodns"); 
	$ppp_mtu			= query("mtu"); 
	$ppp_mru			= query("mtu"); 
	$ppp_defaultroute	= 1;
	if ($ppp_demand!=1) { $ppp_idle=0; }

	echo "echo \"\\\"".$ppp_username."\\\" * \\\"".$ppp_password."\\\" *\" >> /etc/ppp/pap-secrets\n";
	require($template_root."/ppp/ppp_setup.php");
	if ($ppp_persist == 1) { echo "sh /var/run/ppp-".$ppp_linkname.".sh start > /dev/console\n"; }
	if ($ppp_demand == 1)
	{
		set("/runtime/wan/inf:1/connecttype", "3");
		anchor("/runtime/wan/inf:1");
		set("ip", "10.112.112.112");
		set("netmask", "255.255.255.255");
		set("gateway", "10.112.112.113");
		set("primarydns", "10.112.112.114");
	}
}
else
{
	echo "sh /var/run/ppp-".$ppp3g_session.".sh stop > /dev/console\n";
}
?># ppp3g <<<

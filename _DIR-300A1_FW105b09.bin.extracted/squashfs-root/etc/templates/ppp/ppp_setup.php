# ppp_setup.php >>>
<?
/* vi: set sw=4 ts=4:
 *
 * The pap-secrets and chap-secrets will not be generated in this script.
 * Caller should prepare the secret files.
 *
 * The caller should also generate the ip-up and ip-down scripts in /etc/ppp
 */
if ($ppp_linkname == "")
{
	echo "echo No link name specified !!!! > /dev/console\n";
	exit;
}

/* Generate options file */
$options_file="/etc/ppp/options.".$ppp_linkname;
if ($ppp_mtu=="") { $ppp_mtu="1492"; }
if ($ppp_mru=="") { $ppp_mru="1492"; }
if (query("/wan/rg/inf:2/mode") == "1" || query("/wan/rg/inf:2/mode") == "2")
{
	$russia_pppoe = "1";
}
if (query("/wan/rg/inf:1/pptp/physical") == "1")
{
	$russia_pptp = "1";
}
$pppoe_mppe = query("/wan/rg/inf:1/pppoe/mppe/enable");
$pptp_mppe = query("/wan/rg/inf:1/pptp/mppe/enable");

fwrite( $options_file, "noauth nodeflate nobsdcomp nodetach");
if ($russia_pppoe == "1" || $russia_pptp == "1") 
{
	if ($pppoe_mppe == "1" || $pptp_mppe == "1")
	{ fwrite2( $options_file,"\n"); } else { fwrite2( $options_file," noccp\n"); } 
} else { fwrite2( $options_file," noccp\n"); }

if (query("/runtime/ppp_debug")==1) { fwrite2($options_file, "debug dump logfd 1\n"); }
fwrite2($options_file, "lcp-echo-failure 3\n");
fwrite2($options_file, "lcp-echo-interval 30\n");
fwrite2($options_file, "lcp-echo-failure-2 14\n");
fwrite2($options_file, "lcp-echo-interval-2 6\n");
fwrite2($options_file, "lcp-timeout-1 10\n");
fwrite2($options_file, "lcp-timeout-2 10\n");
fwrite2($options_file, "ipcp-accept-remote ipcp-accept-local\n");
fwrite2($options_file, "mtu ".$ppp_mtu."\n");
fwrite2($options_file, "mru ".$ppp_mru."\n");
fwrite2($options_file, "linkname ".$ppp_linkname."\n");
fwrite2($options_file, "ipparam ".$ppp_linkname."\n");

if ($ppp_username != "")					{ fwrite2($options_file, "user \"".$ppp_username."\"\n"); }
if ($ppp_defaultroute == 1)					{ fwrite2($options_file, "defaultroute\n"); }
if ($ppp_idle != "" && $ppp_idle != "0")	{ fwrite2($options_file, "idle ".$ppp_idle."\n"); }
if (query("/wan/rg/inf:1/pppoe/starspeed/enable") == "1")
{
if ($ppp_persist == 1)						{ fwrite2($options_file, "persist\nmaxfail 1\n"); }
}
else
{
if ($ppp_persist == 1)						{ fwrite2($options_file, "persist\nmaxfail 5\n"); }	
}
if ($ppp_usepeerdns == 1)					{ fwrite2($options_file, "usepeerdns\n"); }
set("/runtime/ppp/".$ppp_linkname."/usepeerdns", $ppp_usepeerdns);

/* use statoc ip address or not */
if ($ppp_staticip != "") { $ignore_local=1; } else { $ignore_local=0; }
$ipaddr = $ppp_staticip;

if ($ppp_demand == 1)
{
	fwrite2($options_file, "demand\nconnect true\nktune\n");
	if ($ipaddr == "" || $ipaddr == "0.0.0.0") { $ipaddr = "10.112.112.112"; }
}
if ($ipaddr != "" && $ipaddr != "0.0.0.0")
{
	fwrite2($options_file, $ipaddr.":10.112.112.113\n");
	if ($ignore_local==1) { fwrite2($options_file, "ipcp-ignore-local\n"); }
}
else
{
	fwrite2($options_file, "noipdefault\n");
}

if ($ppp_type == "pppoe")
{
	if ($pppoe_acname != "")	{ $ACNM=" pppoe_ac_name ".$pppoe_acname; }
	if ($pppoe_service != "")	{ $SRVC=" pppoe_srv_name ".$pppoe_service; }
	if ($russia_pppoe == "1" && $pppoe_mppe == "1")
	{
		fwrite2($options_file, "refuse-eap\n");
		fwrite2($options_file, "refuse-chap\n");
		fwrite2($options_file, "refuse-mschap\n");
		fwrite2($options_file, "require-mppe\n");
	}
	fwrite2($options_file, "kpppoe pppoe_device ".$pppoe_if.$ACNM.$SRVC."\n");
}
else if ($ppp_type == "pptp")
{
	fwrite2($options_file, "pty_pptp pptp_server_ip ".$pptp_server."\n");
	fwrite2($options_file, "name ".$ppp_username."\n");
	fwrite2($options_file, "refuse-eap\n");
	if ($russia_pptp == "1" && $pptp_mppe == "1")
	{
		fwrite2($options_file, "refuse-chap\n");
		fwrite2($options_file, "refuse-mschap\n");
		fwrite2($options_file, "require-mppe\n");
	}	
	fwrite2($options_file, "sync pptp_sync\n");
}
else if ($ppp_type == "l2tp")
{
	fwrite2($options_file, "pty_l2tp l2tp_peer ".$l2tp_server."\n");
	fwrite2($options_file, "sync l2tp_sync\n");
}
else if ($ppp_type == "ppp3g")
{
	$chat_file = "/etc/ppp/".$ppp_linkname."chat.txt";
	fwrite2($options_file, "tty_ppp3g ppp3g_chat ".$chat_file."\n");
	if( $ppp_modem != "" && $ppp_modem != "0" )
	{
		fwrite2($options_file, "modem\n");
	}
	fwrite2($options_file, "crtscts\n");
	if( $ppp_modem == "acm" )
	{
		fwrite2($options_file, "/dev/usb/acm/0\n");
	}
	else if( $ppp_modem == "tts" )
	{
		fwrite2($options_file, "/dev/usb/tts/0\n");
	}
	fwrite2($options_file, "11520\n");
	fwrite2($options_file, "0.0.0.0:0.0.0.0\n");
	fwrite2($options_file, "novj\n");

	
	/* generate 3g chat script */
	//$chat_file = "/etc/ppp/".$ppp_linkname."chat.txt";
	fwrite($chat_file, "TIMEOUT 20\n");
	fwrite2($chat_file, "\'\' \\rAT\n");
	if( $ppp_pin != "" )
	{
		fwrite2($chat_file, "OK \\rAT+CPIN=\"".$ppp_pin."\"\n");
	} 
	fwrite2($chat_file, "OK \\rAT+CGDCONT=1,\"IP\",\"".$ppp_apn."\"\n");
	fwrite2($chat_file, "OK \\rATDT".$ppp_dialnumber."\\r\n");
	fwrite2($chat_file, "CONNECT \'\'\n");
	
	/* ppp option that calls the chat script */	
	//fwrite2($options_file, "connect \'chat -v -V -S -r /var/ppp-chat.log -f ".$chat_file."\'\n");
}
/* generate script files */
$ppp_loop_script = "/var/run/ppp-loop-".$ppp_linkname.".sh";
$ppp_script = "/var/run/ppp-".$ppp_linkname.".sh";

/* ppp loop script */
/*
 *	$ppp_persist means always on, but we do not loop forever when
 *	the phyiscal interface is using DHCP. We trigger DHCP client
 *	to renew and start PPP again when we get the IP address again.
 */
fwrite($ppp_loop_script, "#!/bin/sh\n");
if ($ppp_persist==1)
{
	if ($ppp_on_dhcp==1)
	{
		fwrite2($ppp_loop_script, "pppd file ".$options_file." > /dev/console\n");
		fwrite2($ppp_loop_script, "killall -SIGUSR1 udhcpc\n");
	}
	else
	{
		fwrite2($ppp_loop_script, "while [ 1 = 1 ]; do\n");
		fwrite2($ppp_loop_script, "pppd file ".$options_file." > /dev/console\n");
		fwrite2($ppp_loop_script, "done\n");
	}
}
else if($ppp_schedule != "" && $ppp_schedule != 0)
{
		fwrite2($ppp_loop_script, "while [ 1 = 1 ]; do\n");
		fwrite2($ppp_loop_script, "pppd file ".$options_file." > /dev/console\n");
		fwrite2($ppp_loop_script, "done\n");
}
else
{
	fwrite2($ppp_loop_script, "pppd file ".$options_file." > /dev/console\n");
}

/* ppp script */
echo "rgdb -A ".$template_root."/ppp/ppp_run.php -V linkname=".$ppp_linkname." > ".$ppp_script."\n";
echo "chmod +x ".$ppp_script." ".$ppp_loop_script."\n";
?># ppp_setup.php <<<

#!/bin/sh
echo [$0] ... > /dev/console
<? /* vi: set sw=4 ts=4: */
require("/etc/templates/troot.php");
$mode = query("/wan/rg/inf:1/mode");
if (query("/runtime/router/enable")!=1)
{
	echo "echo Bridge mode selected ! > /dev/console\n";
	if ($mode==1) {	require($template_root."/wan_static.php"); }
	else { $mode=2;	require($template_root."/wan_dhcp.php"); }
}
else
{
	/* netsniper */
	$netsniper = query("/runtime/func/netsniper");
	$netsniper_enable = query("/wan/rg/inf:1/netsniper_enable");
	if($netsniper==1)
	{
		/* enable netsniper, must remove sw_tcpip module. Or else web access from lan will fail! */
		if($netsniper_enable == 1)
		{
			echo "rmmod sw_tcpip\n";
			echo "echo 1024 > /proc/sys/net/ipv4/ip_personality_sport\n";
			echo "echo 1 > /proc/sys/net/ipv4/ip_personality_enable\n";
		}
		else
		{
			echo "echo 0 > /proc/sys/net/ipv4/ip_personality_enable\n";
			echo "echo 0 > /proc/sys/net/ipv4/ip_personality_sport\n";
			echo "insmod /lib/modules/sw_tcpip.o\n";
		}
	}

	if		($mode==1)	{ require($template_root."/wan_static.php"); }
	else if	($mode==2)	{ require($template_root."/wan_dhcp.php"); }
	else if	($mode==3)
	{
		require($template_root."/wan_pppoe.php");
		$wan2_mode = query("/wan/rg/inf:2/mode");
		if		($wan2_mode=="1") { require($template_root."/wan2_static.php");}
		else if ($wan2_mode=="2") { require($template_root."/wan2_dhcp.php");}
	}
	else if ($mode==4)	{ require($template_root."/wan_ip_setup.php"); }
	else if ($mode==5)	{ require($template_root."/wan_ip_setup.php"); }
	else if ($mode==7)	{ require($template_root."/wan_dhcp.php"); }
	else if ($mode==8)	{ require($template_root."/wan_ppp3g.php"); }
	else
	{
		echo "echo \"Uknown WAN mode : ".$mode."\" > /dev/console\n";
	}
}
?>

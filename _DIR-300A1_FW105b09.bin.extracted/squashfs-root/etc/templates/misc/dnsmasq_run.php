#!/bin/sh
echo [$0] ... > /dev/console
<?
/* vi: set sw=4 ts=4: */
require("/etc/templates/troot.php");

$dnsmasq_pid="/var/run/dnsmasq.pid";

if ($generate_start==1)
{
	if (query("/runtime/router/enable")!=1)
	{
		echo "echo Router function is off, DNS relay will not be enabled !!! > /dev/console\n";
	}
	else if (query("/dnsrelay/mode")==1)
	{
		echo "echo Dnsmasq disabled... > /dev/console\n";
	}
	else
	{
		$dns0  = query("/runtime/wan/inf:1/primarydns");
		$dns1  = query("/runtime/wan/inf:1/secondarydns");
		$dns2  = query("/runtime/wan/inf:2/primarydns");
		$dns3  = query("/runtime/wan/inf:2/secondarydns");
		$bdns  = query("/backupdns/enable");
		$bdns1 = query("/backupdns/dns1");
		$bdns2 = query("/backupdns/dns2");
		$wan2gw= query("/runtime/wan/inf:2/gateway");
		$wan2if= query("/runtime/wan/inf:2/interface");
		echo "#".$dns0.",".$dns1.",".$dns2.",".$dns3."\n";
		$param="";
		if ($dns0 != "") { $param=$param." -S ".$dns0; }
		if ($dns1 != "") { $param=$param." -S ".$dns1; }
		if ($dns2 != "") { $param=$param." -S ".$dns2; }
		if ($dns3 != "") { $param=$param." -S ".$dns3; }
		if ($bdns==1)
		{
			if ($bdns1!="") { $param=$param." -S ".$bdns1; }
			if ($bdns2!="") { $param=$param." -S ".$bdns2; }
		}
/*		for now, dnsmasq still not support specific string, ex: "flets/"  */
/*
		$pro_id=query("/wan/rg/inf:2/profileid");
		for ("/routing/policyroute/entry")
		{
			if (query("profile") == $pro_id)
			{
				if (query("rule")==0)
				{
					$domain=query("domain");
					$param=$param." -K \"".$domain."\"";
				}
			}
		}
*/

		$urlhome = query("/sys/hostname");
		$lanip   = query("/lan/ethernet/ip");
		fwrite("/etc/hosts", "127.0.0.1 localhost\n");
		fwrite2("/etc/hosts", $lanip." ".$urlhome."\n");

		echo "echo Start Dnsmasq ... > /dev/console\n";
		echo "dnsmasq".$param." -c 0 -R -x /var/run/dnsmasq.pid \n";

	}
}
else
{
	echo "echo Stop Dnsmasq ... > /dev/console\n";
	if (query("/runtime/router/enable")!=1)
	{
		echo "echo Dnsmasq is not enabled ! > /dev/console\n";
	}
	else
	{
		echo "if [ -f ".$dnsmasq_pid." ]; then\n";
		echo "	PID=`cat ".$dnsmasq_pid."`\n";
		echo "	if [ \"$PID\" != \"0\" -a \"$PID\" != \"\" ]; then\n";
		echo "		kill $PID > /dev/console 2>&1\n";
		echo "	fi\n";
		echo "	rm -f ".$dnsmasq_pid." > /dev/console\n";
		echo "fi\n";
		echo "rm -f $0 > /dev/console\n";
	}
}
?>
# dnsmasq_run.php <<<

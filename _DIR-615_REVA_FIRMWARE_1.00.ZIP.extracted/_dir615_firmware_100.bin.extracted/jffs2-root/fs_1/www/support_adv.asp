
<html>
<head>

<link rel="STYLESHEET" type="text/css" href="css_router.css">

<title>D-LINK SYSTEMS, INC | WIRELESS ROUTER | HOME</title>
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.style6 {
	font-size: 14px;
	font-weight: bold;
}
-->
</style>
</head>

<body topmargin="1" leftmargin="0" rightmargin="0" bgcolor="#757575">
	<table id="header_container" border="0" cellpadding="5" cellspacing="0" width="838" align="center">
      <tr>
        <td width="100%">Product Page: <a href="http://support.dlink.com/">DIR-615</a></td>
        <td align="right" nowrap>Hardware Version: A1 &nbsp;</td>
        <td align="right" nowrap>Firmware Version: <% CmoGetStatus("version"); %></td>
      </tr>
    </table>
	<table id="topnav_container" border="0" cellpadding="0" cellspacing="0" width="838" align="center">
		<tr>
			<td align="center" valign="middle"><img src="wlan_masthead.gif" width="836" height="92"></td>
		</tr>
	</table>
	<table border="0" cellpadding="2" cellspacing="1" width="838" align="center" bgcolor="#FFFFFF">
		<tr id="topnav_container">
			<td><img src="short_modnum.gif" width="125" height="25"></td>
			<td id="topnavoff"><a href="index.asp">Setup</a></td>
			<td id="topnavoff"><a href="adv_virtual.asp">Advanced</a></td>
			<td id="topnavoff"><a href="tools_admin.asp">Tools</a></td>
			<td id="topnavoff"><a href="st_device.asp">Status</a></td>
			<td id="topnavon"><a href="support_men.asp">Support</a></td>
		</tr>
	</table>
	<table border="1" cellpadding="2" cellspacing="0" width="838" height="100%" align="center" bgcolor="#FFFFFF" bordercolordark="#FFFFFF">
		<tr>
		  <td id="sidenav_container" valign="top" width="125" align="right">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td id="sidenav_container">
							<div id=sidenav> 
							<!-- === BEGIN SIDENAV === -->
								<ul>
									<li><div><a href="support_men.asp">MENU</a></div></li>
									<li><div><a href="support_internet.asp">Setup</a></div></li>
									<li><div><div id="sidenavoff">Advanced</div></li>
									<li><div><a href="support_tools.asp">Tools</a></div></li>
									<li><div><a href="support_status.asp">Status</a></div></li>
								</ul>
								<!-- === END SIDENAV === -->
							</div>
						</td>			
					</tr>
				</table>			
		  </td>
			<td valign="top" id="maincontent_container">
				<div id="maincontent">
					<!-- === BEGIN MAINCONTENT === -->
				 				  <div id="box_header"> 
						<h1>SUPPORT MENU</h1>
						<table width=75% border=0 cellspacing=0 cellpadding=0>
                          <tr>
                            <td>
                              <ul>
                                <li><a href=support_adv.asp#05><font color=#000000>Virtual Server </font></a></li>
								<li><a href=support_adv.asp#06><font color=#000000>Port Forwarding</font></a></li>
								<li><a href=support_adv.asp#07><font color=#000000>Applications</font></a></li>
								<li><a href=support_adv.asp#08><font color=#000000>Network filter</font></a></li>
                                <li><a href=support_adv.asp#09><font color=#000000>Website Filter</font></a></li>
								<li><a href=support_adv.asp#10><font color=#000000>Firewall Settings</font></a></li>
								<li><a href=support_adv.asp#11><font color=#000000>Advanced Wireless</font></a></li>
								<li><a href=support_adv.asp#12><font color=#000000>Advanced Network</font></a></li>

</ul></td>
                          </tr>
                        </table>
				  </div>
				  <div class="box">
				  <h2>Virtual Server <a name=05></a></h2>
				  <table width=511 border=0 cellspacing=0 cellpadding=0>
				                            <tr>
                            <td height=63><p><b>Virtual Server</b><font size=4><b> </b></font><br>
                              The device can be configured as a virtual server so that users on the Internet can access services such as Web or FTP via the public (WAN) IP address of the router. The DIR-615 can be configured to automatically redirect these requests from the Internet to servers on your network. Click the checkbox to Enable the entry, select a pre-defined service from the Application Name drop down menu, select a computer from the Computer Name drop down menu, and click Save Settings. The Application, Computer, and Ports can also be filled in manually if your Application or Computer is not listed in the drop down menus. <br>
                              <strong><em>Name </em></strong> &ndash; The name for the service being provided by the device on your LAN that uses the ports being opened. <br>
                              <strong><em>IP Address </em></strong> &ndash; The server computer on the LAN network that the specified ports will be opened to. <br>
                              <strong><em>Application Name </em></strong> &ndash; This contains a list of pre-defined services. </p>
                              <p><strong><em>Computer Name </em></strong> &ndash; This contains a list of the devices on your network, which have obtained an IP Address from the router. </p>
                              <p><strong><em>Public Port </em></strong> &ndash; The port number that users on the Internet will use to access the defined service. <br>
                                  <strong><em>Private Port </em></strong> &ndash; The port number of the service being hosted by the server computer on the LAN. <br>
                                  <strong>Traffic Type </strong> &ndash; The protocol used by the service the device on your LAN is providing. </p>
                              <p><strong><em>Schedule </em></strong> &ndash; The schedule of time when the Virtual Server Rule will be active. Schedules can be defined on the Tools&gt;Schedules page. </p>
                              <p>&nbsp;</p></td>
                          </tr>
				  </table>
				  </div>
				  				  <div class="box">
				  <h2>Port Forwarding<a name=06 id="06"></a></h2>
				  <table width=511 border=0 cellspacing=0 cellpadding=0>
				                            <tr>
                            <td height=228><p><strong>Port Forwarding </strong><font size=4></font><br>
 Port Forwarding can be used to open a port or range of ports to a device on your network . To use them, click the checkbox to Enable the entry, select a pre-defined service from the Application Name drop down menu, select a computer from the Computer Name drop down menu, and click Save Settings. The Application, Computer, and Ports can also be filled in manually if your Application or Computer is not listed in the drop down menus.<br>
  <strong><em>Name </em></strong> &ndash; The name for the service being provided by the device on your LAN that uses the ports being opened. <br>
  <strong><em>IP Address </em></strong> &ndash; The server computer on the LAN network that the specified ports will be opened to. <br>
  <strong><em>Application Name </em></strong> &ndash; This contains a list of pre-defined services. </p>
                              <p><strong><em>Computer Name </em></strong> &ndash; This contains a list of the devices on your network that have obtained an IP Address from the router. </p>
                              <p><strong><em>Public Port </em></strong> &ndash; The port number that users on the Internet will use to access the defined service. <br>
                                  <strong><em>Private Port </em></strong> &ndash; The port number of the service being hosted by the server computer on the LAN. <br>
                                  <strong>Traffic Type </strong> &ndash; The protocol used by the service the device on your LAN is providing. </p>
                              <p><strong><em>Schedule </em></strong> &ndash; The schedule of time when the Virtual Server Rule will be active. Schedules can be defined on the Tools&gt;Schedules page. </p>
                              <p>&nbsp;</p></td>
                          </tr>
				  
				  </table>
				  </div>
				  				  <div class="box">
				  <h2>Applications<a name=07 id="07"></a></h2>
				  <table width=511 border=0 cellspacing=0 cellpadding=0>
				  <tr>
                            <td height=64> <p><strong>Applications<font size=4></font> </strong><br>
                              Some applications require multiple connections, such as Internet gaming, video conferencing, Internet telephony and others. These applications have difficulties working through NAT (Network Address Translation). If you need to run applications that require multiple connections, specify the port normally associated with an application in the &quot; Trigger Port &quot; field, select the protocol type as TCP (Transmission Control Protocol) or UDP (User Datagram Protocol), then enter the public ports associated with the trigger port in the Firewall Port field to open them for inbound traffic. There are already defined well-known applications in the Application Name drop down menu.<br>
                                <strong><em>Name </em></strong> &ndash; This is the name referencing the application. <br>
                                <strong><em>Trigger Port </em></strong>&ndash; This is the port used to trigger the application. It can be either a single port or a range of ports. <br>
                                <strong><em>Traffic Type </em></strong>&ndash; This is the protocol used to trigger the application.<br>
                                <strong><em>Firewall Port </em></strong> &ndash; This is the port number on the WAN side that will be used to access the application. You may define a single port or a range of ports. You can use a comma to add multiple ports or port ranges. <br>
                                <strong><em>Traffic Type </em></strong> &ndash; This is the protocol used for the application. <br>
                                <strong><em>Schedule </em></strong>&ndash; The schedule of time when the Application Rule will be active. Schedules can be defined on the Tools&gt;Schedules page. </p>
                            <p>&nbsp;</p></td>
                    </tr>
				  </table>
				  </div>				  <div class="box">
				  <h2>Network Filter<a name="08" id="08"></a></h2>
				  <table width=511 border=0 cellspacing=0 cellpadding=0>
				   <tr>
                            <td height=99><p><strong>Network Filter </strong><br>
 Network filter or MAC filters can be used to deny computers within the local area network from accessing the Internet. You can either manually add a MAC address or select the MAC address from the list of clients that are currently connected to the unit. </p>
                              <p>Select &quot;Turn MAC Filtering ON and ALLOW computers with MAC address listed below to access the network&quot; if you only want selected computers to have network access and all other computers not to have network access. <br>
                              Select &quot;Turn MAC Filtering ON and DENY computers with MAC address listed below to access the network&quot; if you want all computers to have network access except those computers in the list. </p>                              
                              <p><strong><em>MAC Address</em></strong>– The MAC address of the network device to be added to the MAC Filter List. <br>
                                <strong><em>DHCP Client List </em></strong>– DHCP clients will have their hostname in the Computer Name drop down menu. You can select the client computer you want to add to the MAC Filter List and click arrow button. This will automatically add that computer's MAC address to the appropriate field. <br>
                              <strong><em>CLEAR</em></strong>– This will remove the MAC Address on the corresponding line from the MAC Filtering table. </p>
                              <p>&nbsp;</p></td>
                    </tr>
				  </table>
				  </div>
				  				  <div class="box">
				  <h2>Website Filter<a name="09" id="09"></a></h2>
				  <table width=511 border=0 cellspacing=0 cellpadding=0>
				  <tr>
                            <td height=44><p><strong>Website Filter <br>
                            </strong> Along with the ability to filter devices from accessing your network and the Internet, the DIR-615 can also be configured to allow or deny access, for the computers on your network, to inappropriate websites either by domain name or by keywords. </p>
                              <p><strong>Website Filtering </strong><br>
 Website Filtering is used to allow or deny computers on your network from accessing specific web sites by keywords or specific Domain Names. Select &iexcl;&sect;Turn Website Filtering ON and ALLOW computers access to ONLY these sites&iexcl;&uml; in order only allow computers on your network to access the specified URLs and Domain Names. &iexcl;&sect;Turn Website Filtering ON and DENY computers access to ONLY these sites&iexcl;&uml; in order deny computers on your network to access the specified URLs and Domain Names. </p>
                              <p><span class="style1">Example 1: </span><br>
  If you wanted to block LAN users from any website containing a URL pertaining to shopping, you would need to select &iexcl;&sect;Turn Website Filtering ON and DENY computers access to ONLY these sites&iexcl;&uml; and then enter &quot;shopping&quot; into the Website Filtering Rules list. Sites like these will be denied access to LAN users because they contain the keyword in the URL. <br>
  <a href="http://www.yahoo.com/shopping/stores.html">http://www.yahoo.com/shopping/stores.html </a><br>
  <a href="http://www.msn.com/search/shopping-spree.html">http://www.msn.com/search/shopping-spree.html </a></p>
                              <p><span class="style1">Example 2: </span> If you want your children to only access particular sites, you would then choose &quot;Turn Website Filtering ON and ALLOW computers access to ONLY these sites&iexcl;&uml; and then enter in the domains you want your children to have access to. </p>
                              <ul>
                                <li>Disney.com </li>
                                <li>Cartoons.com </li>
                                <li>DiscoveryChannel.com</li>
                              </ul></td>
                    </tr>
                          <tr>
                            <td height=20>&nbsp;</td>
                          </tr>
                          <tr>
                            <td height=20><p><strong><em>Schedule</em></strong> &ndash; The schedule of time when the Website Filter Rule will be active.Schedules can be defined on the Tools&gt;Schedules page. </p>
                            <p>&nbsp;</p></td>
                          </tr>
				  </table>
				  </div>				  <div class="box">
				  <h2> Firewall Settings <a name="10" id="10"></a></h2>
				  <table width=511 border=0 cellspacing=0 cellpadding=0>
				  <td height=248>
                              <div align=left>
                                <p><strong>Firewall Settings </strong><br>
  The Firewall Settings section contains the option to configure a DMZ Host as well as PPTP, L2TP, and IPSec passthrough. </p>
                                <p><strong>DMZ </strong><a name="10_1" id="10_1"></a><br>
 If you have a computer that cannot run Internet applications properly from behind the DIR-615, then you can allow the computer to have unrestricted Internet access. Enter the IP address of that computer as a DMZ (Demilitarized Zone) host with unrestricted Internet access. Adding a client to the DMZ may expose that computer to a variety of security risks; so only use this option as a last resort.<br>
  <strong><em>Computer Name </em></strong> &ndash; If you are not sure what the IP address of the device is that you would like to make the DMZ host, you can select a device on your network that has obtained an IP from the router using the Computer Name dropdown menu. <br>
  <strong><em>Schedule </em></strong> &ndash; The schedule of time when the DMZ Host will be active.  Schedules can be defined on the Tools>Schedules page. </p>
                                <p><strong>VPN Passthrough </strong><br>
The device supports VPN (Virtual Private Network) passthrough for PPTP (Point-to-Point Tunneling Protocol), L2TP (Layer 2 Tunneling Protocol), and IPSec (IP Security). Once VPN passthrough is enabled, there is no need to create any Virtual Server or Port Forwarding entries in order for outbound VPN sessions to establish properly. Multiple VPN connections can be made through the device. This is useful when you have many VPN clients on the Local Area Network. </p>
                                <p>&nbsp;</p>
                              </div></td>
				  </table>
				  </div>
				  				  <div class="box">
				  <h2>Advanced Wireless <a name=11></a></h2>
				  <table width=511 border=0 cellspacing=0 cellpadding=0>
				                            <tr>
                            <td height=20><p><strong>Advanced Wireless </strong></p>
                              <p>The options on this page should be changed by advanced users or if you are instructed to by one of our support personnel, as they can negatively affect the performance of your router if configured improperly. </p>
                              <p><br>
                                  <strong><em>802.11b/g/n fixed Tx rate &ndash;</em></strong>If you would like to define the Tx rate for each wireless standard, select Fixed and then choose the Tx rate using the dropdown menus.By default this option is set to Auto. </p>
                              <p><strong><em>Beacon Interval &ndash;</em></strong> Beacons are packets sent by an Access Point to synchronize a wireless network. Specify a Beacon interval value between 20 and 1000. The default value is set to 100 milliseconds.</p>
                              <p><strong><em>RTS Threshold &ndash;</em></strong> This value should remain at its default setting of 2346. If you encounter inconsistent data flow, only minor modifications to the value range between 1 and 2346 are recommended. The default value for RTS Threshold is set to 2346.</p>
                              <p><strong><em>DTIM Interval &ndash;</em></strong> Enter a value between 1 and 5 for the Delivery Traffic Indication Message (DTIM). A DTIM is a countdown informing clients of the next window for listening to broadcast and multicast messages. When the Access Point has buffered broadcast or multicast messages for associated clients, it sends the next DTIM with a DTIM Interval value. AP clients hear the beacons and awaken to receive the broadcast and multicast messages. The default value for DTIM interval is set to 1.</p>
                              <p><strong><em>Preamble Type &ndash;</em></strong> The Preamble Type defines the length of the CRC (Cyclic Redundancy Check) block for communication between the Access Point and roaming wireless adapters. Make sure to select the appropriate preamble type and click the Save Settings button.</p>
                              <p><strong><em>Extra Wireless Protection &ndash;</em></strong>Extra protection for neighboring 11b wireless networks. Turn this option off to reduce the adverse effect of legacy wireless networks on 802.11ng performance.This option is available only when <b>802.11 Mode</b> is set to <b>802.11ng only</b>.(Refer to the <a href="wireless.asp">Setup &rarr; Wireless Settings &rarr; Manual Wireless Network Setup</a> page.)</p>
                              <p><strong>Note: </strong>High network traffic areas should use Short Preamble. CRC is a common technique for detecting data transmission errors. </p>
                              <p>&nbsp;</p></td>
                          </tr>
				  </table>
				  </div>				  <div class="box">
				  <h2>Advanced Network <a name="12" id="12"></a></h2>
				  <table width=511 border=0 cellspacing=0 cellpadding=0>
				                      <tr>
                            <td height=20><p><strong>Advanced Network </strong></p>
                              <p> This section contains settings that can change the way the router handles certain types of traffic. We recommend that you not change any of these settings unless you are already familiar with them or have been instructed to change them by one of our support personnel. </p>
                              <p><strong>UPnP </strong><br>
UPnP is short for Universal Plug and Play, which is a networking architecture that provides compatibility among networking equipment, software, and peripherals. The DIR-615 is an UPnP enabled router, meaning it will work with other UPnP devices/software. If you do not want to use the UPnP functionality, it can be disabled by unchecking the option. </p>
                              <p><strong>WAN Ping </strong><br>
                              When you Enable WAN Ping respond, you are causing the public WAN (Wide Area Network) IP address on the device to respond to ping commands sent by Internet users. Pinging public WAN IP addresses is a common method used by hackers to test whether your WAN IP address is valid. </p>
                              When not playing games or using these voice applications, it is recommended that Gaming Mode is disabled.
<p><strong>WAN Port Speed </strong><br>
 This allows you to select the speed of the WAN interface of the DIR-615: Choose 100Mbps, 10Mbps, or 10/100Mbps Auto.</p>
                              <p><strong>Multicast Streams</strong><br>
Enable this option to allow Multicast traffic to pass from the Internet to your network more efficiently. </p>                              </td>
                          </tr>
				  </table>
				  </div>				  				 
				  
					<!-- === END MAINCONTENT === -->
                </div></td>
                </td>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table cellpadding="2" cellspacing="0" border="0" bgcolor="#FFFFFF">
					<tr>
					  <td id="help_text">							<br>					  </td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table id="footer_container" border="0" cellpadding="0" cellspacing="0" width="838" align="center">
		<tr>
			<td width="125" align="center">&nbsp;&nbsp;<img src="wireless_bottom.gif" width="114" height="35"></td>
			<td width="10">&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table>
<br>
<div align="center">Copyright &copy; 2004-2005 D-Link Systems, Inc.</div>
<br>
</body>
</html>
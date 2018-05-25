<html>
<head>

<link rel="STYLESHEET" type="text/css" href="css_router.css">
<script language="JavaScript" src="public.js"></script>

<title>D-LINK SYSTEMS, INC | WIRELESS ROUTER | HOME</title>

</head>

<body topmargin="1" leftmargin="0" rightmargin="0" bgcolor="#757575">
	<table id="header_container" border="0" cellpadding="5" cellspacing="0" width="838" align="center">
      <tr>
        <td width="100%">Product Page: <a href="http://support.dlink.com/">DIR-615</a></td>
        <td align="right" nowrap>Hardware Version: A1 &nbsp;</td>
        <td align="right" nowrap>Firmware Version: 2.00&nbsp;</td>
      </tr>
    </table>
	<table id="topnav_container" border="0" cellpadding="0" cellspacing="0" width="838" align="center">
		<tr>
			<td align="center" valign="middle"><img src="wlan_masthead.gif" width="836" height="92"></td>
		</tr>
	</table>
	<table border="0" cellpadding="2" cellspacing="1" width="838" align="center" bgcolor="#FFFFFF">
		<tr id="topnav_container">
			<td height="29"><img src="short_modnum.gif" width="125" height="25"></td>
			<td id="topnavoff"><a href="index.asp">Setup</a></td>
			<td id="topnavon"><a href="adv_virtual.asp">Advanced</a></td>
			<td id="topnavoff"><a href="tools_admin.asp">Tools</a></td>
			<td id="topnavoff"><a href="st_device.asp">Status</a></td>
			<td id="topnavoff"><a href="support_men.asp">Support</a></td>
		</tr>
	</table>
	<table border="1" cellpadding="2" cellspacing="0" width="838" height="100%" align="center" bgcolor="#FFFFFF" bordercolordark="#FFFFFF">
		<tr>
			<td id="sidenav_container" valign="top" width="125" align="right">
				<table cellSpacing=0 cellPadding=0 border=0>
                  <tbody>
                    <tr>
                      <td id=sidenav_container>
                        <div id=sidenav>
                          <!-- === BEGIN SIDENAV === -->
                          <UL>
                            <LI>
                              <div><a href="adv_virtual.asp">Port Forwarding</a></div>
                            <LI>
                              <div><a href="adv_appl.asp">Application Rules</a></div>
                            <LI>
                              <div><a href="adv_filters_mac.asp">Network Filter</a></div>
<LI>
							 <div id=sidenavoff>Access control</div>
                            <LI>
                              <div><a href="adv_filters_url.asp">Website Filter</a></div>
                            <LI>
                              <div><a href="adv_dmz.asp">Firewall Settings</a></div>
                            <LI>
                              <div><a href="adv_wlan_perform.asp">advanced Wireless</a></div>
                            <LI>
                              <div><a href="adv_network.asp">advanced Network</a></div>
                            </LI>
                          </UL>
                          <!-- === END SIDENAV === -->
                      </div></td>
                    </tr>
                  </tbody>
                </table></td>
<form id="form1" name="form1" method="post" action="adv_perform.cgi">
			<td valign="top" id="maincontent_container">
				<div id=maincontent>
				  <!-- === BEGIN MAINCONTENT === -->
                  
          <div id=box_header> 
            <h1>Access Control</h1>
            The Access Control option allows you to control access in and out 
            of your network. Use this feature as Access Controls to only grant 
            access to approved sites, limit web access based on time or dates, 
            and/or block internet access for applications like P2P utilities or 
            games.<br>
            <br>
                    <input name="button" type=button class=button_submit value="Save Settings" onClick="send_request()">
                    <input name="button2" type=reset class=button_submit value="Don't Save Settings"  onClick="window.location.href='enable.asp'">
                  </div>
                  <div class=box>
                    <h2>Enable</h2>
                    
            <table width="525" class=formarea summary="">
              <tbody>
                <tr> 
                  <td width="135" class=form_label>Enable Access Control&nbsp;:</td>
                  <td width="378"><input name="access_control" id="access_control"type=checkbox></td>
                </tr>
              </tbody>
            </table>
          </div>
		  <strong> 
          <!-- === END MAINCONTENT === -->
          </strong> </div></td></form>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table borderColor=#ffffff cellSpacing=0 borderColorDark=#ffffff 
      cellPadding=2 bgColor=#ffffff borderColorLight=#ffffff border=0>
                  <tbody>
                    <tr>
                      <td id=help_text><b>Helpful Hints.</b><br>
                          <br>                          
                          <strong><em>Transmission (TX) Rates &ndash;</em></strong> Select the basic transfer rates based on the speed of wireless adapters on the WLAN (wireless local area network).<br>
                          <strong><em>Transmit Power &ndash;</em></strong> You can lower the output power of the WBR-2310 by selecting lower percentage Transmit Power values from the drop down.Your choices are; 100%, 50%, 25%, and 12.5%.<br>
						  <strong><em>Beacon Interval &ndash;</em></strong> Beacons are packets sent by an Access Point to synchronize a wireless network. Specify a Beacon interval value between 20 and 1000. The default value is set to 100 milliseconds.<br>
						  <strong><em>RTS Threshold &ndash;</em></strong> This value should remain at its default setting of 2346. If you encounter inconsistent data flow, only minor modifications to the value range between 1 and 2346 are recommended. The default value for RTS Threshold is set to 2346.<br>
						  <strong><em>Fragmentation &ndash;</em></strong> This value should remain at its default setting of 2346. If you experience a high packet error rate, you may slightly increase your "Fragmentation" value within the value range of 256 to 2346. Setting the Fragmentation value too low may result in poor performance.<br>
						  <strong><em>DTIM Interval &ndash;</em></strong> Enter a value between 1 and 255 for the Delivery Traffic Indication Message (DTIM). A DTIM is a countdown informing clients of the next window for listening to broadcast and multicast messages. When the Access Point has buffered broadcast or multicast messages for associated clients, it sends the next DTIM with a DTIM Interval value. AP clients hear the beacons and awaken to receive the broadcast and multicast messages. The default value for DTIM interval is set to 1.<br>
				    	  <strong><em>Preamble Type &ndash;</em></strong> The Preamble Type defines the length of the CRC (Cyclic Redundancy Check) block for communication between the Access Point and roaming wireless adapters. Make sure to select the appropriate preamble type and click the Apply button.<br>
						  <strong><em><FONT color="#FF0000" >Note:</FONT></em></strong> High network traffic areas should use the shorter preamble type. CRC is a common technique for detecting data transmission errors.
						  <strong><em>CTS Mode &ndash;</em></strong> Select None to disable this feature.Select Always to force the router to require each wireless device on the network to perform and RTS/CTS handshake before they are allowed to transmit data.Select Always to allow the router to decide when RTS/CTS handshakes are necessary.<br>
						  <strong><em>WMM &ndash;</em></strong> Select Enable to turn on QoS for the wireless interface of the WBR-2310.

					  </td>
                    </tr>
                  </tbody>
                </table></td>
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
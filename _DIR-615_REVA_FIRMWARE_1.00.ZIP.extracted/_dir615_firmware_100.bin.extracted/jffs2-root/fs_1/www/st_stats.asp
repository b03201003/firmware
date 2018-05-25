
<html>
<head>
<link rel="STYLESHEET" type="text/css" href="css_router.css">

<title>D-LINK SYSTEMS, INC | WIRELESS ROUTER | HOME</title>
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.style4 {
	font-size: 11px;
	font-weight: bold;
}
.style5 {font-size: 11px}
-->
</style>
<script language="JavaScript" src="public.js"></script>
<script language="JavaScript">

function reset_packets(){
	send_submit("form2");
}

</script>
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
			<td id="topnavon"><a href="st_device.asp">Status</a></td>
			<td id="topnavoff"><a href="support_men.asp">Support</a></td>
		</tr>
	</table>
	<table border="1" cellpadding="2" cellspacing="0" width="838" height="100%" align="center" bgcolor="#FFFFFF" bordercolordark="#FFFFFF">
		<tr>
			<td id="sidenav_container" valign="top" width="125" align="right">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td id="sidenav_container">
							<div id="sidenav">
							<!-- === BEGIN SIDENAV === -->
								<ul>
									<li><div><a href="st_device.asp">Device Info</a></div></li>
									<li><div><a href="st_log.asp">Log</a></div></li>
									<li><div id="sidenavoff">Stats</div></li>
									<li><div><a href="st_wireless.asp">Wireless</a></div></li>
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
						<h1>Traffic Statistics</h1>
						<h4>Network Traffic Stats</h4>
						<p>Traffic Statistics display Receive and Transmit packets passing through your router.</p>
						<input name=refresh type=button id="refresh" onClick="window.location.href='st_stats.asp'" value="Refresh Statistics">
                        <input name=reset type=button id="reset" value="Clear Statistics" onClick="reset_packets()">				  
					</div>
					<div class="box"> 
						<h2>&nbsp;</h2>
<form id="form1" name="form1" method="post" action="apply.cgi">
<input type="hidden" name="html_response_page" value="back.asp">
<input type="hidden" name="html_response_message" value="The setting is saved.">
<input type="hidden" name="html_response_return_page" value="st_stats.asp">
							<table width="525" border="0" cellpadding="1" cellspacing="1">
                            </table>
                    		<table borderColor=#ffffff cellSpacing=1 cellPadding=2 width=525 bgColor=#dfdfdf border=1>
                              <tr id="box_header">
                                <td width=111 height=2>&nbsp;</td>
                                <td width=220 height=2><strong> Receive</strong></td>
                                <td width=183 height=2><strong>Transmit</strong></td>
                              </tr>
                              <tr>
                                <td width=111 height=20><strong>WAN</strong></td>
                                <td width=220 height=20>                                <% CmoGetStatus("wan_rx_packets"); %>
      Packets</td>
                                <td width=183 height=20>                                <% CmoGetStatus("wan_tx_packets"); %>
      Packets</td>
                              </tr>
                              <tr>
                                <td width=111 height=20><strong>LAN</strong></td>
                                <td width=220 height=20>                                <% CmoGetStatus("lan_rx_packets"); %>
      Packets</td>
                                <td width=183 height=20>                                <% CmoGetStatus("lan_tx_packets"); %>
      Packets</td>
                              </tr>
                              <tr>
                                <td width=111 height=20><strong>WIRELESS </strong></td>
                                <td width=220 height=20>                                <% CmoGetStatus("wlan_rx_packets"); %>
      Packets</td>
                                <td width=183 height=20>                                <% CmoGetStatus("wlan_tx_packets"); %>
      Packets</td>
                              </tr>
                            </table>
</form>
<form id="form2" name="form2" method="post" action="reset_packet_counter.cgi">
<input type="hidden" name="html_response_page" value="st_stats.asp">
<input type="hidden" name="html_response_return_page" value="st_stats.asp">
</form>
					</div>
					<!-- === END MAINCONTENT === -->
                </div></td>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table cellpadding="2" cellspacing="0" border="0" bgcolor="#FFFFFF">
					<tr>
					  <td id="help_text">
						<p>&nbsp;</p>
			          </td>
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
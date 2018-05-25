
<html>
<head>

<link rel="STYLESHEET" type="text/css" href="css_router.css">
<script language="JavaScript" src="public.js"></script>
<title>D-LINK SYSTEMS, INC | WIRELESS ROUTER | HOME</title>
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.style4 {
	font-size: 11px;
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
									<li><div><a href="st_stats.asp">Stats</a></div></li>
									<li><div id="sidenavoff">Wireless</div></li>
								</ul>
								<!-- === END SIDENAV === -->
							</div>
						</td>			
					</tr>
                <td>
                 <!-- repeat name="extTab" -->
                </td>
				</table>			
			</td>
			<form id="form1" name="form1" method="post" action=apply.cgi>
<input type="hidden" name="html_response_page" value="st_wireless.asp">
<input type="hidden" name="html_response_message" value="The setting is saved.">
<input type="hidden" name="html_response_return_page" value="st_wireles.asp">

<input type="hidden" id="wireless_station_list" name="wireless_station_list" value="<% CmoGetList("wireless_station_list"); %>">
			<td valign="top" id="maincontent_container">
				<div id="maincontent">
					<!-- === BEGIN MAINCONTENT === -->
					<div id="box_header"> 
						<h1>Connected Wireless Client List</h1>
						<h4>Associated Wireless Client List</h4>
						<p>The Wireless Client table below displays Wireless clients Connected to the AP (Access Point).</p>
					</div>
					<div class="box"> 
						<h2>&nbsp;</h2>
							<table borderColor=#ffffff cellSpacing=1 cellPadding=2 width=525 bgColor=#dfdfdf border=1>
                              <tr id="box_header">
                                <!--<td width=134 height=2><strong>Connected Time</strong></td>
                                <td width=188 height=2><strong> MAC Address</strong></td>
                                <td width=179 height=2><strong>Mode</strong></td>-->
								<td width=10 height=2><strong></strong></td>
                                <td width=188 height=2><strong> MAC Address</strong></td>
                                <td width=10 height=2><strong></strong></td>
                              </tr>
                              <script>
                              	//name/mac_addr
							  	if(get_by_id("wireless_station_list").value !=""){
								var temp_station_list = get_by_id("wireless_station_list").value.split(",");
	
								for (var i = 0; i < temp_station_list.length - 1; i++){	
									var temp_data = temp_station_list[i].split("/");
									if(temp_data.length != 0){
									temp_data[0]="";
									document.write("<tr border=1 borderColor=\"#ffffff\" bgcolor=\"#dfdfdf\"><td border=1 borderColor=\"#ffffff\"><font size=\"2\" face=\"Tahoma\">"+ temp_data[0] +"</font></td><td border=1 borderColor=\"#ffffff\"><font size=\"2\" face=\"Tahoma\">"+ temp_data[1] +"</font></tr>");	
									}	
								}
							}	
							  
							  </script>
                            </table>
					</div>
					<!-- === END MAINCONTENT === -->
                </div></td></form>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table cellpadding="2" cellspacing="0" border="0" bgcolor="#FFFFFF">
					<tr>
					  <td id="help_text">
						<p>&nbsp;</p></td>
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

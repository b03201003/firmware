<html>
<head>

<link rel="STYLESHEET" type="text/css" href="css_router.css">
<script language="JavaScript" src="public.js"></script>
<script>
function dhcp_renew(){
	var login_who="<% CmoGetStatus("get_current_user"); %>";
	if(login_who== "user"){
		window.location.href ="back.asp";
	}else{
		send_submit("form2");
	}
}

function dhcp_release(){
	var login_who="<% CmoGetStatus("get_current_user"); %>";
	if(login_who== "user"){
		window.location.href ="back.asp";
	}else{
		send_submit("form3");
	}
}

function pppoe_connect(){
	var login_who="<% CmoGetStatus("get_current_user"); %>";
	if(login_who== "user"){
		window.location.href ="back.asp";
	}else{
		send_submit("form4");
	}
}

function pppoe_disconnect(){
	var login_who="<% CmoGetStatus("get_current_user"); %>";
	if(login_who== "user"){
		window.location.href ="back.asp";
	}else{
		send_submit("form5");
	}
}

function pptp_connect(){
	var login_who="<% CmoGetStatus("get_current_user"); %>";
	if(login_who== "user"){
		window.location.href ="back.asp";
	}else{
		send_submit("form6");
	}
}

function pptp_disconnect(){
	var login_who="<% CmoGetStatus("get_current_user"); %>";
	if(login_who== "user"){
		window.location.href ="back.asp";
	}else{
		send_submit("form7");
	}
}

function l2tp_connect(){
	var login_who="<% CmoGetStatus("get_current_user"); %>";
	if(login_who== "user"){
		window.location.href ="back.asp";
	}else{
		send_submit("form8");
	}
}

function l2tp_disconnect(){
	var login_who="<% CmoGetStatus("get_current_user"); %>";
	if(login_who== "user"){
		window.location.href ="back.asp";
	}else{
		send_submit("form9");
	}
}

function bigpond_connect(){
	var login_who="<% CmoGetStatus("get_current_user"); %>";
	if(login_who== "user"){
		window.location.href ="back.asp";
	}else{
		send_submit("form10");
	}
}

function bigpond_disconnect(){
	var login_who="<% CmoGetStatus("get_current_user"); %>";
	if(login_who== "user"){
		window.location.href ="back.asp";
	}else{
		send_submit("form11");
	}
}



</script>
<title>D-LINK SYSTEMS, INC | WIRELESS ROUTER | HOME</title>
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.style3 {font-size: 12px}
.style4 {
	font-size: 11px;
	font-weight: bold;
}
.style5 {font-size: 11px}
-->
</style>
</head>
<form id="form1" name="form1" method="post" action="st_device.cgi">
<input type="hidden" name="html_response_page" value="back.asp">
<input type="hidden" name="html_response_message" value="The setting is saved.">
<input type="hidden" name="html_response_return_page" value="st_device.asp">

<input type="hidden" id="wan_current_ipaddr" name="wan_current_ipaddr" value="<% CmoGetStatus("wan_current_ipaddr_00"); %>">
<input type="hidden" id="wan_proto" name="wan_proto" value="<% CmoGetCfg("wan_proto","none"); %>">
<input type="hidden" id="wan_pppoe_dynamic_00" name="wan_pppoe_dynamic_00" value="<% CmoGetCfg("wan_pppoe_dynamic_00","none"); %>">
<input type="hidden" id="wan_pptp_dynamic" name="wan_pptp_dynamic" value="<% CmoGetCfg("wan_pptp_dynamic","none"); %>">
<input type="hidden" id="wan_l2tp_dynamic" name="wan_l2tp_dynamic" value="<% CmoGetCfg("wan_l2tp_dynamic","none"); %>">
<input type="hidden" id="dhcpd_enable" name="dhcpd_enable" value="<% CmoGetCfg("dhcpd_enable","none"); %>">

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
									<li><div id="sidenavoff">Device Info</div></li>
									<li><div><a href="st_log.asp">Log</a></div>
									</li>
									<li><div><a href="st_stats.asp">Stats</a></div>
									</li>
									<li><div><a href="st_wireless.asp">Wireless</a></div>
									</li>
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
						<h1>Device InfoRMATION</h1>
						
				    <p>All of your Internet and network connection details are displayed on this page. The firmware version is also displayed here.
				    </p>
				    
				    <p align="center"><strong>				          Firmware Version: 
						<% CmoGetStatus("version"); %>
                      , 
           	        <% CmoGetStatus("version_date"); %>
			          </strong></p>
				  </div>
					<div class="box"> 
						<h2>lan</h2>
							<table cellpadding="1" cellspacing="1" border="0" width="525">
								<tr>
                                  <td class="form_label">MAC Address :</td>
                                  <td>&nbsp;
								  <% CmoGetCfg("lan_mac","none"); %>
								  </td>
							  </tr>
								<tr>
                                  <td class="form_label">IP Address :</td>
                                  <td>&nbsp;
								  <% CmoGetCfg("lan_ipaddr","none"); %>
								  </td>
							  </tr>
								<tr>
                                  <td class="form_label">Subnt Mask :</td>
                                  <td>&nbsp;
								  <% CmoGetCfg("lan_netmask","none"); %>
								  </td>
							  </tr>
								<tr>
                                  <td class="form_label">DHCP Server :</td>
                                  <td>&nbsp;
								  <script>
								  		if(get_by_id("dhcpd_enable").value == "1"){
											document.write("Enabled");
										}else{
											document.write("Disabled");
										}
										
								  </script>
								  <!-- insert name=dhcp_enable -->
								  </td>
							  </tr>
							</table>
					</div>
					<div class="box"> 
						<h2>Wan</h2>
							<table cellpadding="1" cellspacing="1" border="0" width="525">
								<tr>
                                  <td class="form_label">MAC Address :</td>
                                  <td width=320>&nbsp;
                                   <% CmoGetCfg("wan_mac","none"); %>
								   </td>
							  </tr>
								<tr>
                                  <td class="form_label">Connection :</td>
                                  <td>&nbsp; 
								  <!-- insert name=wan_status -->
								  <script>
								  		var ifname ="";
										
								  		if(get_by_id("wan_proto").value == "static"){
											document.write("fixed IP");
										}else if(get_by_id("wan_proto").value == "dhcpc"){
											con_status = "<% CmoGetStatus("dhcpc_connection_status"); %>";
											document.write("DHCP Client " + con_status + " <input type=\"button\" value=\"DHCP Release\" name=\"release\" onClick=\"dhcp_release()\">&nbsp;<input type=\"button\" value=\"DHCP Renew\" name=\"renew\" onClick=\"dhcp_renew()\">");
										
										}else if(get_by_id("wan_proto").value == "pppoe"){
											ifname = "PPPoE";
											con_status = "<% CmoGetStatus("pppoe_00_connection_status"); %>";
											if(get_by_id("wan_pppoe_dynamic_00").value == "0"){
												document.write(ifname +" Fixed IP " + con_status + " <input type=button name=\"connect\" value=\"Connect\" onClick=\"pppoe_connect()\">&nbsp;<input type=button name=\"disconnect\" value=\"Disconnect\" onClick=\"pppoe_disconnect()\">");
											}else{
												document.write(ifname + " " + con_status + " <input type=button name=\"connect\" value=\"Connect\" onClick=\"pppoe_connect()\">&nbsp;<input type=button name=\"disconnect\" value=\"Disconnect\" onClick=\"pppoe_disconnect()\">");
											}
										}else if(get_by_id("wan_proto").value == "pptp"){
											ifname = "PPTP";
											con_status = "<% CmoGetStatus("pptp_connection_status"); %>";
											if(get_by_id("wan_pptp_dynamic").value == "0"){
												document.write(ifname + " Fixed IP " + con_status + " <input type=button name=\"pptpconnect\" value=\"Connect\" onClick=\"pptp_connect()\">&nbsp;<input type=button name=\"pptpdisconnect\" value=\"Disconnect\" onClick=\"pptp_disconnect()\">");
											}else{
												document.write(ifname + " " + con_status + " <input type=button name=\"pptpconnect\" value=\"Connect\" onClick=\"pptp_connect()\">&nbsp;<input type=button name=\"pptpdisconnect\" value=\"Disconnect\" onClick=\"pptp_disconnect()\">");
											}
										}else if(get_by_id("wan_proto").value == "l2tp"){
											ifname = "L2TP";
											con_status = "<% CmoGetStatus("l2tp_connection_status"); %>";
											if(get_by_id("wan_l2tp_dynamic").value == "0"){
												document.write(ifname + " Fixed IP " + con_status + " <input type=button name=\"l2tpconnect\" value=\"Connect\" onClick=\"l2tp_connect()\">&nbsp;<input type=button name=\"l2tpdisconnect\" value=\"Disconnect\" onClick=\"l2tp_disconnect()\">");
											}else{
												document.write(ifname + " " + con_status + " <input type=button name=\"l2tpconnect\" value=\"Connect\" onClick=\"l2tp_connect()\">&nbsp;<input type=button name=\"l2tpdisconnect\" value=\"Disconnect\" onClick=\"l2tp_disconnect()\">");
											}
										}else if(get_by_id("wan_proto").value == "bigpond"){
											ifname = "Bigpond";
											con_status = "<% CmoGetStatus("bigpond_connection_status"); %>";
											document.write(ifname + " Client " + con_status + " <input type=\"button\" value=\"Bigpond Login\" name=\"bpalogin\" onClick=\"bigpond_connect()\">&nbsp;<input type=\"button\" value=\"Bigpond Logout\" name=\"bpalogout\" onClick=\"bigpond_disconnect()\">");
											
											
										}else{
											alert("connect type none");
										}
								  
								  
								  </script>  
								  </td>
							  </tr>
								<tr>
                                  <td class="form_label">IP Address :</td>
                                  <td>&nbsp; 
								  <script>
								  	var dat= get_by_id("wan_current_ipaddr").value.split("/");
									document.write(dat[0]);
								  </script>
								  </td>
							  </tr>
								<tr>
                                  <td class="form_label">Subnt Mask :</td>
                                  <td>&nbsp;  
								  <script>
								  	var dat= get_by_id("wan_current_ipaddr").value.split("/");
									document.write(dat[1]);
								  </script>
								  </td>
							  </tr>
								<tr>
                                  <td class="form_label">Default Gateway :</td>
                                  <td>&nbsp;
								  <script>
								  	var dat= get_by_id("wan_current_ipaddr").value.split("/");
									document.write(dat[2]);
								  </script>
								  </td>
							  </tr>
								<tr>
                                  <td class="form_label">DNS :</td>
                                  <td>&nbsp; 
								  <script>
								  	var dat= get_by_id("wan_current_ipaddr").value.split("/");
									if(dat[3] !="" && dat[3] !="0.0.0.0"&& dat[4] !="" && dat[4] !="0.0.0.0"){
										document.write(dat[3] + "," + dat[4]);
									}else if((dat[3] !="" && dat[3] !="0.0.0.0")&& (dat[4] =="" || dat[4] =="0.0.0.0")){
										document.write(dat[3]);
									}else if((dat[3] =="" || dat[3] =="0.0.0.0") && (dat[4] !="" && dat[4] !="0.0.0.0")){
										document.write(dat[4]);
									}else if((dat[3] =="" || dat[3] =="0.0.0.0")&& (dat[4] =="" || dat[4] =="0.0.0.0")){
										
									}else{
										alert("dns error");
									}
									
									
								  </script>
								  </td>
							  </tr>
							</table>
					</div>
					<!--
					<div class="box"> 
						<h2><span class="style3"><font face=Arial>Wireless JumpStart : </font></span></h2>
						<table cellpadding="1" cellspacing="1" border="0" width="525">
								<tr>
                                  <td width="197" align="right">Jump Start :</td>
                                  <td width=321>&nbsp;</td>
						  </tr>
								<tr>
                                  <td align="right">Status :</td>
                                  <td>&nbsp;</td>
						  </tr>
					  </table>
				  </div>
				  -->
					<div class="box"> 
						<h2>WIRELESS</h2>
						<table cellpadding="1" cellspacing="1" border="0" width="525">
								<tr>
									<td class="form_label">SSID :</td>
									<td>&nbsp;
									<script>
										document.write(hex_to_a("<% CmoGetCfg("wlan0_ssid","none"); %>"));
									</script>
									</td>
								</tr>
								<tr>
									<td class="form_label">Channel :</td>
									<td>&nbsp;
									<% CmoGetStatus("current_channel"); %>
									</td>
								</tr>
								<tr>
									<td class="form_label">Encryption :</td>
								  <td>&nbsp;
								  <% CmoGetCfg("wlan0_security","none"); %>
								  </td>
								</tr>
					  </table>
				  </div>
					<!-- === END MAINCONTENT === -->
				</div>				
			</td>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table cellpadding="2" cellspacing="0" border="0" bgcolor="#FFFFFF">
					<tr>
					  <td id="help_text">
						<p>&nbsp;</p>					  </td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table id="footer_container" border="0" cellpadding="0" cellspacing="0" width="838" align="center">
		<tr>
			<td width="125" align="center">&nbsp;&nbsp;<img src="wireless_bottom.gif" width="114" height="35"></td>
			<td width="10">&nbsp;</td><td>&nbsp;</td>
		</tr>
	</table></form>
<form id="form2" name="form2" method="post" action="dhcp_renew.cgi"><input type="hidden" name="html_response_page" value="st_device.asp"><input type="hidden" name="html_response_return_page" value="st_device.asp"></form>
<form id="form3" name="form3" method="post" action="dhcp_release.cgi"><input type="hidden" name="html_response_page" value="st_device.asp"><input type="hidden" name="html_response_return_page" value="st_device.asp"></form>
<form id="form4" name="form4" method="post" action="pppoe_00_connect.cgi"><input type="hidden" name="html_response_page" value="st_device.asp"><input type="hidden" name="html_response_return_page" value="st_device.asp"></form>
<form id="form5" name="form5" method="post" action="pppoe_00_disconnect.cgi"><input type="hidden" name="html_response_page" value="st_device.asp"><input type="hidden" name="html_response_return_page" value="st_device.asp"></form>
<form id="form6" name="form6" method="post" action="pptp_connect.cgi"><input type="hidden" name="html_response_page" value="st_device.asp"><input type="hidden" name="html_response_return_page" value="st_device.asp"></form>
<form id="form7" name="form7" method="post" action="pptp_disconnect.cgi"><input type="hidden" name="html_response_page" value="st_device.asp"><input type="hidden" name="html_response_return_page" value="st_device.asp"></form>
<form id="form8" name="form8" method="post" action="l2tp_connect.cgi"><input type="hidden" name="html_response_page" value="st_device.asp"><input type="hidden" name="html_response_return_page" value="st_device.asp"></form>
<form id="form9" name="form9" method="post" action="l2tp_disconnect.cgi"><input type="hidden" name="html_response_page" value="st_device.asp"><input type="hidden" name="html_response_return_page" value="st_device.asp"></form>
<form id="form10" name="form10" method="post" action="bigpond_connect.cgi"><input type="hidden" name="html_response_page" value="st_device.asp"><input type="hidden" name="html_response_return_page" value="st_device.asp"></form>
<form id="form11" name="form11" method="post" action="bigpond_disconnect.cgi"><input type="hidden" name="html_response_page" value="st_device.asp"><input type="hidden" name="html_response_return_page" value="st_device.asp"></form>

<br>
<div align="center">Copyright &copy; 2004-2005 D-Link Systems, Inc.</div>
<br>
</body>
</html>
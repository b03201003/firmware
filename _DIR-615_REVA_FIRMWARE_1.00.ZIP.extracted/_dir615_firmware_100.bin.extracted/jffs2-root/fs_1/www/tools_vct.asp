
<html>
<head>
<link rel="STYLESHEET" type="text/css" href="css_router.css">
<title>D-LINK SYSTEMS, INC | WIRELESS ROUTER | HOME</title>
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<script language="Javascript" src="public.js"></script>
<script language=JavaScript>
function MoreInfo(name){
	window.open(name,"More","width=450,height=320")
}

function check_ip(){
		if (get_by_id("ping_ipaddr").value == ""){
			alert(msg[PING_IP_ERROR]);
			return false;
		}else{
		return true;
			send_submit("form5");
		}
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
			<td id="topnavon"><a href="tools_admin.asp">Tools</a></td>
			<td id="topnavoff"><a href="st_device.asp">Status</a></td>
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
									<li><div><a href="tools_admin.asp">Admin</a></div></li>
									<li><div><a href="tools_time.asp">Time</a></div></li>
									<li><div><a href="tools_system.asp">System</a></div></li>
									<li><div><a href="tools_firmw.asp">Firmware</a></div></li>
									<li><div><a href="tools_ddns.asp">DDNS</a></div></li>
									<li><div id="sidenavoff">SYSTEM CHECK</div></li>
<li><div><a href="tools_schedules.asp">SCHEDULES</a></div></li>
<li><div><a href="st_log_settings.asp">Log settings</a></div></li>
								</ul>
								<!-- === END SIDENAV === -->
							</div>
						</td>			
					</tr>
				</table>			
			</td>
			<td valign="top" id="maincontent_container">			  <div id="maincontent">
					<!-- === BEGIN MAINCONTENT === -->
				  <div id="box_header"> 
						<h1>Fast Ethernet Virtual 
Cable Tester (VCT)</h1>
						Cable Test is an advanced feature that integrates a LAN cable tester on every Ethernet port on the router.<br>				 
				  </div>
					<div class="box"> 
						<h2>VCT INFO</h2>
							<table borderColor=#ffffff cellSpacing=1 cellPadding=2 bgColor=#dfdfdf border=1>
                             <form id="form1" name="form1" method="post" action="apply.cgi">
						<input type="hidden" name="html_response_page" value="back.asp">
	   					<input type="hidden" name="html_response_message" value="The setting is saved.">
	   					<input type="hidden" name="html_response_return_page" value="tools_vct.asp">
							  <tr id="box_header">
                                <td width=64 height=25><div align="center"><strong>Ports</strong></div></td>
                                <td width=220 height=25><div align="center"><strong>Link Status</strong></div></td>
                                <td width=217 height=25><div align="center">&nbsp;</div></td>
                                <td width=109 height=25><div align="center">&nbsp;</div></td>
                              </tr>
                              <tr>
                                <td width="64" height="20">
								
                                <div align="center"><b>WAN</b></div></td>
                                <td width="220" height=20>&nbsp;
								<input type="hidden" id="wan_link" name="wan_link" value="<%  CmoGetStatus("wan_port_status"); %>">
								<!-- insert name=link_stat_wan -->
								<script>
									if(get_by_id("wan_link").value == "connect"){
										document.write("<img src=W_link.gif width=200 height=20 border=0>");
									}else{
										document.write("<img src=W_nolink.gif width=200 height=20 border=0>");
									}
								</script>
								</td>
                                <td height="20">&nbsp;
								<input type="hidden" id="wan_port_speed_duplex" name="wan_port_speed_duplex" value="<%  CmoGetStatus("wan_port_speed_duplex"); %>">
								<script>
									var temp_data = get_by_id("wan_port_speed_duplex").value;
									var data = temp_data.split("|");
									if(get_by_id("wan_link").value == "connect"){
										document.write("<font face=\"Tahoma\" size=\"2\" color=\"#000000\"><strong>"+ data[0] +"Mbps "+ data[1] +" Duplex</strong></font>");
									}else{
										document.write("<font face=\"Tahoma\" size=\"2\" color=\"#000000\">Disconnected</font>");
									}
								
								</script>
								<!-- insert name=link_stat_txt_wan --></td>
                                <td width="17%" height="20">
                                  <div align="left">
                                    <input type=button name=wizard2 value="More Info" onClick="MoreInfo('wan_m.asp')">
                                </div></td>
                              </tr>
                              <tr>
                                <td width="64" height="20">
                                <div align="center"><b>LAN1</b></div></td>
                                <td width="220" height=20>&nbsp;
								<input type="hidden" id="lan_link_00" name="lan_link_00" value="<%  CmoGetStatus("lan_port_status_00"); %>">
								<!-- insert name=link_stat_lan1 -->
								<script>
									if(get_by_id("lan_link_00").value == "connect"){
										document.write("<img src=W_link.gif width=200 height=20 border=0>");
									}else{
										document.write("<img src=W_nolink.gif width=200 height=20 border=0>");
									}
								</script>
								</td>
                                <td height="20">&nbsp;
								<input type="hidden" id="lan_port_speed_duplex_00" name="lan_port_speed_duplex_00" value="<%  CmoGetStatus("lan_port_speed_duplex_00"); %>">
								<script>
									var temp_data = get_by_id("lan_port_speed_duplex_00").value;
									var data = temp_data.split("|");
									if(get_by_id("lan_link_00").value == "connect"){
										document.write("<font face=\"Tahoma\" size=\"2\" color=\"#000000\"><strong>"+ data[0] +"Mbps "+ data[1] +" Duplex</strong></font>");
									}else{
										document.write("<font face=\"Tahoma\" size=\"2\" color=\"#000000\">Disconnected</font>");
									}
								
								</script>
								<!-- insert name=link_stat_txt_lan1 --></td>
                                <td width="17%" height="20">
                                  <div align="left">
                                    <input type=button name=wizard22 value="More Info" onClick="MoreInfo('lan1_m.asp')">
                                </div></td>
                              </tr>
                              <tr>
                                <td width="64" height="20">
                                <div align="center"><b>LAN2</b></div></td>
                                <td width=220 height=20>&nbsp;
								<input type="hidden" id="lan_link_01" name="lan_link_01" value="<%  CmoGetStatus("lan_port_status_01"); %>">
								<!-- insert name=link_stat_lan2 -->
								<script>
									if(get_by_id("lan_link_01").value == "connect"){
										document.write("<img src=W_link.gif width=200 height=20 border=0>");
									}else{
										document.write("<img src=W_nolink.gif width=200 height=20 border=0>");
									}
								</script>
								</td>
                                <td width=217 height="20">&nbsp;
								<input type="hidden" id="lan_port_speed_duplex_01" name="lan_port_speed_duplex_01" value="<%  CmoGetStatus("lan_port_speed_duplex_01"); %>">
								<script>
									var temp_data = get_by_id("lan_port_speed_duplex_01").value;
									var data = temp_data.split("|");
									if(get_by_id("lan_link_01").value == "connect"){
										document.write("<font face=\"Tahoma\" size=\"2\" color=\"#000000\"><strong>"+ data[0] +"Mbps "+ data[1] +" Duplex</strong></font>");
									}else{
										document.write("<font face=\"Tahoma\" size=\"2\" color=\"#000000\">Disconnected</font>");
									}
								
								</script>
								<!-- insert name=link_stat_txt_lan2 --></td>
                                <td width="17%" height="20">
                                  <div align="left">
                                    <input type=button name=wizard3 value="More Info" onClick="MoreInfo('lan2_m.asp')">
</div></td>
                              </tr>
                              <tr>
                                <td width="64" height="20">
                                <div align="center"><b>LAN3</b></div></td>
                                <td width=220 height=20>&nbsp;
								<input type="hidden" id="lan_link_02" name="lan_link_02" value="<%  CmoGetStatus("lan_port_status_02"); %>">
								<!-- insert name=link_stat_lan3 -->
								<script>
									if(get_by_id("lan_link_02").value == "connect"){
										document.write("<img src=W_link.gif width=200 height=20 border=0>");
									}else{
										document.write("<img src=W_nolink.gif width=200 height=20 border=0>");
									}
								</script>
								</td>
                                <td width=217 height="20">&nbsp;
								<input type="hidden" id="lan_port_speed_duplex_02" name="lan_port_speed_duplex_02" value="<%  CmoGetStatus("lan_port_speed_duplex_02"); %>">
								<script>
									var temp_data = get_by_id("lan_port_speed_duplex_02").value;
									var data = temp_data.split("|");
									if(get_by_id("lan_link_02").value == "connect"){
										document.write("<font face=\"Tahoma\" size=\"2\" color=\"#000000\"><strong>"+ data[0] +"Mbps "+ data[1] +" Duplex</strong></font>");
									}else{
										document.write("<font face=\"Tahoma\" size=\"2\" color=\"#000000\">Disconnected</font>");
									}
								
								</script>
								<!-- insert name=link_stat_txt_lan3 --></td>
                                <td width="17%" height="20">
                                  <div align="left">
                                    <input type=button name=wizard4 value="More Info" onClick="MoreInfo('lan3_m.asp')">
                                </div></td>
                              </tr>
                              <tr>
                                <td width="64" height="20">
                                <div align="center"><b>LAN4</b></div></td>
                                <td width=220 height=20>&nbsp;
								<input type="hidden" id="lan_link_03" name="lan_link_03" value="<%  CmoGetStatus("lan_port_status_03"); %>">
								<!-- insert name=link_stat_lan4 -->
								<script>
									if(get_by_id("lan_link_03").value == "connect"){
										document.write("<img src=W_link.gif width=200 height=20 border=0>");
									}else{
										document.write("<img src=W_nolink.gif width=200 height=20 border=0>");
									}
								</script>
								</td>
                                <td width=217 height="20">&nbsp;
								<input type="hidden" id="lan_port_speed_duplex_03" name="lan_port_speed_duplex_03" value="<%  CmoGetStatus("lan_port_speed_duplex_03"); %>">
								<script>
									var temp_data = get_by_id("lan_port_speed_duplex_03").value;
									var data = temp_data.split("|");
									if(get_by_id("lan_link_03").value == "connect"){
										document.write("<font face=\"Tahoma\" size=\"2\" color=\"#000000\"><strong>"+ data[0] +"Mbps "+ data[1] +" Duplex</strong></font>");
									}else{
										document.write("<font face=\"Tahoma\" size=\"2\" color=\"#000000\">Disconnected</font>");
									}
								
								</script>
								<!-- insert name=link_stat_txt_lan4 --></td>
                                <td width="17%" height="20">
                                  <div align="left">
                                    <input type=button name=wizard5 value="More Info" onClick="MoreInfo('lan4_m.asp')">
</div></td>
                              </tr>
							  </form>
                      </table>
					</div>
				  <div class=box>
                    <h2>Ping Test</h2>
                    <P>Ping Test sends "ping" packets to test a computer on the Internet.</P>
                    <table border="0" cellpadding="0" cellspacing="0" class="formarea">
                      
                        <form id="form5" name="form5" method="post" action="ping_response.cgi">
						<input type="hidden" name="html_response_page" value="back.asp">
	   					<input type="hidden" name="html_response_message" value="The setting is saved.">
	   					<input type="hidden" name="html_response_return_page" value="tools_vct.asp">
                          <tr>
                            <td class="form_label">
                              <div align="right">Host Name or IP Address:</div></td>
                            <td height="20" valign="top">&nbsp;
							 <input type="text" id="ping_ipaddr" name="ping_ipaddr" size=30 maxlength=63 value="<% CmoGetStatus("ping_ipaddr"); %>" >
                              <input type="submit" name="ping" value="ping" onClick="return check_ip()"></td>
                          </tr> </form>                      
                    </table>
						
				  </div>
<div class=box>
                    <h2>Ping Result</h2>
                    <p>Enter a host name or IP address above and click 'Ping'</p>
                    <table cellSpacing=1 cellPadding=1 width=525 border=0>
					  <tr>
                            <td><div align="center">
                              <% CmoGetStatus("ping_reslute"); %>
                              <!-- repeat name=msg --></div></td>
                      </tr>
                            <td height="20" valign="top">&nbsp;</td>
                          </tr>                    
                    </table>
						
			  </div>
					<!-- === END MAINCONTENT === -->
                </div></td>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table cellpadding="2" cellspacing="0" border="0" bgcolor="#FFFFFF">
					<tr>
					  <td id="help_text">&nbsp;							</td>
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
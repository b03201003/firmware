
<html>
<head>
<script language="JavaScript" src="public.js"></script>
<script language="JavaScript">	
	function onPageLoad(){
		var sel_log_system_activity = "<% CmoGetCfg("log_system_activity","none"); %>";
		var p_log_system_activity = get_by_id("type1");
		if(sel_log_system_activity == "1"){
			p_log_system_activity.checked =true;
		}else{
			p_log_system_activity.checked =false;
		}
		
		var sel_log_debug_information = "<% CmoGetCfg("log_debug_information","none"); %>";
		var p_log_debug_information = get_by_id("type2");
		if(sel_log_debug_information == "1"){
			p_log_debug_information.checked =true;
		}else{
			p_log_debug_information.checked =false;
		}
		
		var sel_log_attacks = "<% CmoGetCfg("log_attacks","none"); %>";
		var p_log_attacks = get_by_id("type3");
		if(sel_log_attacks == "1"){
			p_log_attacks.checked =true;
		}else{
			p_log_attacks.checked =false;
		}
		
		var sel_log_dropped_packets = "<% CmoGetCfg("log_dropped_packets","none"); %>";
		var p_log_dropped_packets = get_by_id("type4");
		if(sel_log_dropped_packets == "1"){
			p_log_dropped_packets.checked =true;
		}else{
			p_log_dropped_packets.checked =false;
		}
		
		var sel_log_notice = "<% CmoGetCfg("log_notice","none"); %>";
		var p_log_notice = get_by_id("type5");
		if(sel_log_notice == "1"){
			p_log_notice.checked =true;
		}else{
			p_log_notice.checked =false;
		}
		
		
	}

	function check_mail(){
		if (get_by_id("log_email_server").value == ""){
			alert(msg[SMTP_SERVER_ERROR]);
			return;
		}else if (get_by_id("log_email_sender").value == ""){
			alert(msg[EMAIL_ADDRESS_ERROR]);	
			return;		
		}
		
	var log_res_type ="";
	var type1 = get_by_id("type1");	
	if (type1.checked==true){						
			get_by_id("log_system_activity").value = "1";
			log_res_type = "system";
	}else{		
			get_by_id("log_system_activity").value = "0";
	}
	
	var type2 = get_by_id("type2");	
	if (type2.checked==true){						
			get_by_id("log_debug_information").value = "1";
			log_res_type = log_res_type +"| debug" ;
	}else{		
			get_by_id("log_debug_information").value = "0";
	}
	
	var type3 = get_by_id("type3");	
	if (type3.checked==true){						
			get_by_id("log_attacks").value = "1";
			log_res_type = log_res_type +"| attack";
	}else{		
			get_by_id("log_attacks").value = "0";
	}
	
	var type4 = get_by_id("type4");	
	if (type4.checked==true){						
			get_by_id("log_dropped_packets").value = "1";
			log_res_type = log_res_type +"| dropped";
	}else{		
			get_by_id("log_dropped_packets").value = "0";
	}
	
	var type5 = get_by_id("type5");	
	if (type5.checked==true){						
			get_by_id("log_notice").value = "1";
			log_res_type = log_res_type +"| notice";
	}else{		
			get_by_id("log_notice").value = "0";
	}
	
	get_by_id("log_response_type").value =log_res_type;
	
		
		get_by_id("form1").action = "send_log_email.cgi";
		get_by_id("html_response_message").value = "Finish.";
		send_submit("form1");
	}

function save_log_fun(){
	send_submit("form3");
}

	
function send_request(){
	var log_res_type ="";
	var type1 = get_by_id("type1");	
	if (type1.checked==true){						
			get_by_id("log_system_activity").value = "1";
			log_res_type = "system";
	}else{		
			get_by_id("log_system_activity").value = "0";
	}
	
	var type2 = get_by_id("type2");	
	if (type2.checked==true){						
			get_by_id("log_debug_information").value = "1";
			log_res_type = log_res_type +"| debug" ;
	}else{		
			get_by_id("log_debug_information").value = "0";
	}
	
	var type3 = get_by_id("type3");	
	if (type3.checked==true){						
			get_by_id("log_attacks").value = "1";
			log_res_type = log_res_type +"| attack";
	}else{		
			get_by_id("log_attacks").value = "0";
	}
	
	var type4 = get_by_id("type4");	
	if (type4.checked==true){						
			get_by_id("log_dropped_packets").value = "1";
			log_res_type = log_res_type +"| dropped";
	}else{		
			get_by_id("log_dropped_packets").value = "0";
	}
	
	var type5 = get_by_id("type5");	
	if (type5.checked==true){						
			get_by_id("log_notice").value = "1";
			log_res_type = log_res_type +"| notice";
	}else{		
			get_by_id("log_notice").value = "0";
	}
	
	get_by_id("log_response_type").value =log_res_type;
	
	return true;
}	
		
</script>	
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
                  <tbody>
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
									<li><div><a href="tools_vct.asp">SYSTEM CHECK</a></div></li>
									<li><div><a href="tools_schedules.asp">SCHEDULES</a></div></li>
									<li><div id="sidenavoff">Log settings</div></li>

								</ul>
								<!-- === END SIDENAV === -->
							</div>
						</td>			
					</tr>
                  </tbody>
				</table>			
			</td>
			<form id="form1" name="form1" method="post" action="apply.cgi">
<input type="hidden" name="html_response_page" value="back.asp">
<input type="hidden" id="html_response_message" name="html_response_message" value="The setting is saved.">
<input type="hidden" name="html_response_return_page" value="st_log_settings.asp">

<input type="hidden" name="log_response_type" id="log_response_type" value="<% CmoGetCfg("log_response_type","none"); %>">
			<td valign="top" id="maincontent_container">			  <div id="maincontent">
					<!-- === BEGIN MAINCONTENT === -->
<div id="box_header"> 
						<h1>Log SETTINGS</h1>
						<p>Logs can be saved. </p>
						  <input name="button" type="submit" class=button_submit value="Save Settings" onClick="return send_request()">
                          <input name="button2" type=reset class=button_submit value="Don't Save Settings"  onClick="window.location.href='st_log_settings.asp'">
</div>
					<div class="box">
                    <h2>lOG FILES</h2>

            <table borderColor=#ffffff cellSpacing=1 cellPadding=2 width=525 bgColor=#dfdfdf border=1>
                      <!--<tr>
                        <td class="form_label">
                          <div align=left>SMTP Server / IP Address</div></td>
                        <td width=70%>                          <input type=text id=log_email_server name=log_email_server size=30 maxlength=30 value=" CmoGetCfg("log_email_server","none"); %>"></td>
                      </tr>
                      <tr>
                        <td class="form_label">
                          <div align=left>Email Address</div></td>
                        <td width=65%> 
						<input type=text id=log_email_sender name=log_email_sender size=30 maxlength=99 value=" CmoGetCfg("log_email_sender","none"); %>">
						<input type=button value="Send Mail Now" name=sendnow onClick="check_mail()"></td>
                      </tr>-->
                      <tr>
                        <td colspan="2" height=25><strong>Save Log File To Local Hard Drive</strong><font color="#333333">&nbsp;
                        <input type="button" name="backup" value="Save" onClick="save_log_fun()">
                        </font></td>
                      </tr>
                      <tr>
                        <td class="form_label">
                          <div align=left>Log Type</div></td>
                        <td width=70%>
								<input type="hidden" id="log_system_activity" name="log_system_activity" value="<% CmoGetCfg("log_system_activity","none"); %>">						 
						        <input type=checkbox id=type1 name=type1 value=4>
      System Activity</td>
                      </tr>
                      <tr>
                        <td width=30%>&nbsp;</td>
                        <td width=70% height=25> 
						<input type="hidden" id="log_debug_information" name="log_debug_information" value="<% CmoGetCfg("log_debug_information","none"); %>">
						 <input type=checkbox id=type2 name=type2 value=32>
      Debug Information</td>
                      </tr>
                      <tr>
                        <td width=30%>&nbsp;</td>
                        <td width=70% height=25>
						<input type="hidden" id="log_attacks" name="log_attacks" value="<% CmoGetCfg("log_attacks","none"); %>">
						                        <input type=checkbox id=type3 name=type3 value=16>
      Attacks</td>
                      </tr>
                      <tr>
                        <td width=30% height=14>&nbsp;</td>
                        <td width=70% height=25>
						<input type="hidden" id="log_dropped_packets" name="log_dropped_packets" value="<% CmoGetCfg("log_dropped_packets","none"); %>">
						                        <input type=checkbox id=type4 name=type4 value=8>
      Dropped Packets</td>
                      </tr>
                      <tr>
                        <td width=30% height=14>&nbsp;</td>
                        <td width=70% height=25>
						<input type="hidden" id="log_notice" name="log_notice" value="<% CmoGetCfg("log_notice","none"); %>">
						                        <input type=checkbox id=type5 name=type5 value=2>
      Notice</td>
                      </tr>
            </table>
                    <table borderColor=#ffffff cellSpacing=1 cellPadding=2 width=525 bgColor=#FFFFFF border=1>
                      <tr bgcolor="#FFFFFF">
                       
                      </tr>
                    </table>

			  </div>
				</div></td></form>
				<form id="form2" name="form2" method="post" action="send_log_email.cgi">
				<input type="hidden" name="html_response_page" value="back.asp">
				<input type="hidden" name="html_response_return_page" value="st_log_settings.asp">
				</form>
				<form id="form3" name="form3" method=POST action="save_log.cgi" enctype=multipart/form-data>
				<input type="hidden" name="html_response_page" value="back.asp">
				<input type="hidden" name="html_response_message" value="Success.">
				<input type="hidden" name="html_response_return_page" value="st_log_settings.asp">
				</form>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table cellpadding="2" cellspacing="0" border="0" bgcolor="#FFFFFF">
                  <tr>
                    <td id="help_text">
                      <p><span class="style4">Helpful Hints..</span><span class="style5"><br>
                          <br>
</span></p></td>
                  </tr>
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
<script>
	onPageLoad();
</script>
</html>
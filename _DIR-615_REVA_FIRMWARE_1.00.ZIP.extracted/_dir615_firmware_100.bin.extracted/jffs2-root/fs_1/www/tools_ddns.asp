
<html>
<head>
<script language="JavaScript" src="public.js"></script>
<script language=JavaScript>
var submit_button_flag = 0;
var kinds_array = new Array("Dynamic","Custom","Static");
function onPageLoad(){
	var sel_ddns_enable = "<% CmoGetCfg("ddns_enable","none"); %>";
	var ddns_type = get_by_id("ddns_type").value;
	var ddns_type_value = get_by_id("ddns_type_value").value;
	var p_ddns_enable = get_by_id("d_enable");
	if(sel_ddns_enable == "1"){
			p_ddns_enable.checked =true;
	}else{
			p_ddns_enable.checked =false;
	}
	get_by_id("ddns_type_value").value = ddns_type;
	if(ddns_type == "DynDns.org"){
		for(i=0;i<kinds_array.length;i++){
			if(get_by_id("ddns_dyndns_kinds").value == kinds_array[i]){
				get_by_id("ddns_type_value").value = get_by_id("ddns_type_sel").options[i+2].text;
				break;
			}
		}
	}
}

function check_ddns(){
	var ddnsEnable = get_by_id("d_enable");
	
	if (ddnsEnable.checked){
		if (get_by_id("ddns_type_value").value == ""){
			alert(msg[DDNS_SERVER_ERROR]);
			return false;
		}else if (get_by_id("ddns_hostname").value == ''){
			alert(msg[DDNS_HOST_ERROR]);
			return false;
		}else if (get_by_id("ddns_username").value == ''){
			alert(msg[DDNS_USER_ERROR]);
			return false;
		}else if (get_by_id("ddns_password").value == ''){
			alert(msg[DDNS_PASS_ERROR]);
			return false;
		}
	}
	
	return true;
}

function send_request(){
	if (check_ddns()){
		var d_enable = get_by_id("d_enable");
		if (d_enable.checked==true){						
			get_by_id("ddns_enable").value = "1";
		}else{		
			get_by_id("ddns_enable").value = "0";
		}
		if(submit_button_flag == 0){
			submit_button_flag = 1;
			return true;
		}else{
			return false;
		}
	}
}

function copy_name(){
	var obj = get_by_id("ddns_type_sel");
	var kinds = get_by_id("ddns_dyndns_kinds");
	if(obj.selectedIndex > 0){
		get_by_id("ddns_type_value").value = obj.options[obj.selectedIndex].text;
		get_by_id("ddns_type").value = obj.options[obj.selectedIndex].value;
		if(obj.selectedIndex > 1 && obj.selectedIndex < 5){
			get_by_id("ddns_dyndns_kinds").value = kinds_array[obj.selectedIndex-2];
		}
	}else{
		get_by_id("ddns_type_value").value = "";
		get_by_id("ddns_type").value = "";
	}
}
</script>

<link rel="STYLESHEET" type="text/css" href="css_router.css">

<title>D-LINK SYSTEMS, INC | WIRELESS ROUTER | HOME</title>
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.style1 {font-size: 11px}
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
					<tr>
						<td id="sidenav_container">
							<div id="sidenav">
							<!-- === BEGIN SIDENAV === -->
								<ul>
									<li><div><a href="tools_admin.asp">Admin</a></div></li>
									<li><div><a href="tools_time.asp">Time</a></div></li>
									<li><div><a href="tools_system.asp">System</a></div></li>
									<li><div><a href="tools_firmw.asp">Firmware</a></div></li>
									<li><div id="sidenavoff">DDNS</div></li>
									<li><div><a href="tools_vct.asp">SYSTEM CHECK</a></div>
									<li><div><a href="tools_schedules.asp">SCHEDULES</a></div></li>
									<li><div><a href="st_log_settings.asp">Log settings</a></div></li>
									</li>
								</ul>
								<!-- === END SIDENAV === -->
							</div>
						</td>			
					</tr>
				</table>			
			</td>
			<form  name="form1" id="form1" method="post" action="apply.cgi">
				<input type="hidden" id="ddns_dyndns_kinds" name="ddns_dyndns_kinds" value="<% CmoGetCfg("ddns_dyndns_kinds","none"); %>">
                <input type="hidden" id="ddns_type" name="ddns_type" value="<% CmoGetCfg("ddns_type","none"); %>">
				<input type="hidden" name="html_response_page" value="back.asp">
				<input type="hidden" name="html_response_message" value="The setting is saved.">
				<input type="hidden" name="html_response_return_page" value="tools_ddns.asp">			  
			
			<td valign="top" id="maincontent_container">
				<div id="maincontent">
					<!-- === BEGIN MAINCONTENT === -->
				  <div id="box_header"> 
						<h1>Dynamic DNS</h1>
						<h4>Dynamic DNS (DDNS)</h4>
						<p>The DDNS feature allows you to host a server (Web, FTP, Game Server, etc...) using a domain name that you have purchased (www.whateveryournameis.com) with your dynamically assigned IP address. Most broadband Internet Service Providers assign dynamic (changing) IP addresses. Using a DDNS service provider, your friends can enter your host name to connect to your game server no matter what your IP address is. 
						</p>
                    <input name="button" type="submit" class=button_submit value="Save Settings" onClick="return send_request()">
                    <input name="button" type=reset class=button_submit value="Don't Save Settings"  onClick="window.location.href='tools_ddns.asp'">
				    <br>           
				  </div>
				  <div class="box"> 
						<h2>Dynamic DNS</h2>
							<table width=525 height=112 border=0 cellpadding=0>
                             
                                <tr>
                                  <td class="form_label">
                                    <div align="right">Enable Dynamic DNS :</div></td>
                                  <td height=20>&nbsp;
                                    <input name="d_enable" type="checkbox" id="d_enable" value="1">
									<input type="hidden" id="ddns_enable" name="ddns_enable" value="<% CmoGetCfg("ddns_enable","none"); %>"></td>
                                </tr>
                                <tr>
                                  <td class="form_label">
                                    <div align="right">Server Address : </div></td>
                                  <td height=20>&nbsp;&nbsp;
                                    <input type="text" id="ddns_type_value" name="ddns_type_value" readonly value="">
                                    <input name="copy_app5" type=button value="<<" class="button" onClick="copy_name();">
                                    <select id="ddns_type_sel" name="ddns_type_sel" tabindex=2>
									  <option value="">Select Dynamic DNS Server</option>
									  <option value="dlinkddns.com">dlinkddns.com</option>
									  <option value="DynDns.org">DynDns.org(Free)</option>
									  <option value="DynDns.org">DynDns.org(Custom)</option>
									  <option value="DynDns.org">DynDns.org(Static)</option>
                                      <!--option value="EasyDns.com">EasyDns.com</option>
                                      <option value="No-IP.com">No-IP.com</option>
									  <option value="changeip.com">Changeip.com</option>
                                      <option value="EuroDynDns.org">EuroDynDns.org</option>
                                      <option value="ods.org">ods.org</option>
									  <option value="ovh.com">ovh.com</option>
                                      <option value="regfish.com">regfish.com</option>
                                      <option value="tzo.com">tzo.com</option>
									  <option value="zoneedit.com">zoneedit.com</option-->
                                    </select>
                                  </td>
                                </tr>
                                <tr>
                                  <td class="form_label">
                                    <div align="right">Host Name : </div></td>
                                  <td height=20>&nbsp;&nbsp;
                                    <input type="text" id="ddns_hostname" name="ddns_hostname" size="40" maxlength="60" value="<% CmoGetCfg("ddns_hostname","none"); %>">
                                  </td>
                                </tr>
                                <tr>
                                  <td class="form_label">
                                    <div align="right">
                                      <LABEL for=dyndns_user>Username or Key&nbsp;:</LABEL>
                                    </div></td>
                                  <td height=20>&nbsp;&nbsp;
                                    <input type="text" id="ddns_username" name="ddns_username" size="40" maxlength="60" value="<% CmoGetCfg("ddns_username","none"); %>">
                                  </td>
                                </tr>
                                <tr>
                                  <td class="form_label">
                                    <div align="right">
                                      <LABEL for=dyndns_pass>Password or Key&nbsp;:</LABEL>
                                    </div></td>
                                  <td height=20>&nbsp;&nbsp;
                                    <input type="password" id="ddns_password" name="ddns_password" size="40" maxlength="40" value="WDB8WvbXdHtZyM8Ms2RENgHlacJghQyG">
                                  </td>
                                </tr>
                              
				    </table>
				  </div>
					<!-- === END MAINCONTENT === -->
                </div></td></form>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table cellpadding="2" cellspacing="0" border="0" bgcolor="#FFFFFF">
					<tr>
					  <td id="help_text">
							<strong>Helpful Hints..</strong><br>
							
					        <p class="style1"> In order to use this feature you must first have a DDNS account from one of the providers in the drop down menu. </p></td>
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
<script>
	onPageLoad();
</script>
</html>
<html>
<head>

<link rel="STYLESHEET" type="text/css" href="css_router.css">
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<script language="JavaScript" src="public.js"></script>
<script language="JavaScript">
var submit_button_flag = 0;
function onPageLoad(){
	var sel_remote_http_management_enable = "<% CmoGetCfg("remote_http_management_enable","none"); %>";
	var p_remote_http_management_enable = get_by_id("remote_enable");
	if(sel_remote_http_management_enable == "1"){
			p_remote_http_management_enable.checked =true;
	}else{
			p_remote_http_management_enable.checked =false;
	}

	var sel_remote_http_management_port = "<% CmoGetCfg("remote_http_management_port","none"); %>";
	if(sel_remote_http_management_port == "80"){
			get_by_id("remote_http_management_port").selectedIndex = 0;		
	}else if(sel_remote_http_management_port == "88"){
			get_by_id("remote_http_management_port").selectedIndex = 1;
	}else if(sel_remote_http_management_port == "1080"){
			get_by_id("remote_http_management_port").selectedIndex = 2;														
	}else{
			get_by_id("remote_http_management_port").selectedIndex = 3;

	}

	set_selectIndex(get_by_id("remote_http_management_schedule_name").value, get_by_id("remote_schedule"));

}

	function send_request(){	
		var ip = get_by_id("remote_http_management_ipaddr_range").value;		
		var temp_ip_obj = new addr_obj(ip.split("."), ip_addr_msg, false, false);
		var remote_enable = get_by_id("remote_enable");
		
		if (get_by_id("admin_password1").value != get_by_id("admPass2").value){
			alert(msg[ADMIN_PASS_ERROR]);				
		}else if (get_by_id("user_password1").value != get_by_id("userPass2").value){
			alert(msg[USER_PASS_ERROR]);	
		}else{ 
			if(get_by_id("remote_enable").checked == true){
				if (ip != "*"){
					if (!check_address(temp_ip_obj)){
						return false;
					}
				}
			}
			
	
		if (remote_enable.checked==true){						
			get_by_id("remote_http_management_enable").value = "1";
		}else{		
			get_by_id("remote_http_management_enable").value = "0";
		}
		
		get_by_id("remote_http_management_schedule_name").value = get_by_id("remote_schedule").value;
					
			if(submit_button_flag == 0){
			submit_button_flag = 1;
			return true;
			}else{
			return false;
			}	
			//return true;	
			//send_submit("form1");
		}
		return false;
	}	

function key_word(newobj,obj){
	get_by_id(obj).value = newobj.value;
}
</script>
<title>D-LINK SYSTEMS, INC | WIRELESS ROUTER | HOME</title>

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
							
								<ul>
									<li><div id="sidenavoff">Admin</div></li>
									<li><div><a href="tools_time.asp">Time</a></div></li>
									<li><div><a href="tools_system.asp">System</a></div></li>
									<li><div><a href="tools_firmw.asp">Firmware</a></div></li>
									<li><div><a href="tools_ddns.asp">DDNS</a></div></li>
								  	<li><div><a href="tools_vct.asp">SYSTEM CHECK</a></div></li>
									<li><div><a href="tools_schedules.asp">SCHEDULES</a></div></li>
									<li><div><a href="st_log_settings.asp">Log settings</a></div></li>
								</ul>
								
							</div>
						</td>			
					</tr>
				</table>			
			</td>
<input type="hidden" id="schedule_rule_0" name="schedule_rule_0" value="<% CmoGetCfg("schedule_rule_00","none"); %>">
<input type="hidden" id="schedule_rule_1" name="schedule_rule_1" value="<% CmoGetCfg("schedule_rule_01","none"); %>">
<input type="hidden" id="schedule_rule_2" name="schedule_rule_2" value="<% CmoGetCfg("schedule_rule_02","none"); %>">
<input type="hidden" id="schedule_rule_3" name="schedule_rule_3" value="<% CmoGetCfg("schedule_rule_03","none"); %>">
<input type="hidden" id="schedule_rule_4" name="schedule_rule_4" value="<% CmoGetCfg("schedule_rule_04","none"); %>">
<input type="hidden" id="schedule_rule_5" name="schedule_rule_5" value="<% CmoGetCfg("schedule_rule_05","none"); %>">
<input type="hidden" id="schedule_rule_6" name="schedule_rule_6" value="<% CmoGetCfg("schedule_rule_06","none"); %>">
<input type="hidden" id="schedule_rule_7" name="schedule_rule_7" value="<% CmoGetCfg("schedule_rule_07","none"); %>">
<input type="hidden" id="schedule_rule_8" name="schedule_rule_8" value="<% CmoGetCfg("schedule_rule_08","none"); %>">
<input type="hidden" id="schedule_rule_9" name="schedule_rule_9" value="<% CmoGetCfg("schedule_rule_09","none"); %>">
<input type="hidden" id="schedule_rule_10" name="schedule_rule_10" value="<% CmoGetCfg("schedule_rule_10","none"); %>">
<input type="hidden" id="schedule_rule_11" name="schedule_rule_11" value="<% CmoGetCfg("schedule_rule_11","none"); %>">
<input type="hidden" id="schedule_rule_12" name="schedule_rule_12" value="<% CmoGetCfg("schedule_rule_12","none"); %>">
<input type="hidden" id="schedule_rule_13" name="schedule_rule_13" value="<% CmoGetCfg("schedule_rule_13","none"); %>">
<input type="hidden" id="schedule_rule_14" name="schedule_rule_14" value="<% CmoGetCfg("schedule_rule_14","none"); %>">
<input type="hidden" id="schedule_rule_15" name="schedule_rule_15" value="<% CmoGetCfg("schedule_rule_15","none"); %>">
<input type="hidden" id="schedule_rule_16" name="schedule_rule_16" value="<% CmoGetCfg("schedule_rule_16","none"); %>">
<input type="hidden" id="schedule_rule_17" name="schedule_rule_17" value="<% CmoGetCfg("schedule_rule_17","none"); %>">
<input type="hidden" id="schedule_rule_18" name="schedule_rule_18" value="<% CmoGetCfg("schedule_rule_18","none"); %>">
<input type="hidden" id="schedule_rule_19" name="schedule_rule_19" value="<% CmoGetCfg("schedule_rule_19","none"); %>">			
			
<form id="form1" name="form1" method="post" action=apply.cgi>
<input type="hidden" name="html_response_page" value="back.asp">
<input type="hidden" name="html_response_message" value="The setting is saved.">
<input type="hidden" name="html_response_return_page" value="tools_admin.asp">
<input type="hidden" id="auth_flag" name="auth_flag" value="auth">



			<td valign="top" id="maincontent_container">			  <div id="maincontent">
					
<div id="box_header"> 
						<h1>Administrator Settings</h1>
						<p>The 'admin' and 'user' accounts can access the management interface. The admin has read/write access and can change passwords, while the user has read-only access.</p>
						<p>By default there is no password configured. It is highly recommended that you create a password to keep your router secure.</p>
						<input name="button" type="submit" class=button_submit value="Save Settings" onClick="return send_request()">
                        <input name="button" type=reset class=button_submit value="Don't Save Settings" onClick="window.location.href='tools_admin.asp'">
</div>
					<div class="box"> 
							<h2>Admin Password</h2>
							<p class="box_msg">Please enter the same password into both boxes, for confirmation.</p>							
							<table cellpadding="1" cellspacing="1" border="0" width="525">
							  <tr>
                                <td class="form_label">Login name :</td>
                                <td width="368"><font face=Arial size=2>&nbsp;&nbsp;
                                  <input type=password id="admin_username" name="admin_username" size=20 maxlength=15 value="<% CmoGetCfg("admin_username","none"); %>">
                                </font></td>
						      </tr>
								<tr>
									<td class="form_label">Password :</td>
									<input type="hidden" id="admin_password" name="admin_password" value="WDB8WvbXdHtZyM8Ms2RENgHlacJghQyG">
									<td width="368"><font face=Arial size=2>&nbsp;&nbsp;
                                        <input type=password id="admin_password1" name="admin_password1" size=20 maxlength=15 value="WDB8WvbXdHtZyM8Ms2RENgHlacJghQyG" onChange="key_word(this,'admin_password');">
</font></td>
								</tr>
								<tr>
									<td class="form_label">Verify Password :</td>
									<td width="368"><font face=Arial size=2>&nbsp;&nbsp;
									  <input type=password id=admPass2 name=admPass2 size=20 maxlength=15 value="WDB8WvbXdHtZyM8Ms2RENgHlacJghQyG">
								  </font> </td>
								</tr>														
					  </table>
					</div>
			  <div class="box"> 
							<h2>User Password</h2>
							<p class="box_msg">Please enter the same password into both boxes, for confirmation.</p>
							<table cellpadding="1" cellspacing="1" border="0" width="525">
						      <tr>
                                <td class="form_label">Login name :</td>
                                <td width="368"><font face=Arial size=2>&nbsp;&nbsp;
                                      <input type=password id="user_username" name="user_username" size=20 maxlength=15 value="<% CmoGetCfg("user_username","none"); %>">
                                </font></td>
				          </tr>
                              <tr>
                                <td class="form_label">Password :</td>
                                <input type="hidden" id="user_password" name="user_password" value="WDB8WvbXdHtZyM8Ms2RENgHlacJghQyG">
                                <td width="368"><font face=Arial size=2>&nbsp;&nbsp;
                                  <input type=password id="user_password1" name="user_password1" size=20 maxlength=15 value="WDB8WvbXdHtZyM8Ms2RENgHlacJghQyG" onChange="key_word(this,'user_password');">
                                </font></td>
                              </tr>
                              <tr>
                                <td class="form_label">Verify Password :</td>
                                <td width="368"><font face=Arial size=2>&nbsp;&nbsp;
                                  <input type=password id=userPass2 name=userPass2 size=20 maxlength=15 value="WDB8WvbXdHtZyM8Ms2RENgHlacJghQyG">
                                </font> </td>
                              </tr>
                </table>
			  </div>
					<div class="box"> 
						<h2>Administration : </h2>
						<table cellpadding="1" cellspacing="1" border="0" width="525">
                          <tr>
                            <td class="form_label">Enable Remote Managment : </td>
                            <td width="368" align="right"><div align="left">&nbsp;
                                
								<input name="remote_enable" type="checkbox" id="remote_enable" value="1">
								<input type="hidden" id="remote_http_management_enable" name="remote_http_management_enable" value="<% CmoGetCfg("remote_http_management_enable","none"); %>">
     </div></td>
                          </tr>
                          <tr>
                            <td class="form_label">Remote Admin IP :</td>
                            <td width="368" align="right"><div align="left">&nbsp;&nbsp;
                              <input type=text id="remote_http_management_ipaddr_range" name="remote_http_management_ipaddr_range" size=16 maxlength=15 value="<% CmoGetCfg("remote_http_management_ipaddr_range","none"); %>">
                              <span>                              </span>
                            </div></td>
                          </tr>
                          <tr>
                            <td class="form_label">Remote Admin Port :</td>
                            <td align="right"><div align="left">&nbsp;&nbsp;
                                    <select id="remote_http_management_port" name="remote_http_management_port" size="1">
                                      <option value="80">80</option>
                                      <option value="88">88</option>
                                      <option value="1080">1080</option>
                                      <option value="8080" selected>8080</option>
                                    </select>
                                    <select id="remote_schedule" name="remote_schedule" style="width:80">
                                      <option value="Always">Always</option>
                                      <script>set_schedule_option()</script>
                                    </select>									
                              <input type="hidden" id="remote_http_management_schedule_name" name="remote_http_management_schedule_name" value="<% CmoGetCfg("remote_http_management_schedule_name","none"); %>">
                            </div></td>
                          </tr>
                         <!-- <tr>
                            <td width="180" align="right">Schedule  :</td>
                            <td width="368" align="right"><div align="left">&nbsp;
                                <select name=menu1>
                                  <option selected>Always</option>
                                  <option>Never</option>
                                  <option>Defined Schedule</option>
                                </select>
                            </div></td>
                          </tr>-->
                      </table>
				</div>
					</div>				
			</td>
</form>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table cellpadding="2" cellspacing="0" border="0" bgcolor="#FFFFFF">
					<tr>
					  <td id="help_text">
							<strong>Helpful Hints..</strong><br>
							
					        <p class="style1"> For security reasons, it is recommended that you change the Login Name and Password for the Administrator and User accounts. Be sure to write down the new Login Names and Passwords to avoid having to reset the router in the event that they are forgotten. </p>
			          <p class="style1"> When enabling Remote Management, you can specify the IP address of the computer on the Internet that you want to have access to your router, or you can enter an asterisk (*) to allow access to any computer on the Internet. </p></td>
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
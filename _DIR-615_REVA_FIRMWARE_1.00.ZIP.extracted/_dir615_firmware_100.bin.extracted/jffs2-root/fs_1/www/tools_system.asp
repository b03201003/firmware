<html>
<head>
<script language="JavaScript" src="public.js"></script>
<script language="JavaScript">
function restoreConfirm(){
		var login_who="<% CmoGetStatus("get_current_user"); %>";
		if(login_who== "user"){
			window.location.href ="back.asp";
		}else{
		if(confirm(msg[RESTORE_DEFAULT])){		
	    	send_submit("form2");
	   	}
		}
}
	
	function restore_js(){
		if(confirm(msg[RESET_JUMPSTAR])){		
	    	send_submit("form4");
	   	}
	}
	
function loadConfirm(){
	var login_who="<% CmoGetStatus("get_current_user"); %>"; 
	if(login_who== "user"){
		window.location.href ="back.asp";
	}else{
		if(confirm(msg[LOAD_SETTING])){
			if (get_by_id("file").value == ''){
				alert(msg[LOAD_FILE_ERROR]);
			}else{
				send_submit("form1");
			}		
		}
	
	}    
}
		
function confirm_reboot(){
	var login_who="<% CmoGetStatus("get_current_user"); %>";
	if(login_who== "user"){
		window.location.href ="back.asp";
	}else{
		if(confirm(msg[REBOOT_ROUTER])){
	    	send_submit("form6");
	   	}
	}	
}

	function save_conf(){
		send_submit("form17");
	}

</script>
<link rel="STYLESHEET" type="text/css" href="css_router.css">

<title>D-LINK SYSTEMS, INC | WIRELESS ROUTER | HOME</title>
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.style2 {font-size: 11px}
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
									<li><div id="sidenavoff">System</div></li>
									<li><div><a href="tools_firmw.asp">Firmware</a></div></li>
									<li><div><a href="tools_ddns.asp">DDNS</a></div></li>
								    <li><div><a href="tools_vct.asp">SYSTEM CHECK</a></div></li>
<li><div><a href="tools_schedules.asp">SCHEDULES</a></div></li>
<li><div><a href="st_log_settings.asp">Log settings</a></div></li>
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
						<h1>System SETTINGS</h1>
						<p>The System Settings section allows you to reboot the device, or restore the router to the factory default settings. Restoring the unit to the factory default settings will erase all settings, including any rules that you have created.</p>
						<p>The current system settings can be saved as a file onto the local hard drive. The saved file or any other saved setting file created by device can be uploaded into the unit.</p>				  
				  </div>
				  <div class="box">
                      <h2>SYSTEM Settings : </h2>
                      <table border="0" cellpadding="0" cellspacing="2" class="formarea" >
                        <form id="form17" name="form17" method=POST action="save_configuration.cgi" enctype=multipart/form-data>
                          <input type="hidden" name="html_response_page" value="back.asp">
                          <input type="hidden" name="html_response_message" value="The setting is saved.">
                          <input type="hidden" name="html_response_return_page" value="tools_system.asp">
                          <tr>
                            <td class="form_label">Save Settings To Local Hard Drive :</td>
                            <td width="300" height=10>&nbsp;
                                <input type=button value="Save Configuration" name=save onClick="save_conf()"></td>
                          </tr>
                        </form>
                          <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                          </tr>
                        <form id="form1" name="form1" method=POST action="upload_configuration.cgi" enctype=multipart/form-data>
                          <input type="hidden" name="html_response_page" value="count_down.asp">
                          <input type="hidden" name="html_response_return_page" value="tools_system.asp">
                          <tr>
                            <td class="form_label">Load Settings From Local Hard Drive :</td>
                            <td height=20 width=300>&nbsp;
                                <input type=file id=file name=file size=20>
                                <br>
                        &nbsp;
                                <input type="button" value="Restore Configuration from File" name="load" onClick="loadConfirm()">
                            </td>
                          </tr>
                        </form>
                          <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                          </tr>
                        <form id="form2" name="form2" method="post" action="restore_default.cgi">
                          <input type="hidden" name="html_response_page" value="count_down.asp">
                          <input type="hidden" name="html_response_return_page" value="tools_system.asp">
                          <tr>
                            <td class="form_label">Restore To Factory Default Settings :</td>
                            <td width="300" height=20>&nbsp;
                                <input type="button" value="Restore to the Factory Defaults" name="restore" onClick="restoreConfirm()"></td>
                          </tr>
                        </form>
                          <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                          </tr>
                        <form id="form6" name="form6" method="post" action="reboot.cgi">
                          <input type="hidden" name="html_response_page" value="count_down.asp">
                          <input type="hidden" name="html_response_return_page" value="tools_system.asp">
                          <tr>
                            <td class="form_label">Reboots the DIR-615 :</td>
                            <td width="300" height="20" valign="top"> &nbsp;
                                <input type="button" value="Reboot the Device" name=restart onClick="confirm_reboot()">
                            </td>
                          </tr>
                        </form>
                          <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                          </tr>
                      </table>
				  </div>
				  <!--
<div class="box">
                      <h2>JumpStart : </h2>
                      <table width="525" height=46 border=0 cellpadding=2 cellspacing="2">
                        
                        <form id=form3 name= form3 method=POST action=enableJS.cgi>
                          <tr>
                            <td width=225><div align="right">Enable JumpStart function :</div></td>
                            <td height=20 width=300>&nbsp;
				            <input name="js_g_enable" type="checkbox" id="js_g_enable" value="1">
                            &nbsp;
                            <input type="button" value=Apply name=SaveJs onclick="send_submit('form3')">                           </td>
                          </tr>
                       </form>
                          <form id=form4 name=form4 method=POST action=restoreJS.cgi>
			<tr>
                <td width=225><div align="right">Reset JumpStart :</div></td>
                            <td height=20 width=300>&nbsp;
				<input type="button" name="restoreJS"  id="restoreJS" onClick="restore_js()" value="Jumpstart">                </td>
                          </tr></form>
			  
                    </table>
					
				  </div>
-->
					<!-- === END MAINCONTENT === -->
          </div>
		  </td>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table cellpadding="2" cellspacing="0" border="0" bgcolor="#FFFFFF">
					<tr>
					  <td id="help_text">
							<strong>Helpful Hints..</strong><br>
							
							<p class="style2"> Once your router is configured they way you want it, you can save these settings to a configuration file that can later be loaded in the event that the router's default settings are restored. To do this, click the <strong>Save </strong> button next to where it says Save Settings to Local Hard Drive. </p>
							<!--<p class="style2"> JumpStart can be used to configure the wireless settings of your router and JumpStart enabled wireless clients. If you have a JumpStart enabled wireless client and would like to utilize this feature, simply click the checkbox next to <strong>Enable JumpStart function </strong> and then click <strong>Apply </strong>. </p>-->
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
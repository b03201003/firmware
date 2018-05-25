
<html>
<head>
<script language="Javascript" src="public.js"></script>
<script language="JavaScript">
var submit_button_flag = 0;
	function send_request(){
		if (get_by_id("file").value == ''){
			alert(msg[FIRMWARE_UPGRADE_ERROR]);
		}else{
		
			if(submit_button_flag == 0){
				submit_button_flag = 1;
				send_submit("form1");
				//return true;
			}else{
			//return false;
			}		
			
		}
	}
</script>

<link rel="STYLESHEET" type="text/css" href="css_router.css">

<title>D-LINK SYSTEMS, INC | WIRELESS ROUTER | HOME</title>
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
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
									<li><div><a href="tools_admin.asp">Admin</a></div></li>
									<li><div><a href="tools_time.asp">Time</a></div></li>
									<li><div><a href="tools_system.asp">System</a></div></li>
									<li><div id="sidenavoff">Firmware</div></li>
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
			<form id="form1" name="form1" method=POST action="firmware_upgrade.cgi" enctype=multipart/form-data>
			<input type="hidden" name="html_response_page" value="count_down.asp">
			<!--<input type="hidden" name="html_response_message" value="The setting is saved.">-->
			<input type="hidden" name="html_response_return_page" value="tools_firmw.asp">
			<td valign="top" id="maincontent_container">
				<div id="maincontent">				
					<div id="box_header"> 
						<h1>Firmware</h1>
						<h4>Firmware Upgrade</h4>
						<p>There may be new firmware for your DIR-615 to improve functionality and performance.<br>
                      <a href=http://support.dlink.com target=_blank>Click here to check for an upgrade on our support site.</a><br>
						<br>
						To upgrade the firmware, locate the upgrade file on the local hard drive with the Browse button. Once you have found the file to be used, click the Save Settings button below to start the firmware upgrade.<br><br>						
                        <input name="button" type=button class=button_submit value="Save Settings" onClick="send_request()">
                        <input name="button" type=button class=button_submit value="Don't Save Settings"  onClick="window.location.href='tools_firmw.asp'">
					</div>
				  <div class="box"> 
						<h2>Firmware Information</h2>
							<table width=76% height=57 border=0 cellpadding=2 cellspacing="2">
                              <tr>
                                <td class="form_label">Current Firmware Version:</td>
                                <td class="form_data" height=10 colspan=2>
                                  <div align="left">
                                    <% CmoGetStatus("version"); %>
                                </div></td>
                              </tr>
                              <tr>
                              <td class="form_label"><div align="right">Current Firmware Date:</div></td>
                                <td class="form_data" height=10 colspan=2>
                                  <div align="left">
                                   <% CmoGetStatus("version_date"); %></div></td>
                              </tr>
                            </table>
				  </div>	
				  <div class="box"> 
						<h2>Firmware Upgrade</h2>
						<p class="box_alert">
							<b>Note:</b> Some firmware upgrades reset the configuration options to the factory defaults. Before performing an upgrade, be sure to save the current configuration from the <a href="tools_system.asp">Tools&nbsp;-&gt;&nbsp;System</a> screen. 
					    </p>
						<p class="box_msg">To upgrade the firmware, your PC must have a wired connection to the router.Enter the name of thefirmware upgrade file, and click on the Upload button.
						</p>
						<table width=76% height=57 border=0 cellpadding=2 cellspacing="2">
                              <tr>
                                <td class="form_label">Upload :</td>
                                <td colspan=2>
                                    <input type=file id=file name=file size=30>
								</td>
                              </tr>						
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
							<br>
							Firmware updates are released periodically to improve the functionality of your router and also to add features.  If you run into a problem with a specific feature of the router, check our support site by clicking on the <strong>Click here to check for an upgrade on our support site</strong> link and see if an updated firmware is available for your router.
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
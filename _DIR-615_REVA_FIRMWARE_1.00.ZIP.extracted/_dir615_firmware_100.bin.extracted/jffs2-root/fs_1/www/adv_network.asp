<html>
<head>
<script language="JavaScript" src="public.js"></script>
<script language=JavaScript>
var submit_button_flag = 0;
function onPageLoad(){
	var sel_upnp_enable = "<% CmoGetCfg("upnp_enable","none"); %>";
	var p_upnp_enable = get_by_id("upnpEnable");
	if(sel_upnp_enable == "1"){
			p_upnp_enable.checked =true;
	}else{
			p_upnp_enable.checked =false;
	}

	var sel_hEnable = "<% CmoGetCfg("wan_port_ping_response_enable","none"); %>";
	var p_hEnable = get_by_id("wan_ping");
	if(sel_hEnable == "1"){
			p_hEnable.checked =true;
	}else{
			p_hEnable.checked =false;
	}

	

	var sel_multicast_stream_enable = "<% CmoGetCfg("multicast_stream_enable","none"); %>";
	var p_multicast_stream_enable = get_by_id("multi_enable");
	if(sel_multicast_stream_enable == "1"){
			p_multicast_stream_enable.checked =true;
	}else{
			p_multicast_stream_enable.checked =false;
	}

	var sel_wan_port_speed = "<% CmoGetCfg("wan_port_speed","none"); %>";
	if(sel_wan_port_speed == "10full"){
			get_by_id("wan_port_speed").selectedIndex = 0;		
	}else if(sel_wan_port_speed == "100full"){
			get_by_id("wan_port_speed").selectedIndex = 1;
	}else if(sel_wan_port_speed == "auto"){
			get_by_id("wan_port_speed").selectedIndex = 2;														
	}else{
	alert("speed error");
//			get_by_id("wan_port_speed").selectedIndex = 3;
	}


}


function send_request(){
	var upnpEnable = get_by_id("upnpEnable");
	var wan_ping = get_by_id("wan_ping");
	var multi_enable = get_by_id("multi_enable");
	
		if (upnpEnable.checked==true){						
			get_by_id("upnp_enable").value = "1";
		}else{		
			get_by_id("upnp_enable").value = "0";
		}
	
		if (wan_ping.checked==true){						
			get_by_id("wan_port_ping_response_enable").value = "1";
		}else{		
			get_by_id("wan_port_ping_response_enable").value = "0";
		}
	
		if (multi_enable.checked==true){						
			get_by_id("multicast_stream_enable").value = "1";
		}else{		
			get_by_id("multicast_stream_enable").value = "0";
		}
	
	
	if(submit_button_flag == 0){
		submit_button_flag = 1;
		return true;
		}else{
		return false;
		}
	//return true;
	//send_submit("form3");
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
<form id="form3" name="form3" method="post" action="apply.cgi">
<input type="hidden" name="html_response_page" value="back.asp">
<input type="hidden" name="html_response_message" value="The setting is saved.">
<input type="hidden" name="html_response_return_page" value="adv_network.asp">
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
                              <div><a href="adv_virtual.asp">Virtual Server</a></div>
                            <LI>
                              <div><a href="adv_virtual.asp">Port Forwarding</a></div>
                            <LI>
                              <div><a href="adv_appl.asp">Application Rules</a></div>
                            <LI>
                              <div><a href="adv_filters_mac.asp">Network Filter</a></div>
							<LI>
							 <!-- <div><a href="adv_access_control.asp">Access control</a></div>
                            <LI>-->
                              <div><a href="adv_filters_url.asp">Website Filter</a></div>

                            <LI>
                              <div><a href="adv_dmz.asp">Firewall Settings</a></div>
                            <LI>
                              <div><a href="adv_wlan_perform.asp">advanced Wireless</a></div>
                            <LI>
                              <div id=sidenavoff>advanced Network</div>
                            </LI>
                          </UL>
                          <!-- === END SIDENAV === -->
                      </div></td>
                    </tr>
                  </tbody>
                </table></td>
			<td valign="top" id="maincontent_container">			  <div id=maincontent>
				  <!-- === BEGIN MAINCONTENT === -->
                  <div id=box_header>
                    <h1>Advanced Network</h1>
                    <p>If you are not familiar with these Advanced Network settings, please read the help section before attempting to modify these settings.</p>
                    <input name="button" type="submit" class=button_submit value="Save Settings" onClick="return send_request()">
                    <input name="button2" type=button class=button_submit value="Don't Save Settings"  onClick="window.location.href='adv_network.asp'">
                  </div>
                  <div class=box>
                    <h2>UPnP</h2>
                    <P class="box_msg">Universal Plug and Play (UPnP) supports peer-to-peer Plug and Play functionality for network devices.</P>
                    <table cellSpacing=1 cellPadding=1 width=525 border=0>
                      <tbody>
                        <tr>
                          <td align=right width=160 class="form_label">Enable UPnP :</td>
                          <td colSpan=3>&nbsp;
						  
						  <input name="upnpEnable" type=checkbox id="upnpEnable" value="1">
						  <input type="hidden" id="upnp_enable" name="upnp_enable" value="<% CmoGetCfg("upnp_enable","none"); %>">
						  </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div class=box>
                    <h2>WAN PING</h2>
                    <P class="box_msg">If you enable this feature, the WAN port of your router will respond to ping requests from the Internet that are sent to the WAN IP Address.</P>
                    <table cellSpacing=1 cellPadding=1 width=525 border=0>
                      <tbody>
                        <tr>
                          <td align=right width=160 class="form_label">Enable WAN Ping Respond :</td>
                          <td colSpan=3>&nbsp;
						  
						  <input name="wan_ping" type="checkbox" id="wan_ping" value="1">
						  <input type="hidden" id="wan_port_ping_response_enable" name="wan_port_ping_response_enable" value="<% CmoGetCfg("wan_port_ping_response_enable","none"); %>">
						  </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>


                  <div class=box>
                    <h2><strong>WAN port speed</strong></h2>
                    <table width="525" border=0 cellpadding=0>
                      <tr>
                        <td class="form_label">WAN Port Speed&nbsp;:</td>
                        <td width="64%" height=20 align=right><div align="left">
                          <select name="wan_port_speed" id="wan_port_speed">
							 <option value="10full">10Mbps</option>
                             <option value="100full">100Mbps</option>                           
                             <option value="auto">Auto 10/100Mbps</option>
                          </select>
</div>


</td>
                      </tr>
                    </table>
                  </div>
					<!--
					<div class=box>
                    <h2>GAMING MODE : </h2>
                    <P>If you are having difficulties playing some online games - please enable this mode.</P>

                    <table cellSpacing=1 cellPadding=1 width=525 border=0>
                      <tbody>
                        <tr>
                          <td align=right width=150>Enable GAMING mode :</td>
                          <td><input name="game" type=checkbox id="game" value="1"></td>
                        </tr>
                      </tbody>
                    </table></div>
					-->
<div class=box>
                    <h2><strong>Multicast Streams</strong></h2>
                    <table cellSpacing=1 cellPadding=1 width=525 border=0>
                      <tbody>
                        <tr>
                          <td align=right width=160 class="form_label">Enable Multicast Streams:</td>
                          <td width="358" colSpan=3>&nbsp;
						  
						  <input name="multi_enable" type=checkbox id="multi_enable" value="1">
						  <input type="hidden" id="multicast_stream_enable" name="multicast_stream_enable" value="<% CmoGetCfg("multicast_stream_enable","none"); %>">
						  </td>
                        </tr>
                      </tbody>
                    </table></form>
            </div>

                  
                   
              <!-- === END MAINCONTENT === -->
			  </div></td>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table width="125" border=0 
      cellPadding=2 cellSpacing=0 borderColor=#ffffff borderColorLight=#ffffff borderColorDark=#ffffff bgColor=#ffffff>
                  <tbody>
                    <tr>
                      <td id=help_text><strong>Helpful Hints..</strong><br>
                          <br> 
                          <span class="style1">For added security, it is recommended that you disable the <strong>WAN Ping Respond</strong> option.  Ping is often used by malicious Internet users to locate active networks or PCs.</span></p>
                       <!-- <p class="style1">&nbsp;&nbsp;Gaming Mode should be used when you are playing games on the Internet from behind the router.</p>-->
                       <p class="style1">If you are having trouble receiving multicast streams from the Internet, make sure the  Multicast Stream option is enabled. </p></td>
                    </tr>
                  </tbody>
                </table></td>
		</tr>
	</table>
	<table id="footer_container" border="0" cellpadding="0" cellspacing="0" width="838" align="center">
		<tr>
			<td width="125" align="center">&nbsp;&nbsp;<img src="wireless_bottom.gif" width="114" height="35"></td>
			<td width="10">&nbsp;</td><td>&nbsp;</td>
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
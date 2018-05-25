<html>
<head>
<script language="JavaScript" src="public.js"></script>
	<script language="JavaScript">
	var submit_button_flag = 0;
    var dDat = new Array();
	var dDat1 = new Array();
	
	<!-- repeat name=dynamic_dhcp_data -->

function onPageLoad(){
	var sel_dmz_enable = "<% CmoGetCfg("dmz_enable","none"); %>";
	var p_dmz_enable = get_by_id("dmz_host");
	if(sel_dmz_enable == "1"){
			p_dmz_enable.checked =true;
	}else{
			p_dmz_enable.checked =false;
	}
	
	var sel_pptp_pass_through = "<% CmoGetCfg("pptp_pass_through","none"); %>";
	var p_pptp_pass_through = get_by_id("pptp_ps");
	if(sel_pptp_pass_through == "1"){
			p_pptp_pass_through.checked =true;
	}else{
			p_pptp_pass_through.checked =false;
	}
	
	var sel_l2tp_pass_through = "<% CmoGetCfg("l2tp_pass_through","none"); %>";
	var p_l2tp_pass_through = get_by_id("l2tp_ps");
	if(sel_l2tp_pass_through == "1"){
			p_l2tp_pass_through.checked =true;
	}else{
			p_l2tp_pass_through.checked =false;
	}
	
	var sel_ipsec_pass_through = "<% CmoGetCfg("ipsec_pass_through","none"); %>";
	var p_ipsec_pass_through = get_by_id("ipsec_ps");
	if(sel_ipsec_pass_through == "1"){
			p_ipsec_pass_through.checked =true;
	}else{
			p_ipsec_pass_through.checked =false;
	}
	
	set_selectIndex(get_by_id("dmz_schedule").value, get_by_id("dmz_schedule_list"));
	
}

function clone_mac(){
   
	if (get_by_id("dhcp").selectedIndex > 0){
		get_by_id("dmz_ipaddr").value = get_by_id("dhcp").options[get_by_id("dhcp").selectedIndex].value;
	}else{
		alert(msg[SELECT_COMPUTER_ERROR]);
	}
}

	function send_request(){
		var dmzEnable = get_by_id("dmz_host");
		var dmz_ip = get_by_id("dmz_ipaddr").value;
		var ip_obj = new addr_obj(dmz_ip.split("."), IP_ADDRESS_DESC, false, INVALID_IP_ADDRESS, ZERO_IP_ADDRESS, -1, false);
	    var dmz_host = get_by_id("dmz_host");
		var pptp_ps = get_by_id("pptp_ps");
		var l2tp_ps = get_by_id("l2tp_ps");
		var ipsec_ps = get_by_id("ipsec_ps");
		
		if (dmzEnable.checked){
			if (!check_address(ip_obj)){				
				return false;
	   		}
	   	}
		
		if (dmz_host.checked==true){						
			get_by_id("dmz_enable").value = "1";
		}else{		
			get_by_id("dmz_enable").value = "0";
		}
		
		if (pptp_ps.checked==true){						
			get_by_id("pptp_pass_through").value = "1";
		}else{		
			get_by_id("pptp_pass_through").value = "0";
		}
		
		if (l2tp_ps.checked==true){						
			get_by_id("l2tp_pass_through").value = "1";
		}else{		
			get_by_id("l2tp_pass_through").value = "0";
		}
		
		if (ipsec_ps.checked==true){						
			get_by_id("ipsec_pass_through").value = "1";
		}else{		
			get_by_id("ipsec_pass_through").value = "0";
		}
		
		get_by_id("dmz_schedule").value = get_by_id("dmz_schedule_list").value;
		
		if(submit_button_flag == 0){
		submit_button_flag = 1;
		return true;
		}else{
		return false;
		}
		//return true;
	   	//send_submit("form1");
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

<form id="form1" name="form1" method="post" action="apply.cgi">
<input type="hidden" name="html_response_page" value="back.asp">
<input type="hidden" name="html_response_message" value="The setting is saved.">
<input type="hidden" name="html_response_return_page" value="adv_dmz.asp">



<input type="hidden" id="dhcp_list" name="dhcp_list" value="<% CmoGetList("dhcpd_leased_table"); %>">
<input type="hidden" id="dmz_schedule" name="dmz_schedule" value="<% CmoGetCfg("dmz_schedule","none"); %>">
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
                              <div id=sidenavoff>Firewall Settings</div>
                            <LI>
                              <div><a href="adv_wlan_perform.asp">advanced Wireless</a></div>
                            <LI>
                              <div><a href="adv_network.asp">advanced Network</a></div>
                            </LI>
                          </UL>
                          <!-- === END SIDENAV === -->
                      </div></td>
                    </tr>
                  </tbody>
                </table></td>
			
			<td valign="top" id="maincontent_container">
				<div id=maincontent>
				  <!-- === BEGIN MAINCONTENT === -->
                  <div id=box_header>
                    <h1> Firewall Settings : </h1>
                    <p>The Web Filter options allows you to set-up a list of allowed Web sites that can be used by multiple users. When Web Filter is enabled, all other Web sites not listed on this page will be blocked.</p>
                    <input name="button" type="submit" class=button_submit value="Save Settings" onClick="return send_request()">                    
                    <input name="button2" type=button class=button_submit value="Don't Save Settings"  onClick="window.location.href='adv_dmz.asp'">
                  </div>
                  <div class=box>
                    <h2>DMZ HOST : </h2>
                    <p>The DMZ (Demilitarized Zone) option provides you with an option to set a single computer on your network outside of the router. If you have a computer that cannot run Internet applications successfully from behind the router, then you can place the computer into the DMZ for unrestricted Internet access. </p>
                    <p><strong>Note:</strong> Putting a computer in the DMZ may expose that computer to a variety of security risks. Use of this option is only recommended as a last resort.</p>
                    <table cellSpacing=1 cellPadding=1 width=525 border=0>
                      <tbody>
                        <tr>
                          <td width=155 class="form_label">
						  <input type="hidden" id="dmz_enable" name="dmz_enable" value="<% CmoGetCfg("dmz_enable","none"); %>">
						  Enable DMZ Host :</td>
                          <td colSpan=3>&nbsp;
						   
						  <input name="dmz_host" type=checkbox id="dmz_host" value="1"></td>
                        </tr>
                        <tr>
                          <td width="155" class="form_label">DMZ IP Address :</td>
                          <td width="258" valign="bottom" colspan="2"><input type=text id="dmz_ipaddr" name="dmz_ipaddr" size=16 maxlength=15 value="<% CmoGetCfg("dmz_ipaddr","none"); %>">
                          	<input name="button22" type=button value="<<" style="width: 24; height: 24" onClick="clone_mac()">
                            <select id=dhcp name=dhcp size=1>
                              <option value="-1">Computer Name</option>
                              <script>set_dhcp_list()</script>
                            </select>
						  </td>
                          <td width="3">&nbsp;</td>
                        </tr>
                        <tr>
                          <td width=144 class="form_label">Schedule :</td>
                          <td width=132>
                          	<select id="dmz_schedule_list" name="dmz_schedule_list" style="width:80">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                            </select>
                          </td>
                          <td width=167>&nbsp;</td>
                          <td width="69">&nbsp;</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
<div class=box>
                    <h2>VPN Passthrough : </h2>
                    
                    <table cellSpacing=1 cellPadding=1 width=525 border=0>
                      <tbody>
                        <tr>
                          <td width=155 class="form_label">Enable PPTP Passthough :</td>
                          <td width="360">&nbsp;
						  
						  <input name="pptp_ps" type=checkbox id="pptp_ps" value="1">
						  <input type="hidden" id="pptp_pass_through" name="pptp_pass_through" value="<% CmoGetCfg("pptp_pass_through","none"); %>">
						  </td>
                        </tr>
                        <tr>
                          <td width=155 class="form_label">Enable L2TP Passthough :</td>
                          <td>&nbsp;
						  
						  <input name="l2tp_ps" type=checkbox id="l2tp_ps" value="1">
						  <input type="hidden" id="l2tp_pass_through" name="l2tp_pass_through" value="<% CmoGetCfg("l2tp_pass_through","none"); %>">
						  </td>
                        </tr>
                        <tr>
                          <td width=155 class="form_label">Enable IPSec Passthough :</td>
                          <td>&nbsp;
						  
						  <input name="ipsec_ps" type=checkbox id="ipsec_ps" value="1">
						  <input type="hidden" id="ipsec_pass_through" name="ipsec_pass_through" value="<% CmoGetCfg("ipsec_pass_through","none"); %>">
						  </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  
                </div></td>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table borderColor=#ffffff cellSpacing=0 borderColorDark=#ffffff 
      cellPadding=2 bgColor=#ffffff borderColorLight=#ffffff border=0>
                  <tbody>
                    <tr>
                      <td id=help_text><strong>Helpful Hints..</strong><br>
                          <br>
                          <span class="style1">Only enable the DMZ option as a last resort.  If you are having trouble using an application from a computer behind the router, first try opening ports associated with the application in the Virtual Server or Port Forwarding sections. </span></p>
                          <p class="style1">Make sure VPN passthrough is enabled if you are trying to use a VPN client from behind the router.  </p>
                          <p class="style1"> VPN Passthrough will only function if the VPN client being used runs on the standards ports associated with the VPN connection type. If you are having problems getting your VPN client connected from behind the router and these VPN passthrough options are enabled, please contact your network administrator to find out if any nonstandard ports or options are being used. </p></td>
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
	</table></form>
<br>
<div align="center">Copyright &copy; 2004-2005 D-Link Systems, Inc.</div>
<br>
</body>
<script>
	onPageLoad();
</script>
</html>
<html>
<head>
<link rel="STYLESHEET" type="text/css" href="css_router.css">
<script language="JavaScript" src="public.js"></script>
<script language="JavaScript">
var submit_button_flag = 0;
function onPageLoad(){
	var url_domain_filter_type= "<% CmoGetCfg("url_domain_filter_type","none"); %>";
		if(url_domain_filter_type=="disable"){
				get_by_id("enable").selectedIndex = 0;				
		}else if(url_domain_filter_type=="list_allow"){
				get_by_id("enable").selectedIndex = 1;
		}else{
				get_by_id("enable").selectedIndex = 2;
		}
		
		
}	

function set_virtual_server(){
		for (var i = 0; i < 40; i++){
			var temp_mf;
			var temp_sc;
			
			if (i > 9){
				temp_mf = get_by_id("url_domain_filter_" + i).value;
				temp_sc = get_by_id("url_domain_filter_schedule_" + i).value;
			}else{
				temp_mf = get_by_id("url_domain_filter_0" + i).value;		
				temp_sc = get_by_id("url_domain_filter_schedule_0" + i).value;
			}
			
			
			if (temp_mf.length > 1){
				get_by_id("url_" + (i+1)).value = temp_mf;
				set_selectIndex(temp_sc, get_by_id("schedule" + (i+1)));
			}
		}
}

	
	
	function clear_url(){
		for (var i = 1; i <= 40; i++){
			get_by_id("url_" + i).value = "";
			get_by_id("schedule" + i).selectedIndex = 0;
		}
	}
	
	function send_request(){
		
		for (var i = 1; i <= 40; i++){
			var temp_url = get_by_id("url_" + i).value;			
			if (temp_url != ""){
				for (var j = i+1; j <= 40; j++){
					if (temp_url == get_by_id("url_" + j).value){
						alert(msg[DUPLICATE_URL_ERROR]);
						return;
					}
				}
			}
		}
		
		
		var count = 0;		
		for (var i = 1; i <= 40; i++){
			var temp_mac;
			var temp_sc;
			if (i > 10){
				get_by_id("url_domain_filter_" + (i-1)).value = "";	
				get_by_id("url_domain_filter_schedule_" + (i-1)).value = "";
			}else{
				get_by_id("url_domain_filter_0" + (i-1)).value = "";
				get_by_id("url_domain_filter_schedule_0" + (i-1)).value = "";
			}
			
			
			if (get_by_id("url_" + i).value != "" ){
			
				
				if (count > 9){
					temp_mac = get_by_id("url_domain_filter_" + count);
					temp_sc = get_by_id("url_domain_filter_schedule_" + count);
				}else{
					temp_mac = get_by_id("url_domain_filter_0" + count);
					temp_sc = get_by_id("url_domain_filter_schedule_0" + count);
				}
				
				
				temp_mac.value = get_by_id("url_" + i).value;
				temp_sc.value = get_by_id("schedule" + i).value;
				count++;			
			}		
		}
		
		
		
		if(get_by_id("enable").selectedIndex == 0){
			get_by_id("url_domain_filter_type").value = "disable";
		}else if(get_by_id("enable").selectedIndex == 1){
			get_by_id("url_domain_filter_type").value = "list_allow";
		}else if(get_by_id("enable").selectedIndex == 2){
			get_by_id("url_domain_filter_type").value = "list_deny";
		}else{
			alert("type error");
		}
		
		
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
                              <div id=sidenavoff>Website Filter</div>


                            <LI>
                              <div><a href="adv_dmz.asp">Firewall Settings</a></div>
                            <LI>
                              <div><a href="adv_wlan_perform.asp">advanced Wireless</a></div>
                            <LI>
                              <div><a href="adv_network.asp">advanced Network</a></div>
                            </LI>
                          </UL>                      
                      </div></td>
                    </tr>
                  </tbody>
                </table></td>
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
				<input type="hidden" name="html_response_return_page" value="adv_filters_url.asp">
                <input type="hidden" id="url_domain_filter_00" name="url_domain_filter_00" value="<% CmoGetCfg("url_domain_filter_00","none"); %>">
                <input type="hidden" id="url_domain_filter_01" name="url_domain_filter_01" value="<% CmoGetCfg("url_domain_filter_01","none"); %>">
                <input type="hidden" id="url_domain_filter_02" name="url_domain_filter_02" value="<% CmoGetCfg("url_domain_filter_02","none"); %>">
                <input type="hidden" id="url_domain_filter_03" name="url_domain_filter_03" value="<% CmoGetCfg("url_domain_filter_03","none"); %>">
                <input type="hidden" id="url_domain_filter_04" name="url_domain_filter_04" value="<% CmoGetCfg("url_domain_filter_04","none"); %>">
                <input type="hidden" id="url_domain_filter_05" name="url_domain_filter_05" value="<% CmoGetCfg("url_domain_filter_05","none"); %>">
                <input type="hidden" id="url_domain_filter_06" name="url_domain_filter_06" value="<% CmoGetCfg("url_domain_filter_06","none"); %>">
                <input type="hidden" id="url_domain_filter_07" name="url_domain_filter_07" value="<% CmoGetCfg("url_domain_filter_07","none"); %>">
                <input type="hidden" id="url_domain_filter_08" name="url_domain_filter_08" value="<% CmoGetCfg("url_domain_filter_08","none"); %>">
                <input type="hidden" id="url_domain_filter_09" name="url_domain_filter_09" value="<% CmoGetCfg("url_domain_filter_09","none"); %>">
                <input type="hidden" id="url_domain_filter_10" name="url_domain_filter_10" value="<% CmoGetCfg("url_domain_filter_10","none"); %>">
                <input type="hidden" id="url_domain_filter_11" name="url_domain_filter_11" value="<% CmoGetCfg("url_domain_filter_11","none"); %>">
                <input type="hidden" id="url_domain_filter_12" name="url_domain_filter_12" value="<% CmoGetCfg("url_domain_filter_12","none"); %>">
                <input type="hidden" id="url_domain_filter_13" name="url_domain_filter_13" value="<% CmoGetCfg("url_domain_filter_13","none"); %>">
                <input type="hidden" id="url_domain_filter_14" name="url_domain_filter_14" value="<% CmoGetCfg("url_domain_filter_14","none"); %>">
                <input type="hidden" id="url_domain_filter_15" name="url_domain_filter_15" value="<% CmoGetCfg("url_domain_filter_15","none"); %>">
                <input type="hidden" id="url_domain_filter_16" name="url_domain_filter_16" value="<% CmoGetCfg("url_domain_filter_16","none"); %>">
                <input type="hidden" id="url_domain_filter_17" name="url_domain_filter_17" value="<% CmoGetCfg("url_domain_filter_17","none"); %>">
                <input type="hidden" id="url_domain_filter_18" name="url_domain_filter_18" value="<% CmoGetCfg("url_domain_filter_18","none"); %>">
                <input type="hidden" id="url_domain_filter_19" name="url_domain_filter_19" value="<% CmoGetCfg("url_domain_filter_19","none"); %>">
				<input type="hidden" id="url_domain_filter_20" name="url_domain_filter_20" value="<% CmoGetCfg("url_domain_filter_20","none"); %>">
                <input type="hidden" id="url_domain_filter_21" name="url_domain_filter_21" value="<% CmoGetCfg("url_domain_filter_21","none"); %>">
                <input type="hidden" id="url_domain_filter_22" name="url_domain_filter_22" value="<% CmoGetCfg("url_domain_filter_22","none"); %>">
                <input type="hidden" id="url_domain_filter_23" name="url_domain_filter_23" value="<% CmoGetCfg("url_domain_filter_23","none"); %>">
                <input type="hidden" id="url_domain_filter_24" name="url_domain_filter_24" value="<% CmoGetCfg("url_domain_filter_24","none"); %>">
                <input type="hidden" id="url_domain_filter_25" name="url_domain_filter_25" value="<% CmoGetCfg("url_domain_filter_25","none"); %>">
                <input type="hidden" id="url_domain_filter_26" name="url_domain_filter_26" value="<% CmoGetCfg("url_domain_filter_26","none"); %>">
                <input type="hidden" id="url_domain_filter_27" name="url_domain_filter_27" value="<% CmoGetCfg("url_domain_filter_27","none"); %>">
                <input type="hidden" id="url_domain_filter_28" name="url_domain_filter_28" value="<% CmoGetCfg("url_domain_filter_28","none"); %>">
                <input type="hidden" id="url_domain_filter_29" name="url_domain_filter_29" value="<% CmoGetCfg("url_domain_filter_29","none"); %>">
                <input type="hidden" id="url_domain_filter_30" name="url_domain_filter_30" value="<% CmoGetCfg("url_domain_filter_30","none"); %>">
                <input type="hidden" id="url_domain_filter_31" name="url_domain_filter_31" value="<% CmoGetCfg("url_domain_filter_31","none"); %>">
                <input type="hidden" id="url_domain_filter_32" name="url_domain_filter_32" value="<% CmoGetCfg("url_domain_filter_32","none"); %>">
                <input type="hidden" id="url_domain_filter_33" name="url_domain_filter_33" value="<% CmoGetCfg("url_domain_filter_33","none"); %>">
                <input type="hidden" id="url_domain_filter_34" name="url_domain_filter_34" value="<% CmoGetCfg("url_domain_filter_34","none"); %>">
                <input type="hidden" id="url_domain_filter_35" name="url_domain_filter_35" value="<% CmoGetCfg("url_domain_filter_35","none"); %>">
                <input type="hidden" id="url_domain_filter_36" name="url_domain_filter_36" value="<% CmoGetCfg("url_domain_filter_36","none"); %>">
                <input type="hidden" id="url_domain_filter_37" name="url_domain_filter_37" value="<% CmoGetCfg("url_domain_filter_37","none"); %>">
                <input type="hidden" id="url_domain_filter_38" name="url_domain_filter_38" value="<% CmoGetCfg("url_domain_filter_38","none"); %>">
                <input type="hidden" id="url_domain_filter_39" name="url_domain_filter_39" value="<% CmoGetCfg("url_domain_filter_39","none"); %>">
				
				
				
				
				<input type="hidden" id="url_domain_filter_schedule_00" name="url_domain_filter_schedule_00" value="<% CmoGetCfg("url_domain_filter_schedule_00","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_01" name="url_domain_filter_schedule_01" value="<% CmoGetCfg("url_domain_filter_schedule_01","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_02" name="url_domain_filter_schedule_02" value="<% CmoGetCfg("url_domain_filter_schedule_02","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_03" name="url_domain_filter_schedule_03" value="<% CmoGetCfg("url_domain_filter_schedule_03","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_04" name="url_domain_filter_schedule_04" value="<% CmoGetCfg("url_domain_filter_schedule_04","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_05" name="url_domain_filter_schedule_05" value="<% CmoGetCfg("url_domain_filter_schedule_05","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_06" name="url_domain_filter_schedule_06" value="<% CmoGetCfg("url_domain_filter_schedule_06","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_07" name="url_domain_filter_schedule_07" value="<% CmoGetCfg("url_domain_filter_schedule_07","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_08" name="url_domain_filter_schedule_08" value="<% CmoGetCfg("url_domain_filter_schedule_08","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_09" name="url_domain_filter_schedule_09" value="<% CmoGetCfg("url_domain_filter_schedule_09","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_10" name="url_domain_filter_schedule_10" value="<% CmoGetCfg("url_domain_filter_schedule_10","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_11" name="url_domain_filter_schedule_11" value="<% CmoGetCfg("url_domain_filter_schedule_11","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_12" name="url_domain_filter_schedule_12" value="<% CmoGetCfg("url_domain_filter_schedule_12","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_13" name="url_domain_filter_schedule_13" value="<% CmoGetCfg("url_domain_filter_schedule_13","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_14" name="url_domain_filter_schedule_14" value="<% CmoGetCfg("url_domain_filter_schedule_14","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_15" name="url_domain_filter_schedule_15" value="<% CmoGetCfg("url_domain_filter_schedule_15","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_16" name="url_domain_filter_schedule_16" value="<% CmoGetCfg("url_domain_filter_schedule_16","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_17" name="url_domain_filter_schedule_17" value="<% CmoGetCfg("url_domain_filter_schedule_17","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_18" name="url_domain_filter_schedule_18" value="<% CmoGetCfg("url_domain_filter_schedule_18","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_19" name="url_domain_filter_schedule_19" value="<% CmoGetCfg("url_domain_filter_schedule_19","none"); %>">
				<input type="hidden" id="url_domain_filter_schedule_20" name="url_domain_filter_schedule_20" value="<% CmoGetCfg("url_domain_filter_schedule_20","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_21" name="url_domain_filter_schedule_21" value="<% CmoGetCfg("url_domain_filter_schedule_21","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_22" name="url_domain_filter_schedule_22" value="<% CmoGetCfg("url_domain_filter_schedule_22","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_23" name="url_domain_filter_schedule_23" value="<% CmoGetCfg("url_domain_filter_schedule_23","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_24" name="url_domain_filter_schedule_24" value="<% CmoGetCfg("url_domain_filter_schedule_24","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_25" name="url_domain_filter_schedule_25" value="<% CmoGetCfg("url_domain_filter_schedule_25","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_26" name="url_domain_filter_schedule_26" value="<% CmoGetCfg("url_domain_filter_schedule_26","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_27" name="url_domain_filter_schedule_27" value="<% CmoGetCfg("url_domain_filter_schedule_27","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_28" name="url_domain_filter_schedule_28" value="<% CmoGetCfg("url_domain_filter_schedule_28","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_29" name="url_domain_filter_schedule_29" value="<% CmoGetCfg("url_domain_filter_schedule_29","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_30" name="url_domain_filter_schedule_30" value="<% CmoGetCfg("url_domain_filter_schedule_30","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_31" name="url_domain_filter_schedule_31" value="<% CmoGetCfg("url_domain_filter_schedule_31","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_32" name="url_domain_filter_schedule_32" value="<% CmoGetCfg("url_domain_filter_schedule_32","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_33" name="url_domain_filter_schedule_33" value="<% CmoGetCfg("url_domain_filter_schedule_33","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_34" name="url_domain_filter_schedule_34" value="<% CmoGetCfg("url_domain_filter_schedule_34","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_35" name="url_domain_filter_schedule_35" value="<% CmoGetCfg("url_domain_filter_schedule_35","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_36" name="url_domain_filter_schedule_36" value="<% CmoGetCfg("url_domain_filter_schedule_36","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_37" name="url_domain_filter_schedule_37" value="<% CmoGetCfg("url_domain_filter_schedule_37","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_38" name="url_domain_filter_schedule_38" value="<% CmoGetCfg("url_domain_filter_schedule_38","none"); %>">
                <input type="hidden" id="url_domain_filter_schedule_39" name="url_domain_filter_schedule_39" value="<% CmoGetCfg("url_domain_filter_schedule_39","none"); %>">
				
			<td valign="top" id="maincontent_container">
				<div id=maincontent>				  
                  <div id=box_header>
                    <h1>Website Filtering Rules : </h1>
                    <p>The Website Filter option allows you to set-up a list of Websites that the users on your network will either be allowed or denied access to.</p>
                    <input name="apply" type="submit" class=button_submit value="Save Settings" onClick="return send_request()">
                    <input name="cancel" type=button class=button_submit value="Don't Save Settings"  onClick="window.location.href='adv_filters_url.asp'">
                  </div>
                  <div class=box>
                    <h2>40 - Website Filtering Rules</h2>
                    <table cellSpacing=1 cellPadding=2 width=500 border=0>
                      <tbody>
                        <tr>
                          <td>Configure Website Filtering below:</td>
                        </tr>
                        <tr>
                          <td>
						<input type="hidden" id="url_domain_filter_type" name="url_domain_filter_type" value="<% CmoGetCfg("url_domain_filter_type","none"); %>">						  						  
						  <select name="enable" id="enable">
                              <option value="0">Turn Website Filtering OFF</option>
                              <option value="2">Turn Website Filtering ON and ALLOW computers access to ONLY these sites</option>
                              <option value="1">Turn Website Filtering ON and DENY computers access to ONLY these sites</option>
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <td><input name="clear" type=button value="Clear the list below..." onClick="clear_url()"></td>
                        </tr>
                      </tbody>
                    </table>
                    <br>
                    <table borderColor=#ffffff cellSpacing=1 cellPadding=2 width=525 
      bgColor=#dfdfdf border=1>
                      <tbody>
                        <tr>
                          <td>Website URL/Domain</td>
                          <td>&nbsp;</td>
                          <td>Website URL/Domain</td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td><input id="url_1" name="url_1" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule1" name="schedule1">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                          <td><input id="url_21" name="url_21" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule21" name="schedule21">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                        </tr>
                        <tr>
                          <td><input id="url_2" name="url_2" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule2" name="schedule2">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                          <td><input id="url_22" name="url_22" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule22" name="schedule22">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                        </tr>
                        <tr>
                          <td><input id="url_3" name="url_3" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule3" name="schedule3">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                          <td><input id="url_23" name="url_23" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule23" name="schedule23">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                        </tr>
                        <tr>
                          <td><input id="url_4" name="url_4" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule4" name="schedule4">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                          <td><input id="url_24" name="url_24" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule24" name="schedule24">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                        </tr>
                        <tr>
                          <td><input id="url_5" name="url_5" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule5" name="schedule5">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                          <td><input id="url_25" name="url_25" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule25" name="schedule25">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                        </tr>
                        <tr>
                          <td><input id="url_6" name="url_6" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule6" name="schedule6">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                          <td><input id="url_26" name="url_26" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule26" name="schedule26">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                        </tr>
                        <tr>
                          <td><input id="url_7" name="url_7" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule7" name="schedule7">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                          <td><input id="url_27" name="url_27" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule27" name="schedule27">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                        </tr>
                        <tr>
                          <td><input id="url_8" name="url_8" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule8" name="schedule8">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                          <td><input id="url_28" name="url_28" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule28" name="schedule28">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                        </tr>
                        <tr>
                          <td><input id="url_9" name="url_9" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule9" name="schedule9">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                          <td><input id="url_29" name="url_29" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule29" name="schedule29">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                        </tr>
                        <tr>
                          <td><input id="url_10" name="url_10" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule10" name="schedule10">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                          <td><input id="url_30" name="url_30" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule30" name="schedule30">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                        </tr>
                        <tr>
                          <td><input id="url_11" name="url_11" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule11" name="schedule11">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                          <td><input id="url_31" name="url_31" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule31" name="schedule31">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                        </tr>
                        <tr>
                          <td><input id="url_12" name="url_12" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule12" name="schedule12">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                          <td><input id="url_32" name="url_32" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule32" name="schedule32">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                        </tr>
                        <tr>
                          <td><input id="url_13" name="url_13" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule13" name="schedule13">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                          <td><input id="url_33" name="url_33" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule33" name="schedule33">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                        </tr>
                        <tr>
                          <td><input id="url_14" name="url_14" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule14" name="schedule14">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                          <td><input id="url_34" name="url_34" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule34" name="schedule34">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                        </tr>
                        <tr>
                          <td><input id="url_15" name="url_15" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule15" name="schedule15">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                          <td><input id="url_35" name="url_35" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule35" name="schedule35">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                        </tr>
                        <tr>
                          <td><input id="url_16" name="url_16" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule16" name="schedule16">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                          <td><input id="url_36" name="url_36" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule36" name="schedule36">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                        </tr>
                        <tr>
                          <td><input id="url_17" name="url_17" maxLength="40" size="30"></td>
                          <td align=middle>
                            <select id="schedule17" name="schedule17">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                          <td><input id="url_37" name="url_37" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule37" name="schedule37">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                        </tr>
                        <tr>
                          <td><input id="url_18" name="url_18" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule18" name="schedule18">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                          <td><input id="url_38" name="url_38" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule38" name="schedule38">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                        </tr>
                        <tr>
                          <td><input id="url_19" name="url_19" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule19" name="schedule19">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                          <td><input id="url_39" name="url_39" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule39" name="schedule39">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                        </tr>
                        <tr>
                          <td><input id="url_20" name="url_20" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule20" name="schedule20">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                          <td><input id="url_40" name="url_40" maxLength="40" size="30">                          </td>
                          <td align=middle>
                            <select id="schedule40" name="schedule40">
                              <option value="Always">Always</option>
                              <script>set_schedule_option()</script>
                          </select></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>           
			  </div></td></form>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table width="125" border=0 
      cellPadding=2 cellSpacing=0 borderColor=#ffffff borderColorLight=#ffffff borderColorDark=#ffffff bgColor=#ffffff>
                  <tbody>
                    <tr>
                      <td id=help_text><b>Helpful Hints..</b><br>
                          <br>
                          <span class="style1">Create a list of Websites that you would like the devices on your network to be allowed or denied access to.</span></p>
                          <p class="style1">Keywords can be entered in this list in order to block any URL containing the keyword entered. </p></td>
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
 set_virtual_server();                     
</script>
</html>
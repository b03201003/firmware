<html>
<head>
<link rel="STYLESHEET" type="text/css" href="css_router.css">
<script language="JavaScript" src="public.js"></script>
<script language="JavaScript">
var submit_button_flag = 0;
function onPageLoad(){
	var sel_wlan0_auto_txrate ="<% CmoGetCfg("wlan0_auto_txrate","none"); %>";
	var p_wlan0_auto_txrate = get_by_name("wlan0_auto_txrate");
	if(sel_wlan0_auto_txrate == "0"){
		p_wlan0_auto_txrate[1].checked = true;
	}else{
		p_wlan0_auto_txrate[0].checked = true;
	}


	var sel_wlan0_11b_txrate = "<% CmoGetCfg("wlan0_11b_txrate","none"); %>";
	if(sel_wlan0_11b_txrate == "1"){
			get_by_id("wlan0_11b_txrate").selectedIndex = 0;
	}else if(sel_wlan0_11b_txrate == "2"){
			get_by_id("wlan0_11b_txrate").selectedIndex = 1;
	}else if(sel_wlan0_11b_txrate == "5.5"){
			get_by_id("wlan0_11b_txrate").selectedIndex = 2;
	}else if(sel_wlan0_11b_txrate == "11"){
			get_by_id("wlan0_11b_txrate").selectedIndex = 3;														
	}else{
	alert("11b tx rate error");
//			get_by_id("wlan0_txrate").selectedIndex = 13;
	}
	
	var sel_wlan0_11g_txrate = "<% CmoGetCfg("wlan0_11g_txrate","none"); %>";
	if(sel_wlan0_11g_txrate == "9"){
			get_by_id("wlan0_11g_txrate").selectedIndex = 0;
	}else if(sel_wlan0_11g_txrate == "12"){
			get_by_id("wlan0_11g_txrate").selectedIndex = 1;
	}else if(sel_wlan0_11g_txrate == "18"){
			get_by_id("wlan0_11g_txrate").selectedIndex = 2;
	}else if(sel_wlan0_11g_txrate == "24"){
			get_by_id("wlan0_11g_txrate").selectedIndex = 3;
	}else if(sel_wlan0_11g_txrate == "36"){
			get_by_id("wlan0_11g_txrate").selectedIndex = 4;
	}else if(sel_wlan0_11g_txrate == "48"){
			get_by_id("wlan0_11g_txrate").selectedIndex = 5;
	}else if(sel_wlan0_11g_txrate == "54"){
			get_by_id("wlan0_11g_txrate").selectedIndex = 6;																
	}else{
	alert("11g tx rate error");
//			get_by_id("wlan0_txrate").selectedIndex = 13;
	}
	
	/*
	var sel_wlan0_txpower = "<% CmoGetCfg("wlan0_txpower","none"); %>";
	if(sel_wlan0_txpower == "19"){
			get_by_id("wlan0_txpower").selectedIndex = 0;		
	}else if(sel_wlan0_txpower == "10"){
			get_by_id("wlan0_txpower").selectedIndex = 1;
	}else if(sel_wlan0_txpower == "5"){
			get_by_id("wlan0_txpower").selectedIndex = 2;														
	}else{
			get_by_id("wlan0_txpower").selectedIndex = 3;
	}
	*/
	
	var sel_wlan0_short_preamble ="<% CmoGetCfg("wlan0_short_preamble","none"); %>";
	var p_wlan0_short_preamble = get_by_name("wlan0_short_preamble");
	if(sel_wlan0_short_preamble == "1"){
		p_wlan0_short_preamble[0].checked = true;
	}else{
		p_wlan0_short_preamble[1].checked = true;
	}
	
	/*
	var sel_wlan0_cts ="<% CmoGetCfg("wlan0_cts","none"); %>";
	var p_wlan0_cts = get_by_name("wlan0_cts");
	if(sel_wlan0_cts == "0"){
		p_wlan0_cts[0].checked = true;
	}else if(sel_wlan0_cts == "1"){
		p_wlan0_cts[1].checked = true;
	}else{
		p_wlan0_cts[2].checked = true;
	}
	*/
	
	var sel_wlan0_protection ="<% CmoGetCfg("wlan0_protection","none"); %>";
	var p_wlan0_protection = get_by_name("wlan0_protection");
	if(sel_wlan0_protection == "0"){
		p_wlan0_protection[1].checked = true;
	}else{
		p_wlan0_protection[0].checked = true;
	}
	
	/*
	var sel_wlan0_wmm_enable ="<% CmoGetCfg("wlan0_wmm_enable","none"); %>";
	var p_wlan0_wmm_enable = get_by_name("wlan0_wmm_enable");
	if(sel_wlan0_wmm_enable == "0"){
		p_wlan0_wmm_enable[1].checked = true;
	}else{
		p_wlan0_wmm_enable[0].checked = true;
	}
	*/
	
	var sel_wlan0_11n_txrate = "<% CmoGetCfg("wlan0_11n_txrate","none"); %>";
	if(sel_wlan0_11n_txrate == "MCS0"){
			get_by_id("wlan0_11n_txrate").selectedIndex = 0;		
	}else if(sel_wlan0_11n_txrate == "MCS1"){
			get_by_id("wlan0_11n_txrate").selectedIndex = 1;
	}else if(sel_wlan0_11n_txrate == "MCS2"){
			get_by_id("wlan0_11n_txrate").selectedIndex = 2;
	}else if(sel_wlan0_11n_txrate == "MCS3"){
			get_by_id("wlan0_11n_txrate").selectedIndex = 3;
	}else if(sel_wlan0_11n_txrate == "MCS4"){
			get_by_id("wlan0_11n_txrate").selectedIndex = 4;
	}else if(sel_wlan0_11n_txrate == "MCS5"){
			get_by_id("wlan0_11n_txrate").selectedIndex = 5;
	}else if(sel_wlan0_11n_txrate == "MCS6"){
			get_by_id("wlan0_11n_txrate").selectedIndex = 6;
	}else if(sel_wlan0_11n_txrate == "MCS7"){
			get_by_id("wlan0_11n_txrate").selectedIndex = 7;
	}else if(sel_wlan0_11n_txrate == "MCS8"){
			get_by_id("wlan0_11n_txrate").selectedIndex = 8;
	}else if(sel_wlan0_11n_txrate == "MCS9"){
			get_by_id("wlan0_11n_txrate").selectedIndex = 9;
	}else if(sel_wlan0_11n_txrate == "MCS10"){
			get_by_id("wlan0_11n_txrate").selectedIndex = 10;
	}else if(sel_wlan0_11n_txrate == "MCS11"){
			get_by_id("wlan0_11n_txrate").selectedIndex = 11;
	}else if(sel_wlan0_11n_txrate == "MCS12"){
			get_by_id("wlan0_11n_txrate").selectedIndex = 12;
	}else if(sel_wlan0_11n_txrate == "MCS13"){
			get_by_id("wlan0_11n_txrate").selectedIndex = 13;
	}else if(sel_wlan0_11n_txrate == "MCS14"){
			get_by_id("wlan0_11n_txrate").selectedIndex = 14;
	}else if(sel_wlan0_11n_txrate == "MCS15"){
			get_by_id("wlan0_11n_txrate").selectedIndex = 15;		
	}else{
			alert("11n rate error");
	}
	/*
	var sel_wlan0_amsdu ="<% CmoGetCfg("wlan0_amsdu","none"); %>";
	var p_wlan0_amsdu = get_by_name("wlan0_amsdu");
	if(sel_wlan0_amsdu == "disable"){
		p_wlan0_amsdu[0].checked = true;
	}else if(sel_wlan0_amsdu == "4k"){
		p_wlan0_amsdu[1].checked = true;
	}else{
		p_wlan0_amsdu[2].checked = true;
	}
	*/
	/*
	var sel_wlan0_channel_bandwidth ="<% CmoGetCfg("wlan0_channel_bandwidth","none"); %>";
	var p_wlan0_channel_bandwidth = get_by_name("wlan0_channel_bandwidth");
	if(sel_wlan0_channel_bandwidth == "auto"){
		p_wlan0_channel_bandwidth[0].checked = true;
	}else if(sel_wlan0_channel_bandwidth == "20"){
		p_wlan0_channel_bandwidth[1].checked = true;
	}else{
		p_wlan0_channel_bandwidth[2].checked = true;
	}
	*/
	/*
	var sel_wlan0_guard_interval ="<% CmoGetCfg("wlan0_guard_interval","none"); %>";
	var p_wlan0_guard_interval = get_by_name("wlan0_guard_interval");
	if(sel_wlan0_guard_interval == "auto"){
		p_wlan0_guard_interval[0].checked = true;
	}else if(sel_wlan0_guard_interval == "short"){
		p_wlan0_guard_interval[1].checked = true;
	}else{
		p_wlan0_guard_interval[2].checked = true;
	}
	*/
	/*
	var sel_wlan0_ext_subchannel ="<% CmoGetCfg("wlan0_ext_subchannel","none"); %>";
	var p_wlan0_ext_subchannel = get_by_name("wlan0_ext_subchannel");
	if(sel_wlan0_ext_subchannel == "auto"){
		p_wlan0_ext_subchannel[0].checked = true;
	}else if(sel_wlan0_ext_subchannel == "lower"){
		p_wlan0_ext_subchannel[1].checked = true;
	}else{
		p_wlan0_ext_subchannel[2].checked = true;
	}
	*/
	/*
	var sel_wlan0_11n_protection ="<% CmoGetCfg("wlan0_11n_protection","none"); %>";
	var p_wlan0_11n_protection = get_by_name("wlan0_11n_protection");
	if(sel_wlan0_11n_protection == "disable"){
		p_wlan0_11n_protection[3].checked = true;
	}else if(sel_wlan0_11n_protection == "20"){
		p_wlan0_11n_protection[1].checked = true;
	}else if(sel_wlan0_11n_protection == "20_40"){
		p_wlan0_11n_protection[2].checked = true;
	}else if(sel_wlan0_11n_protection == "auto"){
		p_wlan0_11n_protection[0].checked = true;
	}else{
		alert("11n protection");
	}
	*/
}

function dis_tx_rate(){
	var p_wlan0_auto_txrate = get_by_name("wlan0_auto_txrate");
	if(p_wlan0_auto_txrate[0].checked == true){
		get_by_id("wlan0_11b_txrate").disabled = true;
		get_by_id("wlan0_11g_txrate").disabled = true;
		get_by_id("wlan0_11n_txrate").disabled = true;
	}else if(p_wlan0_auto_txrate[1].checked == true){
		get_by_id("wlan0_11b_txrate").disabled = false;
		get_by_id("wlan0_11g_txrate").disabled = false;
		get_by_id("wlan0_11n_txrate").disabled = false;
	}else{
		alert("disable tx rate error.");
	}
	

}

	
	/*
	function change_tx(){
		var cts = get_by_name("wlan0_cts");
		var is_disabled;
		
		if (get_by_id("wlan0_txrate").selectedIndex != 0){		
			cts[0].checked = true;	
			is_disabled = true;		
		}else{
		    if (cts[0].checked)
		    	cts[2].checked = true;
			is_disabled = false;
		}
		
		cts[0].disabled = !is_disabled;
		cts[1].disabled = is_disabled;
		cts[2].disabled = is_disabled;
	}
	*/
	
	function check_perform(which_one){		
    	var obj;
    	var temp_obj;
    	
    	switch(which_one){
    		case 0 :
    			temp_obj = get_by_id("wlan0_beacon_interval");
    			obj = new varible_obj(temp_obj.value, "Beacon Interval", 20, 1000, false);
    			break;
    		case 1 :
    			temp_obj = get_by_id("wlan0_rts_threshold");
    			obj = new varible_obj(temp_obj.value, "RTS Threshold", 256, 2346, false);
    			break;
    		case 2 :
				//no fragmemtation now, so just take beacon avoid error.
				temp_obj = get_by_id("wlan0_beacon_interval");
    			obj = new varible_obj(temp_obj.value, "Beacon Interval", 20, 1000, false);
    			break;
			
				/*
    			temp_obj = get_by_id("wlan0_fragmemtation");
    			obj = new varible_obj(temp_obj.value, "Fragmentation", 1500, 2346, true);
    			break;
				*/
    		case 3 :
    			temp_obj = get_by_id("wlan0_dtim");
    			obj = new varible_obj(temp_obj.value, "DTIM Interval", 1, 5, false);
    			break;
    	}
    	
    	if (check_varible(obj)){
    		return true;
    	}else {
        	temp_obj.value = temp_obj.defaultValue;
        	return false;
    	}         
    }
	
	function send_request(){
		var is_submit = false;
    	
		for (var i = 0; i < 4; i++){
			is_submit = check_perform(i);
			
			if (!is_submit){			
				break;
    		} 
		}
	
		if (is_submit){
		
		
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
</script>

<title>D-LINK SYSTEMS, INC | WIRELESS ROUTER | HOME</title>
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.style1 {color: #000000}
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
			<td height="29"><img src="short_modnum.gif" width="125" height="25"></td>
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
							<!--  <div><a href="adv_access_control.asp">Access control</a></div>-->
                            <!--<LI>-->
                              <div><a href="adv_filters_url.asp">Website Filter</a></div>
                            <LI>
                              <div><a href="adv_dmz.asp">Firewall Settings</a></div>
                            <LI>
                              <div id=sidenavoff>advanced Wireless</div>
                            <LI>
                              <div><a href="adv_network.asp">advanced Network</a></div>
                            </LI>
                          </UL>
                      </div></td>
                    </tr>
                  </tbody>
                </table></td>
			<form id="form1" name="form1" method="post" action="apply.cgi">
			<input type="hidden" name="html_response_page" value="back.asp">
			<input type="hidden" name="html_response_message" value="The setting is saved.">
			<input type="hidden" name="html_response_return_page" value="adv_wlan_perform.asp">
			<td valign="top" id="maincontent_container">
				<div id=maincontent>
                  <div id=box_header>
                    <h1>Advanced Wireless settings : </h1>
                    <p>If you are not familiar with these Advanced Wireless settings, please read the help section before attempting to modify these settings.</p>
                    <input name="button" type="submit" class=button_submit value="Save Settings" onClick="return send_request()">
                    <input name="button2" type=reset class=button_submit value="Don't Save Settings"  onClick="window.location.href='adv_wlan_perform.asp'">
                  </div>
                  <div class=box>
                    <h2>Advanced Wireless Settings : </h2>
                    <table cellSpacing=1 cellPadding=1 width=525 border=0>
                <tr> 
                  <td width="35%" class="form_label">802.11&nbsp;b/g/n&nbsp;fixed&nbsp;Tx&nbsp;rate:</td>
                  <td width="65%"> 
                    <font size=2><b>
					<input name="wlan0_auto_txrate" type=radio value=1 onClick="dis_tx_rate()">
                    
                    </b>Auto <b>
                    <input name="wlan0_auto_txrate" type=radio value=0 onClick="dis_tx_rate()">
                    </b>Fixed</font></td>
                </tr>
				
				<tr> 
                  <td width="35%" class="form_label">11b TX Rates :</td>
                  <td width="65%"> 
                 <select id="wlan0_11b_txrate" name="wlan0_11b_txrate" size="1" >
                      <option value="1">1</option>
                      <option value="2">2</option>
                      <option value="5.5">5.5</option>
                      <option value="11">11</option>
                    </select>
                  </td>
                </tr>
				<tr> 
                  <td width="35%" class="form_label">11g TX Rates :</td>
                  <td width="65%"> 
                 <select id="wlan0_11g_txrate" name="wlan0_11g_txrate" size="1" >
                      <option value="9">9</option>
                      <option value="12">12</option>
                      <option value="18">18</option>
                      <option value="24">24</option>
                      <option value="36">36</option>
                      <option value="48">48</option>
                      <option value="54">54</option>
                    </select>
                  </td>
                </tr>
				<tr> 
                  <td width="35%" class="form_label">11n TX Rates :</td>
                  <td width="65%"> 
                    <select id="wlan0_11n_txrate" name="wlan0_11n_txrate" size="1" >
                      <option value="MCS0">MCS0</option>
                      <option value="MCS1">MCS1</option>
                      <option value="MCS2">MCS2</option>
                      <option value="MCS3">MCS3</option>
                      <option value="MCS4">MCS4</option>
                      <option value="MCS5">MCS5</option>
                      <option value="MCS6">MCS6</option>
                      <option value="MCS7">MCS7</option>
                      <option value="MCS8">MCS8</option>
                      <option value="MCS9">MCS9</option>
                      <option value="MCS10">MCS10</option>
                      <option value="MCS11">MCS11</option>
                      <option value="MCS12">MCS12</option>
                      <option value="MCS13">MCS13</option>
                      <option value="MCS14">MCS14</option>
                      <option value="MCS15">MCS15</option>
                    </select>
                  </td>
                </tr>
				
				<!-- 
                <tr> 
                  <td width="27%"> 
                    <div align="right"><font color="#000000" size="2">Transmit Power:</font></div>
                  </td>
                  <td width="73%"> 
                    <select id="wlan0_txpower" name="wlan0_txpower">
                      <option value="19">100%</option>
                      <option value="10">50%</option>
                      <option value="5">25%</option>
                      <option value="2">12.5%</option>
                    </select>
                </tr>  
				 -->       
                <tr> 
                  <td width="35%" class="form_label">Beacon interval :</td>
                  <td width="65%"><font size="2"> 
                    <input maxlength=4 id="wlan0_beacon_interval" name="wlan0_beacon_interval" size=6 value="<% CmoGetCfg("wlan0_beacon_interval","none"); %>">
                    (msec, range:20~1000, default:100) </font></td>
                </tr>
                <tr> 
                  <td width="35%" class="form_label">RTS Threshold :</td>
                  <td width="65%"><font size="1"> 
                    <input maxlength=4 id="wlan0_rts_threshold" name="wlan0_rts_threshold" size=6 value="<% CmoGetCfg("wlan0_rts_threshold","none"); %>">
                    <font size=2>(range: 256~2346, default:2346)</font> </font></td>
                </tr>
               <!--
			    <tr> 
                  <td width="27%"> 
                    <div align="right"><font color="#000000" size="2">Fragmentation 
                      :</font></div>
                  </td>
                  <td width="73%"><font size="2"> 
                    <input maxlength=4 id="wlan0_fragmemtation" name="wlan0_fragmemtation" size=6 value="<% CmoGetCfg("wlan0_fragmemtation","none"); %>">
                    (range: 1500~2346, default:2346, even number only) </font></td>
                </tr>
				-->
                <tr> 
                  <td width="35%" class="form_label">DTIM interval :</td>
                  <td width="65%"><font size="2"> 
                    <input maxlength=3 id="wlan0_dtim" name="wlan0_dtim" size=6 value="<% CmoGetCfg("wlan0_dtim","none"); %>">
                    (range: 1~5, default:1) </font></td>
                </tr>                          
                <tr> 
                  <td width="35%" class="form_label">Preamble Type :</td>
                  <td width="65%"><font size="2"> 
                    <input name="wlan0_short_preamble" type=radio value=1>
                    Short Preamble 
                    <input name="wlan0_short_preamble" type=radio value=0>
                    Long Preamble</font></td>
                </tr>
				<!--
                <tr>
                  <td width="27%"> 
                    <div align="right"><font color="#000000" size="2">CTS 
                      Mode :</font></div>
                  </td>
                  <td width="73%"><font size="2"> 
                    <input name="wlan0_cts" type=radio value="0" checked>
    None
                    <input name="wlan0_cts" type=radio value="1">
    Always
    <input name="wlan0_cts" type="radio" value="2">
    Auto &nbsp;&nbsp;</font></td>
                </tr>
				-->
				<tr> 
                  <td width="35%" class="form_label"> Protection :</td>
                  <td width="65%"> 
                    <font size=2><b>
					<input name="wlan0_protection" type=radio value=1>
                    
                    </b>Enable <b>
                    <input name="wlan0_protection" type=radio value=0>
                    </b>Disable</font></td>
                </tr>
				<!--<tr> 
                  <td width="27%"> 
                    <div align="right"><font size="2">WMM Function:</font></div>
                  </td>
                  <td width="73%"> 
                    <font size=2><b>
					<input name="wlan0_wmm_enable" type=radio value=1>
                    </b>Enable <b>
                    <input name="wlan0_wmm_enable" type=radio value=0>
                    </b>Disable</font></td>
                </tr>-->
				
				<!--<tr> 
                  <td width="27%"> 
                    <div align="right"><font color="#000000" size="2">802.11n Specific
                      :</font></div>
                  </td>
                  <td width="73%"> 
                  </td>
                </tr>-->
                
                
                <!--<tr>
                  <td width="27%"> 
                    <div align="right"><font color="#000000" size="2">Aggregate MSDU :</font></div>
                  </td>
                  <td width="73%"><font size="2"> 
                    <input name=wlan0_amsdu type=radio value="disable"> disable
                    <input name=wlan0_amsdu type=radio value="4k"> 4K
                    <input name=wlan0_amsdu type=radio value="8k"> 8K
    </font></td>
                </tr>
                <tr>
                  <td width="27%"> 
                    <div align="right"><font color="#000000" size="2">Channel Bandwidth :</font></div>
                  </td>
                  <td width="73%"><font size="2"> 
                    <input name=wlan0_channel_bandwidth type=radio value="auto"> Auto
                    <input name=wlan0_channel_bandwidth type=radio value="20"> 20Mhz
                    <input name=wlan0_channel_bandwidth type=radio value="40"> 40Mhz
    </font></td>
                </tr>
                <tr>
                  <td width="27%"> 
                    <div align="right"><font color="#000000" size="2">Guard Interval :</font></div>
                  </td>
                  <td width="73%"><font size="2"> 
                    <input name=wlan0_guard_interval type=radio value="auto"> Auto
                    <input name=wlan0_guard_interval type=radio value="short"> Short interval
                    <input name=wlan0_guard_interval type=radio value="long"> Long interval
    </font></td>
                </tr>
                <tr>
                  <td width="27%"> 
                    <div align="right"><font color="#000000" size="2">Extension Channel :</font></div>
                  </td>
                  <td width="73%"><font size="2"> 
                    <input name=wlan0_ext_subchannel type=radio value="auto"> Auto
                    <input name=wlan0_ext_subchannel type=radio value="lower"> Lower channel 
                    <input name=wlan0_ext_subchannel type=radio value="upper"> Upper channel
    </font></td>
                </tr>
				<tr> 
                  <td width="27%"> 
                    <div align="right"><font size="2">11n Protection:</font></div>
                  </td>
                  <td width="73%"> 
                    <font size=2><b>
					<input name="wlan0_11n_protection" type=radio value="auto">
                    
                    </b>Auto <b>
                    <input name="wlan0_11n_protection" type=radio value="20">
                    </b>20 <b>
                    <input name="wlan0_11n_protection" type=radio value="20_40">
					</b>20_40 <b>
					<input name="wlan0_11n_protection" type=radio value="disable">
					</b>Disable <b>
					</font>			
					</td>
                </tr>-->
				
              </table>
                  </div>
			  </div></td>
		  </form>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table borderColor=#ffffff cellSpacing=0 borderColorDark=#ffffff 
      cellPadding=2 bgColor=#ffffff borderColorLight=#ffffff border=0>
                  <tbody>
                    <tr>
                      <td id=help_text><b>Helpful Hints.</b><br>
                          <br>
                          It is recommended that you leave these options at their default values.  Adjusting them could negatively impact the performance of your wireless network.                        
                      </td>
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
	dis_tx_rate();
//	change_tx();
</script>
</html>
<html>
<head>
<link rel="STYLESHEET" type="text/css" href="css_router.css">
<script language="JavaScript" src="public.js"></script>
<script language="JavaScript">
var submit_button_flag = 0;
function onPageLoad(){
	var mac_filter_type= "<% CmoGetCfg("mac_filter_type","none"); %>";
		if(mac_filter_type=="disable"){
				get_by_id("enable").selectedIndex = 0;				
		}else if(mac_filter_type=="list_allow"){
				get_by_id("enable").selectedIndex = 1;
		}else{
				get_by_id("enable").selectedIndex = 2;
		}
		
		
}

function set_mac_list(){
	var temp_dhcp_list = get_by_id("dhcp_list").value.split(",");
	
	for (var i = 0; i < temp_dhcp_list.length; i++){	
		var temp_data = temp_dhcp_list[i].split("/");
		if(temp_data.length != 0){		
		if(temp_data.length > 1){
		document.write("<option value='" + temp_data[2] + "'>" + temp_data[0] + "</option>");		
		}
		}
	}
}


function set_virtual_server(){
		for (var i = 0; i < 20; i++){
			var temp_mf;
			
			if (i > 9){
				temp_mf = (get_by_id("mac_filter_" + i).value).split("/");
			}else{
				temp_mf = (get_by_id("mac_filter_0" + i).value).split("/");		
			}
			
			
			
			if (temp_mf.length > 1){
				get_by_id("mac" + (i+1)).value = temp_mf[1];
			}
		}
}


function copy_mac(index){

	if (get_by_id("dhcp_list" + index).selectedIndex > 0){
		get_by_id("mac" + index).value = get_by_id("dhcp_list" + index).options[get_by_id("dhcp_list" + index).selectedIndex].value;
	}else{
		alert(msg[SELECT_MACHINE_ERROR]);
	}
}


	function clear_mac(index){
		get_by_id("dhcp_list" + index).selectedIndex = 0;
		get_by_id("name" + index).value = "";
		get_by_id("mac" + index).value = "00:00:00:00:00:00";
	}
	
	function send_request(){
		
		for (var i = 1; i <= 20; i++){
			var mac = get_by_id("mac" + i).value;
			
			if (get_by_id("mac" + i).value != ""){
				if (!check_mac(mac)){
					alert(msg[MAC_ADDRESS_ERROR]);
					return false;			
				}
			}
			
		}
		
		
		var count = 0;		
		for (var i = 1; i <= 20; i++){
			var temp_mac;
		
			if (i > 10){
				get_by_id("mac_filter_" + (i-1)).value = "Name/00:00:00:00:00:00/Always";
			}else{
				get_by_id("mac_filter_0" + (i-1)).value = "Name/00:00:00:00:00:00/Always";
			}
			
			
			if (get_by_id("mac" + i).value != "" && get_by_id("mac" + i).value != "00:00:00:00:00:00"){
			
				if (count > 9){
					temp_mac = get_by_id("mac_filter_" + count);
				}else{
					temp_mac = get_by_id("mac_filter_0" + count);
				}
				
				temp_mac.value = "Name/"+ get_by_id("mac" + i).value + "/Always";
				count++;			
			}		
		}
		
		
		
		if(get_by_id("enable").selectedIndex == 0){
			get_by_id("mac_filter_type").value = "disable";
		}else if(get_by_id("enable").selectedIndex == 1){
			get_by_id("mac_filter_type").value = "list_allow";
		}else if(get_by_id("enable").selectedIndex == 2){
			get_by_id("mac_filter_type").value = "list_deny";
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
        <td width="100%">Product Page: <a href="http://support.dlink.com/">DIR-6250</a></td>
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
                              <div id=sidenavoff>Network Filter</div>
							<LI>
							 <!-- <div><a href="adv_access_control.asp">Access control</a></div>
                            <LI>-->
                              <div><a href="adv_filters_url.asp">Website Filter</a></div>

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
                <form id="form1" name="form1" method="post" action="apply.cgi">
				<input type="hidden" name="html_response_page" value="back.asp">
				<input type="hidden" name="html_response_message" value="The setting is saved.">
				<input type="hidden" name="html_response_return_page" value="adv_filters_mac.asp">
                <input type="hidden" id="mac_filter_00" name="mac_filter_00" value="<% CmoGetCfg("mac_filter_00","none"); %>">
                <input type="hidden" id="mac_filter_01" name="mac_filter_01" value="<% CmoGetCfg("mac_filter_01","none"); %>">
                <input type="hidden" id="mac_filter_02" name="mac_filter_02" value="<% CmoGetCfg("mac_filter_02","none"); %>">
                <input type="hidden" id="mac_filter_03" name="mac_filter_03" value="<% CmoGetCfg("mac_filter_03","none"); %>">
                <input type="hidden" id="mac_filter_04" name="mac_filter_04" value="<% CmoGetCfg("mac_filter_04","none"); %>">
                <input type="hidden" id="mac_filter_05" name="mac_filter_05" value="<% CmoGetCfg("mac_filter_05","none"); %>">
                <input type="hidden" id="mac_filter_06" name="mac_filter_06" value="<% CmoGetCfg("mac_filter_06","none"); %>">
                <input type="hidden" id="mac_filter_07" name="mac_filter_07" value="<% CmoGetCfg("mac_filter_07","none"); %>">
                <input type="hidden" id="mac_filter_08" name="mac_filter_08" value="<% CmoGetCfg("mac_filter_08","none"); %>">
                <input type="hidden" id="mac_filter_09" name="mac_filter_09" value="<% CmoGetCfg("mac_filter_09","none"); %>">
                <input type="hidden" id="mac_filter_10" name="mac_filter_10" value="<% CmoGetCfg("mac_filter_10","none"); %>">
                <input type="hidden" id="mac_filter_11" name="mac_filter_11" value="<% CmoGetCfg("mac_filter_11","none"); %>">
                <input type="hidden" id="mac_filter_12" name="mac_filter_12" value="<% CmoGetCfg("mac_filter_12","none"); %>">
                <input type="hidden" id="mac_filter_13" name="mac_filter_13" value="<% CmoGetCfg("mac_filter_13","none"); %>">
                <input type="hidden" id="mac_filter_14" name="mac_filter_14" value="<% CmoGetCfg("mac_filter_14","none"); %>">
                <input type="hidden" id="mac_filter_15" name="mac_filter_15" value="<% CmoGetCfg("mac_filter_15","none"); %>">
                <input type="hidden" id="mac_filter_16" name="mac_filter_16" value="<% CmoGetCfg("mac_filter_16","none"); %>">
                <input type="hidden" id="mac_filter_17" name="mac_filter_17" value="<% CmoGetCfg("mac_filter_17","none"); %>">
                <input type="hidden" id="mac_filter_18" name="mac_filter_18" value="<% CmoGetCfg("mac_filter_18","none"); %>">
                <input type="hidden" id="mac_filter_19" name="mac_filter_19" value="<% CmoGetCfg("mac_filter_19","none"); %>">
                
				<input type="hidden" id="dhcp_list" name="dhcp_list" value="<% CmoGetList("dhcpd_leased_table"); %>">
				
			<td valign="top" id="maincontent_container">
				<div id=maincontent>				  
                  <div id=box_header>
                    <h1>MAC Filtering  : </h1>
                    <p>The MAC (Media Access Controller) Address filter option is used to control network access based on the MAC Address of the network adapter. A MAC address is a unique ID assigned by the manufacturer of the network adapter. This feature can be configured to ALLOW or DENY network/Internet access.</p>
                    <input name="button" type="submit" class=button_submit value="Save Settings" onClick="return send_request()">
                    <input name="button2" type=button class=button_submit value="Don't Save Settings"  onClick="window.location.href='adv_filters_mac.asp'">
                  </div>
                  <div class=box>
                    <h2>20 - MAC Filtering Rules</h2>
                    <table cellSpacing=1 cellPadding=2 width=525 border=0>
                      <tbody>
                        <tr>
                          <td>Configure MAC Filtering below:</td>
                        </tr>
                        <tr>
                          <td>
						<input type="hidden" id="mac_filter_type" name="mac_filter_type" value="<% CmoGetCfg("mac_filter_type","none"); %>">						  
						  <select id="enable" name="enable">
                              <option value="0">Turn MAC Filtering OFF</option>
                              <option value="2">Turn MAC Filtering ON and ALLOW computers listed to access the network</option>
                              <option value="1">Turn MAC Filtering ON and DENY computers listed to access the network</option>
                            </select>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                    <br>
                    <table borderColor=#ffffff cellSpacing=1 cellPadding=2 width=452 bgColor=#dfdfdf border=1>
                      <tbody>
                        <tr>
                        <!--
                          <td align=middle> Schedule </td> -->
                          <td width="148">MAC Address</td>
                          <td width="58">&nbsp;</td>
                          <td width="155" align=middle>DHCP Client List</td>
                        </tr>
                        <tr>
                        	
                          <td><input type="text" id="mac1" name="mac1" size="20" maxlength="17"><input type="hidden" id="name1" name="name1" maxlength="31"></td>
                          <td><input type="button" name="copy1" value="<<" onClick="copy_mac(1)"></td>
                          <td width=155>
                          	<select id="dhcp_list1" name="dhcp_list1">
                              <option value="-1">Computer Name</option>
                              <script>set_mac_list()</script>                             
                          	</select>
                          </td>
                          <td width="60" align=middle><input type="button" name="clear1" value="CLEAR" onClick="clear_mac(1)"></td>
                        </tr> 
                        <tr>
                        	
                          <td><input type="text" id="mac2" name="mac2" size="20" maxlength="17"><input type="hidden" id="name2" name="name2" maxlength="31"></td>
                          <td><input type="button" name="copy2" value="<<" onClick="copy_mac(2)"></td>
                          <td width=155>
                          	<select id="dhcp_list2" name="dhcp_list2">
                              <option value="-1">Computer Name</option>
                              <script>set_mac_list()</script>                             
                          	</select>
                          </td>
                          <td align=middle><input type="button" name="clear2" value="CLEAR" onClick="clear_mac(2)"></td>
                        </tr>    
                        <tr>
                        	
                          <td><input type="text" id="mac3" name="mac3" size="20" maxlength="17"><input type="hidden" id="name3" name="name3" maxlength="31"></td>
                          <td><input type="button" name="copy3" value="<<" onClick="copy_mac(3)"></td>
                          <td width=155>
                          	<select id="dhcp_list3" name="dhcp_list3">
                              <option value="-1">Computer Name</option>
                              <script>set_mac_list()</script>                             
                          	</select>
                          </td>
                          <td align=middle><input type="button" name="clear3" value="CLEAR" onClick="clear_mac(3)"></td>
                        </tr>
                        <tr>
                        	
                          <td><input type="text" id="mac4" name="mac4" size="20" maxlength="17"><input type="hidden" id="name4" name="name4" maxlength="31"></td>
                          <td><input type="button" name="copy4" value="<<" onClick="copy_mac(4)"></td>
                          <td width=155>
                          	<select id="dhcp_list4" name="dhcp_list4">
                              <option value="-1">Computer Name</option>
                              <script>set_mac_list()</script>                             
                          	</select>
                          </td>
                          <td align=middle><input type="button" name="clear4" value="CLEAR" onClick="clear_mac(4)"></td>
                        </tr> 
                        <tr>
                        	
                          <td><input type="text" id="mac5" name="mac5" size="20" maxlength="17"><input type="hidden" id="name5" name="name5" maxlength="31"></td>
                          <td><input type="button" name="copy5" value="<<" onClick="copy_mac(5)"></td>
                          <td width=155>
                          	<select id="dhcp_list5" name="dhcp_list5">
                              <option value="-1">Computer Name</option>
                              <script>set_mac_list()</script>                             
                          	</select>
                          </td>
                          <td align=middle><input type="button" name="clear5" value="CLEAR" onClick="clear_mac(5)"></td>
                        </tr> 
                        <tr>
                        	
                          <td><input type="text" id="mac6" name="mac6" size="20" maxlength="17"><input type="hidden" id="name6" name="name6" maxlength="31"></td>
                          <td><input type="button" name="copy6" value="<<" onClick="copy_mac(6)"></td>
                          <td width=155>
                          	<select id="dhcp_list6" name="dhcp_list6">
                              <option value="-1">Computer Name</option>
                              <script>set_mac_list()</script>                             
                          	</select>
                          </td>
                          <td align=middle><input type="button" name="clear6" value="CLEAR" onClick="clear_mac(6)"></td>
                        </tr> 
                        <tr>
                        	
                          <td><input type="text" id="mac7" name="mac7" size="20" maxlength="17"><input type="hidden" id="name7" name="name7" maxlength="31"></td>
                          <td><input type="button" name="copy7" value="<<" onClick="copy_mac(7)"></td>
                          <td width=155>
                          	<select id="dhcp_list7" name="dhcp_list7">
                                <option value="-1">Computer Name</option>
                              <script>set_mac_list()</script>                             
                          	</select>
                          </td>
                          <td align=middle><input type="button" name="clear7" value="CLEAR" onClick="clear_mac(7)"></td>
                        </tr> 
                        <tr>
                        	
                          <td><input type="text" id="mac8" name="mac8" size="20" maxlength="17"><input type="hidden" id="name8" name="name8" maxlength="31"></td>
                          <td><input type="button" name="copy8" value="<<" onClick="copy_mac(8)"></td>
                          <td width=155>
                          	<select id="dhcp_list8" name="dhcp_list8">
                              <option value="-1">Computer Name</option>
                              <script>set_mac_list()</script>                             
                          	</select>
                          </td>
                          <td align=middle><input type="button" name="clear8" value="CLEAR" onClick="clear_mac(8)"></td>
                        </tr> 
                        <tr>
                        	
                          <td><input type="text" id="mac9" name="mac9" size="20" maxlength="17"><input type="hidden" id="name9" name="name9" maxlength="31"></td>
                          <td><input type="button" name="copy9" value="<<" onClick="copy_mac(9)"></td>
                          <td width=155>
                          	<select id="dhcp_list9" name="dhcp_list9">
                              <option value="-1">Computer Name</option>
                              <script>set_mac_list()</script>                             
                          	</select>
                          </td>
                          <td align=middle><input type="button" name="clear9" value="CLEAR" onClick="clear_mac(9)"></td>
                        </tr> 
                        <tr>
                        	
                          <td><input type="text" id="mac10" name="mac10" size="20" maxlength="17"><input type="hidden" id="name10" name="name10" maxlength="31"></td>
                          <td><input type="button" name="copy10" value="<<" onClick="copy_mac(10)"></td>
                          <td width=155>
                          	<select id="dhcp_list10" name="dhcp_list10">
                              <option value="-1">Computer Name</option>
                              <script>set_mac_list()</script>                             
                          	</select>
                          </td>
                          <td align=middle><input type="button" name="clear10" value="CLEAR" onClick="clear_mac(10)"></td>
                        </tr>
                        <tr>
                        	
                          <td><input type="text" id="mac11" name="mac11" size="20" maxlength="17"><input type="hidden" id="name11" name="name11" maxlength="31"></td>
                          <td><input type="button" name="copy11" value="<<" onClick="copy_mac(11)"></td>
                          <td width=155>
                          	<select id="dhcp_list11" name="dhcp_list11">
                                <option value="-1">Computer Name</option>
                              <script>set_mac_list()</script>                             
                          	</select>
                          </td>
                          <td align=middle><input type="button" name="clear11" value="CLEAR" onClick="clear_mac(11)"></td>
                        </tr> 
                        <tr>
                        	
                          <td><input type="text" id="mac12" name="mac12" size="20" maxlength="17"><input type="hidden" id="name12" name="name12" maxlength="31"></td>
                          <td><input type="button" name="copy12" value="<<" onClick="copy_mac(12)"></td>
                          <td width=155>
                          	<select id="dhcp_list12" name="dhcp_list12">
                              <option value="-1">Computer Name</option>
                              <script>set_mac_list()</script>                             
                          	</select>
                          </td>
                          <td align=middle><input type="button" name="clear12" value="CLEAR" onClick="clear_mac(12)"></td>
                        </tr>    
                        <tr>
                        	
                          <td><input type="text" id="mac13" name="mac13" size="20" maxlength="17"><input type="hidden" id="name13" name="name13" maxlength="31"></td>
                          <td><input type="button" name="copy13" value="<<" onClick="copy_mac(13)"></td>
                          <td width=155>
                          	<select id="dhcp_list13" name="dhcp_list13">
                              <option value="-1">Computer Name</option>
                              <script>set_mac_list()</script>                             
                          	</select>
                          </td>
                          <td align=middle><input type="button" name="clear13" value="CLEAR" onClick="clear_mac(13)"></td>
                        </tr>
                        <tr>
                        	
                          <td><input type="text" id="mac14" name="mac14" size="20" maxlength="17"><input type="hidden" id="name14" name="name14" maxlength="31"></td>
                          <td><input type="button" name="copy14" value="<<" onClick="copy_mac(14)"></td>
                          <td width=155>
                          	<select id="dhcp_list14" name="dhcp_list14">
                              <option value="-1">Computer Name</option>
                              <script>set_mac_list()</script>                             
                          	</select>
                          </td>
                          <td align=middle><input type="button" name="clear14" value="CLEAR" onClick="clear_mac(14)"></td>
                        </tr> 
                        <tr>
                        	
                          <td><input type="text" id="mac15" name="mac15" size="20" maxlength="17"><input type="hidden" id="name15" name="name15" maxlength="31"></td>
                          <td><input type="button" name="copy5" value="<<" onClick="copy_mac(15)"></td>
                          <td width=155>
                          	<select id="dhcp_list15" name="dhcp_list15">
                              <option value="-1">Computer Name</option>
                              <script>set_mac_list()</script>                             
                          	</select>
                          </td>
                          <td align=middle><input type="button" name="clear15" value="CLEAR" onClick="clear_mac(15)"></td>
                        </tr> 
                        <tr>
                        	
                          <td><input type="text" id="mac16" name="mac16" size="20" maxlength="17"><input type="hidden" id="name16" name="name16" maxlength="31"></td>
                          <td><input type="button" name="copy16" value="<<" onClick="copy_mac(16)"></td>
                          <td width=155>
                          	<select id="dhcp_list16" name="dhcp_list16">
                              <option value="-1">Computer Name</option>
                              <script>set_mac_list()</script>                             
                          	</select>
                          </td>
                          <td align=middle><input type="button" name="clear16" value="CLEAR" onClick="clear_mac(16)"></td>
                        </tr> 
                        <tr>
                        	
                          <td><input type="text" id="mac17" name="mac17" size="20" maxlength="17"><input type="hidden" id="name17" name="name17" maxlength="31"></td>
                          <td><input type="button" name="copy17" value="<<" onClick="copy_mac(17)"></td>
                          <td width=155>
                          	<select id="dhcp_list17" name="dhcp_list17">
                                <option value="-1">Computer Name</option>
                              <script>set_mac_list()</script>                             
                          	</select>
                          </td>
                          <td align=middle><input type="button" name="clear17" value="CLEAR" onClick="clear_mac(17)"></td>
                        </tr> 
                        <tr>
                        	
                          <td><input type="text" id="mac18" name="mac18" size="20" maxlength="17"><input type="hidden" id="name18" name="name18" maxlength="31"></td>
                          <td><input type="button" name="copy18" value="<<" onClick="copy_mac(18)"></td>
                          <td width=155>
                          	<select id="dhcp_list18" name="dhcp_list18">
                                <option value="-1">Computer Name</option>
                              <script>set_mac_list()</script>                             
                          	</select>
                          </td>
                          <td align=middle><input type="button" name="clear18" value="CLEAR" onClick="clear_mac(18)"></td>
                        </tr> 
                        <tr>
                        	
                          <td><input type="text" id="mac19" name="mac19" size="20" maxlength="17"><input type="hidden" id="name19" name="name19" maxlength="31"></td>
                          <td><input type="button" name="copy19" value="<<" onClick="copy_mac(19)"></td>
                          <td width=155>
                          	<select id="dhcp_list19" name="dhcp_list19">
                              <option value="-1">Computer Name</option>
                              <script>set_mac_list()</script>                             
                          	</select>
                          </td>
                          <td align=middle><input type="button" name="clear19" value="CLEAR" onClick="clear_mac(19)"></td>
                        </tr> 
                        <tr>
                        	
                          <td><input type="text" id="mac20" name="mac20" size="20" maxlength="17"><input type="hidden" id="name20" name="name20" maxlength="31"></td>
                          <td><input type="button" name="copy20" value="<<" onClick="copy_mac(20)"></td>
                          <td width=155>
                          	<select id="dhcp_list20" name="dhcp_list20">
                              <option value="-1">Computer Name</option>
                              <script>set_mac_list()</script>                             
                          	</select>
                          </td>
                          <td align=middle><input type="button" name="clear20" value="CLEAR" onClick="clear_mac(20)"></td>
                        </tr>  
                      </tbody>
                    </table>
                  </div>             
			  </div></td></form>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table borderColor=#ffffff cellSpacing=0 borderColorDark=#ffffff 
      cellPadding=2 bgColor=#ffffff borderColorLight=#ffffff border=0>
                  <tbody>
                    <tr>
                      <td id=help_text><b>Helpful Hints..</b><br>
                          <br>
                          <span class="style1">Create a list of MAC addresses that you would either like to allow or deny access to your network. </span></p>
                        <p class="style1">Computers that have obtained an IP address from the router's DHCP server will be in the DHCP Client List.  Select a device from the drop down menu and click the arrow to add that device's MAC to the list.  </p>
                        <p class="style1">Click the <strong>CLEAR</strong> button to remove the MAC address from the MAC Filtering list.</p></td>
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
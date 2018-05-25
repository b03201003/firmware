<html>
<head>

<link rel="STYLESHEET" type="text/css" href="css_router.css">
<script language="JavaScript" src="public.js"></script>
<script language="JavaScript">
	var submit_button_flag = 0;
	function onPageLoad(){
		for (var i = 0; i < 20; i++){
			var temp_pf;
			if (i > 9){
				temp_pf = get_by_id("port_forward_" + i).value;
			}else{
				temp_pf = get_by_id("port_forward_0" + i).value;				
			}
			
			if(temp_pf ==""){
				if (i > 9){
					 get_by_id("port_forward_" + i).value = "0//TCP/0/0/0.0.0.0/Always";
				}else{
					get_by_id("port_forward_0" + i).value = "0//TCP/0/0/0.0.0.0/Always";				
				}
			}
			
		
		}
		
	}

	function set_port_forwarding(){
		for (var i = 0; i < 20; i++){
			var temp_pf;
			
			if (i > 9){
				temp_pf = (get_by_id("port_forward_" + i).value).split("/");
			}else{
				temp_pf = (get_by_id("port_forward_0" + i).value).split("/");				
			}
			
			if (temp_pf.length > 1){
				
				if (temp_pf[0] == "1"){
					get_by_id("enable" + (i+1)).checked = true;
				}
				
				get_by_id("name" + (i+1)).value = temp_pf[1];
				set_protocol(temp_pf[2], get_by_id("protocol" + (i+1)));	
				get_by_id("public_port" + (i+1)).value = temp_pf[3];
				get_by_id("private_port" + (i+1)).value = temp_pf[4];
				get_by_id("ip" + (i+1)).value = temp_pf[5];
				set_selectIndex(temp_pf[6], get_by_id("schedule" + (i+1)));
				
			}
		}
	}
	
	function send_request(){
		var count = 0;
		
		for (var i = 1; i <= 20; i++){		
			var ip = get_by_id("ip" + i).value;
    		var temp_ip_obj = new addr_obj(ip.split("."), IP_ADDRESS_DESC, false, INVALID_IP_ADDRESS, ZERO_IP_ADDRESS, -1, false);
			var is_enable = 0;
			var temp_pf;
			
			if (i > 10){
				get_by_id("port_forward_" + (i-1)).value = "";
			}else{
				get_by_id("port_forward_0" + (i-1)).value = "";
			}
			
			if (get_by_id("name" + i).value != ""){
				check_name = get_by_id("name" + i).value;
				if(Find_word(check_name,"'") || Find_word(check_name,'"') || Find_word(check_name,"/")){
					alert("Port forwarding name "+ i +" invalid. the legal characters can not enter ',/,''");
					return false
				}
				
				if (!check_address(temp_ip_obj)){
		            return false;
		        }
        
				if (!check_pf_port(get_by_id("public_port" + i).value)){
		            alert(msg[PUBLIC_PORT_ERROR]);
		            return false;
		        }

				if (!check_pf_port(get_by_id("private_port" + i).value)){
		            alert(msg[PRIVATE_PORT_ERROR]);
		            return false;
		        }	
		        
		        if (get_by_id("enable" + i).checked){
		        	is_enable = 1;
		        }
		        
		        if (count > 9){
					temp_pf = get_by_id("port_forward_" + count);
				}else{
					temp_pf = get_by_id("port_forward_0" + count);
				}
				
				temp_pf.value = is_enable + "/" + get_by_id("name" + i).value + "/" + get_by_id("protocol" + i).value 
					+ "/" + get_by_id("public_port" + i).value + "/" + get_by_id("private_port" + i).value 
					+ "/" + get_by_id("ip" + i).value + "/" + get_by_id("schedule" + i).value;
		        count++;
			}
		}
		
		
		
		if(submit_button_flag == 0){
		submit_button_flag = 1;
		return true;
		}else{
		return false;
		}
		//return true;
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
                              <div id=sidenavoff>Port Forwarding</div>
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
                              <div><a href="adv_wlan_perform.asp">advanced Wireless </a></div>
                            <LI>
                              <div><a href="adv_network.asp">advanced Network </a></div>
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
				<input type="hidden" name="html_response_return_page" value="adv_portforward.asp">
                <input type="hidden" id="port_forward_00" name="port_forward_00" value="<% CmoGetCfg("port_forward_00","none"); %>">
                <input type="hidden" id="port_forward_01" name="port_forward_01" value="<% CmoGetCfg("port_forward_01","none"); %>">
                <input type="hidden" id="port_forward_02" name="port_forward_02" value="<% CmoGetCfg("port_forward_02","none"); %>">
                <input type="hidden" id="port_forward_03" name="port_forward_03" value="<% CmoGetCfg("port_forward_03","none"); %>">
                <input type="hidden" id="port_forward_04" name="port_forward_04" value="<% CmoGetCfg("port_forward_04","none"); %>">
                <input type="hidden" id="port_forward_05" name="port_forward_05" value="<% CmoGetCfg("port_forward_05","none"); %>">
                <input type="hidden" id="port_forward_06" name="port_forward_06" value="<% CmoGetCfg("port_forward_06","none"); %>">
                <input type="hidden" id="port_forward_07" name="port_forward_07" value="<% CmoGetCfg("port_forward_07","none"); %>">
                <input type="hidden" id="port_forward_08" name="port_forward_08" value="<% CmoGetCfg("port_forward_08","none"); %>">
                <input type="hidden" id="port_forward_09" name="port_forward_09" value="<% CmoGetCfg("port_forward_09","none"); %>">
                <input type="hidden" id="port_forward_10" name="port_forward_10" value="<% CmoGetCfg("port_forward_10","none"); %>">
                <input type="hidden" id="port_forward_11" name="port_forward_11" value="<% CmoGetCfg("port_forward_11","none"); %>">
                <input type="hidden" id="port_forward_12" name="port_forward_12" value="<% CmoGetCfg("port_forward_12","none"); %>">
                <input type="hidden" id="port_forward_13" name="port_forward_13" value="<% CmoGetCfg("port_forward_13","none"); %>">
                <input type="hidden" id="port_forward_14" name="port_forward_14" value="<% CmoGetCfg("port_forward_14","none"); %>">
                <input type="hidden" id="port_forward_15" name="port_forward_15" value="<% CmoGetCfg("port_forward_15","none"); %>">
                <input type="hidden" id="port_forward_16" name="port_forward_16" value="<% CmoGetCfg("port_forward_16","none"); %>">
                <input type="hidden" id="port_forward_17" name="port_forward_17" value="<% CmoGetCfg("port_forward_17","none"); %>">
                <input type="hidden" id="port_forward_18" name="port_forward_18" value="<% CmoGetCfg("port_forward_18","none"); %>">
                <input type="hidden" id="port_forward_19" name="port_forward_19" value="<% CmoGetCfg("port_forward_19","none"); %>">
                
                
                
                <input type="hidden" id="dhcp_list" name="dhcp_list" value="<% CmoGetList("dhcpd_leased_table"); %>">
			<td valign="top" id="maincontent_container">
				<div id=maincontent>
				  
                  <div id=box_header>
                    <h1>Port Forwarding Rules : </h1>
                    <p>The Port Forwarding option is used to open a single port or a range of ports through your firewall and redirect data through those ports to a single PC on your network.</p>
                    <input name="button" type="submit" class=button_submit value="Save Settings" onClick="return send_request()">
                    <input name="button2" type=button class=button_submit value="Don't Save Settings"  onClick="window.location.href='adv_portforward.asp'">
                  </div>
                  <div class=box>
                    <h2>20- Port Forwarding Rules</h2>
                    <table borderColor=#ffffff cellSpacing=1 cellPadding=2 width=525 bgColor=#dfdfdf border=1>
                      <tbody>
                        <tr>
                          <td align=middle width=20>&nbsp;</td>
                          <td width="117">&nbsp;</td>
                          <td width="165" align=left><div align="left">&nbsp;</div></td>
                          <td width="45" align=middle><div align="center">Port</div></td>
                          <td width="52" align=middle><div align="center">Traffic Type </div></td>
                          <td width="81" align=middle><div align="center">Schedule</div></td>
                        </tr>
                       <tr>
                          <td align=middle rowspan="2">
                          	<input type=checkbox id="enable1" name="enable1" value="1">
                          </td>
                          <td valign="bottom">Name
                          <input type="text" id="name1" name="name1" size="16" maxlength="31">
                          </td>
                          <td align=left valign="bottom">
                          	  <input name="copy_app1" type=button value="<<" class="button" onClick="copy_application(1)">
                              <select id="application1" name="application1" style="width:120">
                                <option>Application Name</option>                             
                          	  	<script>set_application_option()</script>
                          	  </select>
                          </td>
                          <td align=middle valign="bottom">Start
                            <input type="text" id="public_port1" name="public_port1" size=5 maxlength="5"></td>
                          	<td align=middle rowspan="2">
                          		<select id="protocol1" name="protocol1">
                              		<option value="TCP">TCP</option>
                      				<option value="UDP">UDP</option>
                      				<option value="Any">Any</option>
                            </select>
                          </td>
                          <td align=middle rowspan="2">
                            	<select id="schedule1" name="schedule1" style="width:80">
                              		<option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                          		</select>
                       	  </td>
                        </tr>
                        <tr>
                          <td valign="bottom">
                            	IP Address
                                <input type="text" id="ip1" name="ip1" size="16" maxlength="15">
                          </td>
                          <td align=left valign="bottom">
                            	<input name="copy_ip1" type=button value="<<" class="button" onClick="copy_ip(1)">
                        		<select id="ip_list1" name="ip_list1" style="width:120">
                          			<option>Computer Name</option>
                          			<script>set_dhcp_list()</script>
                      			</select>
                   		  </td>
                          <td align=middle valign="bottom">End
                            	<input type="text" id="private_port1" name="private_port1" size=5 maxlength="5">
                          </td>
                        </tr>
                        <tr>
                          <td align=middle rowspan="2">
                          	<input type=checkbox id="enable2" name="enable2" value="1">
                          </td>
                          <td valign="bottom">
                            	Name
                                <input type="text" id="name2" name="name2" size="16" maxlength="31">
                          </td>
                          <td align=left valign="bottom">
                          	  <input name="copy_app2" type=button value="<<" class="button" onClick="copy_application(2)">
                              <select id="application2" name="application2" style="width:120">
                                <option>Application Name</option>                             
                          	  	<script>set_application_option()</script>
                          	  </select>
                          </td>
                          <td align=middle valign="bottom">Start
                            <input type="text" id="public_port2" name="public_port2" size=5 maxlength="5"></td><td align=middle rowspan="2">
                          		<select id="protocol2" name="protocol2">
                              		<option value="TCP">TCP</option>
                      				<option value="UDP">UDP</option>
                      				<option value="Any">Any</option>
                            </select>
                          </td>
                          <td align=middle rowspan="2">
                            	<select id="schedule2" name="schedule2" style="width:80">
                              		<option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                          		</select>
                       	  </td>
                        </tr>
                        <tr>
                          <td valign="bottom">
                            	IP Address
                                <input type="text" id="ip2" name="ip2" size="16" maxlength="15">
                          </td>
                          <td align=left valign="bottom">
                            	<input name="copy_ip2" type=button value="<<" class="button" onClick="copy_ip(2)">
                        		<select id="ip_list2" name="ip_list2" style="width:120">
                          			<option>Computer Name</option>
                          			<script>set_dhcp_list()</script>
                      			</select>
                   		  </td>
                          <td align=middle valign="bottom">End
                            	<input type="text" id="private_port2" name="private_port2" size=5 maxlength="5">
                          </td></tr>
                        <tr>
                          <td align=middle rowspan="2">
                          	<input type=checkbox id="enable3" name="enable3" value="1">
                          </td>
                          <td valign="bottom">
                            	Name
                                <input type="text" id="name3" name="name3" size="16" maxlength="31">
                          </td>
                          <td align=left valign="bottom">
                          	  <input name="copy_app3" type=button value="<<" class="button" onClick="copy_application(3)">
                              <select id="application3" name="application3" style="width:120">
                                <option>Application Name</option>                             
                          	  	<script>set_application_option()</script>
                          	  </select>
                          </td>
                          <td align=middle valign="bottom">Start
                            <input type="text" id="public_port3" name="public_port3" size=5 maxlength="5"></td><td align=middle rowspan="2">
                          		<select id="protocol3" name="protocol3">
                              		<option value="TCP">TCP</option>
                      				<option value="UDP">UDP</option>
                      				<option value="Any">Any</option>
                            </select>
                          </td>
                          <td align=middle rowspan="2">
                            	<select id="schedule3" name="schedule3" style="width:80">
                              		<option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                          		</select>
                       	  </td>
                        </tr>
                        <tr>
                          <td valign="bottom">
                            	IP Address
                                <input type="text" id="ip3" name="ip3" size="16" maxlength="15">
                          </td>
                          <td align=left valign="bottom">
                            	<input name="copy_ip3" type=button value="<<" class="button" onClick="copy_ip(3)">
                        		<select id="ip_list3" name="ip_list3" style="width:120">
                          			<option>Computer Name</option>
                          			<script>set_dhcp_list()</script>
                      			</select>
                   		  </td>
                          <td align=middle valign="bottom">End
                            	<input type="text" id="private_port3" name="private_port3" size=5 maxlength="5">
                          </td></tr>
                        <tr>
                          <td align=middle rowspan="2">
                          	<input type=checkbox id="enable4" name="enable4" value="1">
                          </td>
                          <td valign="bottom">
                            	Name
                                <input type="text" id="name4" name="name4" size="16" maxlength="31">
                          </td>
                          <td align=left valign="bottom">
                          	  <input name="copy_app4" type=button value="<<" class="button" onClick="copy_application(4)">
                              <select id="application4" name="application4" style="width:120">
                                <option>Application Name</option>                             
                          	  	<script>set_application_option()</script>
                          	  </select>
                          </td>
                          <td align=middle valign="bottom">Start
                            <input type="text" id="public_port4" name="public_port4" size=5 maxlength="5"></td><td align=middle rowspan="2">
                          		<select id="protocol4" name="protocol4">
                              		<option value="TCP">TCP</option>
                      				<option value="UDP">UDP</option>
                      				<option value="Any">Any</option>
                            </select>
                          </td>
                          <td align=middle rowspan="2">
                            	<select id="schedule4" name="schedule4" style="width:80">
                              		<option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                          		</select>
                       	  </td>
                        </tr>
                        <tr>
                          <td valign="bottom">
                            	IP Address
                                <input type="text" id="ip4" name="ip4" size="16" maxlength="15">
                          </td>
                          <td align=left valign="bottom">
                            	<input name="copy_ip4" type=button value="<<" class="button" onClick="copy_ip(4)">
                        		<select id="ip_list4" name="ip_list4" style="width:120">
                          			<option>Computer Name</option>
                          			<script>set_dhcp_list()</script>
                      			</select>
                   		  </td>
                          <td align=middle valign="bottom">End
                            	<input type="text" id="private_port4" name="private_port4" size=5 maxlength="5">
                          </td></tr>
                        <tr>
                          <td align=middle rowspan="2">
                          	<input type=checkbox id="enable5" name="enable5" value="1">
                          </td>
                          <td valign="bottom">
                            	Name
                                <input type="text" id="name5" name="name5" size="16" maxlength="31">
                          </td>
                          <td align=left valign="bottom">
                          	  <input name="copy_app5" type=button value="<<" class="button" onClick="copy_application(5)">
                              <select id="application5" name="application5" style="width:120">
                                <option>Application Name</option>                             
                          	  	<script>set_application_option()</script>
                          	  </select>
                          </td>
                          <td align=middle valign="bottom">Start
                            <input type="text" id="public_port5" name="public_port5" size=5 maxlength="5"></td><td align=middle rowspan="2">
                          		<select id="protocol5" name="protocol5">
                              		<option value="TCP">TCP</option>
                      				<option value="UDP">UDP</option>
                      				<option value="Any">Any</option>
                            </select>
                          </td>
                          <td align=middle rowspan="2">
                            	<select id="schedule5" name="schedule5" style="width:80">
                              		<option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                          		</select>
                       	  </td>
                        </tr>
                        <tr>
                          <td valign="bottom">
                            	IP Address
                                <input type="text" id="ip5" name="ip5" size="16" maxlength="15">
                          </td>
                          <td align=left valign="bottom">
                            	<input name="copy_ip5" type=button value="<<" class="button" onClick="copy_ip(5)">
                        		<select id="ip_list5" name="ip_list5" style="width:120">
                          			<option>Computer Name</option>
                          			<script>set_dhcp_list()</script>
                      			</select>
                   		  </td>
                          <td align=middle valign="bottom">End
                            	<input type="text" id="private_port5" name="private_port5" size=5 maxlength="5">
                          </td></tr>
                        <tr>
                          <td align=middle rowspan="2">
                          	<input type=checkbox id="enable6" name="enable6" value="1">
                          </td>
                          <td valign="bottom">
                            	Name
                                <input type="text" id="name6" name="name6" size="16" maxlength="31">
                          </td>
                          <td align=left valign="bottom">
                          	  <input name="copy_app6" type=button value="<<" class="button" onClick="copy_application(6)">
                              <select id="application6" name="application6" style="width:120">
                                <option>Application Name</option>                             
                          	  	<script>set_application_option()</script>
                          	  </select>
                          </td>
                          <td align=middle valign="bottom">Start
                            <input type="text" id="public_port6" name="public_port6" size=5 maxlength="5"></td><td align=middle rowspan="2">
                          		<select id="protocol6" name="protocol6">
                              		<option value="TCP">TCP</option>
                      				<option value="UDP">UDP</option>
                      				<option value="Any">Any</option>
                            </select>
                          </td>
                          <td align=middle rowspan="2">
                            	<select id="schedule6" name="schedule6" style="width:80">
                              		<option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                          		</select>
                       	  </td>
                        </tr>
                        <tr>
                          <td valign="bottom">
                            	IP Address
                                <input type="text" id="ip6" name="ip6" size="16" maxlength="15">
                          </td>
                          <td align=left valign="bottom">
                            	<input name="copy_ip6" type=button value="<<" class="button" onClick="copy_ip(6)">
                        		<select id="ip_list6" name="ip_list6" style="width:120">
                          			<option>Computer Name</option>
                          			<script>set_dhcp_list()</script>
                      			</select>
                   		  </td>
                          <td align=middle valign="bottom">End
                            	<input type="text" id="private_port6" name="private_port6" size=5 maxlength="5">
                          </td></tr>
                        <tr>
                          <td align=middle rowspan="2">
                          	<input type=checkbox id="enable7" name="enable7" value="1">
                          </td>
                          <td valign="bottom">
                            	Name
                                <input type="text" id="name7" name="name7" size="16" maxlength="31">
                          </td>
                          <td align=left valign="bottom">
                          	  <input name="copy_app7" type=button value="<<" class="button" onClick="copy_application(7)">
                              <select id="application7" name="application7" style="width:120">
                                <option>Application Name</option>                             
                          	  	<script>set_application_option()</script>
                          	  </select>
                          </td>
                          <td align=middle valign="bottom">Start
                            <input type="text" id="public_port7" name="public_port7" size=5 maxlength="5"></td><td align=middle rowspan="2">
                          		<select id="protocol7" name="protocol7">
                              		<option value="TCP">TCP</option>
                      				<option value="UDP">UDP</option>
                      				<option value="Any">Any</option>
                            </select>
                          </td>
                          <td align=middle rowspan="2">
                            	<select id="schedule7" name="schedule7" style="width:80">
                              		<option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                          		</select>
                       	  </td>
                        </tr>
                        <tr>
                          <td valign="bottom">
                            	IP Address
                                <input type="text" id="ip7" name="ip7" size="16" maxlength="15">
                          </td>
                          <td align=left valign="bottom">
                            	<input name="copy_ip7" type=button value="<<" class="button" onClick="copy_ip(7)">
                        		<select id="ip_list7" name="ip_list7" style="width:120">
                          			<option>Computer Name</option>
                          			<script>set_dhcp_list()</script>
                      			</select>
                   		  </td>
                          <td align=middle valign="bottom">End
                            	<input type="text" id="private_port7" name="private_port7" size=5 maxlength="5">
                          </td></tr>
                        <tr>
                          <td align=middle rowspan="2">
                          	<input type=checkbox id="enable8" name="enable8" value="1">
                          </td>
                          <td valign="bottom">
                            	Name
                                <input type="text" id="name8" name="name8" size="16" maxlength="31">
                          </td>
                          <td align=left valign="bottom">
                          	  <input name="copy_app8" type=button value="<<" class="button" onClick="copy_application(8)">
                              <select id="application8" name="application8" style="width:120">
                                <option>Application Name</option>                             
                          	  	<script>set_application_option()</script>
                          	  </select>
                          </td>
                          <td align=middle valign="bottom">Start
                            <input type="text" id="public_port8" name="public_port8" size=5 maxlength="5"></td><td align=middle rowspan="2">
                          		<select id="protocol8" name="protocol8">
                              		<option value="TCP">TCP</option>
                      				<option value="UDP">UDP</option>
                      				<option value="Any">Any</option>
                            </select>
                          </td>
                          <td align=middle rowspan="2">
                            	<select id="schedule8" name="schedule8" style="width:80">
                              		<option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                          		</select>
                       	  </td>
                        </tr>
                        <tr>
                          <td valign="bottom">
                            	IP Address
                                <input type="text" id="ip8" name="ip8" size="16" maxlength="15">
                          </td>
                          <td align=left valign="bottom">
                            	<input name="copy_ip8" type=button value="<<" class="button" onClick="copy_ip(8)">
                        		<select id="ip_list8" name="ip_list8" style="width:120">
                          			<option>Computer Name</option>
                          			<script>set_dhcp_list()</script>
                      			</select>
                   		  </td>
                          <td align=middle valign="bottom">End
                            	<input type="text" id="private_port8" name="private_port8" size=5 maxlength="5">
                          </td></tr>
                        <tr>
                          <td align=middle rowspan="2">
                          	<input type=checkbox id="enable9" name="enable9" value="1">
                          </td>
                          <td valign="bottom">
                            	Name
                                <input type="text" id="name9" name="name9" size="16" maxlength="31">
                          </td>
                          <td align=left valign="bottom">
                          	  <input name="copy_app9" type=button value="<<" class="button" onClick="copy_application(9)">
                              <select id="application9" name="application9" style="width:120">
                                <option>Application Name</option>                             
                          	  	<script>set_application_option()</script>
                          	  </select>
                          </td>
                          <td align=middle valign="bottom">Start
                            <input type="text" id="public_port9" name="public_port9" size=5 maxlength="5"></td><td align=middle rowspan="2">
                          		<select id="protocol9" name="protocol9">
                              		<option value="TCP">TCP</option>
                      				<option value="UDP">UDP</option>
                      				<option value="Any">Any</option>
                            </select>
                          </td>
                          <td align=middle rowspan="2">
                            	<select id="schedule9" name="schedule9" style="width:80">
                              		<option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                          		</select>
                       	  </td>
                        </tr>
                        <tr>
                          <td valign="bottom">
                            	IP Address
                                <input type="text" id="ip9" name="ip9" size="16" maxlength="15">
                          </td>
                          <td align=left valign="bottom">
                            	<input name="copy_ip9" type=button value="<<" class="button" onClick="copy_ip(9)">
                        		<select id="ip_list9" name="ip_list9" style="width:120">
                          			<option>Computer Name</option>
                          			<script>set_dhcp_list()</script>
                      			</select>
                   		  </td>
                          <td align=middle valign="bottom">End
                            	<input type="text" id="private_port9" name="private_port9" size=5 maxlength="5">
                          </td></tr>
                        <tr>
                          <td align=middle rowspan="2">
                          	<input type=checkbox id="enable10" name="enable10" value="1">
                          </td>
                          <td valign="bottom">
                            	Name
                                <input type="text" id="name10" name="name10" size="16" maxlength="31">
                          </td>
                          <td align=left valign="bottom">
                          	  <input name="copy_app10" type=button value="<<" class="button" onClick="copy_application(10)">
                              <select id="application10" name="application10" style="width:120">
                                <option>Application Name</option>                             
                          	  	<script>set_application_option()</script>
                          	  </select>
                          </td>
                          <td align=middle valign="bottom">Start
                            <input type="text" id="public_port10" name="public_port10" size=5 maxlength="5"></td><td align=middle rowspan="2">
                          		<select id="protocol10" name="protocol10">
                              		<option value="TCP">TCP</option>
                      				<option value="UDP">UDP</option>
                      				<option value="Any">Any</option>
                            </select>
                          </td>
                          <td align=middle rowspan="2">
                            	<select id="schedule10" name="schedule10" style="width:80">
                              		<option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                          		</select>
                       	  </td>
                        </tr>
                        <tr>
                          <td valign="bottom">
                            	IP Address
                                <input type="text" id="ip10" name="ip10" size="16" maxlength="15">
                          </td>
                          <td align=left valign="bottom">
                            	<input name="copy_ip10" type=button value="<<" class="button" onClick="copy_ip(10)">
                        		<select id="ip_list10" name="ip_list10" style="width:120">
                          			<option>Computer Name</option>
                          			<script>set_dhcp_list()</script>
                      			</select>
                   		  </td>
                          <td align=middle valign="bottom">End
                            	<input type="text" id="private_port10" name="private_port10" size=5 maxlength="5">
                          </td></tr>
                        <tr>
                          <td align=middle rowspan="2">
                          	<input type=checkbox id="enable11" name="enable11" value="1">
                          </td>
                          <td valign="bottom">
                            	Name
                                <input type="text" id="name11" name="name11" size="16" maxlength="31">
                          </td>
                          <td align=left valign="bottom">
                          	  <input name="copy_app11" type=button value="<<" class="button" onClick="copy_application(11)">
                              <select id="application11" name="application11" style="width:120">
                                <option>Application Name</option>                             
                          	  	<script>set_application_option()</script>
                          	  </select>
                          </td>
                          <td align=middle valign="bottom">Start
                            <input type="text" id="public_port11" name="public_port11" size=5 maxlength="5"></td><td align=middle rowspan="2">
                          		<select id="protocol11" name="protocol11">
                              		<option value="TCP">TCP</option>
                      				<option value="UDP">UDP</option>
                      				<option value="Any">Any</option>
                            </select>
                          </td>
                          <td align=middle rowspan="2">
                            	<select id="schedule11" name="schedule11" style="width:80">
                              		<option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                          		</select>
                       	  </td>
                        </tr>
                        <tr>
                          <td valign="bottom">
                            	IP Address
                                <input type="text" id="ip11" name="ip11" size="16" maxlength="15">
                          </td>
                          <td align=left valign="bottom">
                            	<input name="copy_ip11" type=button value="<<" class="button" onClick="copy_ip(11)">
                        		<select id="ip_list11" name="ip_list11" style="width:120">
                          			<option>Computer Name</option>
                          			<script>set_dhcp_list()</script>
                      			</select>
                   		  </td>
                          <td align=middle valign="bottom">End
                            	<input type="text" id="private_port11" name="private_port11" size=5 maxlength="5">
                          </td></tr>
                        <tr>
                          <td align=middle rowspan="2">
                          	<input type=checkbox id="enable12" name="enable12" value="1">
                          </td>
                          <td valign="bottom">
                            	Name
                                <input type="text" id="name12" name="name12" size="16" maxlength="31">
                          </td>
                          <td align=left valign="bottom">
                          	  <input name="copy_app12" type=button value="<<" class="button" onClick="copy_application(12)">
                              <select id="application12" name="application12" style="width:120">
                                <option>Application Name</option>                             
                          	  	<script>set_application_option()</script>
                          	  </select>
                          </td>
                          <td align=middle valign="bottom">Start
                            <input type="text" id="public_port12" name="public_port12" size=5 maxlength="5"></td><td align=middle rowspan="2">
                          		<select id="protocol12" name="protocol12">
                              		<option value="TCP">TCP</option>
                      				<option value="UDP">UDP</option>
                      				<option value="Any">Any</option>
                            </select>
                          </td>
                          <td align=middle rowspan="2">
                            	<select id="schedule12" name="schedule12" style="width:80">
                              		<option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                          		</select>
                       	  </td>
                        </tr>
                        <tr>
                          <td valign="bottom">
                            	IP Address
                                <input type="text" id="ip12" name="ip12" size="16" maxlength="15">
                          </td>
                          <td align=left valign="bottom">
                            	<input name="copy_ip12" type=button value="<<" class="button" onClick="copy_ip(12)">
                        		<select id="ip_list12" name="ip_list12" style="width:120">
                          			<option>Computer Name</option>
                          			<script>set_dhcp_list()</script>
                      			</select>
                   		  </td>
                          <td align=middle valign="bottom">End
                            	<input type="text" id="private_port12" name="private_port12" size=5 maxlength="5">
                          </td></tr>
                        <tr>
                          <td align=middle rowspan="2">
                          	<input type=checkbox id="enable13" name="enable13" value="1">
                          </td>
                          <td valign="bottom">
                            	Name
                                <input type="text" id="name13" name="name13" size="16" maxlength="31">
                          </td>
                          <td align=left valign="bottom">
                          	  <input name="copy_app13" type=button value="<<" class="button" onClick="copy_application(13)">
                              <select id="application13" name="application13" style="width:120">
                                <option>Application Name</option>                             
                          	  	<script>set_application_option()</script>
                          	  </select>
                          </td>
                          <td align=middle valign="bottom">Start
                            <input type="text" id="public_port13" name="public_port13" size=5 maxlength="5"></td><td align=middle rowspan="2">
                          		<select id="protocol13" name="protocol13">
                              		<option value="TCP">TCP</option>
                      				<option value="UDP">UDP</option>
                      				<option value="Any">Any</option>
                            </select>
                          </td>
                          <td align=middle rowspan="2">
                            	<select id="schedule13" name="schedule13" style="width:80">
                              		<option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                          		</select>
                       	  </td>
                        </tr>
                        <tr>
                          <td valign="bottom">
                            	IP Address
                                <input type="text" id="ip13" name="ip13" size="16" maxlength="15">
                          </td>
                          <td align=left valign="bottom">
                            	<input name="copy_ip13" type=button value="<<" class="button" onClick="copy_ip(13)">
                        		<select id="ip_list13" name="ip_list13" style="width:120">
                          			<option>Computer Name</option>
                          			<script>set_dhcp_list()</script>
                      			</select>
                   		  </td>
                          <td align=middle valign="bottom">End
                            	<input type="text" id="private_port13" name="private_port13" size=5 maxlength="5">
                          </td></tr>
                        <tr>
                          <td align=middle rowspan="2">
                          	<input type=checkbox id="enable14" name="enable14" value="1">
                          </td>
                          <td valign="bottom">
                            	Name
                                <input type="text" id="name14" name="name14" size="16" maxlength="31">
                          </td>
                          <td align=left valign="bottom">
                          	  <input name="copy_app14" type=button value="<<" class="button" onClick="copy_application(14)">
                              <select id="application14" name="application14" style="width:120">
                                <option>Application Name</option>                             
                          	  	<script>set_application_option()</script>
                          	  </select>
                          </td>
                          <td align=middle valign="bottom">Start
                            <input type="text" id="public_port14" name="public_port14" size=5 maxlength="5"></td><td align=middle rowspan="2">
                          		<select id="protocol14" name="protocol14">
                              		<option value="TCP">TCP</option>
                      				<option value="UDP">UDP</option>
                      				<option value="Any">Any</option>
                            </select>
                          </td>
                          <td align=middle rowspan="2">
                            	<select id="schedule14" name="schedule14" style="width:80">
                              		<option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                          		</select>
                       	  </td>
                        </tr>
                        <tr>
                          <td valign="bottom">
                            	IP Address
                                <input type="text" id="ip14" name="ip14" size="16" maxlength="15">
                          </td>
                          <td align=left valign="bottom">
                            	<input name="copy_ip14" type=button value="<<" class="button" onClick="copy_ip(14)">
                        		<select id="ip_list14" name="ip_list14" style="width:120">
                          			<option>Computer Name</option>
                          			<script>set_dhcp_list()</script>
                      			</select>
                   		  </td>
                          <td align=middle valign="bottom">End
                            	<input type="text" id="private_port14" name="private_port14" size=5 maxlength="5">
                          </td></tr>
                        <tr>
                          <td align=middle rowspan="2">
                          	<input type=checkbox id="enable15" name="enable15" value="1">
                          </td>
                          <td valign="bottom">
                            	Name
                                <input type="text" id="name15" name="name15" size="16" maxlength="31">
                          </td>
                          <td align=left valign="bottom">
                          	  <input name="copy_app15" type=button value="<<" class="button" onClick="copy_application(15)">
                              <select id="application15" name="application15" style="width:120">
                                <option>Application Name</option>                             
                          	  	<script>set_application_option()</script>
                          	  </select>
                          </td>
                          <td align=middle valign="bottom">Start
                            <input type="text" id="public_port15" name="public_port15" size=5 maxlength="5"></td><td align=middle rowspan="2">
                          		<select id="protocol15" name="protocol15">
                              		<option value="TCP">TCP</option>
                      				<option value="UDP">UDP</option>
                      				<option value="Any">Any</option>
                            </select>
                          </td>
                          <td align=middle rowspan="2">
                            	<select id="schedule15" name="schedule15" style="width:80">
                              		<option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                          		</select>
                       	  </td>
                        </tr>
                        <tr>
                          <td valign="bottom">
                            	IP Address
                                <input type="text" id="ip15" name="ip15" size="16" maxlength="15">
                          </td>
                          <td align=left valign="bottom">
                            	<input name="copy_ip15" type=button value="<<" class="button" onClick="copy_ip(15)">
                        		<select id="ip_list15" name="ip_list15" style="width:120">
                          			<option>Computer Name</option>
                          			<script>set_dhcp_list()</script>
                      			</select>
                   		  </td>
                          <td align=middle valign="bottom">End
                            	<input type="text" id="private_port15" name="private_port15" size=5 maxlength="5">
                          </td></tr>
                        <tr>
                          <td align=middle rowspan="2">
                          	<input type=checkbox id="enable16" name="enable16" value="1">
                          </td>
                          <td valign="bottom">
                            	Name
                                <input type="text" id="name16" name="name16" size="16" maxlength="31">
                          </td>
                          <td align=left valign="bottom">
                          	  <input name="copy_app16" type=button value="<<" class="button" onClick="copy_application(16)">
                              <select id="application16" name="application16" style="width:120">
                                <option>Application Name</option>                             
                          	  	<script>set_application_option()</script>
                          	  </select>
                          </td>
                          <td align=middle valign="bottom">Start
                            <input type="text" id="public_port16" name="public_port16" size=5 maxlength="5"></td><td align=middle rowspan="2">
                          		<select id="protocol16" name="protocol16">
                              		<option value="TCP">TCP</option>
                      				<option value="UDP">UDP</option>
                      				<option value="Any">Any</option>
                            </select>
                          </td>
                          <td align=middle rowspan="2">
                            	<select id="schedule16" name="schedule16" style="width:80">
                              		<option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                          		</select>
                       	  </td>
                        </tr>
                        <tr>
                          <td valign="bottom">
                            	IP Address
                                <input type="text" id="ip16" name="ip16" size="16" maxlength="15">
                          </td>
                          <td align=left valign="bottom">
                            	<input name="copy_ip16" type=button value="<<" class="button" onClick="copy_ip(16)">
                        		<select id="ip_list16" name="ip_list16" style="width:120">
                          			<option>Computer Name</option>
                          			<script>set_dhcp_list()</script>
                      			</select>
                   		  </td>
                          <td align=middle valign="bottom">End
                            	<input type="text" id="private_port16" name="private_port16" size=5 maxlength="5">
                          </td></tr>
                        <tr>
                          <td align=middle rowspan="2">
                          	<input type=checkbox id="enable17" name="enable17" value="1">
                          </td>
                          <td valign="bottom">
                            	Name
                                <input type="text" id="name17" name="name17" size="16" maxlength="31">
                          </td>
                          <td align=left valign="bottom">
                          	  <input name="copy_app17" type=button value="<<" class="button" onClick="copy_application(17)">
                              <select id="application17" name="application17" style="width:120">
                                <option>Application Name</option>                             
                          	  	<script>set_application_option()</script>
                          	  </select>
                          </td>
                          <td align=middle valign="bottom">Start
                            <input type="text" id="public_port17" name="public_port17" size=5 maxlength="5"></td><td align=middle rowspan="2">
                          		<select id="protocol17" name="protocol17">
                              		<option value="TCP">TCP</option>
                      				<option value="UDP">UDP</option>
                      				<option value="Any">Any</option>
                            </select>
                          </td>
                          <td align=middle rowspan="2">
                            <select id="schedule17" name="schedule17" style="width:80">
                              <option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                            </select>
</td>
                        </tr>
                        <tr>
                          <td valign="bottom">
                            	IP Address
                                <input type="text" id="ip17" name="ip17" size="16" maxlength="15">
                          </td>
                          <td align=left valign="bottom">
                            	<input name="copy_ip17" type=button value="<<" class="button" onClick="copy_ip(17)">
                        		<select id="ip_list17" name="ip_list17" style="width:120">
                          			<option>Computer Name</option>
                          			<script>set_dhcp_list()</script>
                      			</select>
                   		  </td>
                          <td align=middle valign="bottom">End
                            	<input type="text" id="private_port17" name="private_port17" size=5 maxlength="5">
                          </td></tr>
                        <tr>
                          <td align=middle rowspan="2">
                          	<input type=checkbox id="enable18" name="enable18" value="1">
                          </td>
                          <td valign="bottom">
                            	Name
                                <input type="text" id="name18" name="name18" size="16" maxlength="31">
                          </td>
                          <td align=left valign="bottom">
                          	  <input name="copy_app18" type=button value="<<" class="button" onClick="copy_application(18)">
                              <select id="application18" name="application18" style="width:120">
                                <option>Application Name</option>                             
                          	  	<script>set_application_option()</script>
                          	  </select>
                          </td>
                          <td align=middle valign="bottom">Start
                            <input type="text" id="public_port18" name="public_port18" size=5 maxlength="5"></td><td align=middle rowspan="2">
                          		<select id="protocol18" name="protocol18">
                              		<option value="TCP">TCP</option>
                      				<option value="UDP">UDP</option>
                      				<option value="Any">Any</option>
                            </select>
                          </td>
                          <td align=middle rowspan="2">
                            	<select id="schedule18" name="schedule18" style="width:80">
                              		<option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                          		</select>
                       	  </td>
                        </tr>
                        <tr>
                          <td valign="bottom">
                            	IP Address
                                <input type="text" id="ip18" name="ip18" size="16" maxlength="15">
                          </td>
                          <td align=left valign="bottom">
                            	<input name="copy_ip18" type=button value="<<" class="button" onClick="copy_ip(18)">
                        		<select id="ip_list18" name="ip_list18" style="width:120">
                          			<option>Computer Name</option>
                          			<script>set_dhcp_list()</script>
                      			</select>
                   		  </td>
                          <td align=middle valign="bottom">End
                            	<input type="text" id="private_port18" name="private_port18" size=5 maxlength="5">
                          </td></tr>
                        <tr>
                          <td align=middle rowspan="2">
                          	<input type=checkbox id="enable19" name="enable19" value="1">
                          </td>
                          <td valign="bottom">
                            	Name
                                <input type="text" id="name19" name="name19" size="16" maxlength="31">
                          </td>
                          <td align=left valign="bottom">
                          	  <input name="copy_app19" type=button value="<<" class="button" onClick="copy_application(19)">
                              <select id="application19" name="application19" style="width:120">
                                <option>Application Name</option>                             
                          	  	<script>set_application_option()</script>
                          	  </select>
                          </td>
                          <td align=middle valign="bottom">Start
                            <input type="text" id="public_port19" name="public_port19" size=5 maxlength="5"></td><td align=middle rowspan="2">
                          		<select id="protocol19" name="protocol19">
                              		<option value="TCP">TCP</option>
                      				<option value="UDP">UDP</option>
                      				<option value="Any">Any</option>
                            </select>
                          </td>
                          <td align=middle rowspan="2">
                            	<select id="schedule19" name="schedule19" style="width:80">
                              		<option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                          		</select>
                       	  </td>
                        </tr>
                        <tr>
                          <td valign="bottom">
                            	IP Address
                                <input type="text" id="ip19" name="ip19" size="16" maxlength="15">
                          </td>
                          <td align=left valign="bottom">
                            	<input name="copy_ip19" type=button value="<<" class="button" onClick="copy_ip(19)">
                        		<select id="ip_list19" name="ip_list19" style="width:120">
                          			<option>Computer Name</option>
                          			<script>set_dhcp_list()</script>
                      			</select>
                   		  </td>
                          <td align=middle valign="bottom">End
                            	<input type="text" id="private_port19" name="private_port19" size=5 maxlength="5">
                          </td></tr>
                        <tr>
                          <td align=middle rowspan="2">
                          	<input type=checkbox id="enable20" name="enable20" value="1">
                          </td>
                          <td valign="bottom">
                            	Name
                                <input type="text" id="name20" name="name20" size="16" maxlength="31">
                          </td>
                          <td align=left valign="bottom">
                          	  <input name="copy_app20" type=button value="<<" class="button" onClick="copy_application(20)">
                              <select id="application20" name="application20" style="width:120">
                                <option>Application Name</option>                             
                          	  	<script>set_application_option()</script>
                          	  </select>
                          </td>
                          <td align=middle valign="bottom">Start
                            <input type="text" id="public_port20" name="public_port20" size=5 maxlength="5"></td><td align=middle rowspan="2">
                          		<select id="protocol20" name="protocol20">
                              		<option value="TCP">TCP</option>
                      				<option value="UDP">UDP</option>
                      				<option value="Any">Any</option>
                            </select>
                          </td>
                          <td align=middle rowspan="2">
                            	<select id="schedule20" name="schedule20" style="width:80">
                              		<option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                          		</select>
                       	  </td>
                        </tr>
                        <tr>
                          <td valign="bottom">
                            	IP Address
                                <input type="text" id="ip20" name="ip20" size="16" maxlength="15">
                       	  </td>
                          	<td align=left valign="bottom">
                            	<input name="copy_ip20" type=button value="<<" class="button" onClick="copy_ip(20)">
                        		<select id="ip_list20" name="ip_list20" style="width:120">
                          			<option>Computer Name</option>
                          			<script>set_dhcp_list()</script>
                      			</select>
                          </td>
                          <td align=middle valign="bottom">End
                            	<input type="text" id="private_port20" name="private_port20" size=5 maxlength="5">
                          </td>
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
                          <span class="style1"> Check the<strong> Application Name</strong> drop down menu for a list of pre-defined applications that you can select from.  If you select one of the pre-defined applications, click the arrow button next to the drop down menu to fill out the appropriate fields.</span></p>
                        <p class="style1"> You can select your computer from the list of DHCP clients in the <strong>Computer Name</strong> drop down menu, or enter the IP address manually of the computer you would like to open the specified port to.</p>
                        <p class="style1"> In order to apply a schedule to a Port Forwarding Rule, you must first define a schedule on the <strong>Tools>Schedules</strong> page.</p>
                        <p class="style1"> This feature allows you to open a range of ports to a computer on your network.  To do so, enter the first port in the range you would like to open in the <strong>Start</strong> field and last port of the range in the <strong>End</strong> field.</p>
                      <p class="style1"> To open a single port using this feature, simply enter the same number in both the <strong>Start</strong> and <strong>End</strong> fields. </p></td>
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
	set_port_forwarding();
</script>
</html>
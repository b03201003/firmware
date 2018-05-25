<html>
<head>

<link rel="STYLESHEET" type="text/css" href="css_router.css">
<script language="JavaScript" src="public.js"></script>
<script language="JavaScript">
	var submit_button_flag = 0;
	function onPageLoad(){
		for (var i = 0; i < 20; i++){
			var temp_appl;
			if (i > 9){
				temp_appl = get_by_id("application_" + i).value;
			}else{
				temp_appl = get_by_id("application_0" + i).value;				
			}
			
			if(temp_appl ==""){
				if (i > 9){
					 get_by_id("application_" + i).value = "0///TCP/0/TCP/0/Always";
				}else{
					get_by_id("application_0" + i).value = "0///TCP/0/TCP/0/Always";				
				}
			}
			
		}
	}
	
	
	function set_application(){
		for (var i = 0; i < 20; i++){
			var temp_appl;
			
			if (i > 9){
				temp_appl = (get_by_id("application_" + i).value).split("/");
			}else{
				temp_appl = (get_by_id("application_0" + i).value).split("/");				
			}
			
			if (temp_appl.length > 1){
				
				if (temp_appl[0] == "1"){
					get_by_id("enable" + (i+1)).checked = true;
				}
				
				get_by_id("name" + (i+1)).value = temp_appl[1];								
				set_protocol(temp_appl[3], get_by_id("trigger" + (i+1)));	
				get_by_id("trigger_port" + (i+1)).value = temp_appl[4];
				set_protocol(temp_appl[5], get_by_id("public" + (i+1)));
				get_by_id("public_port" + (i+1)).value = temp_appl[6];
				set_selectIndex(temp_appl[7], get_by_id("schedule" + (i+1)));				
			}
		}
	}
	    	
	function send_request(){
		var count = 0;
		
		for (var i = 1; i <= 20; i++){
			var name = get_by_id("name" + i);
			var trigger_port = (get_by_id("trigger_port" + i).value).split("-");
			var public_port = (get_by_id("public_port" + i).value).split(",");			
			var is_enable = 0;
			var temp_appl;
			
			if (i > 10){
				get_by_id("application_" + (i-1)).value = "";
			}else{
				get_by_id("application_0" + (i-1)).value = "";
			}
			
			if (name.value != ""){
				if (get_by_id("trigger_port" + i).value == ""){
		     		alert(msg[TRIGGER_PORT_ERROR]);
		     		return false;
		     	}else if (get_by_id("public_port" + i).value == ""){
		     		alert(msg[PUBLIC_PORT_ERROR]);
		     		return false;
		     	}
		     	
		     	if (!check_port(trigger_port[0])){
	 				alert(msg[PUBLIC_PORT_ERROR]);
	 				return false;
	 			}		  
	 			   	
		     	if (trigger_port.length > 1){
		     		if (!check_port(trigger_port[1])){
		 				alert(msg[PUBLIC_PORT_ERROR]);
		 				return false;
		 			}	
		     	}
		     			     				     	
		     	for (var j = 0; j < public_port.length; j++){
	  				var port = public_port[j].split("-");
	  				var temp_port1 = "";
	  				var temp_port2 = "";
	  				
	  				
	  				temp_port1 = port[0];
	  				
	  				if (port.length > 1){
	  					temp_port2 = port[1];
	  				}
	  				
	 				if (temp_port1 != ""){
	 					if (!check_port(temp_port1)){
			 				alert(msg[PUBLIC_PORT_ERROR]);
			 				return false;
			 			}
	 				}
 				
	 				if (temp_port2 != ""){
	 					if (!check_port(temp_port2)){
			 				alert(msg[PUBLIC_PORT_ERROR]);
			 				return false;
			 			}
	 				}		
	 								
				}
				
				if (get_by_id("enable" + i).checked){
		        	is_enable = 1;
		        }
		        
		        if (count > 9){
					temp_appl = get_by_id("application_" + count);
				}else{
					temp_appl = get_by_id("application_0" + count);
				}
				
				temp_appl.value = is_enable + "/" + get_by_id("name" + i).value + "/Any/" + get_by_id("trigger" + i).value 
					+ "/" + get_by_id("trigger_port" + i).value + "/" + get_by_id("public" + i).value 
					+ "/" + get_by_id("public_port" + i).value + "/" + get_by_id("schedule" + i).value;
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
                              <div><a href="adv_portforward.asp">Port Forwarding</a></div>
                            <LI>
                              <div id=sidenavoff>Application Rules</div>
                            <LI>
                              <div><a href="adv_filters_mac.asp">Network Filter</a></div>
							<LI>
							  <!--<div><a href="adv_access_control.asp">Access control</a></div>
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
				<input type="hidden" name="html_response_return_page" value="adv_appl.asp">
				<input type="hidden" id="application_00" name="application_00" value="<% CmoGetCfg("application_00","none"); %>">
                <input type="hidden" id="application_01" name="application_01" value="<% CmoGetCfg("application_01","none"); %>">
                <input type="hidden" id="application_02" name="application_02" value="<% CmoGetCfg("application_02","none"); %>">
                <input type="hidden" id="application_03" name="application_03" value="<% CmoGetCfg("application_03","none"); %>">
                <input type="hidden" id="application_04" name="application_04" value="<% CmoGetCfg("application_04","none"); %>">
                <input type="hidden" id="application_05" name="application_05" value="<% CmoGetCfg("application_05","none"); %>">
                <input type="hidden" id="application_06" name="application_06" value="<% CmoGetCfg("application_06","none"); %>">
                <input type="hidden" id="application_07" name="application_07" value="<% CmoGetCfg("application_07","none"); %>">
                <input type="hidden" id="application_08" name="application_08" value="<% CmoGetCfg("application_08","none"); %>">
                <input type="hidden" id="application_09" name="application_09" value="<% CmoGetCfg("application_09","none"); %>">
                <input type="hidden" id="application_10" name="application_10" value="<% CmoGetCfg("application_10","none"); %>">
                <input type="hidden" id="application_11" name="application_11" value="<% CmoGetCfg("application_11","none"); %>">
                <input type="hidden" id="application_12" name="application_12" value="<% CmoGetCfg("application_12","none"); %>">
                <input type="hidden" id="application_13" name="application_13" value="<% CmoGetCfg("application_13","none"); %>">
                <input type="hidden" id="application_14" name="application_14" value="<% CmoGetCfg("application_14","none"); %>">
                <input type="hidden" id="application_15" name="application_15" value="<% CmoGetCfg("application_15","none"); %>">
                <input type="hidden" id="application_16" name="application_16" value="<% CmoGetCfg("application_16","none"); %>">
                <input type="hidden" id="application_17" name="application_17" value="<% CmoGetCfg("application_17","none"); %>">
                <input type="hidden" id="application_18" name="application_18" value="<% CmoGetCfg("application_18","none"); %>">
                <input type="hidden" id="application_19" name="application_19" value="<% CmoGetCfg("application_19","none"); %>">
                
                
                
			<td valign="top" id="maincontent_container">
				<div id=maincontent>			
                  <div id=box_header>
                    <h1>Application Rules : </h1>
                    <p>The Application Rules option is used to open single or multiple ports in your firewall when the router senses data sent to the Internet on a outgoing "Trigger" port or port range. Special Applications rules apply to all computers on your internal network.</p>
                    <input name="button" type="submit" class=button_submit value="Save Settings" onClick="return send_request()">
                    <input name="button2" type=button class=button_submit value="Don't Save Settings"  onClick="window.location.href='adv_appl.asp'">
                  </div>
                  <div class=box>
                    <h2>20 -Application Rules</h2>
                    <table borderColor=#ffffff cellSpacing=1 cellPadding=2 width=525 bgColor=#dfdfdf border=1>
                      <tbody>
                        <tr>
                          <td align=middle width=20>&nbsp;</td>
                          <td width="75">&nbsp;</td>
                          <td width="173" align=left><div align="left">&nbsp;</div></td>
                          <td width="80" align=middle><div align="center">Port</div></td>
                          <td width="52" align=middle><div align="center">Traffic Type </div></td>
                          <td width="80" align=middle><div align="center">Schedule</div></td>
                        </tr>
                        <tr>
                          <td align=middle rowspan="2"><input type=checkbox id="enable1" name="enable1" value="1"></td>
                          <td rowspan="2" align=middle><input type="text" id="name1" name="name1" size="15" maxlength="31"></td>
                          <td rowspan="2" align=left>
                              <input name="copy_app1" type=button value="<<" class="button" onClick="copy_special_appl(1)">
                              <select id="application1" name="application1" style="width:108">
                                <option>Application Name</option>
                                <script>set_special_appl_option()</script>
                              </select>
                          </td>
                          <td align=middle valign="bottom"> <div align="left">Trigger
                              <input type="text" id="trigger_port1" name="trigger_port1" size=12 maxlength="11">
                          </div></td>
                              <td align=middle valign="bottom">
                                <select id="trigger1" name="trigger1">
                                  	<option value="TCP">TCP</option>
                  					<option value="UDP">UDP</option>
                  					<option value="Any">Any</option>
                                </select>
                              </td>
                              <td rowspan="2" align=middle>
                                <select id="schedule1" name="schedule1" style="width:80">
                                  <option value="Always">Always</option>
                              	  <script>set_schedule_option()</script>
                                </select>
                              </td>                             
                        </tr>
                        <tr>
                          <td height="10" align=middle valign="bottom"><div align="left">Firewall
                              <input type=text id="public_port1" name="public_port1" size=12 maxlength=60>                             
                          </div></td>
                          <td align=middle valign="bottom">
                            <select id="public1" name="public1">
                              	<option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                            </select>
                          </td>
                        </tr>
                     	<tr>
                          <td align=middle rowspan="2"><input type=checkbox id="enable2" name="enable2" value="1"></td>
                          <td rowspan="2" align=middle><input type="text" id="name2" name="name2" size="15" maxlength="31"></td>
                          <td rowspan="2" align=left>
                              <input name="copy_app2" type=button value="<<" class="button" onClick="copy_special_appl(2)">
                              <select id="application2" name="application2" style="width:108">
                                <option>Application Name</option>                             
                          	  	<script>set_special_appl_option()</script>
                          	  </select>
                          </td>
                          <td align=middle valign="bottom"> <div align="left">Trigger
                              <input type="text" id="trigger_port2" name="trigger_port2" size=12 maxlength="11">
                          </div></td>
                              <td align=middle valign="bottom">
                                <select id="trigger2" name="trigger2">
                                  <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                                </select>
                              </td>
                              <td rowspan="2" align=middle>
                                <select id="schedule2" name="schedule2" style="width:80">
                                  <option value="Always">Always</option>
                              	  <script>set_schedule_option()</script>
                                </select>
                              </td>                            
                        </tr>
                        <tr>
                          <td height="10" align=middle valign="bottom"><div align="left">Firewall
                              <input type=text id="public_port2" name="public_port2" size=12 maxlength=60>                             
                          </div></td>
                          <td align=middle valign="bottom">
                            <select id="public2" name="public2">
                             <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <td align=middle rowspan="2"><input type=checkbox id="enable3" name="enable3" value="1"></td>
                          <td rowspan="2" align=middle><input type="text" id="name3" name="name3" size="15" maxlength="31"></td>
                          <td rowspan="2" align=left>
                              <input name="copy_app3" type=button value="<<" class="button" onClick="copy_special_appl(3)">
                              <select id="application3" name="application3" style="width:108">
                                <option>Application Name</option>                             
                          	  	<script>set_special_appl_option()</script>
                          	  </select>
                          </td>
                          <td align=middle valign="bottom"> <div align="left">Trigger
                              <input type="text" id="trigger_port3" name="trigger_port3" size=12 maxlength="11">
                          </div></td>
                              <td align=middle valign="bottom">
                                <select id="trigger3" name="trigger3">
                                  <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                                </select>
                              </td>
                              <td rowspan="2" align=middle>
                                <select id="schedule3" name="schedule3" style="width:80">
                                  <option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                                </select>
                              </td>                          
                        </tr>
                        <tr>
                          <td height="10" align=middle valign="bottom"><div align="left">Firewall
                              <input type=text id="public_port3" name="public_port3" size=12 maxlength=60>                             
                          </div></td>
                          <td align=middle valign="bottom">
                            <select id="public3" name="public3">
                              <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <td align=middle rowspan="2"><input type=checkbox id="enable4" name="enable4" value="1"></td>
                          <td rowspan="2" align=middle><input type="text" id="name4" name="name4" size="15" maxlength="31"></td>
                          <td rowspan="2" align=left>
                              <input name="copy_app4" type=button value="<<" class="button" onClick="copy_special_appl(4)">
                              <select id="application4" name="application4" style="width:108">
                                <option>Application Name</option>                             
                          	  	<script>set_special_appl_option()</script>
                          	  </select>
                          </td>
                          <td align=middle valign="bottom"> <div align="left">Trigger
                              <input type="text" id="trigger_port4" name="trigger_port4" size=12 maxlength="11">
                          </div></td>
                              <td align=middle valign="bottom">
                                <select id="trigger4" name="trigger4">
                                  <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                                </select>
                              </td>
                              <td rowspan="2" align=middle>
                                <select id="schedule4" name="schedule4" style="width:80">
                                  <option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                                </select>
                              </td>                           
                        </tr>
                        <tr>
                          <td height="10" align=middle valign="bottom"><div align="left">Firewall
                              <input type=text id="public_port4" name="public_port4" size=12 maxlength=60>                              
                          </div></td>
                          <td align=middle valign="bottom">
                            <select id="public4" name="public4">
                              <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <td align=middle rowspan="2"><input type=checkbox id="enable5" name="enable5" value="1"></td>
                          <td rowspan="2" align=middle><input type="text" id="name5" name="name5" size="15" maxlength="31"></td>
                          <td rowspan="2" align=left>
                              <input name="copy_app5" type=button value="<<" class="button" onClick="copy_special_appl(5)">
                              <select id="application5" name="application5" style="width:108">
                                <option>Application Name</option>                             
                          	  	<script>set_special_appl_option()</script>
                          	  </select>
                          </td>
                          <td align=middle valign="bottom"> <div align="left">Trigger
                              <input type="text" id="trigger_port5" name="trigger_port5" size=12 maxlength="11">
                          </div></td>
                              <td align=middle valign="bottom">
                                <select id="trigger5" name="trigger5">
                                  <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                                </select>
                              </td>
                              <td rowspan="2" align=middle>
                                <select id="schedule5" name="schedule5" style="width:80">
                                  <option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                                </select>
                              </td>                             
                        </tr>
                        <tr>
                          <td height="10" align=middle valign="bottom"><div align="left">Firewall
                              <input type=text id="public_port5" name="public_port5" size=12 maxlength=60>                              
                          </div></td>
                          <td align=middle valign="bottom">
                            <select id="public5" name="public5">
                              <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <td align=middle rowspan="2"><input type=checkbox id="enable6" name="enable6" value="1"></td>
                          <td rowspan="2" align=middle><input type="text" id="name6" name="name6" size="15" maxlength="31"></td>
                          <td rowspan="2" align=left">
                              <input name="copy_app6" type=button value="<<" class="button" onClick="copy_special_appl(6)">
                              <select id="application6" name="application6" style="width:108">
                                <option>Application Name</option>                             
                          	  	<script>set_special_appl_option()</script>
                          	  </select>
                          </td>
                          <td align=middle valign="bottom"> <div align="left">Trigger
                              <input type="text" id="trigger_port6" name="trigger_port6" size=12 maxlength="11">
                          </div></td>
                              <td align=middle valign="bottom">
                                <select id="trigger6" name="trigger6">
                                  <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                                </select>
                              </td>
                              <td rowspan="2" align=middle>
                                <select id="schedule6" name="schedule6" style="width:80">
                                  <option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                                </select>
                              </td>                           
                        </tr>
                        <tr>
                          <td height="10" align=middle valign="bottom"><div align="left">Firewall
                              <input type=text id="public_port6" name="public_port6" size=12 maxlength=60>                             
                          </div></td>
                          <td align=middle valign="bottom">
                            <select id="public6" name="public6">
                              <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <td align=middle rowspan="2"><input type=checkbox id="enable7" name="enable7" value="1"></td>
                          <td rowspan="2" align=middle><input type="text" id="name7" name="name7" size="15" maxlength="31"></td>
                          <td rowspan="2" align=left>
                              <input name="copy_app7" type=button value="<<" class="button" onClick="copy_special_appl(7)">
                              <select id="application7" name="application7" style="width:108">
                                <option>Application Name</option>                             
                          	  	<script>set_special_appl_option()</script>
                          	  </select>
                          </td>
                          <td align=middle valign="bottom"> <div align="left">Trigger
                              <input type="text" id="trigger_port7" name="trigger_port7" size=12 maxlength="11">
                          </div></td>
                              <td align=middle valign="bottom">
                                <select id="trigger7" name="trigger7">
                                  <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                                </select>
                              </td>
                              <td rowspan="2" align=middle>
                                <select id="schedule7" name="schedule7" style="width:80">
                                  <option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                                </select>
                              </td>                          
                        </tr>
                        <tr>
                          <td height="10" align=middle valign="bottom"><div align="left">Firewall
                              <input type=text id="public_port7" name="public_port7" size=12 maxlength=60>                             
                          </div></td>
                          <td align=middle valign="bottom">
                            <select id="public7" name="public7">
                              <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <td align=middle rowspan="2"><input type=checkbox id="enable8" name="enable8" value="1"></td>
                          <td rowspan="2" align=middle><input type="text" id="name8" name="name8" size="15" maxlength="31"></td>
                          <td rowspan="2" align=left>
                              <input name="copy_app8" type=button value="<<" class="button" onClick="copy_special_appl(8)">
                              <select id="application8" name="application8" style="width:108">
                                <option>Application Name</option>                             
                          	  	<script>set_special_appl_option()</script>
                          	  </select>
                          </td>
                          <td align=middle valign="bottom"> <div align="left">Trigger
                              <input type="text" id="trigger_port8" name="trigger_port8" size=12 maxlength="11">
                          </div></td>
                              <td align=middle valign="bottom">
                                <select id="trigger8" name="trigger8">
                                  <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                                </select>
                              </td>
                              <td rowspan="2" align=middle>
                                <select id="schedule8" name="schedule8" style="width:80">
                                  <option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                                </select>
                              </td>                         
                        </tr>
                        <tr>
                          <td height="10" align=middle valign="bottom"><div align="left">Firewall
                              <input type=text id="public_port8" name="public_port8" size=12 maxlength=60>                             
                          </div></td>
                          <td align=middle valign="bottom">
                            <select id="public8" name="public8">
                              <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <td align=middle rowspan="2"><input type=checkbox id="enable9" name="enable9" value="1"></td>
                          <td rowspan="2" align=middle><input type="text" id="name9" name="name9" size="15" maxlength="31"></td>
                          <td rowspan="2" align=left>
                              <input name="copy_app9" type=button value="<<" class="button" onClick="copy_special_appl(9)">
                              <select id="application9" name="application9" style="width:108">
                                <option>Application Name</option>                             
                          	  	<script>set_special_appl_option()</script>
                          	  </select>
                          </td>
                          <td align=middle valign="bottom"> <div align="left">Trigger
                              <input type="text" id="trigger_port9" name="trigger_port9" size=12 maxlength="11">
                          </div></td>
                              <td align=middle valign="bottom">
                                <select id="trigger9" name="trigger9">
                                  <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                                </select>
                              </td>
                              <td rowspan="2" align=middle>
                                <select id="schedule9" name="schedule9" style="width:80">
                                  <option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                                </select>
                              </td>                            
                        </tr>
                        <tr>
                          <td height="10" align=middle valign="bottom"><div align="left">Firewall
                              <input type=text id="public_port9" name="public_port9" size=12 maxlength=60>                             
                          </div></td>
                          <td align=middle valign="bottom">
                            <select id="public9" name="public9">
                              <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <td align=middle rowspan="2"><input type=checkbox id="enable10" name="enable10" value="1"></td>
                          <td rowspan="2" align=middle><input type="text" id="name10" name="name10" size="15" maxlength="31"></td>
                          <td rowspan="2" align=left>
                              <input name="copy_app10" type=button value="<<" class="button" onClick="copy_special_appl(10)">
                            <select id="application10" name="application10" style="width:108">
                                <option>Application Name</option>                             
                          	  	<script>set_special_appl_option()</script>
                       	    </select>
                          </td>
                          <td align=middle valign="bottom">
                            <div align="left">Trigger
                                <input type="text" id="trigger_port10" name="trigger_port10" size=12 maxlength="11">
                          </div></td>
                              <td align=middle valign="bottom">
                                <select id="trigger10" name="trigger10">
                                  <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                                </select>
                              </td>
                              <td rowspan="2" align=middle>
                                <select id="schedule10" name="schedule10" style="width:80">
                                  <option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                                </select>
                              </td>                           
                        </tr>
                        <tr>
                          <td height="10" align=middle valign="bottom"><div align="left">Firewall
                              <input type=text id="public_port10" name="public_port10" size=12 maxlength=60>                            
                          </div></td>
                          <td align=middle valign="bottom">
                            <select id="public10" name="public10">
                              <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                            </select>
                          </td>
                        </tr>                        
                         <tr>
                          <td align=middle rowspan="2"><input type=checkbox id="enable11" name="enable11" value="1"></td>
                          <td rowspan="2" align=middle><input type="text" id="name11" name="name11" size="15" maxlength="31"></td>
                          <td rowspan="2" align=left>
                            <input name="copy_app11" type=button class="button" onClick="copy_special_appl(11)" value="<<">
                            <select id="application11" name="application11" style="width:108">
                              <option>Application Name</option>
                              <script>set_special_appl_option()</script>
                            </select>
</td>
                          <td align=middle valign="bottom">
                            <div align="left">Trigger
                                <input type="text" id="trigger_port11" name="trigger_port11" size=12 maxlength="11">
                          </div></td>
                          <td align=middle valign="bottom">
                            <select id="trigger11" name="trigger11">
                              <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                            </select>
                          </td>
                          <td rowspan="2" align=middle>
                            <select id="schedule11" name="schedule11" style="width:80">
                             <option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                            </select>
                          </td>                        
                        </tr>
                        <tr>
                          <td height="10" align=middle valign="bottom"><div align="left">Firewall
                                  <input type=text id="public_port11" name="public_port11" size=12 maxlength=60>                              
                          </div></td>
                          <td align=middle valign="bottom">
                            <select id="public11" name="public11">
                              <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <td align=middle rowspan="2"><input type=checkbox id="enable12" name="enable12" value="1"></td>
                          <td rowspan="2" align=middle><input type="text" id="name12" name="name12" size="15" maxlength="31"></td>
                          <td rowspan="2" align=left>
                            <input name="copy_app12" type=button class="button" onClick="copy_special_appl(12)" value="<<">
                            <select id="application12" name="application12" style="width:108">
                              <option>Application Name</option>
                              <script>set_special_appl_option()</script>
                            </select>
                          </td>
                          <td align=middle valign="bottom">
                            <div align="left">Trigger
                                <input type="text" id="trigger_port12" name="trigger_port12" size=12 maxlength="11">
                          </div></td>
                          <td align=middle valign="bottom">
                            <select id="trigger12" name="trigger12">
                              <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                            </select>
                          </td>
                          <td rowspan="2" align=middle>
                            <select id="schedule12" name="schedule12" style="width:80">
                              <option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                            </select>
                          </td>                        
                        </tr>
                        <tr>
                          <td height="10" align=middle valign="bottom"><div align="left">Firewall
                                  <input type=text id="public_port12" name="public_port12" size=12 maxlength=60>                                
                          </div></td>
                          <td align=middle valign="bottom">
                            <select id="public12" name="public12">
                             <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <td align=middle rowspan="2"><input type=checkbox id="enable13" name="enable13" value="1"></td>
                          <td rowspan="2" align=middle><input type="text" id="name13" name="name13" size="15" maxlength="31"></td>
                          <td rowspan="2" align=left>
                            <input name="copy_app13" type=button class="button" onClick="copy_special_appl(13)" value="<<">
                            <select id="application13" name="application13" style="width:108">
                              <option>Application Name</option>
                              <script>set_special_appl_option()</script>
                            </select>
                          </td>
                          <td align=middle valign="bottom">
                            <div align="left">Trigger
                                <input type="text" id="trigger_port13" name="trigger_port13" size=12 maxlength="11">
                          </div></td>
                          <td align=middle valign="bottom">
                            <select id="trigger13" name="trigger13">
                              <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                            </select>
                          </td>
                          <td rowspan="2" align=middle>
                            <select id="schedule13" name="schedule13" style="width:80">
                             <option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                            </select>
                          </td>                        
                        </tr>
                        <tr>
                          <td height="10" align=middle valign="bottom"><div align="left">Firewall
                                  <input type=text id="public_port13" name="public_port13" size=12 maxlength=60>                                
                          </div></td>
                          <td align=middle valign="bottom">
                            <select id="public13" name="public13">
                              <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <td align=middle rowspan="2"><input type=checkbox id="enable14" name="enable14" value="1"></td>
                          <td rowspan="2" align=middle><input type="text" id="name14" name="name14" size="15" maxlength="31"></td>
                          <td rowspan="2" align=left>
                            <input name="copy_app14" type=button class="button" onClick="copy_special_appl(14)" value="<<">
                            <select id="application14" name="application14" style="width:108">
                              <option>Application Name</option>
                              <script>set_special_appl_option()</script>
                            </select>
                          </td>
                          <td align=middle valign="bottom">
                            <div align="left">Trigger
                                <input type="text" id="trigger_port14" name="trigger_port14" size=12 maxlength="11">
                          </div></td>
                          <td align=middle valign="bottom">
                            <select id="trigger14" name="trigger14">
                              <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                            </select>
                          </td>
                          <td rowspan="2" align=middle>
                            <select id="schedule14" name="schedule14" style="width:80">
                              <option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                            </select>
                          </td>                        
                        </tr>
                        <tr>
                          <td height="10" align=middle valign="bottom"><div align="left">Firewall
                                  <input type=text id="public_port14" name="public_port14" size=12 maxlength=60>                                 
                          </div></td>
                          <td align=middle valign="bottom">
                            <select id="public14" name="public14">
                             <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <td align=middle rowspan="2"><input type=checkbox id="enable15" name="enable15" value="1"></td>
                          <td rowspan="2" align=middle><input type="text" id="name15" name="name15" size="15" maxlength="31"></td>
                          <td rowspan="2" align=left>
                            <input name="copy_app15" type=button class="button" onClick="copy_special_appl(15)" value="<<">
                            <select id="application15" name="application15" style="width:108">
                              <option>Application Name</option>
                              <script>set_special_appl_option()</script>
                            </select>
                          </td>
                          <td align=middle valign="bottom">
                            <div align="left">Trigger
                                <input type="text" id="trigger_port15" name="trigger_port15" size=12 maxlength="11">
                          </div></td>
                          <td align=middle valign="bottom">
                            <select id="trigger15" name="trigger15">
                              <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                            </select>
                          </td>
                          <td rowspan="2" align=middle>
                            <select id="schedule15" name="schedule15" style="width:80">
                              <option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                            </select>
                          </td>                        
                        </tr>
                        <tr>
                          <td height="10" align=middle valign="bottom"><div align="left">Firewall
                                  <input type=text id="public_port15" name="public_port15" size=12 maxlength=60>                                  
                          </div></td>
                          <td align=middle valign="bottom">
                            <select id="public15" name="public15">
                              <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <td align=middle rowspan="2"><input type=checkbox id="enable16" name="enable16" value="1"></td>
                          <td rowspan="2" align=middle><input type="text" id="name16" name="name16" size="15" maxlength="31"></td>
                          <td rowspan="2" align=left">
                            <input name="copy_app16" type=button class="button" onClick="copy_special_appl(16)" value="<<">
                            <select id="application16" name="application16" style="width:108">
                              <option>Application Name</option>
                              <script>set_special_appl_option()</script>
                            </select>
                          </td>
                          <td align=middle valign="bottom">
                            <div align="left">Trigger
                                <input type="text" id="trigger_port16" name="trigger_port16" size=12 maxlength="11">
                          </div></td>
                          <td align=middle valign="bottom">
                            <select id="trigger16" name="trigger16">
                              <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                            </select>
                          </td>
                          <td rowspan="2" align=middle>
                            <select id="schedule16" name="schedule16" style="width:80">
                              <option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                            </select>
                          </td>                        
                        </tr>
                        <tr>
                          <td height="10" align=middle valign="bottom"><div align="left">Firewall
                                  <input type=text id="public_port16" name="public_port16" size=12 maxlength=60>                                 
                          </div></td>
                          <td align=middle valign="bottom">
                            <select id="public16" name="public16">
                              <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <td align=middle rowspan="2"><input type=checkbox id="enable17" name="enable17" value="1"></td>
                          <td rowspan="2" align=middle><input type="text" id="name17" name="name17" size="15" maxlength="31"></td>
                          <td rowspan="2" align=left>
                            <input name="copy_app17" type=button class="button" onClick="copy_special_appl(17)" value="<<">
                            <select id="application17" name="application17" style="width:108">
                              <option>Application Name</option>
                              <script>set_special_appl_option()</script>
                            </select>
                          </td>
                          <td align=middle valign="bottom">
                            <div align="left">Trigger
                                <input type="text" id="trigger_port17" name="trigger_port17" size=12 maxlength="11">
                          </div></td>
                          <td align=middle valign="bottom">
                            <select id="trigger17" name="trigger17">
                              <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                            </select>
                          </td>
                          <td rowspan="2" align=middle>
                            <select id="schedule17" name="schedule17" style="width:80">
                             <option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                            </select>
                          </td>                        
                        </tr>
                        <tr>
                          <td height="10" align=middle valign="bottom"><div align="left">Firewall
                                  <input type=text id="public_port17" name="public_port17" size=12 maxlength=60>                                 
                          </div></td>
                          <td align=middle valign="bottom">
                            <select id="public17" name="public17">
                              <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <td align=middle rowspan="2"><input type=checkbox id="enable18" name="enable18" value="1"></td>
                          <td rowspan="2" align=middle><input type="text" id="name18" name="name18" size="15" maxlength="31"></td>
                          <td rowspan="2" align=left>
                            <input name="copy_app18" type=button class="button" onClick="copy_special_appl(18)" value="<<">
                            <select id="application18" name="application18" style="width:108">
                              <option>Application Name</option>
                              <script>set_special_appl_option()</script>
                            </select>
                          </td>
                          <td align=middle valign="bottom">
                            <div align="left">Trigger
                                <input type="text" id="trigger_port18" name="trigger_port18" size=12 maxlength="11">
                          </div></td>
                          <td align=middle valign="bottom">
                            <select id="trigger18" name="trigger18">
                              <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                            </select>
                          </td>
                          <td rowspan="2" align=middle>
                            <select id="schedule18" name="schedule18" style="width:80">
                              <option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                            </select>
                          </td>                          
                        </tr>
                        <tr>
                          <td height="10" align=middle valign="bottom"><div align="left">Firewall
                                  <input type=text id="public_port18" name="public_port18" size=12 maxlength=60>                                  
                          </div></td>
                          <td align=middle valign="bottom">
                            <select id="public18" name="public18">
                              <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <td align=middle rowspan="2"><input type=checkbox id="enable19" name="enable19" value="1"></td>
                          <td rowspan="2" align=middle><input type="text" id="name19" name="name19" size="15" maxlength="31"></td>
                          <td rowspan="2" align=left>
                            <input name="copy_app19" type=button class="button" onClick="copy_special_appl(19)" value="<<">
                            <select id="application19" name="application19" style="width:108">
                              <option>Application Name</option>
                              <script>set_special_appl_option()</script>
                            </select>
</td>
                          <td align=middle valign="bottom">
                            <div align="left">Trigger
                                <input type="text" id="trigger_port19" name="trigger_port19" size=12 maxlength="11">
                          </div></td>
                          <td align=middle valign="bottom">
                            <select id="trigger19" name="trigger19">
                              <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                            </select>
                          </td>
                          <td rowspan="2" align=middle>
                            <select id="schedule19" name="schedule19" style="width:80">
                              <option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                            </select>
                          </td>                         
                        </tr>
                        <tr>
                          <td height="10" align=middle valign="bottom"><div align="left">Firewall
                                  <input type=text id="public_port19" name="public_port19" size=12 maxlength=60>                                  
                          </div></td>
                          <td align=middle valign="bottom">
                            <select id="public19" name="public19">
                              <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <td align=middle rowspan="2"><input type=checkbox id="enable20" name="enable20" value="1"></td>
                          <td rowspan="2" align=middle><input type="text" id="name20" name="name20" size="15" maxlength="31"></td>
                          <td rowspan="2" align=left>
                            <input name="copy_app20" type=button class="button" onClick="copy_special_appl(20)" value="<<">
                            <select id="application20" name="application20" style="width:108">
                              <option>Application Name</option>
                              <script>set_special_appl_option()</script>
                            </select>
                          </td>
                          <td align=middle valign="bottom">
                            <div align="left">Trigger
                                <input type="text" id="trigger_port20" name="trigger_port20" size=12 maxlength="11">
                          </div></td>
                          <td align=middle valign="bottom">
                            <select id="trigger20" name="trigger20">
                             <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                            </select>
                          </td>
                          <td rowspan="2" align=middle>
                            <select id="schedule20" name="schedule20" style="width:80">
                              <option value="Always">Always</option>
                              		<script>set_schedule_option()</script>
                            </select>
                          </td>                          
                        </tr>
                        <tr>
                          <td height="10" align=middle valign="bottom"><div align="left">Firewall
                                  <input type=text id="public_port20" name="public_port20" size=12 maxlength=60>                                  
                          </div></td>
                          <td align=middle valign="bottom">
                            <select id="public20" name="public20">
                             <option value="TCP">TCP</option>
                  				<option value="UDP">UDP</option>
                  				<option value="Any">Any</option>
                            </select>
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
                          <span class="style1">Check the <strong>Application Name</strong> drop down menu for a list of pre-defined applications that you can select from.  If you select one of the pre-defined applications, click the arrow button next to the drop down menu to fill out the appropriate fields.</span></p>
                          <p class="style1">In order to apply a schedule to an Application Rule, you must first define a schedule on the <strong>Tools>Schedules</strong> page. </p></td>
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
	set_application();
</script>
</html>
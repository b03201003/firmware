<html>
<head>
<link rel="STYLESHEET" type="text/css" href="css_router.css">
<script language="JavaScript" src="public.js"></script>
<script language="JavaScript">
	
	function show_save_button(){
		var is_edit = <!-- insert name=ac_edit -->;
		
		if (is_edit > -1){
			get_by_id("save").disabled = false;
		}
	}
	
	function copy_mac(index){
		var temp_data, temp_mac;
		
		if (get_by_id("mac_list").selectedIndex > 0){
			temp_data = (get_by_id("mac_list").value).split(",");
			get_by_id("mac_addr").value = temp_data[1];
			temp_mac = temp_data[1].split("-");
			for(var i = 1; i < 7; i++){		
						
				get_by_id("mac"+i).value = temp_mac[i-1];						
			}
			
			get_by_id("other_ip").value = temp_data[0];
		}else{
			alert(msg[SELECT_MACHINE_ERROR]);
		}
	}
	
	
	function copy_ip_1(){
		var temp_data, temp_mac;
		
		if (get_by_id("ip_list").selectedIndex > 0){
			temp_data = (get_by_id("ip_list").value).split(",");	
			get_by_id("ip").value = temp_data[0];
			get_by_id("other_ip").value = temp_data[0];
			
			temp_mac = temp_data[1].split("-");
			for(var i = 1; i < 7; i++){								
				get_by_id("mac"+i).value = temp_mac[i-1];						
			}						
		}else{
			alert(msg[SELECT_COMPUTER_ERROR]);
		}
	}
	
	function check_aes(){
		var addr_type = get_by_name("addr_type");
		var ip = get_by_id("ip");
		var mac_addr = get_by_id("mac_addr");
		var clone = get_by_id("clone");
		var ip_list = get_by_id("ip_list");
		var mac_list = get_by_id("mac_list");
		var copy1 = get_by_id("copy1");
		var copy2 = get_by_id("copy2");
		var machine_table = get_by_id("machine_table");
		
		mac_addr.disabled = true;
		mac_list.disabled = true;
		clone.disabled = true;
		copy2.disabled = true;
		ip.disabled = true;
		ip_list.disabled = true;
		copy1.disabled = true;
		machine_table.style.display = "none";	
			
		if (addr_type[0].checked){			
			ip.disabled = false;
			ip_list.disabled = false;
			copy1.disabled = false;			
		}else if (addr_type[1].checked){				
			mac_addr.disabled = false;
			mac_list.disabled = false;
			clone.disabled = false;
			copy2.disabled = false;
		}else if (addr_type[2].checked){
			machine_table.style.display = "";	
		}
	}
	
	function select_machine(row){
		var data = get_by_id("table1").rows[row+1];		
		var ip = get_row_data(data, 1);
		var mac = get_row_data(data, 2).split("-");
		get_by_id("other_ip").value = ip;
		for(var i = 1; i < 7; i++){						
			get_by_id("mac"+i).value = mac[i-1];						
		}
		change_color("table1",row+1);
	}
</script>
<title>D-LINK SYSTEMS, INC | WIRELESS ROUTER | HOME</title>

</head>

<body topmargin="1" leftmargin="0" rightmargin="0" bgcolor="#757575">
	<table id="header_container" border="0" cellpadding="5" cellspacing="0" width="838" align="center">
      <tr>
        <td width="100%">Product Page: <a href="http://support.dlink.com/">DIR-615</a></td>
        <td align="right" nowrap>Hardware Version: A1 &nbsp;</td>
        <td align="right" nowrap>Firmware Version: 2.00</td>
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
                              <div><a href="adv_virtual.asp">Port Forwarding</a></div>
                            <LI>
                              <div><a href="adv_appl.asp">Application Rules</a></div>
                            <LI>
                              <div><a href="adv_filters_mac.asp">Network Filter</a></div>
<LI>
							 <div id=sidenavoff>Access control</div>
                            <LI>
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
<form id="form1" name="form1" method="post" action="step3.cgi">
<input type=hidden name=mac1 id=mac1>
<input type=hidden name=mac2 id=mac2>
<input type=hidden name=mac3 id=mac3>
<input type=hidden name=mac4 id=mac4>
<input type=hidden name=mac5 id=mac5>
<input type=hidden name=mac6 id=mac6>
<input type="hidden" id="other_ip" name="other_ip">
			<td valign="top" id="maincontent_container">
				<div id=maincontent>
				  
                  <div class=box>
		  <h2>Step 3: select Machine</h2> 
		    <P><strong>select the machine to which this policy applies.</strong></P>
            Specify a machine with its IP or MAC address, or select "Other 
              Machines" for machines that do not have a policy.            
            <table width="525" class=formarea summary="">
              <tbody>
                <tr> 
                  <td class=form_label><div align="right">Address Type&nbsp;:</div></td>
                  <td>
                    <input type=radio value=0 name=addr_type onClick=check_aes()>
                    IP 
                    <input type=radio value=1 name=addr_type onClick=check_aes()>
                    MAC 
                    <input type=radio value=2 name=addr_type onClick=check_aes()>
                    Other Machines </td>
                </tr>
                <tr> 
                  <td class=form_label><div align="right">IP Address&nbsp;:</div></td>
                  <td><input name="ip" id="ip" maxlength=17>
                    <span>
                    <input type="button" name="copy1" id="copy1" value="<<" onClick="copy_ip_1()">
                    <select name=ip_list id="ip_list" style="WIDTH: 150px">
                      <option value="-1">Computer Name</option>
                      <!-- repeat name=dhcp_client_list -->
                    </select>
</span></td>
                  
                </tr>
                <tr> 
                  <td class=form_label><div align="right">Machine Address&nbsp;:</div></td>
                  <td><input name="mac_addr" id="mac_addr" maxlength=17>
                  
                    <span>
                    <input type="button" name="copy2" id="copy2" value="<<" onClick="copy_mac()">
                    <select name=mac_list id="mac_list" style="WIDTH: 150px">
                      <option value="-1">Computer Name</option>
                      <!-- repeat name=show_dhcp_list -->
                    </select>
</span></td>
                  
                </tr>
                <tr> 
                  <td class=form_label></td>
                  <td><input name="clone" id="clone" type=submit class=button_submit value="Copy Your PC's MAC Address"></td>
                </tr>
                <tr> 
                  <td class=form_label></td>
                  <td><input name="ok" type=button class=button_submit id="ok" value=OK > 
                    <input name="cancel" type=reset class=button_submit id="cancel"value=Cancel> 
                  </td>
                </tr>
              </tbody>
            </table>    
      <div id=machine_table style="display:none">
		<h2>&nbsp; Machine</h2>
			<table width="525" id=table1 border=0 cellPadding=1 cellSpacing=1 style="font-family: Tahoma;font-size: 12">
              <tbody>
                <tr>
                  <td>Host Name</td>
                  <td>IP Address</td>
                  <td>MAC Address</td>
                </tr>
                <!-- repeat name=dynamic_dhcp_list -->
              </tbody> 
              
            </table>
      </div>
            <hr>
            <table width="362" align="center">
              <td><table width="362" align="center">
  <td>
      <div align="center">
        <input name="perv" type="button" id="perv" value="Perv" onclick="window.location='Step_2.asp';">
&nbsp;
        <input name="next" type="submit" id="next" value="Next">
&nbsp;
        <input name="save" type="submit" id="save" value="Save" disabled>
&nbsp;
        <input name="cancel" type="button" id="cancel" value="Cancel" onclick="window.location='adv_access_control.asp';">
    </div></td>
              </table></td>
            </table>
          </div>		  
             
             
        </div></td></form>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table borderColor=#ffffff cellSpacing=0 borderColorDark=#ffffff cellPadding=2 bgColor=#ffffff borderColorLight=#ffffff border=0>
                  <tbody>
                    <tr>
                      <td id=help_text><b>Helpful Hints.</b><br>
                          <br>                          
                      </td>
                    </tr>
                  </tbody>
                </table></td>
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
check_aes();
show_save_button();
</script>
</html>
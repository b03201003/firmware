<html>
<head>
<script language="JavaScript" src="public.js"></script>
<script>
var submit_button_flag = 0;
function onPageLoad(){
	var sel_wan_pppoe_dynamic_00 ="<% CmoGetCfg("wan_pppoe_dynamic_00","none"); %>";
	var p_wan_pppoe_dynamic_00 = get_by_name("wan_pppoe_dynamic_00");
	if(sel_wan_pppoe_dynamic_00 == "1"){
		p_wan_pppoe_dynamic_00[0].checked = true;
	}else{
		p_wan_pppoe_dynamic_00[1].checked = true;
	}
		
		
	var sel_wan_pppoe_connect_mode_00 ="<% CmoGetCfg("wan_pppoe_connect_mode_00","none"); %>";
	var p_wan_pppoe_connect_mode_00 = get_by_name("wan_pppoe_connect_mode_00");
	if(sel_wan_pppoe_connect_mode_00 == "always_on"){
		p_wan_pppoe_connect_mode_00[0].checked = true;
	}else if(sel_wan_pppoe_connect_mode_00 == "manual"){
		p_wan_pppoe_connect_mode_00[1].checked = true;
	}else{
		p_wan_pppoe_connect_mode_00[2].checked = true;
	}
		
	
	set_mac(get_by_id("wan_mac").value);	
}


function change_wan(){
    var html_file;
    
    switch(get_by_id("wan_proto").selectedIndex){
		case 0 :
	    	html_file = "wan_static.asp";
	    	break;	   	
		case 1 :
	    	html_file = "wan_dhcp.asp";
	    	break;
		case 2 :
	    	html_file = "wan_poe.asp";
	    	break;
	    case 3 :
	    	html_file = "wan_pptp.asp";
	    	break;
		case 4 :
			html_file = "wan_l2tp.asp";
	    	break;
		case 5 :
			html_file = "wan_bigpond.asp";
	    	break;		
	}
	
	location.href = html_file;
}

function clone_mac_action(){
	set_mac(get_by_id("mac_clone_addr").value);
}

	
function disable_poe_ip(){
		var fixIP = get_by_name("wan_pppoe_dynamic_00");
		var is_disabled;
				  
	  	if (fixIP[0].checked){
	    	is_disabled = true;
	  	}else{
	    	is_disabled = false;
	    }
	  	get_by_id("wan_pppoe_ipaddr_00").disabled = is_disabled;		  	
	}
		
    function set_poe_dynamic(type){
    	var fixIP = get_by_name("wan_pppoe_dynamic_00");
        if (type == 0){
            fixIP[0].checked = true;
            get_by_id("wan_pppoe_ipaddr_00").value = "0.0.0.0";	           
        }
    }
    
    function send_pppoe_request(){
    	var fixIP = get_by_name("wan_pppoe_dynamic_00");
    	var ip = get_by_id("wan_pppoe_ipaddr_00").value;
    	var dns1 = get_by_id("wan_primary_dns").value;
    	var dns2 = get_by_id("wan_secondary_dns").value;
    	var idle = get_by_id("wan_pppoe_max_idle_time_00");	    	
        var mtu = get_by_id("wan_mtu");

        var temp_ip_obj = new addr_obj(ip.split("."), ip_addr_msg, false, false);
        var temp_dns1_obj = new addr_obj(dns1.split("."), dns1_addr_msg, false, false);
		var temp_dns2_obj = new addr_obj(dns2.split("."), dns2_addr_msg, true, false);
        var temp_idle = new varible_obj(idle.value, "Maximum Idle Time", 0, 9999, false);
        var temp_mtu = new varible_obj(mtu.value, "MTU", 200, 1500, false);

        var mac = "";
		
		if(get_by_id("mac1").value != "00"){
		alert("The first mac value must be 00 .");
		return false;
		}
		
		for (var i = 1; i < 7; i++){
			mac += get_by_id("mac" + i).value;
			
			if (i < 6){
				mac += ":";
			}
		}
				
        if (fixIP[1].checked){
        	if (!check_address(temp_ip)){
        		return false;
        	}
        }
        
        if (!check_mac(mac)){
			alert(msg[MAC_ADDRESS_ERROR]);
			return false;
		}	
				
        if (dns1 != "" && dns1 != "0.0.0.0"){
    		if (!check_address(temp_dns1_obj)){
    			return false;
    		}
    	}
    	
    	if (dns2 != "" && dns2 != "0.0.0.0"){
    		if (!check_address(temp_dns2_obj)){
    			return false;
    		}
    	}
    	
    	if (!check_pwd("wan_pppoe_password_00", "poe_pass_v")){
       		return false;
       	}
       	
       	if (!check_varible(temp_idle)){
    		return false;
    	}
    	
    	if (!check_varible(temp_mtu)){
    		return false;
    	}
    	
		if((get_by_id("wan_primary_dns").value =="" || get_by_id("wan_primary_dns").value =="0.0.0.0")&& ( get_by_id("wan_secondary_dns").value =="" || get_by_id("wan_secondary_dns").value =="0.0.0.0")){
			get_by_id("wan_specify_dns").value = 0;
		}else{
			get_by_id("wan_specify_dns").value = 1;
		}
		
		get_by_id("wan_mac").value= mac;
		
		
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
			<td id="topnavon"><a href="index.asp">Setup</a></td>
			<td id="topnavoff"><a href="adv_virtual.asp">Advanced</a></td>
			<td id="topnavoff"><a href="tools_admin.asp">Tools</a></td>
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
									<li><div id="sidenavoff">Internet</div></li>
									<li>
									  <div id="sidenavon"><a href="wireless.asp">Wireless settings </a></div>
									</li>
									<li>
									  <div id="sidenavon"><a href="lan.asp">Network SETTINGS</a></div>
									</li>
								</ul>
								
							</div>
						</td>			
					</tr>
				</table>			
			</td>
			<td valign="top" id="maincontent_container">			
	<form id="form1" name="form1" method="post" action="apply.cgi">
<input type="hidden" name="html_response_page" value="back.asp">
<input type="hidden" name="html_response_message" value="The setting is saved.">
<input type="hidden" name="html_response_return_page" value="wan_poe.asp">

<input type="hidden" name="mac_clone_addr" id="mac_clone_addr" value="<% CmoGetStatus("mac_clone_addr"); %>">
<input type="hidden" name="wan_specify_dns" id="wan_specify_dns" value="<% CmoGetCfg("wan_specify_dns","none"); %>">  
<div id=maincontent>
			  <!-- === BEGIN MAINCONTENT === -->
              <div id=box_header>
                <h1>WAN</h1>
                <h4>Internet Connection</h4>
                <p>Use this section to configure your Internet Connection type. There are several connection types to choose from: Static IP, DHCP, PPPoE, PPTP, L2TP, and BigPond. If you are unsure of your connection method, please contact your Internet Service Provider.</p>
          		<p><strong>Note: </strong> If using the PPPoE option, you will need to remove or disable any PPPoE client software on your computers.</p>
            	<input name="button" type="submit" class=button_submit value="Save Settings" onClick="return send_pppoe_request()">
            	<input name="button2" type=reset class=button_submit value="Don't Save Settings"  onClick="window.location.href='wan_poe.asp'">
              </div>
              <div class=box>
                <h2>Internet Connection Type : </h2>
                <p class="box_msg">Choose the mode to be used by the router to connect to the Internet. </p>
                <table cellSpacing=1 cellPadding=1 width=525 border=0>
                  <tbody>
                    <tr>
                      <td width=150 class="form_label">My Internet Connection is :</td>
                      <td>&nbsp; <select name="wan_proto" id="wan_proto" onChange="change_wan()">
                        <option value="static">Static IP</option>
                        <option value="dhcpc">Dynamic IP (DHCP)</option>
                        <option value="pppoe" selected>PPPoE (Username / Password)</option>
                        <option value="pptp">PPTP (Username / Password)</option>
                        <option value="l2tp">L2TP (Username / Password)</option>
                        <option value="bigpond">BigPond (Australia)</option>
                      </select></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div class=box id=show_poe >
                <h2>PPPoE : </h2>
				<p class="box_msg">Enter the information provided by your Internet Service Provider (ISP). </p>
			
                <table cellSpacing=1 cellPadding=1 width=525 border=0>
                  <tbody>
                    <tr>
                      <td class="form_label">Address Mode&nbsp;:</td>
                      <td><font size=2>&nbsp;
                      	<input type=radio value=1 name="wan_pppoe_dynamic_00" onClick=disable_poe_ip() checked>
						Dynamic PPPoE
						<input type=radio value=0 name="wan_pppoe_dynamic_00" onClick=disable_poe_ip()>
						Static PPPoE</font></td>
                    </tr>
                    <tr>
                      <td width=150 valign=top class="form_label">User Name :</td>
                      <td valign=top><font size=2>&nbsp;
                          <input type=text id="wan_pppoe_username_00" name="wan_pppoe_username_00" size=30 maxlength=63 value="<% CmoGetCfg("wan_pppoe_username_00","none"); %>">
</font></td>
                    </tr>
                    <tr>
                      <td width=150 class="form_label">Password :</td>
                      <td><font size=2>&nbsp;
                      <input type=password id="wan_pppoe_password_00" name="wan_pppoe_password_00" size=30 maxlength=63 value="WDB8WvbXdHtZyM8Ms2RENgHlacJghQyG">
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150 class="form_label">Retype Password :</td>
                      <td><font size=2>&nbsp;
                      <input type=password id=poe_pass_v name=poe_pass_v size=30 maxlength=63 value="WDB8WvbXdHtZyM8Ms2RENgHlacJghQyG">
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150 class="form_label">Service Name :</td>
                      <td><font size=2>&nbsp;
                      <input type=text id="wan_pppoe_service_00" name="wan_pppoe_service_00" size=30 maxlength=63 value="<% CmoGetCfg("wan_pppoe_service_00","none"); %>">
    					(optional) </font></td>
                    </tr>
                    <tr>
                      <td width=150 class="form_label">IP Address :</td>
                      <td><font size=2>&nbsp;
                      <input type=text id="wan_pppoe_ipaddr_00" name="wan_pppoe_ipaddr_00" size=16 maxlength=15 value="<% CmoGetCfg("wan_pppoe_ipaddr_00","none"); %>">
						</font></td>
                    </tr>
                    <tr>
                      <td width=150 valign=top class="form_label">
					  <input type="hidden" id="wan_mac" name="wan_mac" value="<% CmoGetCfg("wan_mac","none"); %>">
					  MAC Address :</td>
                      <td><font size=2>&nbsp;
                      
					  <input type=text id=mac1 name=mac1 size=2 maxlength=2>
					    -
					    <input type=text id=mac2 name=mac2 size=2 maxlength=2>
					    -
					    <input type=text id=mac3 name=mac3 size=2 maxlength=2>
					    -
					    <input type=text id=mac4 name=mac4 size=2 maxlength=2>
					    -
					    <input type=text id=mac5 name=mac5 size=2 maxlength=2>
					    -
					    <input type=text id=mac6 name=mac6 size=2 maxlength=2>
					    (optional)
					    &nbsp; &nbsp;&nbsp;<input name="clone" type=button value="Clone MAC Address" onClick="clone_mac_action()">
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150 class="form_label">Primary DNS Address :</td>
                      <td>&nbsp;
                      <input type=text id="wan_primary_dns" name="wan_primary_dns" size=16 maxlength=15 value="<% CmoGetCfg("wan_primary_dns","none"); %>">
    (optional)</td>
                    </tr>
                    <tr>
                      <td width=150 class="form_label">Secondary DNS Address :</div></td>
                      <td>&nbsp;
                      <input type=text id="wan_secondary_dns" name="wan_secondary_dns" size=16 maxlength=15 value="<% CmoGetCfg("wan_secondary_dns","none"); %>">
    (optional)</td>
                    </tr>
                    <tr>
                      <td width=150 class="form_label">Maximum Idle Time :</td>
                      <td>&nbsp;
                      <input type=text id="wan_pppoe_max_idle_time_00" name="wan_pppoe_max_idle_time_00" size=5 maxlength=4 value="<% CmoGetCfg("wan_pppoe_max_idle_time_00","none"); %>">
    Minutes</td>
                    </tr>
                    <tr>
                      <td width=150 class="form_label">MTU :</td>
                      <td><font size=2>&nbsp;
                      <input type=text id="wan_mtu" name="wan_mtu" maxlength=4 size=5 value="<% CmoGetCfg("wan_mtu","none"); %>">
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150 class="form_label">Connect mode select :</td>
                      <td><font size=2>&nbsp;
                      <input type=radio name="wan_pppoe_connect_mode_00" value="always_on">
    Always-on
    <input type=radio name="wan_pppoe_connect_mode_00" value="manual">
    Manual
    <input type=radio name="wan_pppoe_connect_mode_00" value="on_demand">
    Connect-on demand</font> </td>
                    </tr>
                  </tbody>
                </table>
        </div>
			  
			  
			  
			  
			  
              
	    
              
              
              

		    </div>
</form>
<form id="form2" name="form2" method="post" action="mac_clone.cgi"><input type="hidden" name="html_response_page" value="wan_poe.asp"><input type="hidden" name="html_response_return_page" value="wan_poe.asp"></form>
           </td>
			
			
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table cellSpacing=0 cellPadding=2 bgColor=#ffffff border=0>
                  <tbody>
                    <tr>
                      <td id=help_text><strong>Helpful Hints..</strong><br>
                         
                          <p class="style1"> When configuring the router to access the Internet, be sure to choose the correct <strong>Internet Connection Type</strong> from the drop down menu. If you are unsure of which option to choose, please contact your <strong>Internet Service Provider (ISP)</strong>.</p>
                          <p> <span class="style1"> If you are having trouble accessing the Internet through the router, double check any settings you have entered on this page and verify them with your ISP if needed</span>. </p></td>
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
//   set_poe_dynamic(<!-- insert name=login_type -->);
	disable_poe_ip();		


</script>
<!-- insert name=restore_wan_type -->
</html>
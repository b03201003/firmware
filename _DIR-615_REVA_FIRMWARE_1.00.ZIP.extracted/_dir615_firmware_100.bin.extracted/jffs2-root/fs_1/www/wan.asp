<html>
<head>
<script language="JavaScript" src="public.js"></script>
<script>
function onPageLoad(){
	var sel_wan_proto = "<% CmoGetCfg("wan_proto"); %>";
	if(sel_wan_proto == "static"){
			get_by_id("wan_proto").selectedIndex = 0;		
	}else if(sel_wan_proto == "dhcpc"){
			get_by_id("wan_proto").selectedIndex = 1;
	}else if(sel_wan_proto == "pppoe"){
			get_by_id("wan_proto").selectedIndex = 2;
	}else if(sel_wan_proto == "pptp"){
			get_by_id("wan_proto").selectedIndex = 3;
	}else if(sel_wan_proto == "l2tp"){
			get_by_id("wan_proto").selectedIndex = 4;
	}else{
			get_by_id("wan_proto").selectedIndex = 5;
	}
		
		
}

function check_request(){
 var connType = get_by_id("wan_proto").value;
    if (connType == "0"){
       send_dhcp_request();
    }
    if (connType == "1"){
       send_static_request();
    }
	if (connType == "2"){
       send_pppoe_request();
    }
	if (connType == "3"){
       send_pptp_request();
    }
	if (connType == "4"){
       send_l2tp_request();
    }
	if (connType == "5"){
	   send_bigpond_request();
		}

}
function show_wan(){			
		var connType = get_by_id("wan_proto").value;	
		
		get_by_id("show_static").style.display = "none";		
		get_by_id("show_dhcp").style.display = "none";		
		get_by_id("show_poe").style.display = "none";
		get_by_id("show_pptp").style.display = "none";		
		get_by_id("show_l2tp").style.display = "none";
		get_by_id("show_bigpond").style.display = "none";
		
		if (connType == "static"){				
			get_by_id("show_dhcp").style.display = "";				
		}else if (connType == "dhcpc"){
			get_by_id("show_static").style.display = "";					
		}else if (connType == "pppoe"){		
			get_by_id("show_poe").style.display = "";		
		}else if (connType == "pptp"){	
			get_by_id("show_pptp").style.display = "";				
		}else if (connType == "l2tp"){			
			get_by_id("show_l2tp").style.display = "";			
		}else if (connType == "bigpond"){		
			get_by_id("show_bigpond").style.display = "";					
        }
    }
function send_static_request(){
    	var ip = get_by_id("wan_static_ipaddr").value;
    	var mask = get_by_id("wan_static_netmask").value;
    	var gateway = get_by_id("wan_static_gateway").value;
    	var dns1 = get_by_id("static_dns1").value;
        var dns2 = get_by_id("static_dns2").value;
        var mtu = get_by_id("static_mtu");
        var temp_dns1 = new addr_obj(dns1.split("."), DNS_ADDRESS_DESC, false, INVALID_DNS_ADDRESS, ZERO_DNS_ADDRESS, -1, false);
        var temp_dns2 = new addr_obj(dns2.split("."), SEC_DNS_ADDRESS_DESC, true, INVALID_SEC_DNS_ADDRESS, ZERO_SEC_DNS_ADDRESS, -1, false);
        var temp_mtu = new varible_obj(mtu.value, "MTU", 200, 1500, false);
        var mac = "";
				
        if (!check_lan_setting(ip, mask, gateway)){
        	return;
        }	     
                
		if (!check_address(temp_dns1)){
			return;
		}
    	
    	for (var i = 1; i < 7; i++){
			mac += get_by_id("static_mac" + i).value;
			
			if (i < 6){
				mac += "-";
			}
		}
		
		if (!check_mac(mac)){
			alert(msg[MAC_ADDRESS_ERROR]);
			return;
		}	
				
    	if (dns2 != "" && dns2 != "0.0.0.0"){
    		if (!check_address(temp_dns2)){
    			return;
    		}
    	}
    	
    	if (!check_varible(temp_mtu)){
    		return;
    	}
    	      
        send_submit("form1");     
    }

	function send_dhcp_request(){
		var dns1 = get_by_id("dyn_dns1").value;
	    var dns2 = get_by_id("dyn_dns2").value;
	    var mtu = get_by_id("dyn_mtu");	    
	    var temp_dns1 = new addr_obj(dns1.split("."), DNS_ADDRESS_DESC, true, INVALID_DNS_ADDRESS, ZERO_DNS_ADDRESS, -1, false);
	    var temp_dns2 = new addr_obj(dns2.split("."), SEC_DNS_ADDRESS_DESC, true, INVALID_SEC_DNS_ADDRESS, ZERO_SEC_DNS_ADDRESS, -1, false);
	    var temp_mtu = new varible_obj(mtu.value, "MTU", 200, 1500, false);
	    var mac = "";
		
		for (var i = 1; i < 7; i++){
			mac += get_by_id("dyn_mac" + i).value;
			
			if (i < 6){
				mac += "-";
			}
		}
		
		if (!check_mac(mac)){
			alert(msg[MAC_ADDRESS_ERROR]);
			return;
		}	
						
	    if (dns1 != "" && dns1 != "0.0.0.0"){
    		if (!check_address(temp_dns1)){
    			return;
    		}
    	}
    	
    	if (dns2 != "" && dns2 != "0.0.0.0"){
    		if (!check_address(temp_dns2)){
    			return;
    		}
    	}
    	
    	if (!check_varible(temp_mtu)){
    		return;
    	}
    	
    	send_submit("form2");
	}
function disable_poe_ip(){
		var fixIP = get_by_name("poe_fixIP");
		var is_disabled;
				  
	  	if (fixIP[0].checked){
	    	is_disabled = true;
	  	}else{
	    	is_disabled = false;
	    }
	  	get_by_id("poe_ip").disabled = is_disabled;		  	
	}
		
    function set_poe_dynamic(type){
    	var fixIP = get_by_name("poe_fixIP");
        if (type == 0){
            fixIP[0].checked = true;
            get_by_id("poe_ip").value = "0.0.0.0";	           
        }
    }
    
    function send_pppoe_request(){
    	var fixIP = get_by_name("poe_fixIP");
    	var ip = get_by_id("poe_ip").value;
    	var dns1 = get_by_id("poe_dns1").value;
    	var dns2 = get_by_id("poe_dns2").value;
    	var idle = get_by_id("poe_idle");	    	
        var mtu = get_by_id("poe_mtu");
        var temp_ip = new addr_obj(ip.split("."), IP_ADDRESS_DESC, false, INVALID_IP_ADDRESS, ZERO_IP_ADDRESS, -1, false);
        var temp_dns1 = new addr_obj(dns1.split("."), DNS_ADDRESS_DESC, true, INVALID_DNS_ADDRESS, ZERO_DNS_ADDRESS, -1, false);
	    var temp_dns2 = new addr_obj(dns2.split("."), SEC_DNS_ADDRESS_DESC, true, INVALID_SEC_DNS_ADDRESS, ZERO_SEC_DNS_ADDRESS, -1, false);
        var temp_idle = new varible_obj(idle.value, "Maximum Idle Time", 0, 9999, false);
        var temp_mtu = new varible_obj(mtu.value, "MTU", 200, 1500, false);
        var mac = "";
		
		for (var i = 1; i < 7; i++){
			mac += get_by_id("poe_mac" + i).value;
			
			if (i < 6){
				mac += "-";
			}
		}
				
        if (fixIP[1].checked){
        	if (!check_address(temp_ip)){
        		return;
        	}
        }
        
        if (!check_mac(mac)){
			alert(msg[MAC_ADDRESS_ERROR]);
			return;
		}	
				
        if (dns1 != "" && dns1 != "0.0.0.0"){
    		if (!check_address(temp_dns1)){
    			return;
    		}
    	}
    	
    	if (dns2 != "" && dns2 != "0.0.0.0"){
    		if (!check_address(temp_dns2)){
    			return;
    		}
    	}
    	
    	if (!check_pwd("poe_pass", "poe_pass_v")){
       		return;
       	}
       	
       	if (!check_varible(temp_idle)){
    		return;
    	}
    	
    	if (!check_varible(temp_mtu)){
    		return;
    	}
    	
    	send_submit("form3");
    }

function disable_l2tp_ip(){
		var fixIP = get_by_name("l2tp_fixIP");
		var is_disabled;
				  
	  	if (fixIP[0].checked){
	    	is_disabled = true;
	  	}else{
	    	is_disabled = false;
	    }
	  	get_by_id("l2tp_ip").disabled = is_disabled;
	  	get_by_id("l2tp_mask").disabled = is_disabled;	
	  	get_by_id("l2tp_gateway").disabled = is_disabled;
	  	get_by_id("l2tp_dns").disabled = is_disabled;		  	
	}
	
	function send_l2tp_request(){
		var fix_ip = get_by_name("l2tp_fixIP");
    	var ip = get_by_id("l2tp_ip").value;
    	var mask = get_by_id("l2tp_mask").value; 
    	var gateway = get_by_id("l2tp_gateway").value;   
    	var dns = get_by_id("l2tp_dns").value;   
    	var server_ip = get_by_id("l2tp_server_ip").value;
    	var idle = get_by_id("l2tp_idle");	    	
        var mtu = get_by_id("l2tp_mtu");
        var temp_dns = new addr_obj(dns.split("."), DNS_ADDRESS_DESC, false, INVALID_DNS_ADDRESS, ZERO_DNS_ADDRESS, -1, false);
        var temp_idle = new varible_obj(idle.value, "Maximum Idle Time", 0, 9999, false);
        var temp_mtu = new varible_obj(mtu.value, "MTU", 200, 1500, false);
                
        if (fix_ip[1].checked){
            if (!check_lan_setting(ip, mask, gateway)){
        		return;
        	}
       	
        		if (!check_address(temp_dns)){
				return;				
			}	     
       	}
    	
    	if(server_ip == ""){
    		alert(msg[ZERO_SERVER_IP]);
    		return;
       	}
       	
       	if (!check_pwd("l2tppwd", "l2tppwd2")){
       		return;
       	}
       	
       	if (!check_varible(temp_idle)){
    		return;
    	}
    	
    	if (!check_varible(temp_mtu)){
    		return;
    	}
    	      
        send_submit("form5");     
    }

	function clickPPTP(){
	  var fixIP = get_by_name("pptp_fixIP");
	  var is_disabled;
	  
	  if (fixIP[0].checked) {
	     is_disabled = true
	 }
	  get_by_id("pptp_ip").disabled = is_disabled;
	  get_by_id("pptp_mask").disabled = is_disabled;
	  get_by_id("pptp_gateway").disabled = is_disabled;
	  get_by_id("pptp_dns").disabled = is_disabled;
	 }
 

	function send_pptp_request(){
		var fix_ip = get_by_name("pptp_fixIP");
		var ip = get_by_id("pptp_ip").value;
		var mask = get_by_id("pptp_mask").value;  
		var gateway = get_by_id("pptp_gateway").value;  
		var dns = get_by_id("pptp_dns").value;  
		var server_ip = get_by_id("pptp_server_ip").value;
		var idle = get_by_id("pptp_idle");	    	
		var mtu = get_by_id("pptp_mtu");
		var temp_dns = new addr_obj(dns.split("."), DNS_ADDRESS_DESC, false, INVALID_DNS_ADDRESS, ZERO_DNS_ADDRESS, -1, false);
		var temp_idle = new varible_obj(idle.value, "Maximum Idle Time", 0, 9999, false);
		var temp_mtu = new varible_obj(mtu.value, "MTU", 200, 1500, false);
          
          if (fix_ip[1].checked){      
			if (!check_lan_setting(ip, mask, gateway)){
	        			return;
	        		}
	       	
    			if (!check_address(temp_dns)){
					return;				
				}	     
	       	}
		
    	if(server_ip == ""){
    		alert(msg[ZERO_SERVER_IP]);
    		return;
	     }
       	
       	if (!check_pwd("pptppwd", "pptppwd2")){
       		return;
       	}
       	
       	if (!check_varible(temp_idle)){
    		return;
    	}
    	
    	if (!check_varible(temp_mtu)){
    		return;
    	}
    	      
        send_submit("form4");     
    }

	function send_bigpond_request(){
		var mac = "";
		
		if (!check_pwd("bigpond_pass", "bigpond_pass_v")){
       		return;
       	}
       	
		for (var i = 1; i < 7; i++){
			mac += get_by_id("bigpond_mac" + i).value;
			
			if (i < 6){
				mac += "-";
			}
		}
		
		if (!check_mac(mac)){
			alert(msg[MAC_ADDRESS_ERROR]);
			return;
		}
		
		send_submit("form6");				
	}

</script>
<link rel="STYLESHEET" type="text/css" href="css_router.css">

<title>D-LINK SYSTEMS, INC | WIRELESS ROUTER | HOME</title>

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
<div id=maincontent>
			  <!-- === BEGIN MAINCONTENT === -->
              <div id=box_header>
                <h1>Internet Connection</h1>
                Use this section to configure your Internet Connection type. There are several connection types to choose from: Static IP, DHCP, PPPoE, PPTP, L2TP, and BigPond. If you are unsure of your connection method, please contact your Internet Service Provider. <br>
          <br>
          <strong>Note: </strong> If using the PPPoE option, you will need to remove or disable any PPPoE client software on your computers.

          <p>
            <input name="button" type=button class=button_submit value="Save Settings" onClick="check_request()">
            <input name="button2" type=reset class=button_submit value="Don't Save Settings"  onClick="window.location.href='wan.asp'">
</p>
              </div>
              <div class=box>
                <h2>Internet Connection Type : </h2>
                <p>Choose the mode to be used by the router to connect to the Internet. </p>
                <table cellSpacing=1 cellPadding=1 width=525 border=0>
                  <tbody>
                    <tr>
                      <td align=right width=150>My Internet Connection is :</td>
                      <td>&nbsp; <select name="wan_proto" id="wan_proto" onChange="show_wan()">
                        <option value="static" selected>Static IP</option>
                        <option value="dhcpc">Dynamic IP (DHCP)</option>
                        <option value="pppoe">PPPoE (Username / Password)</option>
                        <option value="pptp">PPTP (Username / Password)</option>
                        <option value="l2tp">L2TP (Username / Password)</option>
                        <option value="bigpond">BigPond (Australia)</option>
                      </select></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div class=box id=show_static style="display:none">
                <h2>Static IP Address Internet Connection Type : </h2>
                <p>Enter the static address information provided by your Internet Service Provider (ISP).</p>
<form id="form1" name="form1" method="post" action="apply.cgi">
<input type="hidden" name="page" value="wan.asp">
                <table cellSpacing=1 cellPadding=1 width=525 border=0>
                  <tr>
                    <td width=150><div align="right"><font size=2>IP Address : </font></div></td>
                    <td><font size=2>&nbsp;
                    <input type=text id="wan_static_ipaddr" name="wan_static_ipaddr" size=16 maxlength=15>
    (assigned by your ISP)</font></td>
                  </tr>
                  <tr>
                    <td width=150 valign=top><div align="right"><font size=2>Subnet Mask : </font></div></td>
                    <td><font size=2>&nbsp;
                    <input type=text id="wan_static_netmask" name="wan_static_netmask" size=16 maxlength=15>
                    </font></td>
                  </tr>
                  <tr>
                    <td width=150><div align="right"><font size=2>ISP Gateway Address : </font></div></td>
                    <td><font size=2>&nbsp;
                    <input type=text id="wan_static_gateway" name="wan_static_gateway" size=16 maxlength=15>
                    </font></td>
                  </tr>
                  <tr>
                    <td width=150 valign=top><div align="right"><font size=2>MAC Address : </font></div></td>
                    <td width=71%><font size=2>&nbsp;
                    <input type=text id=static_mac1 name=static_mac1 size=2 maxlength=2>
    -
    <input type=text id=static_mac2 name=static_mac2 size=2 maxlength=2>
    -
    <input type=text id=static_mac3 name=static_mac3 size=2 maxlength=2>
    -
    <input type=text id=static_mac4 name=static_mac4 size=2 maxlength=2>
    -
    <input type=text id=static_mac5 name=static_mac5 size=2 maxlength=2>
    -
    <input type=text id=static_mac6 name=static_mac6 size=2 maxlength=2>
    (optional)
    &nbsp;&nbsp;<input type="submit" value="Clone MAC Address" name="clone">
                    </font></td>
                  </tr>
                  <tr>
                    <td width=150><div align="right"><font size=2>Primary DNS Address : </font></div></td>
                    <td><font size=2>&nbsp;
                    <input type=text id=static_dns1 name=static_dns1 size=16 maxlength=15>
                    </font></td>
                  </tr>
                  <tr>
                    <td width=150><div align="right"><font size=2>Secondary DNS Address : </font></div></td>
                    <td><font size=2>&nbsp;
                    <input type=text id=static_dns2 name=static_dns2 size=16 maxlength=15>
    (optional)</font></td>
                  </tr>
                  <tr>
                    <td width=150><div align="right"><font size=2>MTU : </font></div></td>
                    <td><font size=2>&nbsp;
                    <input type=text id=static_mtu name=static_mtu maxlength=4 size=5>
                    </font></td>
                  </tr>
                  <tbody>
                  </tbody>
                </table>
</form>
              </div>
              <div class=box id=show_dhcp style="display:none">
                <h2>Dynamic IP (DHCP) Internet Connection Type : </h2>
                <p> Use this Internet connection type if your Internet Service Provider (ISP) didn't provide you with IP Address information and/or a username and password. </p>
                <form id="form2" name="form2" method="post" action="h_wan_dhcp.cgi">
<table cellSpacing=1 cellPadding=1 width=525 border=0>
                  <tbody>
                    <tr>
                      <td align=right width=150>Host Name :</td>
                      <td>&nbsp;
                          
                          <input type=text id="dyn_host" name="dyn_host" size=40 maxlength=39>                          </td>
                    </tr>
                    <tr>
                      <td align=right valign=top width=150>MAC Address :</td>
                      <td>&nbsp;
		                        <input type=text id=dyn_mac1 name=dyn_mac1 size=2 maxlength=2>
								  -
								  <input type=text id=dyn_mac2 name=dyn_mac2 size=2 maxlength=2>
								  -
								  <input type=text id=dyn_mac3 name=dyn_mac3 size=2 maxlength=2>
								  -
								  <input type=text id=dyn_mac4 name=dyn_mac4 size=2 maxlength=2>
								  -
								  <input type=text id=dyn_mac5 name=dyn_mac5 size=2 maxlength=2>
								  -
								  <input type=text id=dyn_mac6 name=dyn_mac6 size=2 maxlength=2>
								  (optional)
								  &nbsp;&nbsp;<input name="clone" type="submit" value="Clone MAC Address">                     
					  </td>
                    </tr>
                    <tr>
                      <td width="150"><div align="right">Primary DNS Address :</div></td>
                      <td>&nbsp;
                      <input type=text id=dyn_dns1 name=dyn_dns1 size=16 maxlength=15></td>
                    </tr>
                    <tr>
                      <td width="150"><div align="right">Secondary DNS Address :</div></td>
                      <td>&nbsp;
                        <input type=text id=dyn_dns2 name=dyn_dns2 size=16 maxlength=15>
    (optional)</font></td>
                    </tr>
                    <tr>
                      <td width="150" align=right>MTU :</td>
                      <td>&nbsp;
                          <font face=Arial size=2>
                          <input type=text id=dyn_mtu name=dyn_mtu maxlength=4 size=5>
                          </font></td>
                    </tr>
                  </tbody>
                </table></form>
              </div>
	    <div class=box id=show_poe style="display:none">
                <h2>PPPoE : </h2>
				<p>Enter the information provided by your Internet Service Provider (ISP). </p>
				<form id="form3" name="form3" method="post" action="h_wan_poe.cgi">
                <table cellSpacing=1 cellPadding=1 width=525 border=0>
                  <tbody>
                    <tr>
                      <td><div align="right"></div></td>
                      <td><font size=2>&nbsp;
                      <input type=radio value=0 name=poe_fixIP onClick=disable_poe_ip() checked>
						    Dynamic PPPoE
						    <input type=radio value=1 name=poe_fixIP onClick=disable_poe_ip()>
						    Static PPPoE</font></td>
                    </tr>
                    <tr>
                      <td width=150 valign=top><div align="right"><font size=2>User Name :</font></div></td>
                      <td valign=top><font size=2>&nbsp;
                          <input type=text id=poe_name name=poe_name size=30 maxlength=63>
</font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size=2>Password :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input type=password id=poe_pass name=poe_pass size=30 maxlength=63>
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size=2>Retype Password : </font></div></td>
                      <td><font size=2>&nbsp;
                      <input type=password id=poe_pass_v name=poe_pass_v size=30 maxlength=63>
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size=2>Service Name :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input type=text id=poe_srv_name name=poe_srv_name size=30 maxlength=63>
    					(optional) </font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size=2>IP Address :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input type=text id=poe_ip name=poe_ip size=16 maxlength=15>
						</font></td>
                    </tr>
                    <tr>
                      <td width=150 valign=top><div align="right"><font size=2>MAC Address :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input type=text id=poe_mac1 name=poe_mac1 size=2 maxlength=2>
					    -
					    <input type=text id=poe_mac2 name=poe_mac2 size=2 maxlength=2>
					    -
					    <input type=text id=poe_mac3 name=poe_mac3 size=2 maxlength=2>
					    -
					    <input type=text id=poe_mac4 name=poe_mac4 size=2 maxlength=2>
					    -
					    <input type=text id=poe_mac5 name=poe_mac5 size=2 maxlength=2>
					    -
					    <input type=text id=poe_mac6 name=poe_mac6 size=2 maxlength=2>
					    (optional)
					    &nbsp; &nbsp;&nbsp;<input name="clone" type=submit value="Clone MAC Address">
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size=2>Primary DNS Address :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input type=text id=poe_dns1 name=poe_dns1 size=16 maxlength=15>
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size=2>Secondary DNS Address :</font></div></td>
                      <td>&nbsp;
                      <input type=text id=poe_dns2 name=poe_dns2 size=16 maxlength=15>
    (optional)</td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size=2>Maximum Idle Time :</font></div></td>
                      <td>&nbsp;
                      <input type=text id=poe_idle name=poe_idle size=5 maxlength=4>
    Minutes</td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size=2>MTU :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input type=text id=poe_mtu name=poe_mtu maxlength=4 size=5>
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size="2">Connect mode select :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input type=radio name=poe_auto_recon value=1>
    Always-on
    <input type=radio name=poe_auto_recon value=0>
    Manual
    <input type=radio name=poe_auto_recon value=2>
    Connect-on demand</font> </td>
                    </tr>
                  </tbody>
                </table></form>
        </div>
              
              <div class=box id=show_l2tp style="display:none">
                <h2>L2TP : </h2>
				<p>Enter the information provided by your Internet Service Provider (ISP). </p>
				<form id="form5" name="form5" method="post" action="h_wan_l2tp.cgi">
                <table cellSpacing=1 cellPadding=1 width=525 border=0>
                  <tbody>
                    <tr>
                      <td width=150><div align="right"></div></td>
                      <td><font size=2>&nbsp;
                      <input type=radio value=0 name=l2tp_fixIP onClick=disable_l2tp_ip() checked>
    Dynamic IP
    <input type=radio value=1 name=l2tp_fixIP onClick=disable_l2tp_ip()>
    Static IP</font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size=2>IP Address :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input type=text id=l2tp_ip name=l2tp_ip size=16 maxlength=15>
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size=2>Subnet Mask :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input type=text id=l2tp_mask name=l2tp_mask size=16 maxlength=15>
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size=2>Gateway :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input name=l2tp_gateway type=text id="l2tp_gateway" size=16 maxlength=15>
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size=2>DNS :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input name=l2tp_dns type=text id="l2tp_dns" size=16 maxlength=15>
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size=2>Server IP/Name :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input type=text id=l2tp_server_ip name=l2tp_server_ip size=32 maxlength=32>
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size="2">L2TP Account :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input type=text id=l2tpuserid name=l2tpuserid size=32 maxlength=63>
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size="2">L2TP Password :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input type=password id=l2tppwd name=l2tppwd size=32 maxlength=31>
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size="2">L2TP Retype password :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input type=password id=l2tppwd2 name=l2tppwd2 size=32 maxlength=31>
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size=2>Maximum Idle Time :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input type=text id=l2tp_idle name=l2tp_idle maxlength=4 size=5>
    Minutes</font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size=2>MTU :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input type=text id=l2tp_mtu name=l2tp_mtu maxlength=4 size=5>
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size="2">Connect mode select :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input type=radio name=l2tp_auto_recon value=1>
    Always-on
    <input type=radio name=l2tp_auto_recon value=0>
    Manual
    <input type=radio name=l2tp_auto_recon value=2>
    Connect-on demand</font> </td>
                    </tr>
                  </tbody>
                </table></form>
              </div>
              <div class=box id=show_bigpond style="display:none">
                <h2>Bigpond : </h2>
				<p> Enter the information provided by your Internet Service Provider (ISP). </p>
				<form id="form6" name="form6" method="post" action="h_wan_bigpond.cgi">
                <table cellSpacing=1 cellPadding=1 width=525 border=0>
                  <tbody>
                    <tr>
                      <td width=150 valign=top><div align="right"><font size=2>User Name :</font></div></td>
                      <td valign=top><font size=2>&nbsp;
                      <input type=text id=bigpond_name name=bigpond_name size=30 maxlength=63>
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size=2>Password :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input type=password id=bigpond_pass name=bigpond_pass size=30 maxlength=63>
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150 height="25"><div align="right"><font size=2>Retype Password : </font></div></td>
                      <td height="25"><font size=2>&nbsp;
                      <input type=password id=bigpond_pass_v name=bigpond_pass_v size=30 maxlength=63>
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size=2>Auth Server :</font></div></td>
                      <td><font size=2>&nbsp;
                      <select id="authserver" name="authserver">
                        <option value="sm-server" selected>sm-server</option>
                        <option value="dce-server">dce-server</option>
                      </select>
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size="2">Login Server IP/Name :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input type=text id=bigpond_srv_name name=bigpond_srv_name size=32 maxlength=32>
    (optional) </font></td>
                    </tr>
                    <tr>
                      <td width=150 valign=top><div align="right"><font size=2>MAC Address :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input type=text id=bigpond_mac1 name=bigpond_mac1 size=2 maxlength=2>
    -
    <input type=text id=bigpond_mac2 name=bigpond_mac2 size=2 maxlength=2>
    -
    <input type=text id=bigpond_mac3 name=bigpond_mac3 size=2 maxlength=2>
    -
    <input type=text id=bigpond_mac4 name=bigpond_mac4 size=2 maxlength=2>
    -
    <input type=text id=bigpond_mac5 name=bigpond_mac5 size=2 maxlength=2>
    -
    <input type=text id=bigpond_mac6 name=bigpond_mac6 size=2 maxlength=2>
    (optional)
    &nbsp;&nbsp;<input name="clone" type=submit value="Clone MAC Address">
                      </font></td>
                    </tr>
                  </tbody>
                </table></form>
              </div>
<div class=box id=show_pptp style="display:none">
                <h2>PPTP : </h2>
                <p> Enter the information provided by your Internet Service Provider (ISP). </p>
<form id="form4" name="form4" method="post" action="h_wan_pptp.cgi">
                <table cellSpacing=1 cellPadding=1 width=525 border=0>
                  <tbody>
                    <tr>
                      <td width="150"><div align="right"></div></td>
                      <td><font size=2>&nbsp;
                      <input type=radio value=0 name=pptp_fixIP onClick=clickPPTP() checked>
    Dynamic IP
    <input type=radio value=1 name=pptp_fixIP onClick=clickPPTP()>
    Static IP</font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size=2>IP Address :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input type=text id=pptp_ip name=pptp_ip size=16 maxlength=15>
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size=2>Subnet Mask :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input type=text id=pptp_mask name=pptp_mask size=16 maxlength=15>
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size=2>Gateway :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input name=pptp_gateway type=text id="pptp_gateway" size=16 maxlength=15>
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size=2>DNS :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input name=pptp_dns type=text id="pptp_dns" size=16 maxlength=15>
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size=2>Server IP/Name :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input type=text id=pptp_server_ip name=pptp_server_ip size=32 maxlength=32>
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size=2>PPTP Account :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input type=text id=pptpuserid name=pptpuserid size=32 maxlength=63>
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size=2>PPTP Password :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input type=password id=pptppwd  name=pptppwd size=32 maxlength=31>
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size=2>PPTP Retype password :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input type=password id=pptppwd2 name=pptppwd2 size=32 maxlength=31>
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size=2>Maximum Idle Time :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input type=text id=pptp_idle name=pptp_idle maxlength=4 size=5>
    Minutes</font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size=2>MTU :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input type=text id=pptp_mtu name=pptp_mtu maxlength=4 size=5>
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150><div align="right"><font size="2">Connect mode select :</font></div></td>
                      <td><font size=2>&nbsp;
                      <input type=radio name=pptp_auto_recon value=1>
    Always-on
    <input type=radio name=pptp_auto_recon value=0>
    Manual
    <input type=radio name=pptp_auto_recon value=2>
    Connect-on demand</font> </td>
                    </tr>
                  </tbody>
          </table></form>
        </div>
		    </div>

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
//    set_poe_dynamic(<!-- insert name=login_type -->);
	disable_poe_ip();		
    disable_l2tp_ip();
    clickPPTP();
    show_wan();
</script>
<!-- insert name=restore_wan_type -->
</html>
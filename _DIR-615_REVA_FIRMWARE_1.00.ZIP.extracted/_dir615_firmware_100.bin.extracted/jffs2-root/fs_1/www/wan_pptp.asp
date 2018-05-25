<html>
<head>
<script language="JavaScript" src="public.js"></script>
<script>
var submit_button_flag = 0;
function onPageLoad(){
	var sel_wan_pptp_dynamic ="<% CmoGetCfg("wan_pptp_dynamic","none"); %>";
	var p_wan_pptp_dynamic = get_by_name("wan_pptp_dynamic");
	if(sel_wan_pptp_dynamic == "1"){
		p_wan_pptp_dynamic[0].checked = true;
	}else{
		p_wan_pptp_dynamic[1].checked = true;
	}
		
		
	var sel_wan_pptp_connect_mode ="<% CmoGetCfg("wan_pptp_connect_mode","none"); %>";
	var p_wan_pptp_connect_mode = get_by_name("wan_pptp_connect_mode");
	if(sel_wan_pptp_connect_mode == "always_on"){
		p_wan_pptp_connect_mode[0].checked = true;
	}else if(sel_wan_pptp_connect_mode == "manual"){
		p_wan_pptp_connect_mode[1].checked = true;
	}else{
		p_wan_pptp_connect_mode[2].checked = true;
	}	
		
		
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



	function clickPPTP(){
	  var fixIP = get_by_name("wan_pptp_dynamic");
	  var is_disabled;
	  
	  if (fixIP[0].checked) {
	     is_disabled = true
	 }
	  get_by_id("wan_pptp_ipaddr").disabled = is_disabled;
	  get_by_id("wan_pptp_netmask").disabled = is_disabled;
	  get_by_id("wan_pptp_gateway").disabled = is_disabled;
	  get_by_id("wan_primary_dns").disabled = is_disabled;
	 }
 

	function send_pptp_request(){
		var fix_ip = get_by_name("wan_pptp_dynamic");
		var ip = get_by_id("wan_pptp_ipaddr").value;
		var mask = get_by_id("wan_pptp_netmask").value;  
		var gateway = get_by_id("wan_pptp_gateway").value;  
		var dns = get_by_id("wan_primary_dns").value;  
		var server_ip = get_by_id("wan_pptp_server_ip").value;
		var idle = get_by_id("wan_pptp_max_idle_time");	    	
		var mtu = get_by_id("wan_mtu");
		
		var temp_ip_obj = new addr_obj(ip.split("."), ip_addr_msg, false, false);
		var temp_mask_obj = new addr_obj(mask.split("."), subnet_mask_msg, false, false);
		var temp_gateway_obj = new addr_obj(gateway.split("."), gateway_msg, false, false);
		var temp_dns_obj = new addr_obj(dns.split("."), dns_server_msg, false, false);
		var temp_idle = new varible_obj(idle.value, "Maximum Idle Time", 0, 9999, false);
		var temp_mtu = new varible_obj(mtu.value, "MTU", 200, 1500, false);
          
          if (fix_ip[1].checked){      
			if (!check_lan_setting(temp_ip_obj, temp_mask_obj, temp_gateway_obj)){
	        			return false;
	        		}
	       	
    			if (!check_address(temp_dns_obj)){
					return false;				
				}	     
	       	}
		
    	if(server_ip == ""){
    		alert(msg[ZERO_SERVER_IP]);
    		return false;
	     }
       	
       	if (!check_pwd("wan_pptp_password", "pptppwd2")){
       		return false;
       	}
       	
       	if (!check_varible(temp_idle)){
    		return false;
    	}
    	
    	if (!check_varible(temp_mtu)){
    		return false;
    	}
		
		if(get_by_id("wan_primary_dns").value =="" || get_by_id("wan_primary_dns").value =="0.0.0.0"){
			get_by_id("wan_specify_dns").value = 0;
		}else{
			get_by_id("wan_specify_dns").value = 1;
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
<input type="hidden" name="html_response_return_page" value="wan_pptp.asp">

<input type="hidden" name="wan_specify_dns" id="wan_specify_dns" value="<% CmoGetCfg("wan_specify_dns","none"); %>">
	  
<div id=maincontent>
			  <!-- === BEGIN MAINCONTENT === -->
              <div id=box_header>
                <h1>WAN</h1>
                <h4>Internet Connection</h4>
                <p>Use this section to configure your Internet Connection type. There are several connection types to choose from: Static IP, DHCP, PPPoE, PPTP, L2TP, and BigPond. If you are unsure of your connection method, please contact your Internet Service Provider.</p>
          		<p><strong>Note: </strong> If using the PPPoE option, you will need to remove or disable any PPPoE client software on your computers.</p>
            	<input name="button" type="submit" class=button_submit value="Save Settings" onClick="return send_pptp_request()">
            	<input name="button2" type=reset class=button_submit value="Don't Save Settings"  onClick="window.location.href='wan_pptp.asp'">
              </div>
              <div class=box>
                <h2>Internet Connection Type : </h2>
                <p class="box_msg">Choose the mode to be used by the router to connect to the Internet. </p>
                <table cellSpacing=1 cellPadding=1 width=525 border=0>
                  <tbody>
                    <tr>
                      <td width=150 class="form_label">My Internet Connection is :</td>
                      <td>&nbsp; <select name="wan_proto" id="wan_proto" onChange="change_wan()">
                        <option value="static" selected>Static IP</option>
                        <option value="dhcpc">Dynamic IP (DHCP)</option>
                        <option value="pppoe">PPPoE (Username / Password)</option>
                        <option value="pptp" selected>PPTP (Username / Password)</option>
                        <option value="l2tp">L2TP (Username / Password)</option>
                        <option value="bigpond">BigPond (Australia)</option>
                      </select></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div class=box id=show_pptp>
                <h2>PPTP : </h2>
                <p class="box_msg"> Enter the information provided by your Internet Service Provider (ISP). </p>

                <table cellSpacing=1 cellPadding=1 width=525 border=0>
                  <tbody>
                    <tr>
                      <td class="form_label">Address Mode&nbsp;:</td>
                      <td><font size=2>&nbsp;
                      	<input type=radio value="1" name="wan_pptp_dynamic" onClick=clickPPTP() checked>
    						Dynamic IP
    					<input type=radio value="0" name="wan_pptp_dynamic" onClick=clickPPTP()>
    						Static IP</font></td>
                    </tr>
                    <tr>
                      <td width=150 class="form_label">IP Address :</td>
                      <td><font size=2>&nbsp;
                      <input type=text id="wan_pptp_ipaddr" name="wan_pptp_ipaddr" size=16 maxlength=15 value="<% CmoGetCfg("wan_pptp_ipaddr","none"); %>">
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150 class="form_label">Subnet Mask :</td>
                      <td><font size=2>&nbsp;
                      <input type=text id="wan_pptp_netmask" name="wan_pptp_netmask" size=16 maxlength=15 value="<% CmoGetCfg("wan_pptp_netmask","none"); %>">
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150 class="form_label">Gateway :</td>
                      <td><font size=2>&nbsp;
                      <input name="wan_pptp_gateway" type=text id="wan_pptp_gateway" size=16 maxlength=15 value="<% CmoGetCfg("wan_pptp_gateway","none"); %>">
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150 class="form_label">DNS :</td>
                      <td><font size=2>&nbsp;
                      <input name="wan_primary_dns" type=text id="wan_primary_dns" size=16 maxlength=15 value="<% CmoGetCfg("wan_primary_dns","none"); %>">
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150 class="form_label">Server IP/Name :</td>
                      <td><font size=2>&nbsp;
                      <input type=text id="wan_pptp_server_ip" name="wan_pptp_server_ip" size=32 maxlength=32 value="<% CmoGetCfg("wan_pptp_server_ip","none"); %>">
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150 class="form_label">PPTP Account :</td>
                      <td><font size=2>&nbsp;
                      <input type=text id="wan_pptp_username" name="wan_pptp_username" size=32 maxlength=63 value="<% CmoGetCfg("wan_pptp_username","none"); %>">
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150 class="form_label">PPTP Password :</td>
                      <td><font size=2>&nbsp;
                      <input type=password id="wan_pptp_password"  name="wan_pptp_password" size=32 maxlength=31 value="WDB8WvbXdHtZyM8Ms2RENgHlacJghQyG">
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150 class="form_label">PPTP Retype password :</td>
                      <td><font size=2>&nbsp;
                      <input type=password id=pptppwd2 name=pptppwd2 size=32 maxlength=31 value="WDB8WvbXdHtZyM8Ms2RENgHlacJghQyG">
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150 class="form_label">Maximum Idle Time :</td>
                      <td><font size=2>&nbsp;
                      <input type=text id="wan_pptp_max_idle_time" name="wan_pptp_max_idle_time" maxlength=4 size=5 value="<% CmoGetCfg("wan_pptp_max_idle_time","none"); %>">
    Minutes</font></td>
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
                      <input type=radio name="wan_pptp_connect_mode" value="always_on">
    Always-on
    <input type=radio name="wan_pptp_connect_mode" value="manual">
    Manual
    <input type=radio name="wan_pptp_connect_mode" value="on_demand">
    Connect-on demand</font> </td>
                    </tr>
                  </tbody>
          </table>
        </div>
			  
			  
			  
			  
			  
              
	    
              
              
              

		    </div>
</form>
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
		   
    clickPPTP();
   
</script>
<!-- insert name=restore_wan_type -->
</html>
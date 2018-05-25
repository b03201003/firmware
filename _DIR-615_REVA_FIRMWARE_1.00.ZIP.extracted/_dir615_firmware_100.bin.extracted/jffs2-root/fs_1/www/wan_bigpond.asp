<html>
<head>
<script language="JavaScript" src="public.js"></script>
<script>
var submit_button_flag = 0;
function onPageLoad(){
	var sel_wan_bigpond_auth = "<% CmoGetCfg("wan_bigpond_auth","none"); %>";
	if(sel_wan_bigpond_auth == "sm-server"){
			get_by_id("wan_bigpond_auth").selectedIndex = 0;														
	}else{
			get_by_id("wan_bigpond_auth").selectedIndex = 1;
	}	
	
	
	set_mac(get_by_id("wan_mac").value);
		
}

function clone_mac_action(){
	set_mac(get_by_id("mac_clone_addr").value);
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



	function send_bigpond_request(){
		var mac = "";
		
		if (!check_pwd("wan_bigpond_password", "bigpond_pass_v")){
       		return false;
       	}
       	
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
		
		
		
		if (!check_mac(mac)){
			alert(msg[MAC_ADDRESS_ERROR]);
			return false;
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
<input type="hidden" name="html_response_return_page" value="wan_bigpond.asp">
	
<input type="hidden" name="mac_clone_addr" id="mac_clone_addr" value="<% CmoGetStatus("mac_clone_addr"); %>">	
	  
<div id=maincontent>
			  <!-- === BEGIN MAINCONTENT === -->
              <div id=box_header>
                <h1>WAN</h1>
                <h4>Internet Connection</h4>
                <p>Use this section to configure your Internet Connection type. There are several connection types to choose from: Static IP, DHCP, PPPoE, PPTP, L2TP, and BigPond. If you are unsure of your connection method, please contact your Internet Service Provider.</p>
            	<input name="button" type=submit class=button_submit value="Save Settings" onClick="return send_bigpond_request()">
            	<input name="button2" type=reset class=button_submit value="Don't Save Settings"  onClick="window.location.href='wan_bigpond.asp'">
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
                        <option value="pppoe">PPPoE (Username / Password)</option>
                        <option value="pptp">PPTP (Username / Password)</option>
                        <option value="l2tp">L2TP (Username / Password)</option>
                        <option value="bigpond" selected>BigPond (Australia)</option>
                      </select></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div class=box id=show_bigpond>
                <h2>Bigpond : </h2>
				<p class="box_msg"> Enter the information provided by your Internet Service Provider (ISP). </p>
                <table cellSpacing=1 cellPadding=1 width=525 border=0>
                  <tbody>
                    <tr>
                      <td width=150 valign=top class="form_label">User Name :</td>
                      <td valign=top><font size=2>&nbsp;
                      <input type=text id="wan_bigpond_username" name="wan_bigpond_username" size=30 maxlength=63 value="<% CmoGetCfg("wan_bigpond_username","none"); %>">
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150 class="form_label">Password :</td>
                      <td><font size=2>&nbsp;
                      <input type=password id="wan_bigpond_password" name="wan_bigpond_password" size=30 maxlength=63 value="WDB8WvbXdHtZyM8Ms2RENgHlacJghQyG">
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150 height="25" class="form_label">Retype Password :</td>
                      <td height="25"><font size=2>&nbsp;
                      <input type=password id=bigpond_pass_v name=bigpond_pass_v size=30 maxlength=63 value="WDB8WvbXdHtZyM8Ms2RENgHlacJghQyG">
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150 class="form_label">Auth Server :</td>
                      <td><font size=2>&nbsp;
                      <select id="wan_bigpond_auth" name="wan_bigpond_auth">
                        <option value="sm-server" selected>sm-server</option>
                        <option value="dce-server">dce-server</option>
                      </select>
                      </font></td>
                    </tr>
                    <tr>
                      <td width=150 class="form_label">Login Server IP/Name :</td>
                      <td><font size=2>&nbsp;
                      <input type=text id="wan_bigpond_server" name="wan_bigpond_server" size=32 maxlength=32 value="<% CmoGetCfg("wan_bigpond_server","none"); %>">
    (optional) </font></td>
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
    &nbsp;&nbsp;<input name="clone" type=button value="Clone MAC Address" onClick="clone_mac_action()">
                      </font></td>
                    </tr>
                  </tbody>
                </table>
              </div>
			  
			  
			  
			  
			  
              
	    
              
              
              

		    </div>
</form>
<form id="form2" name="form2" method="post" action="mac_clone.cgi"><input type="hidden" name="html_response_page" value="wan_bigpond.asp"><input type="hidden" name="html_response_return_page" value="wan_bigpond.asp"></form>
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
 

</script>
<!-- insert name=restore_wan_type -->
</html>
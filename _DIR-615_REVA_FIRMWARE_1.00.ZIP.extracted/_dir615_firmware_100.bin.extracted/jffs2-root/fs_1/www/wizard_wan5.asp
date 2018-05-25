<html>
<head>
<link rel="STYLESHEET" type="text/css" href="css_router.css">
<script language="JavaScript" src="public.js"></script>
<script language="JavaScript">
var submit_button_flag = 0;
	function send_request(){		
		if(submit_button_flag == 0){
		submit_button_flag = 1;
		return true;
		}else{
		return false;
		}
		//return true;		
	}
</script>
<title></title>
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
</head>
<body topmargin="1" leftmargin="0" rightmargin="0" bgcolor="#757575">

<table border=0 cellspacing=0 cellpadding=0 align=center width=838>
<tr>
<td>
<div align=left>
<table width=838 border=0 cellspacing=0 cellpadding=0 align=center height=100>
<tr>
<td bgcolor="#FFFFFF">
<div align=center>
<table id="header_container" border="0" cellpadding="5" cellspacing="0" width="838" align="center">
  <tr>
    <td width="100%">Product Page: <a href="http://support.dlink.com/">DIR-615</a></td>
    <td align="right" nowrap>Hardware Version: A1 &nbsp;</td>
    <td align="right" nowrap>Firmware Version: <% CmoGetStatus("version"); %></td>
  </tr>
</table>
<div align="center"><img src="wlan_masthead.gif" width="836" height="92" align="middle"></div>
</td>
</tr>
</table>
</div>
</td>
</tr>
<tr>
<td bgcolor="#FFFFFF"><p>&nbsp;</p><table width="650" border="0" align="center">
  <tr>
    <td><div id=box_header-w>
      <h1 align="left" class="h1-w">Setup Complete!</h1>
      <div align="left">
        <div id=w2>
          <P align="left" class=box_msg-w>The Setup Wizard has completed. Click the Connect button to save your settings and restart the router.</P>
          <P align="left" class=box_msg>&nbsp;</P>
          <form id="form1" name="form1" method="post" action="apply.cgi">
          		<input type="hidden" name="html_response_page" value="index.asp">
				<input type="hidden" name="html_response_message" value="The setting is saved.">
				<input type="hidden" name="html_response_return_page" value="index.asp">
				<input type="hidden" name="reboot_type" value="all">
				
          		<input type="hidden" id="admin_password" name="admin_password" value="<% CmoGetCfg("asp_temp_00","none"); %>">
				<input type="hidden" id="time_zone" name="time_zone" value="<% CmoGetCfg("asp_temp_01","none"); %>">
				<input type="hidden" id="wan_proto" name="wan_proto" value="<% CmoGetCfg("asp_temp_02","none"); %>">
				
				<script>
					var wan_type = get_by_id("wan_proto").value;
					
					if (wan_type == "dhcpc"){ // dhcp
						document.write("<input type=\"hidden\" id=\"wan_mac\" name=\"wan_mac\" value=\"<% CmoGetCfg("asp_temp_03","none"); %>\">");
						document.write("<input type=\"hidden\" id=\"hostname\" name=\"hostname\" value=\"<% CmoGetCfg("asp_temp_04","none"); %>\">");
					}else if (wan_type == "static"){ //static ip 
						document.write("<input type=\"hidden\" id=\"wan_static_ipaddr\" name=\"wan_static_ipaddr\" value=\"<% CmoGetCfg("asp_temp_05","none"); %>\">");
						document.write("<input type=\"hidden\" id=\"wan_static_netmask\" name=\"wan_static_netmask\" value=\"<% CmoGetCfg("asp_temp_06","none"); %>\">");
						document.write("<input type=\"hidden\" id=\"wan_static_gateway\" name=\"wan_static_gateway\" value=\"<% CmoGetCfg("asp_temp_07","none"); %>\">");
						document.write("<input type=\"hidden\" id=\"wan_specify_dns\" name=\"wan_specify_dns\" value=\"<% CmoGetCfg("asp_temp_08","none"); %>\">");
						document.write("<input type=\"hidden\" id=\"wan_primary_dns\" name=\"wan_primary_dns\" value=\"<% CmoGetCfg("asp_temp_09","none"); %>\">");
						document.write("<input type=\"hidden\" id=\"wan_secondary_dns\" name=\"wan_secondary_dns\" value=\"<% CmoGetCfg("asp_temp_10","none"); %>\">");
					}else if (wan_type == "pppoe"){ //pppoe
						document.write("<input type=\"hidden\" id=\"wan_pppoe_dynamic_00\" name=\"wan_pppoe_dynamic_00\" value=\"<% CmoGetCfg("asp_temp_11","none"); %>\">");
						document.write("<input type=\"hidden\" id=\"wan_pppoe_username_00\" name=\"wan_pppoe_username_00\" value=\"<% CmoGetCfg("asp_temp_12","none"); %>\">");
						document.write("<input type=\"hidden\" id=\"wan_pppoe_password_00\" name=\"wan_pppoe_password_00\" value=\"<% CmoGetCfg("asp_temp_13","none"); %>\">");
						document.write("<input type=\"hidden\" id=\"wan_pppoe_service_00\" name=\"wan_pppoe_service_00\" value=\"<% CmoGetCfg("asp_temp_14","none"); %>\">");
						document.write("<input type=\"hidden\" id=\"wan_pppoe_ipaddr_00\" name=\"wan_pppoe_ipaddr_00\" value=\"<% CmoGetCfg("asp_temp_15","none"); %>\">");
					}else if (wan_type == "pptp"){	//pptp
						document.write("<input type=\"hidden\" id=\"wan_pptp_dynamic\" name=\"wan_pptp_dynamic\" value=\"<% CmoGetCfg("asp_temp_16","none"); %>\">");
						document.write("<input type=\"hidden\" id=\"wan_pptp_username\" name=\"wan_pptp_username\" value=\"<% CmoGetCfg("asp_temp_17","none"); %>\">");
						document.write("<input type=\"hidden\" id=\"wan_pptp_password\" name=\"wan_pptp_password\" value=\"<% CmoGetCfg("asp_temp_18","none"); %>\">");
						document.write("<input type=\"hidden\" id=\"wan_pptp_ipaddr\" name=\"wan_pptp_ipaddr\" value=\"<% CmoGetCfg("asp_temp_19","none"); %>\">");
						document.write("<input type=\"hidden\" id=\"wan_pptp_netmask\" name=\"wan_pptp_netmask\" value=\"<% CmoGetCfg("asp_temp_20","none"); %>\">");
						document.write("<input type=\"hidden\" id=\"wan_pptp_gateway\" name=\"wan_pptp_gateway\" value=\"<% CmoGetCfg("asp_temp_21","none"); %>\">");
						document.write("<input type=\"hidden\" id=\"wan_pptp_server_ip\" name=\"wan_pptp_server_ip\" value=\"<% CmoGetCfg("asp_temp_22","none"); %>\">");						
					}else if (wan_type == "l2tp"){	//l2tp
						document.write("<input type=\"hidden\" id=\"wan_l2tp_dynamic\" name=\"wan_l2tp_dynamic\" value=\"<% CmoGetCfg("asp_temp_23","none"); %>\">");
						document.write("<input type=\"hidden\" id=\"wan_l2tp_username\" name=\"wan_l2tp_username\" value=\"<% CmoGetCfg("asp_temp_24","none"); %>\">");
						document.write("<input type=\"hidden\" id=\"wan_l2tp_password\" name=\"wan_l2tp_password\" value=\"<% CmoGetCfg("asp_temp_25","none"); %>\">");
						document.write("<input type=\"hidden\" id=\"wan_l2tp_ipaddr\" name=\"wan_l2tp_ipaddr\" value=\"<% CmoGetCfg("asp_temp_26","none"); %>\">");
						document.write("<input type=\"hidden\" id=\"wan_l2tp_netmask\" name=\"wan_l2tp_netmask\" value=\"<% CmoGetCfg("asp_temp_27","none"); %>\">");
						document.write("<input type=\"hidden\" id=\"wan_l2tp_gateway\" name=\"wan_l2tp_gateway\" value=\"<% CmoGetCfg("asp_temp_28","none"); %>\">");
						document.write("<input type=\"hidden\" id=\"wan_l2tp_server_ip\" name=\"wan_l2tp_server_ip\" value=\"<% CmoGetCfg("asp_temp_29","none"); %>\">");
					}else if (wan_type == "bigpond"){	// bigpond
						document.write("<input type=\"hidden\" id=\"wan_bigpond_username\" name=\"wan_bigpond_username\" value=\"<% CmoGetCfg("asp_temp_30","none"); %>\">");
						document.write("<input type=\"hidden\" id=\"wan_bigpond_password\" name=\"wan_bigpond_password\" value=\"<% CmoGetCfg("asp_temp_31","none"); %>\">");
						document.write("<input type=\"hidden\" id=\"wan_bigpond_auth\" name=\"wan_bigpond_auth\" value=\"<% CmoGetCfg("asp_temp_32","none"); %>\">");
						document.write("<input type=\"hidden\" id=\"wan_bigpond_server\" name=\"wan_bigpond_server\" value=\"<% CmoGetCfg("asp_temp_33","none"); %>\">");
					}				
				</script>
            <table align="center" class=formarea >
              <tbody>
                <tr>                  
                  <td><input type="button" class="button_submit" name="prev_b" value="Prev" onClick="window.location.href='wizard_wan3.asp'">
                      <input type="submit" class="button_submit" name="next_b" value="Connect" onClick="return send_request()">
                      <input type="button" class="button_submit" name="cancel_b" value="Cancel" onClick="window.location='index.asp';">
                  </td>
                </tr>
              </tbody>
            </table>
            <div align="center"></div>
          </form>
        </div>
      </div>
    </div></td>
  </tr>
</table>
  <p>&nbsp;</p>
 </td>
</tr>
<tr>
  <td bgcolor="#FFFFFF"><table id="footer_container" border="0" cellpadding="0" cellspacing="0" width="836" align="center">
    <tr>
      <td width="125" align="center">&nbsp;&nbsp;<img src="wireless_bottom.gif" width="114" height="35"></td>
      <td width="10">&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table></td>
</tr>
</table>
<div align="center">Copyright &copy; 2004-2005 D-Link Systems, Inc. </div>
</body>
</html>

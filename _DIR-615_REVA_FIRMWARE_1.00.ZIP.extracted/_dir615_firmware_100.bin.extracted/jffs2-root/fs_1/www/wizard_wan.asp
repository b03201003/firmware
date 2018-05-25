<html>
<head>
<link rel="STYLESHEET" type="text/css" href="css_router.css">
<script language="Javascript" src="public.js"></script>
<script language="Javascript">
var submit_button_flag = 0;
	function send_request(){
		var login_who="<% CmoGetStatus("get_current_user"); %>";
		if(login_who== "user"){
			window.location.href ="index.asp";
			return false;
		}else{
			
			if(submit_button_flag == 0){
				submit_button_flag = 1;
				return true;
			}else{
				return false;
			}
			//return true;
		}
		
		
	}
</script>

<title></title>
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
</head>
<body topmargin="1" leftmargin="0" rightmargin="0" bgcolor="#757575">
<table border=0 cellspacing=0 cellpadding=0 align=center width=838>
<tr>
<td bgcolor="#FFFFFF">
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
  <img src="wlan_masthead.gif" width="836" height="92" align="middle"> 
     </div>
   </div></td>
</tr>
</table>
</div></td>
</tr>
<tr>
<td bgcolor="#FFFFFF">
  <p>&nbsp;</p>
  <table width="650" border="0" align="center">
    <tr>
      <td><div id=box_header-w>
        <h1 align="left" class="h1-w">Welcome to the D-Link Setup Wizard</h1>
        <div align="left">
          <p class="box_msg-w">This wizard will guide you through a step-by-step process to configure your new D-Link router and connect to the Internet.</p>
          <div>
            <div id=w1>
              <div align="center"></div>
              <form id="form1" name="form1" method="post" action="apply.cgi">
              	<input type="hidden" name="html_response_page" value="wizard_wan1.asp">
				<input type="hidden" name="html_response_message" value="">
				<input type="hidden" name="html_response_return_page" value="wizard_wan1.asp">
				<input type="hidden" name="reboot_type" value="none">
				
				<input type="hidden" id="asp_temp_00" name="asp_temp_00" value="<% CmoGetCfg("admin_password","none"); %>">
				<input type="hidden" id="asp_temp_01" name="asp_temp_01" value="<% CmoGetCfg("time_zone","none"); %>">
				<input type="hidden" id="asp_temp_02" name="asp_temp_02" value="<% CmoGetCfg("wan_proto","none"); %>">

				<!-- dhcp -->
				<input type="hidden" id="asp_temp_03" name="asp_temp_03" value="<% CmoGetCfg("wan_mac","none"); %>">
				<input type="hidden" id="asp_temp_04" name="asp_temp_04" value="<% CmoGetCfg("hostname","none"); %>">

				<!-- static ip -->
				<input type="hidden" id="asp_temp_05" name="asp_temp_05" value="<% CmoGetCfg("wan_static_ipaddr","none"); %>">
				<input type="hidden" id="asp_temp_06" name="asp_temp_06" value="<% CmoGetCfg("wan_static_netmask","none"); %>">
				<input type="hidden" id="asp_temp_07" name="asp_temp_07" value="<% CmoGetCfg("wan_static_gateway","none"); %>">
				<input type="hidden" id="asp_temp_08" name="asp_temp_08" value="<% CmoGetCfg("wan_specify_dns","none"); %>">
				<input type="hidden" id="asp_temp_09" name="asp_temp_09" value="<% CmoGetCfg("wan_primary_dns","none"); %>">
				<input type="hidden" id="asp_temp_10" name="asp_temp_10" value="<% CmoGetCfg("wan_secondary_dns","none"); %>">
				
				<!-- pppoe -->
				<input type="hidden" id="asp_temp_11" name="asp_temp_11" value="<% CmoGetCfg("wan_pppoe_dynamic_00","none"); %>">
				<input type="hidden" id="asp_temp_12" name="asp_temp_12" value="<% CmoGetCfg("wan_pppoe_username_00","none"); %>">
				<input type="hidden" id="asp_temp_13" name="asp_temp_13" value="<% CmoGetCfg("wan_pppoe_password_00","none"); %>">
				<input type="hidden" id="asp_temp_14" name="asp_temp_14" value="<% CmoGetCfg("wan_pppoe_service_00","none"); %>">				
				<input type="hidden" id="asp_temp_15" name="asp_temp_15" value="<% CmoGetCfg("wan_pppoe_ipaddr_00","none"); %>">
				
				<!-- pptp -->
				<input type="hidden" id="asp_temp_16" name="asp_temp_16" value="<% CmoGetCfg("wan_pptp_dynamic","none"); %>">
				<input type="hidden" id="asp_temp_17" name="asp_temp_17" value="<% CmoGetCfg("wan_pptp_username","none"); %>">
				<input type="hidden" id="asp_temp_18" name="asp_temp_18" value="<% CmoGetCfg("wan_pptp_password","none"); %>">				
				<input type="hidden" id="asp_temp_19" name="asp_temp_19" value="<% CmoGetCfg("wan_pptp_ipaddr","none"); %>">
				<input type="hidden" id="asp_temp_20" name="asp_temp_20" value="<% CmoGetCfg("wan_pptp_netmask","none"); %>">
				<input type="hidden" id="asp_temp_21" name="asp_temp_21" value="<% CmoGetCfg("wan_pptp_gateway","none"); %>">
				<input type="hidden" id="asp_temp_22" name="asp_temp_22" value="<% CmoGetCfg("wan_pptp_server_ip","none"); %>">
				
				<!-- l2tp -->
				<input type="hidden" id="asp_temp_23" name="asp_temp_23" value="<% CmoGetCfg("wan_l2tp_dynamic","none"); %>">
				<input type="hidden" id="asp_temp_24" name="asp_temp_24" value="<% CmoGetCfg("wan_l2tp_username","none"); %>">
				<input type="hidden" id="asp_temp_25" name="asp_temp_25" value="<% CmoGetCfg("wan_l2tp_password","none"); %>">								
				<input type="hidden" id="asp_temp_26" name="asp_temp_26" value="<% CmoGetCfg("wan_l2tp_ipaddr","none"); %>">
				<input type="hidden" id="asp_temp_27" name="asp_temp_27" value="<% CmoGetCfg("wan_l2tp_netmask","none"); %>">
				<input type="hidden" id="asp_temp_28" name="asp_temp_28" value="<% CmoGetCfg("wan_l2tp_gateway","none"); %>">
				<input type="hidden" id="asp_temp_29" name="asp_temp_29" value="<% CmoGetCfg("wan_l2tp_server_ip","none"); %>">
				
				<!-- bigpond -->				
				<input type="hidden" id="asp_temp_30" name="asp_temp_30" value="<% CmoGetCfg("wan_bigpond_username","none"); %>">
				<input type="hidden" id="asp_temp_31" name="asp_temp_31" value="<% CmoGetCfg("wan_bigpond_password","none"); %>">
				<input type="hidden" id="asp_temp_32" name="asp_temp_32" value="<% CmoGetCfg("wan_bigpond_auth","none"); %>">				
				<input type="hidden" id="asp_temp_33" name="asp_temp_33" value="<% CmoGetCfg("wan_bigpond_server","none"); %>">
				<br>
				<TABLE width="289" align="center" class=formarea summary="wizard intro">
                  <TBODY>
                    <TR>
                      <TD width="320"><UL>
                          <LI><span class="w11">Step 1: Set your Password 
                          </span>
                          <LI><span class="w11">Step 2: Select your Time Zone
                              <!--@OPTIONAL:not the_lpj_output.APP_TYPE_ACCESS_POINT@-->
                              </span>
                          <LI><span class="w11">Step 3: Configure your Internet Connection 
                              </span>
                          <LI><span class="w11">Step 4: Save Settings and Connect
                                </span>
                            <!--@ENDOPTIONAL@-->
                                <!--@OPTIONAL: the_lpj_output.APP_TYPE_ACCESS_POINT@-->
                                <!--@ENDOPTIONAL@-->
                              </LI>
                      </UL></TD>
                    </TR>
                  </TBODY>
                </TABLE>
                <br>
                <table align="center" class="formarea">
                  <tr>
                    <td>
                      <input type="submit" class="button_submit" name="next_b2" value="Next" onClick="return send_request()">
                      <input type="button" class="button_submit" name="cancel_b2" value="Cancel" onClick="window.location.href='index.asp'">
                    </td>
                  </tr>
                </table>
              </form>
            </div>
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

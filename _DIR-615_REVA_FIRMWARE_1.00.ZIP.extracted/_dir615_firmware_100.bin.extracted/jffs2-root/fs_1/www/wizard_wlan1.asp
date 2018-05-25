<html>
<head>
<link rel="STYLESHEET" type="text/css" href="css_router.css">
<script language="JavaScript" src="public.js"></script>
<script language="JavaScript">	
var submit_button_flag = 0;	
	function onPageLoad(){
		get_by_id("show_ssid").value = hex_to_a(get_by_id("asp_temp_34").value);
	}
			
	function send_request(){
		if (check_ssid("show_ssid")){
			get_by_id("asp_temp_34").value = a_to_hex(get_by_id("show_ssid").value);
			if(submit_button_flag == 0){
				submit_button_flag = 1;
				return true;
			}else{
				return false;
			}
			//return true;
			//send_submit('form1');
		}
		return false;
	}
</script>
<title></title>
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
</head>
<body topmargin="1" leftmargin="0" rightmargin="0" bgcolor="#757575">
<table width=838 height="100" border=0 align=center cellpadding=0 cellspacing=0>
<tr>
<td bgcolor="#FFFFFF"><table id="header_container" border="0" cellpadding="5" cellspacing="0" width="838" align="center">
  <tr>
    <td width="100%">Product Page: <a href="http://support.dlink.com/">DIR-615</a></td>
    <td align="right" nowrap>Hardware Version: A1 &nbsp;</td>
    <td align="right" nowrap>Firmware Version: <% CmoGetStatus("version"); %></td>
  </tr>
</table>
  <div align="center"><img src="wlan_masthead.gif" width="836" height="92" align="middle"></div></td>
</tr>
<tr>
  <td bgcolor="#FFFFFF"><p>&nbsp;</p>
    <table width="650" border="0" align="center">
    <tr>
      <td><div id=box_header-w>
          <h1 align="left" class="h1-w">Step 1: Name your Wireless Network</h1>
          <div align="left">
            <p class="box_msg-w">Your wireless network needs a name so it can be easily recognized by wireless clients. For security purposes, it is highly recommended to change the pre-configured network name of [dlink].</p>
            <form id="form1" name="form1" method="post" action="apply.cgi">
			<input type="hidden" name="html_response_page" value="wizard_wlan2.asp">
			<input type="hidden" name="html_response_message" value="">
			<input type="hidden" name="html_response_return_page" value="wizard_wlan2.asp">
			<input type="hidden" name="reboot_type" value="none">
			
              <table align="center" class=formarea>
                <tr>
                  <td width="145" class=form_label><div align="right" class="w11_bold">Wireless Network Name (SSID)</div></TD>
                  <td width="457"><span class="style3"> <font face="Arial" size="2">
                    <input type="text" id="show_ssid" name="show_ssid" size="20" maxlength="32" value="">
					<input type="hidden" id="asp_temp_34" name="asp_temp_34" value="<% CmoGetCfg("asp_temp_34","none"); %>">
                  </font> </span></TD>
                </tr>
                <tr>
                  <td class=form_label>&nbsp;</TD>
                  <td><table align="left" class="formarea">
                      <tr>
                        <td>
                          <input type="submit" class="button_submit" name="next" value="Next" onClick="return send_request()">
                          <input type="button" class="button_submit" name="cancel" value="Cancel" onClick="window.location.href='index.asp'">
                        </td>
                      </tr>
                  </table></TD>
                </tr>
              </table>
            </form>
          </div>
      </div></td>
    </tr>
  </table>
    <p>&nbsp;</p></td>
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
<script>onPageLoad();</script>
</body>
</html>

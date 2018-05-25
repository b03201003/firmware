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
<td></td>
</tr>
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
 <img src="wlan_masthead.gif" width="836" height="92" align="middle"> </div></td>
</tr>
</table>
</div>
</td>
</tr>
<tr>
<td bgcolor="#FFFFFF">
  <p>&nbsp;</p>
  <table width="650" border="0" align="center">
    <tr>
      <td><div id=box_header-w>
        <h1 align="left" class="h1-w">Welcome to the D-Link Wireless Security Setup Wizard</h1>
        <div align="left">
          <div id=w1>
            <div align="center">
              <p align="left"><span class="box_msg-w">This wizard will guide you through a step-by-step process to setup your wireless network and make it secure.</span></p>
            </div>
<form id="form1" name="form1" method="post" action="apply.cgi">
<input type="hidden" name="html_response_page" value="wizard_wlan1.asp">
<input type="hidden" name="html_response_message" value="">
<input type="hidden" name="html_response_return_page" value="wizard_wlan1.asp">
<input type="hidden" name="reboot_type" value="none">

<input type="hidden" id="asp_temp_34" name="asp_temp_34" value="<% CmoGetCfg("wlan0_ssid","none"); %>">
<input type="hidden" id="asp_temp_35" name="asp_temp_35" value="">
<input type="hidden" id="asp_temp_36" name="asp_temp_36" value="">
            <table align="center" class=formarea>
              <tbody>
                <tr>
                  <td width="334" height="81">
                    <UL>
                      <LI><span class="w11">Step 1: Name your Wireless Network
                              </span>
                      <LI><span class="w11">Step 2: Secure your Wireless Network
                              </span>
                      <LI><span class="w11">Step 3: Set your Wireless Security Password
                            </span>
                      </UL></TD>
                </tr>
              </TBODY>
            </table>
            <br>
            <table align="center" class="formarea">
              <tr>
                <td>
                  <input type="submit" class="button_submit" name="next_b22" value="Next" onClick="return send_request()">
                  <input type="button" class="button_submit" name="cancel_b22" value="Cancel" onClick="window.location.href='index.asp'">
                </td>
              </tr>
            </table></form>
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

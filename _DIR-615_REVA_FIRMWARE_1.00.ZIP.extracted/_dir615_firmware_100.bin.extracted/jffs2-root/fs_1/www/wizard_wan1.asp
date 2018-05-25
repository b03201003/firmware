<html>
<head>
<link rel="STYLESHEET" type="text/css" href="css_router.css">
<script language="Javascript" src="public.js"></script>
<script language="Javascript">
var submit_button_flag = 0;
	function send_request(){
		if (get_by_id("pwd1").value != get_by_id("pwd2").value){
			alert(msg[MATCH_WIZARD_PWD_ERROR]);
			return false;
		}
		
		get_by_id("asp_temp_00").value = get_by_id("pwd1").value;
		
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
<table border=0 cellspacing=0 cellpadding=0 align=center width=30>

<tr>
<td bgcolor="#C0C0C0">
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
<div align="center"><img src="wlan_masthead.gif" width="836" height="92" align="middle">
</div></td>
</tr>
<tr>
  <td bgcolor="#FFFFFF"><p>&nbsp;</p>
    <table width="650" border="0" align="center">
    <tr>
      <td><div id=box_header-w>
          <h1 align="left" class="h1-w">Step 1: Set your Password</h1>
          <div align="left">
            <p align="left" class="box_msg-w">By default, your new D-Link Router does not have a password configured for administrator access to the Web-based configuration pages. To secure your new networking device, please set and verify a password below:</p>
            <form id="form1" name="form1" method="post" action="apply.cgi">
            <input type="hidden" name="html_response_page" value="wizard_wan2.asp">
			<input type="hidden" name="html_response_message" value="">
			<input type="hidden" name="html_response_return_page" value="wizard_wan2.asp">
			<input type="hidden" name="reboot_type" value="none">
			
			<input type="hidden" id="asp_temp_00" name="asp_temp_00">
              <div id=w2 >
                <table align="center" class=formarea>
                  <tbody>
                    <tr>
                      <td width="108" class=w11_bold><div align="right">Password&nbsp;:</div></td>
                      <td width="159"><font face=Arial size=2>
                        <input type=password id=pwd1 name=pwd1 size=20 maxlength=15 value="<% CmoGetCfg("asp_temp_00","none"); %>">
                      </font></td>
                    </tr>
                    <tr>
                      <td class=w11_bold><div align="right">Verify Password&nbsp;:</div></td>
                      <td><font face=Arial size=2>
                        <input type=password id=pwd2 name=pwd2 size=20 maxlength=15 value="<% CmoGetCfg("asp_temp_00","none"); %>">
                      </font></td>
                    </tr>
                  </tbody>
                </table>
                <table width="276" align="center" class="formarea">
                  <tr>
                    <td width="92" class="form_label">&nbsp;</td>
                    <td width="172">
                      <input type="button" class="button_submit" name="prev_b" value="Prev" onClick="window.location='wizard_wan.asp';">
                      <input type="submit" class="button_submit" name="next_b" value="Next" onClick="return send_request()">
                      <input type="button" class="button_submit" name="cancel_b" value="Cancel" onClick="window.location='index.asp';">
                    </td>
                  </tr>
                </table>
              </div>
            </form>
          </div>
      </div></td>
    </tr>
  </table>
    <p>&nbsp;</p></td>
</tr>
</table>
</div></td>
</tr>
<tr>
<td bgcolor="#FFFFFF">
  <table id="footer_container" border="0" cellpadding="0" cellspacing="0" width="836" align="center">
    <tr>
      <td width="125" align="center">&nbsp;&nbsp;<img src="wireless_bottom.gif" width="114" height="35"></td>
      <td width="10">&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>  </td>
</tr>
</table><br>
<div align="center">Copyright &copy; 2004-2005 D-Link Systems, Inc. </div>
</body>
</html>

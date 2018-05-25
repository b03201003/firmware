<html>
<head>
<link rel="STYLESHEET" type="text/css" href="css_router.css">
<script language="JavaScript" src="public.js"></script>
<script language="JavaScript">
var submit_button_flag = 0;
	function set_auth_server(){
		var auth_server = get_by_id("authserver");
		
		for (var i = 0; i < auth_server.length; i++){
			if (get_by_id("asp_temp_32").value == auth_server.options[i].value){
				auth_server.selectedIndex = i;
				break;
			}
		}
	}
	
	function send_request(){		
		if (!check_pwd("bigpond_pwd", "bigpond_pwd2")){
       		return false;
       	}
      
      	get_by_id("asp_temp_30").value = get_by_id("bigpond_userid").value;
      	get_by_id("asp_temp_31").value = get_by_id("bigpond_pwd").value;
      	get_by_id("asp_temp_32").value = get_by_id("authserver").value;
      	get_by_id("asp_temp_33").value = get_by_id("srv_name").value;
      	      	
		
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
<table width=838 height="100" border=0 align=center cellpadding=0 cellspacing=0>
<tr>
<td>
<div align=left>
<table width=838 border=0 cellspacing=0 cellpadding=0 align=center height=100>
<tr>
<td bgcolor="#FFFFFF"><div align=center>
  <table id="header_container" border="0" cellpadding="5" cellspacing="0" width="838" align="center">
    <tr>
      <td width="100%">Product Page: <a href="http://support.dlink.com/">DIR-615</a></td>
      <td align="right" nowrap>Hardware Version: A1 &nbsp;</td>
      <td align="right" nowrap>Firmware Version: <% CmoGetStatus("version"); %></td>
    </tr>
  </table>  
 
  <div align="center"><img src="wlan_masthead.gif" width="836" height="92" align="middle"></div></td>
</tr>
</table>
</div>
</td>
</tr>
<tr>
<td bgcolor="#FFFFFF">
    </td>
</tr>
<tr><br>
  <td bgcolor="#FFFFFF"><p>&nbsp;</p>
  <table width="650" border="0" align="center">
    <tr>
      <td><div id=box_header-w>
        <h1 align="left" class="h1-w">Set Username and Password Connection (BigPond)</h1>
        <div align="left">
          <p class="box_msg-w">To set up this connection you will need to have a Username and Password from your Internet Service Provider. You also need BigPond IP adress. If you do not have this information, please contact your ISP.</p>
          <form id="form1" name="form1" method="post" action="apply.cgi">
          	<input type="hidden" name="html_response_page" value="wizard_wan5.asp">
			<input type="hidden" name="html_response_message" value="">
			<input type="hidden" name="html_response_return_page" value="wizard_wan5.asp">
			<input type="hidden" name="reboot_type" value="none">
			
			<input type="hidden" id="asp_temp_30" name="asp_temp_30">
			<input type="hidden" id="asp_temp_31" name="asp_temp_31">
			<input type="hidden" id="asp_temp_32" name="asp_temp_32" value="<% CmoGetCfg("wan_bigpond_auth","none"); %>">				
			<input type="hidden" id="asp_temp_33" name="asp_temp_33">
				
            <table width="536" align="center" class=formarea >
              <tr>
                <td width="250"><div align="right" class="w11_bold"><strong>Auth Server : </strong></div></td>
                <td>
                  <select id="authserver" name="authserver">
                    <option value="sm-server">sm-server</option>
                    <option value="dce-server">dce-server</option>
                  </select>
                </td>
              </tr>
              <tr>
                <td width="250" class=form_label style3><div align="right" class="w11_bold"><strong>Bigpond Server IP Address <br>
              (may be same as gateway)&nbsp;:</strong></div></td>
                <td width="274"><font face=Arial size=2>
                  <input type=text id=srv_name name=srv_name size=32 maxlength=15 value="<% CmoGetCfg("asp_temp_33","none"); %>">
                </font> </td>
              </tr>
              <tr>
                <td width="250" class=form_label style3><div align="right" class="w11_bold"><strong>Bigpond User Name&nbsp;:</strong></div></td>
                <td> <font face=Arial size=2>
                  <input name=bigpond_userid type=text id=bigpond_userid size=32 maxlength=63 value="<% CmoGetCfg("asp_temp_30","none"); %>">
                </font> </td>
              </tr>
              <tr>
                <td width="250" class=form_label style3><div align="right" class="w11_bold"><strong>Bigpond Password&nbsp;:</strong></div></td>
                <td><font face=Arial size=2>
                  <input type=password id=bigpond_pwd name=bigpond_pwd size=32 maxlength=31 value="<% CmoGetCfg("asp_temp_31","none"); %>">
                </font> </td>
              </tr>
              <tr>
                <td width="250" class=form_label style3><div align="right" class="w11_bold"><strong>Bigpond Verify Password&nbsp;:</strong></div></td>
                <td> <font face=Arial size=2>
                  <input type=password id=bigpond_pwd2 name=bigpond_pwd2 size=32 maxlength=31 value="<% CmoGetCfg("asp_temp_31","none"); %>">
                </font> </td>
              </tr>
              <tr>
                <td width="250" class=form_label style3><div align="right"><strong></strong></div></td>
              <td><input type="button" class="button_submit" name="prev" value="Prev" onClick="window.location.href='wizard_wan3.asp'">
                <input type="submit" class="button_submit" name="next" value="Next" onClick="return send_request()">
                    <input type="button" class="button_submit" name="cancel" value="Cancel" onClick="window.location.href='index.asp';">
                </td>
              </tr>
            </table>
          </form>
          <p class="box_msg-w">&nbsp;</p>
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
</body>
<script>
	set_auth_server();
</script>
</html>

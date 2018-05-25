<html>
<head>
<link rel="STYLESHEET" type="text/css" href="css_router.css">
<script language="Javascript" src="public.js"></script>
<script language="JavaScript">
var submit_button_flag = 0;
	function show_encryption(){
		var security = get_by_id("asp_temp_35").value;
		
		get_by_id("show_wep").style.display = "none";
		get_by_id("show_wpa").style.display = "none";
		get_by_id("show_wpa2").style.display = "none";
		if (security == "1"){
			get_by_id("show_wep").style.display = "";
		}else if (security != "0"){			
			if (security == "3"){
				get_by_id("show_wpa2").style.display = "";
			}else{
				get_by_id("show_wpa").style.display = "";
			}
		}
	}
	
	function go_back(){
		var security = get_by_id("asp_temp_35").value;
		
		if (security == "0"){
			window.location.href= 'wizard_wlan2.asp';
		}else{
			window.location.href= 'wizard_wlan3.asp';
		}
	}
	
function send_request(){
	var security = get_by_id("asp_temp_35").value;
	if(security == "0"){
		get_by_id("wlan0_security").value= "disable";
		get_by_id("wlan0_ssid").value= "<% CmoGetCfg("asp_temp_34","none"); %>";
	}else if(security == "1"){
		get_by_id("wlan0_security").value= "wep_open_128";
		get_by_id("wlan0_ssid").value= "<% CmoGetCfg("asp_temp_34","none"); %>";
		get_by_id("wlan0_wep_default_key").value= "1";
		if(get_by_id("asp_temp_37").value == "ascii"){
			get_by_id("wlan0_wep128_key_1").value= hex_to_a(get_by_id("asp_temp_36").value);
		}else{
			get_by_id("wlan0_wep128_key_1").value= get_by_id("asp_temp_36").value;
		}
		get_by_id("wlan0_wep_display").value= "<% CmoGetCfg("asp_temp_37","none"); %>";
		
	}else if(security == "2"){
		get_by_id("wlan0_security").value= "wpa_psk";
		get_by_id("wlan0_ssid").value= "<% CmoGetCfg("asp_temp_34","none"); %>";
		get_by_id("wlan0_psk_pass_phrase").value= get_by_id("asp_temp_36").value;
		get_by_id("wlan0_psk_cipher_type").value= "tkip";
			
	}else if(security == "3"){
		get_by_id("wlan0_security").value= "wpa2_psk";
		get_by_id("wlan0_ssid").value= "<% CmoGetCfg("asp_temp_34","none"); %>";
		get_by_id("wlan0_psk_pass_phrase").value= get_by_id("asp_temp_36").value;
		get_by_id("wlan0_psk_cipher_type").value= "tkip";
	}else{
		alert("security error");
	}
	
	
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
<td></td>
</tr>
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
  <td bgcolor="#FFFFFF"><p>&nbsp;</p>    <table width="650" border="0" align="center">
    <tr>
      <td><div id=box_header-w>
        <h1 align="left" class="h1-w">Setup Complete!</h1>
        <div align="left">
          <p class="box_msg-w">Below is a detailed summary of your wireless security settings. Please print this page out, or write the information on a piece of paper, so you can configure the correct settings on your wireless client adapters.</p>
          <form id="form1" name="form1" method="post" action="apply.cgi">
		  <input type="hidden" name="html_response_page" value="index.asp">
			<input type="hidden" name="html_response_message" value="">
		<input type="hidden" name="html_response_return_page" value="index.asp">
		<input type="hidden" name="reboot_type" value="all">
		  <input type="hidden" id="asp_temp_35" name="asp_temp_35" value="<% CmoGetCfg("asp_temp_35","none"); %>">
		  <input type="hidden" id="asp_temp_36" name="asp_temp_36" value="<% CmoGetCfg("asp_temp_36","none"); %>">
		  <input type="hidden" id="asp_temp_37" name="asp_temp_37" value="<% CmoGetCfg("asp_temp_37","none"); %>">
		  
		  <input type="hidden" id="wlan0_security" name="wlan0_security">
		  <input type="hidden" id="wlan0_ssid" name="wlan0_ssid">
		  <input type="hidden" id="wlan0_wep_default_key" name="wlan0_wep_default_key">
		  <input type="hidden" id="wlan0_wep128_key_1" name="wlan0_wep128_key_1">
		  <input type="hidden" id="wlan0_wep_display" name="wlan0_wep_display">
		  <input type="hidden" id="wlan0_psk_pass_phrase" name="wlan0_psk_pass_phrase">
		  <input type="hidden" id="wlan0_psk_cipher_type" name="wlan0_psk_cipher_type">
            <div>
              <div id=w2 >
                <table width="450" align="center" class="formarea">
                  <tr>
                    <td width="161" class="form_label"><div align="right" class="w11_bold"><strong>Wireless Network Name (SSID)&nbsp;:</strong></div></td>
                    <td width="10">&nbsp;</td>
                    <td width="263">
					<script>
						document.write(hex_to_a("<% CmoGetCfg("asp_temp_34","none"); %>"));
					</script>
					</td>
                  </tr>
                  <tr id="show_wep" style="display:none">
                    <td colspan="3">
                      <table>
                        <tr>
                          <td height="21" class="form_label"><div align="right" class="w11_bold"><strong>Wep Key Length&nbsp;:</strong></div></td>
                          <td>&nbsp;</td>
                          <td class="w11">128 bits</td>
                        </tr>
                        <tr>
                          <td height="21" class="form_label"><div align="right" class="w11_bold"><strong>Default WEP Key to Use&nbsp;:</strong></div></td>
                          <td>&nbsp;</td>
                          <td class="w11">1</td>
                        </tr>
                        <tr>
                          <td height="21" class="form_label"><div align="right" class="w11_bold"><strong>Authentication&nbsp;:</strong></div></td>
                          <td>&nbsp;</td>
                          <td class="w11">Open</td>
                        </tr>
                        <tr id="summary_wep_tr">
                          <td height="21" class="form_label"><div align="right" class="w11_bold"><strong>Wep Key&nbsp;:</strong></div></td>
                          <td id="summary_wep_td">&nbsp;</td>
                          <td id="summary_wep_td">
						  <script>
						  	var show_word = get_by_id("asp_temp_36").value;
						  	if(get_by_id("asp_temp_35").value == "1"){
								if(get_by_id("asp_temp_37").value=="ascii"){
									 show_word = hex_to_a(get_by_id("asp_temp_36").value);
									}
							}
							document.write(show_word);
						  </script>
						  </td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr id="show_wpa" style="display:none">
                    <td colspan="3">
                      <table>
                        <tr>
                          <td height="21" class="form_label"><div align="right" class="w11_bold"><strong>Encryption&nbsp;:</strong></div></td>
                          <td>&nbsp;</td>
                          <td class="w11">WPA-PSK/TKIP (also known as WPA Personal)</td>
                        </tr>
					
                        <tr id="summary_wep_tr">
                          <td height="21" class="form_label"><div align="right" class="w11_bold"><strong>Pre-Shared Key&nbsp;:</strong></div></td>
                          <td id="summary_wep_td">&nbsp;</td>
                          <td id="summary_wep_td">
						  <script>
							document.write(hex_to_a(get_by_id("asp_temp_36").value));
						  </script>
						  </td>
                        </tr>
                    </table></td>
                  </tr>
					<tr id="show_wpa2" style="display:none">
                    <td colspan="3">
                      <table width="405">
                        <tr>
                          <td width="102" height="21" class="form_label"><div align="right" class="w11_bold"><strong>Encryption&nbsp;:</strong></div></td>
                          <td width="10">&nbsp;</td>
                          <td width="277" class="w11">WPA2-PSK/AES (also known as WPA2 Personal)</td>
                        </tr>
					
                        <tr >
                          <td height="21" class="form_label"><div align="right" class="w11_bold"><strong>Pre-Shared Key&nbsp;:</strong></div></td>
                          <td>&nbsp;</td>
                          <td>
						  <script>
							document.write(hex_to_a(get_by_id("asp_temp_36").value));
						  </script>
						  </td>
                        </tr>

                    </table></td>
                  </tr>
<tr id="show_wpa2_auto style="display:none">
                    <td colspan="3">&nbsp;                      </td>
                  </tr>
                </table>
                <div align="center"><br>
                    <input type="button" class="button_submit" name="prev_b" value="Prev" onClick="go_back()">
                    <input type="button" class="button_submit" name="cancel_b" value="Cancel" onClick="window.location.href='index.asp'">
                    <input type="submit" class="button_submit" name="save_b" value="Save" onClick="return send_request()">
                    <br>
                </div>
              </div>
            </div>
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
</body>
<script>
	show_encryption();
</script>
</html>

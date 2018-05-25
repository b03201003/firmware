<html>
<head>
<link rel="STYLESHEET" type="text/css" href="css_router.css">
<script language="Javascript" src="md5.js"></script>
<script language="Javascript" src="public.js"></script>
<script language="Javascript">
var submit_button_flag = 0;
	function mis_length(){
		var mis_length = 8;
		if(parseInt(get_by_id("asp_temp_35").value) < 2){
			mis_length = 13;
		}
		return mis_length;
	}
	function max_length(){
		var max_length = 63;
		if(parseInt(get_by_id("asp_temp_35").value) < 2){
			max_length = 26;
		}
		return max_length;
	}
	function send_request(){
		var security = "<% CmoGetCfg("asp_temp_35","none"); %>";
		var key = get_by_id("key").value;
		var temp_key = key;
		var mis = mis_length();
		var max = max_length();
		if(parseInt(get_by_id("asp_temp_35").value) == 1){
			if (key.length != mis && key.length != max){
	        	alert("The Wireless Security Password must be at least 13 characters or 26 hex digits. You entered "+ key.length);
	            return false;
			}else{
				if(key.length == max){
					for (var j = 0; j < key.length; j++){
		        		if (!check_hex(key.substring(j, j+1))){
		        			alert("Passphrase is invalid. The legal characters are 0~9, A~F, or a~f");
		        			return false;
		        		}
		        	}
		        }else{
		        	get_by_id("asp_temp_37").value = "ascii";
		        	temp_key = a_to_hex(get_by_id("key").value);
		        }
	        }
		}else if(parseInt(get_by_id("asp_temp_35").value) > 1){
			if (key.length < mis){                   
	        	alert("The length of the Passphrase must be at least "+ mis +" characters");
	            return false;
	        }else if (key.length > max){
	        	if(key.match(/[^0-9]/g)){
	           		alert(msg[PSK_OVER_LEN]);
	           		get_by_id("key").value = key.substring(0, 63);
	           		temp_key = get_by_id("key").value;
	           	}
			}
			temp_key = a_to_hex(get_by_id("key").value);
		}
		get_by_id("passpharse").value = temp_key;
		
		get_by_id("asp_temp_36").value = get_by_id("passpharse").value;
		if(submit_button_flag == 0){
		submit_button_flag = 1;
		return true;
		}else{
		return false;
		}
		//return true;
		//send_submit("form1");
	}
	function onPageLoad(){
		if(parseInt(get_by_id("asp_temp_35").value) < 2){
			get_by_id("show_wep").style.display = "";
		}else{
			get_by_id("show_psk").style.display = "";
		}
		get_by_id("key").maxLength = max_length();
	}
</script>
<title></title>
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
</head>
<body topmargin="1" leftmargin="0" rightmargin="0" bgcolor="#757575">
<form id="form1" name="form1" method="post" action="apply.cgi">
<input type="hidden" name="html_response_page" value="wizard_wlan4.asp">
<input type="hidden" name="html_response_message" value="">
<input type="hidden" name="html_response_return_page" value="wizard_wlan4.asp">
<input type="hidden" name="reboot_type" value="none">
<input type="hidden" id="asp_temp_35" name="asp_temp_35" value="<% CmoGetCfg("asp_temp_35","none"); %>">
<input type="hidden" id="asp_temp_36" name="asp_temp_36">
<input type="hidden" id="asp_temp_37" name="asp_temp_37" value="hex">

<table border=0 cellspacing=0 cellpadding=0 align=center width=838>
<tr>
<td>
<div align=left>
<table width=75% border=0 cellspacing=0 cellpadding=0 align=center height=100>
<tr>
<td bgcolor="#FFFFFF"><div align=center>
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
</table>
</div>
</td>
</tr>
<tr>
  <td bgcolor="#FFFFFF"><p>&nbsp;</p>    <table width="650" border="0" align="center">
    <tr>
      <td><div id=box_header-w>
        <h1 align="left" class="h1-w">Step 3: Set your Wireless Security Password</h1>
        <div align="left">
          <p class="box_msg-w">Once you have selected your security level - you will need to set a wireless security password.</p>
          <div class="style5">
            <table align="left" class="formarea" summary="wizard wep">
              <tr>
                <td width="185" class="form_label"><strong class="w11_bold">Wireless Security Password&nbsp;:</strong></td>
                <td width="300"><input id="key" name="key" type="text" size="20" maxlength="20">
                    <input type="hidden" id="passpharse" name="passpharse" maxlength="63">
                    <div id="show_psk" class="itemhelp" style="display:none">(8 to 63 characters)</div>
                    <div id="show_wep" class="itemhelp" style="display:none">(13 characters or 26 hex digits) </div></td>
              </tr>
            </table>
            <br>
            <br>
            <br>
            <div>
              <p align="left" class="w11">Note: You will need to enter the unique security key generated into your wireless clients enable proper wireless communication - not the password you provided to create the security key.</p>
            </div>
            <p align="center"><br>
                <input type="button" class="button_submit" name="prev_b" value="Prev" onClick="window.location.href='wizard_wlan2.asp'">
                <input type="submit" class="button_submit" name="next_b2" value="Next" onClick="return send_request()">
                <input type="button" class="button_submit" name="cancel_b" value="Cancel" onClick="window.location.href='index.asp'">
            </p>
          </div>
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
</form>
<div align="center">Copyright &copy; 2004-2005 D-Link Systems, Inc. </div>
<script>
onPageLoad();
</script>
</body>
</html>

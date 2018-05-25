<html>
<head>
<link rel="STYLESHEET" type="text/css" href="css_router.css">
<script language="JavaScript" src="public.js"></script>
<script language="JavaScript">
var submit_button_flag = 0;
	function set_wan_mac(){
		var mac = (get_by_id("asp_temp_03").value).split(":");
		
		if (mac.length > 1){		
			for (var i = 1; i <= mac.length; i++){
				get_by_id("mac" + i).value = mac[i-1];				
			}
		}
	}
		
	function clone_mac_action(){
	set_mac(get_by_id("mac_clone_addr").value);
	}	
		
	function send_request(){
		var c_host = get_by_id("host").value
		var mac = "";
		
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
		
		if(Find_word(c_host,"'") || Find_word(c_host,'"') || Find_word(c_host,"/")){
			alert("Host name invalid. the legal characters can not enter ',/,''");
			return false
		}
		
		get_by_id("asp_temp_03").value = mac;
		get_by_id("asp_temp_04").value = get_by_id("host").value;
		
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
<td>
<table width=838 border=0 cellspacing=0 cellpadding=0 align=center height=100>
<tr>
<td bgcolor="#FFFFFF">
  <div align="center">
  <table id="header_container" border="0" cellpadding="5" cellspacing="0" width="838" align="center">
    <tr>
      <td width="100%">Product Page: <a href="http://support.dlink.com/">DIR-615</a></td>
      <td align="right" nowrap>Hardware Version: A1 &nbsp;</td>
      <td align="right" nowrap>Firmware Version: <% CmoGetStatus("version"); %></td>
    </tr>
  </table>  <img src="wlan_masthead.gif" width="836" height="92" align="middle"></td>
</tr>
<tr>
  <td bgcolor="#FFFFFF"><p>&nbsp;</p>
  <table width="650" border="0" align="center">
    <tr>
      <td><div id=box_header-w>
          <h1 align="left" class="h1-w">DHCP Connection (Dynamic IP Address)</h1>
          <div align="left">
            <p class="box_msg-w">To set up this connection, please make sure that you are connected to the D-Link Router with the PC that was originally connected to your broadband connection. If you are, then click the Clone MAC button to copy your computer's MAC Address to the D-Link Router.</p>
            <form id="form1" name="form1" method="post" action="apply.cgi">
            <input type="hidden" name="html_response_page" value="wizard_wan5.asp">
			<input type="hidden" name="html_response_message" value="">
			<input type="hidden" name="html_response_return_page" value="wizard_wan5.asp">
			<input type="hidden" name="reboot_type" value="none">
			
			<input type="hidden" id="asp_temp_03" name="asp_temp_03" value="<% CmoGetCfg("asp_temp_03","none"); %>">
			<input type="hidden" id="asp_temp_04" name="asp_temp_04">					
              <div>
                <div id=w2>
                  <p align="left" class=box_msg>&nbsp;</p>
                  <table align="center" class=formarea>
                    <tbody>
                      <tr>
                        <td width="137" class=form_label><div align="right" class="w11_bold"><strong>MAC Address&nbsp;:</strong></div></td>
                        <td width="473"><font face=Arial size=2>
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
                        </font><font face=Arial size=2>&nbsp; </font> <span class="w11">(Optional)</span></td>
                      </tr>
                      <tr>
                        <td class=form_label>&nbsp;</td>
                        <td><input name="clone" type="button" class="button_submit" id="clone" value="Clone Your PC's MAC Address" onClick="clone_mac_action()"></td>
                      </tr>
                      <tr>
                        <td class=form_label><div align="right" class="w11_bold"><strong>Host Name&nbsp;:</strong></div></td>
                        <td><font face=Arial size=2>
                          <input type=text id=host name=host size=40 maxlength=39 value="<% CmoGetCfg("asp_temp_04","none"); %>">
                        </font></td>
                      </tr>
                      <tr>
                        <td class=form_label>&nbsp;</td>
                        <td class="w11">Note: You may also need to provide a Host Name. If you do not have or know this information, please contact your ISP</td>
                      </tr>
                      <tr>
                        <td class=form_label>&nbsp;</td>
                        <td><input type="button" class="button_submit" name="prev" value="Prev" onClick="window.location.href='wizard_wan3.asp'">
                  <input type="submit" class="button_submit" name="next" value="Next" onClick="return send_request()">
                            <input type="button" class="button_submit" name="cancel" value="Cancel" onClick="window.location.href='index.asp'"></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </form>
            <form id="form2" name="form2" method="post" action="mac_clone.cgi">
            	<input type="hidden" name="html_response_page" value="wizard_wan4a.asp">
				<input type="hidden" name="html_response_message" value="">
				<input type="hidden" name="html_response_return_page" value="wizard_wan4a.asp">
            	<input type="hidden" name="mac_clone_addr" id="mac_clone_addr" value="<% CmoGetStatus("mac_clone_addr"); %>">
            </form>
          </div>
      </div></td>
    </tr>
  </table>    <p>&nbsp;</p>    </td>
</tr>
</table>
</td>
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
  </table>
  </td>
</tr>
</table>
<div align="center">Copyright &copy; 2004-2005 D-Link Systems, Inc. </div>
</body>
<script>
	set_wan_mac();
</script>
</html>

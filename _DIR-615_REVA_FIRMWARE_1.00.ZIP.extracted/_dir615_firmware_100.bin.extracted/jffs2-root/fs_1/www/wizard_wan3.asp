<html>
<head>
<link rel="STYLESHEET" type="text/css" href="css_router.css">
<script language="Javascript" src="public.js"></script>
<script language="Javascript">
var submit_button_flag = 0;
	function select_wan_type(){
		var select_isp = get_by_id("select_isp").value;
		var wan_type = get_by_name("wan_type");
		var index = 0;
		
		if (select_isp == "static"){
			index = 1;
		}else if (select_isp == "pppoe"){
			index = 2;
		}else if (select_isp == "pptp"){
			index = 3;
		}else if (select_isp == "l2tp"){
			index = 4;
		}else if (select_isp == "bigpond"){
			index = 5;
		}
		
		wan_type[index].checked = true;		
	}
	
	function send_request(){
		var wan_type = get_by_name("wan_type");
		
		for (var i = 0; i < wan_type.length; i++){
			if (wan_type[i].checked){
				get_by_id("asp_temp_02").value = wan_type[i].value;
				break;
			}
		}
		
		if (get_by_id("asp_temp_02").value == "static"){
			get_by_id("html_response_page").value = "wizard_wan4b.asp";			
		}else if (get_by_id("asp_temp_02").value == "pppoe"){
			get_by_id("html_response_page").value = "wizard_wan4c.asp";
		}else if (get_by_id("asp_temp_02").value == "pptp"){
			get_by_id("html_response_page").value = "wizard_wan4d.asp";
		}else if (get_by_id("asp_temp_02").value == "l2tp"){
			get_by_id("html_response_page").value = "wizard_wan4e.asp";
		}else if (get_by_id("asp_temp_02").value == "bigpond"){
			get_by_id("html_response_page").value = "wizard_wan4f.asp";
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
<table border=0 cellspacing=0 cellpadding=0 align=center width=30>
<tr>
<td></td>
</tr>
<tr>
<td>
<div align=left>
<table width=838 border=0 cellspacing=0 cellpadding=0 align=center height=92>
<tr height="92">
<td bgcolor="#FFFFFF">
  <div align="center">
    <table id="header_container" border="0" cellpadding="5" cellspacing="0" width="838" align="center">
      <tr>
        <td width="100%">Product Page: <a href="http://support.dlink.com/">DIR-615</a></td>
        <td align="right" nowrap>Hardware Version: A1 &nbsp;</td>
        <td align="right" nowrap>Firmware Version: <% CmoGetStatus("version"); %></td>
      </tr>
    </table>
    <img src="wlan_masthead.gif" width="836" height="92" align="middle"></div></td>
</tr>
<tr>
  <td bgcolor="#FFFFFF"><p>&nbsp;</p>
    <table width="650" border="0" align="center">
    <tr>
      <td><div id=box_header-w>
          <h1 align="left" class="h1-w">Step 3: Configure your Internet Connection</h1>
          <div align="left">
            <p class="box_msg-w">Your Internet Connection could not be detected, please select your Internet Service Provider (ISP) from the list below. If your ISP is not listed; select the "Not Listed or Don't Know" option to manually configure your connection.</p>
            <form id="form1" name="form1" method="post" action="apply.cgi">
            <input type="hidden" id="html_response_page" name="html_response_page" value="wizard_wan4a.asp">
			<input type="hidden" name="html_response_message" value="">
			<input type="hidden" id="html_response_return_page" name="html_response_return_page" value="wizard_wan4a.asp">
			<input type="hidden" name="reboot_type" value="none">
			
			<input type="hidden" id="asp_temp_02" name="asp_temp_02" value="<% CmoGetCfg("asp_temp_02","none"); %>">			
                  <div>
                    <P align="center" class=box_msg>
                      <select id="select_isp" name="select_isp" onChange="select_wan_type()">
                        <option value="dhcpc">Not Listed or Don't Know</option>
                        <option value="dhcpc">Adelphia Power Link</option>
                        <option value="static">ALLTEL DSL</option>
                        <option value="static">ATAT DSL Service</option>
                        <option value="static">Bell Sympatico</option>
                        <option value="static">Bellsouth</option>
                        <option value="dhcpc">Charter High-Speed</option>
                        <option value="dhcpc">Comcast</option>
                        <option value="static">Covad</option>
                        <option value="dhcpc">Cox Communications</option>
                        <option value="dhcpc">Earthlink Cable</option>
                        <option value="static">Earthlink DSL</option>
                        <option value="static">FrontierNet</option>
                        <option value="dhcpc">Optimum Online</option>
                        <option value="dhcpc">RCN</option>
                        <option value="dhcpc">Road Runner</option>
                        <option value="dhcpc">Rogers Yahoo!</option>
                        <option value="static">SBC Yahoo! DSL</option>
                        <option value="dhcpc">Shaw</option>
                        <option value="static">Speakeasy</option>
                        <option value="static">Sprint FastConnect</option>
                        <option value="static">Telus</option>
                        <option value="dhcpc">Time Warner Cable</option>
                        <option value="static">US West / Qwest</option>
                        <option value="static">Verizon Online DSL</option>
                        <option value="static">XO Communications</option>
                      </select>
                    </P>
                  </div>
                  <div>
                    <P align="left" class=box_msg-w>If your Internet Service Provider was not listed or you don't know who it is, please select the Internet connection type below:</P>
                    <table class=formarea >
                      <tbody>
                        <tr>
                          <td width="50" class=form_label>&nbsp;</td>
                          <td width="550"><input name="wan_type" type="radio" value="dhcpc">
                              <STRONG class="w11_bold">DHCP Connection (Dynamic IP Address)</STRONG>
                              <div class=w11>Choose this if your Internet connection automatically provides you with an IP Address. Most Cable Modems use this type of connection.</div></td>
                        </tr>
                        <tr>
                          <td class=form_label>&nbsp;</td>
                          <td><input name="wan_type" type="radio" value="pppoe">
                              <STRONG class="w11_bold">Username / Password Connection (PPPoE)</STRONG>
                              <div class=w11>Choose this option if your Internet connection requires a username and password to get online. Most DSL modems use this connection type of connection.</div></td>
                        </tr>
                        <tr>
                          <td class=form_label>&nbsp;</td>
                          <td><input name="wan_type" type="radio" value="pptp">
                              <STRONG class="w11_bold">Username / Password Connection (PPTP)</STRONG>
                              <div class=w11>Choose this option if your Internet connection requires a username and password to get online. Most DSL modems use this connection type of connection. </div></td>
                        </tr>
                        <tr>
                          <td class=form_label>&nbsp;</td>
                          <td><input name="wan_type" type="radio" value="l2tp">
                              <STRONG class="w11_bold">Username / Password Connection (L2TP)</STRONG>
                              <div class=w11>Choose this option if your Internet connection requires a username and password to get online. Most DSL modems use this connection type of connection. </div></td>
                        </tr>
                        <tr>
                          <td class=form_label>&nbsp;</td>
                          <td><input name="wan_type" type="radio" value="bigpond">
                              <STRONG class="w11_bold">Username / Password Connection (Bigpond)</STRONG>
                              <div class=w11>Choose this option if your Internet connection requires a username and password to get online. Most DSL modems use this connection type of connection. </div></td>
                        </tr>
                        <tr>
                          <td class=form_label>&nbsp;</td>
                          <td><input name="wan_type" type="radio" value="static">
                              <STRONG class="w11_bold">Static IP Address Connection</STRONG>
                              <div class=w11>Choose this option if your Internet Setup Provider provided you with IP Address information that has to be manually configured.</div></td>
                        </tr>
                      </tbody>
                    </table>
                    <br>
                    <table align="center" class="formarea">
                      <tr>
                        <td>
                          <input type="button" class="button_submit" name="prev_b" value="Prev" onClick="window.location.href='wizard_wan2.asp'">
                          <input type="submit" class="button_submit" name="next_b" value="Next" onClick="return send_request()">
                          <input type="button" class="button_submit" name="cancel_b" value="Cancel" onClick="window.location='index.asp';">
                        </td>
                      </tr>
                    </table>
                  </div>
            </form>
            <p class="box_msg-w">&nbsp;</p>
          </div>
      </div></td>
    </tr>
  </table>
    <p>&nbsp;</p></td>
</tr>
</table>
</div>
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
	select_wan_type();
</script>
</html>

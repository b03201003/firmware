<html>
<head>
<link rel="STYLESHEET" type="text/css" href="css_router.css">
<script language="JavaScript" src="public.js"></script>
<script language="JavaScript">
var submit_button_flag = 0;
	function send_request(){
    	var ip = get_by_id("ip").value;
    	var mask = get_by_id("mask").value;
    	var gateway = get_by_id("gateway").value;
    	var dns1 = get_by_id("dns1").value;
        var dns2 = get_by_id("dns2").value;       
        
        var temp_ip_obj = new addr_obj(ip.split("."), ip_addr_msg, false, false);
		var temp_mask_obj = new addr_obj(mask.split("."), subnet_mask_msg, false, false);
		var temp_gateway_obj = new addr_obj(gateway.split("."), gateway_msg, false, false);
		var temp_dns1_obj = new addr_obj(dns1.split("."), dns1_addr_msg, false, false);
		var temp_dns2_obj = new addr_obj(dns2.split("."), dns2_addr_msg, true, false);
                
        if (!check_lan_setting(temp_ip_obj, temp_mask_obj, temp_gateway_obj)){
        	return false;
        }	     
                
		if (!check_address(temp_dns1_obj)){
			return false;
		}
    	
    	if (dns2 != "" && dns2 != "0.0.0.0"){
    		if (!check_address(temp_dns2_obj)){
    			return false;
    		}
    	}
    	 
    	get_by_id("asp_temp_05").value = ip;  
    	get_by_id("asp_temp_06").value = mask;
    	get_by_id("asp_temp_07").value = gateway;
    	get_by_id("asp_temp_08").value = "1";
    	get_by_id("asp_temp_09").value = dns1;
    	get_by_id("asp_temp_10").value = dns2;
        
		
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
<table width=838 border=0 cellspacing=0 cellpadding=0 align=center height=92>
<tr>
<td bgcolor="#FFFFFF"><div align="center">
  <table id="header_container" border="0" cellpadding="5" cellspacing="0" width="838" align="center">
    <tr>
      <td width="100%">Product Page: <a href="http://support.dlink.com/">DIR-615</a></td>
      <td align="right" nowrap>Hardware Version: A1 &nbsp;</td>
      <td align="right" nowrap>Firmware Version: <% CmoGetStatus("version"); %></td>
    </tr>
  </table>  <img src="wlan_masthead.gif" width="836" height="92" align="middle"></td>
</tr>
</table>
</td>
</tr>
<tr>
<td bgcolor="#FFFFFF">
  <p>&nbsp;</p>
  <table width="650" border="0" align="center">
    <tr>
      <td><div id=box_header-w>
          <h1 align="left" class="h1-w">Set Static IP Address Connection</h1>
          <div align="left">
            <p class="box_msg-w">To set up this connection you will need to have a complete list of IP information provided by your Internet Service Provider. If you have a Static IP connection and do not have this information, please contact your ISP.</p>
            <div id=w2>
              <P align="left" class=box_msg>&nbsp;</P>
              <form id="form1" name="form1" method="post" action="apply.cgi">
              	<input type="hidden" name="html_response_page" value="wizard_wan5.asp">
				<input type="hidden" name="html_response_message" value="">
				<input type="hidden" name="html_response_return_page" value="wizard_wan5.asp">
				<input type="hidden" name="reboot_type" value="none">
				
				<input type="hidden" id="asp_temp_05" name="asp_temp_05">
				<input type="hidden" id="asp_temp_06" name="asp_temp_06">
				<input type="hidden" id="asp_temp_07" name="asp_temp_07">
				<input type="hidden" id="asp_temp_08" name="asp_temp_08">
				<input type="hidden" id="asp_temp_09" name="asp_temp_09">
				<input type="hidden" id="asp_temp_10" name="asp_temp_10">
                <table width="536" align="center" class=formarea>
                  <tr>
                    <td width="235" class=form_label><div align="right" class="w11_bold">IP Address&nbsp;:</div></td>
                    <td width="468"><span class="style3"> <font face=Arial size=2>
                      <input type=text id=ip name=ip size=16 maxlength=15 value="<% CmoGetCfg("asp_temp_05","none"); %>">
                    </font> </span></td>
                  </tr>
                  <tr>
                    <td class=form_label style3><div align="right" class="w11_bold"><strong>Subnet Mask&nbsp;:</strong></div></td>
                    <td><font face=Arial size=2>
                <input type=text id=mask name=mask size=16 maxlength=15 value="<% CmoGetCfg("asp_temp_06","none"); %>">
                    </font> </td>
                  </tr>
                  <tr>
                    <td class=form_label style3><div align="right" class="w11_bold"><strong>Gateway Address&nbsp;:</strong></div></td>
                    <td><font face=Arial size=2>
                <input type=text id=gateway name=gateway size=16 maxlength=15 value="<% CmoGetCfg("asp_temp_07","none"); %>">
                    </font> </td>
                  </tr>
                  <tr>
                    <td class=form_label style3><div align="right" class="w11_bold"><strong>Primary DNS Address&nbsp;:</strong></div></td>
                    <td><font face=Arial size=2>
                <input type=text id=dns1 name=dns1 size=16 maxlength=15 value="<% CmoGetCfg("asp_temp_09","none"); %>">
                    </font> </td>
                  </tr>
                  <tr>
                    <td class=form_label style3><div align="right" class="w11_bold"><strong>Secondary DNS Address&nbsp;:</strong></div></td>
                    <td><font face=Arial size=2>
                <input type=text id=dns2 name=dns2 size=16 maxlength=15 value="<% CmoGetCfg("asp_temp_10","none"); %>">
                    </font> </td>
                  </tr>
                  <tr>
                    <td class=form_label style3><div align="right"><strong></strong></div></td>
              <td><input type="button" class="button_submit" name="prev" value="Prev" onClick="window.location.href='wizard_wan3.asp'">
                <input type="submit" class="button_submit" name="next" value="Next" onClick="return send_request()">
                        <input type="button" class="button_submit" name="cancel" value="Cancel" onClick="window.location.href='index.asp';">
                    </td>
                  </tr>
                  <tbody>
                  </tbody>
                </table>
              </form>
            </div>
            <p class="box_msg-w">&nbsp;</p>
          </div>
      </div></td>
    </tr>
  </table>
  
 <br><br>
 
  <table id="footer_container" border="0" cellpadding="0" cellspacing="0" width="836" align="center">
    <tr>
      <td width="125" align="center">&nbsp;&nbsp;<img src="wireless_bottom.gif" width="114" height="35"></td>
      <td width="10">&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>
  <div align=right></div></td>
</tr>
</table>
<div align="center">Copyright &copy; 2004-2005 D-Link Systems, Inc. </div>
</body>
</html>

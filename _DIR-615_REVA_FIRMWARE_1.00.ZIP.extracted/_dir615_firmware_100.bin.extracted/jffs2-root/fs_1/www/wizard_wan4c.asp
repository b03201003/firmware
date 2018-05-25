<html>
<head>
<link rel="STYLESHEET" type="text/css" href="css_router.css">
<script language="JavaScript" src="public.js"></script>
<script language="JavaScript">
var submit_button_flag = 0;
	function set_static_ip(){
		var pppoe_type = get_by_name("pppoe_type");	
		
		if (get_by_id("asp_temp_11").value == "1"){
			pppoe_type[0].checked = true;
		}else{
			pppoe_type[1].checked = true;
		}
	}
	
	function show_static_ip(){
		var pppoe_type = get_by_name("pppoe_type");				
		get_by_id("ip").disabled = pppoe_type[0].checked;
	}	
				  
	function send_request(){
		var pppoe_type = get_by_name("pppoe_type");
		var ip = get_by_id("ip").value;
		var dns1 = get_by_id("dns1").value;
		var dns2 = get_by_id("dns2").value;
		
		var temp_dns1_obj = new addr_obj(dns1.split("."), dns_server_msg, false, false);
		var temp_dns2_obj = new addr_obj(dns2.split("."), dns_server_msg, false, false);
		
		if (pppoe_type[1].checked){
			var temp_ip_obj = new addr_obj(ip.split("."), ip_addr_msg, false, false);
	
			if (!check_address(temp_ip_obj)){
        		return false;
	    	}
		}
		
		if (dns1 != "" && dns1 != "0.0.0.0"){
    		if (!check_address(temp_dns1_obj)){
    			return false;
    		}
    	}
    	
    	if (dns2 != "" && dns2 != "0.0.0.0"){
    		if (!check_address(temp_dns2_obj)){
    			return false;
    		}
    	}
		
		if (!check_pwd("pwd1", "pwd2")){
			return false;
        }
        
        if (pppoe_type[1].checked){
        	get_by_id("asp_temp_11").value = "0";
        	get_by_id("asp_temp_15").value = ip;
        }else{
        	get_by_id("asp_temp_11").value = "1";
        }
        
        get_by_id("asp_temp_12").value = get_by_id("user_name").value;
        get_by_id("asp_temp_13").value = get_by_id("pwd1").value;
        get_by_id("asp_temp_14").value = get_by_id("service").value;
        get_by_id("asp_temp_09").value = get_by_id("dns1").value;
        get_by_id("asp_temp_10").value = get_by_id("dns2").value;
    	if((get_by_id("dns1").value =="" || get_by_id("dns1").value =="0.0.0.0")&& ( get_by_id("dns2").value =="" || get_by_id("dns2").value =="0.0.0.0")){
			get_by_id("asp_temp_08").value = 0;
		}else{
			get_by_id("asp_temp_08").value = 1;
		}
		if(submit_button_flag == 0){
			submit_button_flag = 1;
			return true;
		}else{
			return false;
		}
    }
</script>
<title></title>
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
</head>
<body topmargin="1" leftmargin="0" rightmargin="0" bgcolor="#757575">
<table id="header_container" border="0" cellpadding="5" cellspacing="0" width="838" align="center">
  <tr>
    <td width="100%">Product Page: <a href="http://support.dlink.com/">DIR-615</a></td>
    <td align="right" nowrap>Hardware Version: A1 &nbsp;</td>
    <td align="right" nowrap>Firmware Version: <% CmoGetStatus("version"); %></td>
  </tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 align=center width=30>
<tr>
<td></td>
</tr>
<tr>
<td>
<table width=838 border=0 cellspacing=0 cellpadding=0 align=center height=100>
<tr>
<td bgcolor="#FFFFFF"><div align="center"><img src="wlan_masthead.gif" width="836" height="92" align="middle"></div>
  </td>
</tr>
<tr>
  <td bgcolor="#FFFFFF"><p>&nbsp;</p>
  <table width="650" border="0" align="center">
    <tr>
      <td><div id=box_header-w>
          <h1 align="left" class="h1-w">Set Username and Password Connection (PPPoE)</h1>
          <p class="box_msg-w">To set up this connection you will need to have a Username and Password from your Internet Service Provider. If you do not have this information, please contact your ISP.</p>
          <div id=w2 >
            <form id="form1" name="form1" method="post" action="apply.cgi">
            	<input type="hidden" name="html_response_page" value="wizard_wan5.asp">
				<input type="hidden" name="html_response_message" value="">
				<input type="hidden" name="html_response_return_page" value="wizard_wan5.asp">
				<input type="hidden" name="reboot_type" value="none">
				
				<input type="hidden" id="asp_temp_08" name="asp_temp_08" value="0">
				<input type="hidden" id="asp_temp_09" name="asp_temp_09">
				<input type="hidden" id="asp_temp_10" name="asp_temp_10">
            	<input type="hidden" id="asp_temp_11" name="asp_temp_11" value="<% CmoGetCfg("asp_temp_11","none"); %>">
				<input type="hidden" id="asp_temp_12" name="asp_temp_12">
				<input type="hidden" id="asp_temp_13" name="asp_temp_13">
				<input type="hidden" id="asp_temp_14" name="asp_temp_14">				
				<input type="hidden" id="asp_temp_15" name="asp_temp_15">
				
              <table class=formarea >
                <tr>
                  <td width="167" class=form_label><div align="right" class="w11_bold">Address Mode&nbsp;:</div></td>
                  <td width="443"><span class="style3">
                <input name="pppoe_type" type="radio" value="1" onClick="show_static_ip()">
                    <span class="w11"> Dynamic IP</span>&nbsp;&nbsp;
                <input name="pppoe_type" type="radio" value="0" onClick="show_static_ip()">
                    <span class="w11"> Static IP </span></span></td>
                </tr>
                <tr>
                  <td width="167" class=form_label style3><div align="right" class="w11_bold"><strong>IP Address&nbsp;:</strong></div></td>
                  <td><input name="ip" type="text" id="ip" size="30" maxlength="15" value="<% CmoGetCfg("asp_temp_15","none"); %>">
                  </td>
                </tr>
                <tr>
                  <td width="167" class=form_label style3><div align="right" class="w11_bold"><strong>User Name&nbsp;:</strong></div></td>
                  <td><font face=Arial size=2>
                    <input type=text id=user_name name=user_name size=30 maxlength=63 value="<% CmoGetCfg("asp_temp_12","none"); %>">
                  </font> </td>
                </tr>
                <tr>
                  <td width="167" class=form_label style3><div align="right" class="w11_bold"><strong>Password&nbsp;:</strong></div></td>
                  <td><font face=Arial size=2>
                    <input type=password id=pwd1 name=pwd1 size=30 maxlength=63 value="<% CmoGetCfg("asp_temp_13","none"); %>">
                  </font> </td>
                </tr>
                <tr>
                  <td width="167" class=form_label style3><div align="right" class="w11_bold"><strong>Verify Password&nbsp;:</strong></div></td>
                  <td><font face=Arial size=2>
                    <input type=password id=pwd2 name=pwd2 size=30 maxlength=63 value="<% CmoGetCfg("asp_temp_13","none"); %>">
                  </font> </td>
                </tr>
                <tr>
                  <td width="167" class=form_label style3><div align="right" class="w11_bold"><strong>Service Name&nbsp;:</strong></div></td>
                  <td> <font face=Arial size=2>
                    <span class="w11">
                    <input type=text id=service name=service size=30 maxlength=63 value="<% CmoGetCfg("asp_temp_14","none"); %>">
                    </span></font><span class="w11"> (Optional) </span></td>
                </tr>
                <tr>
                    <td width="220" class=form_label style3><div align="right" class="w11_bold"><strong>Primary DNS Address&nbsp;:</strong></div></td>
                    <td><font face=Arial size=2>
                      <input type=text id=dns1 name=dns1 size=32 maxlength=15 value="<% CmoGetCfg("asp_temp_09","none"); %>">
                    </font> </td>
                </tr>
                <tr>
                    <td width="220" class=form_label style3><div align="right" class="w11_bold"><strong>Secondary DNS Address&nbsp;:</strong></div></td>
                    <td><font face=Arial size=2>
                      <input type=text id=dns2 name=dns2 size=32 maxlength=15 value="<% CmoGetCfg("asp_temp_10","none"); %>">
                    </font> </td>
                </tr>
                <tr>
                  <td class=form_label>&nbsp;</td>
                  <td><span class="w11">Note: You may also need to provide a Service Name. If you do not have or know this information, <br>
                  please contact your ISP.</span></td>
                </tr>
                <tr>
                  <td class=form_label style3><div align="right"><strong></strong></div></td>
              <td><input type="button" class="button_submit" name="prev" value="Prev" onClick="window.location.href='wizard_wan3.asp'">
                <input type="submit" class="button_submit" name="next" value="Next" onClick="return send_request()">
                      <input type="button" class="button_submit" name="cancel" value="Cancel" onClick="window.location.href='index.asp';">
                  </td>
                </tr>
              </table>
            </form>
          </div>
      </div></td>
    </tr>
  </table>
  <p>&nbsp;</p></td>
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
	set_static_ip();
	show_static_ip();
</script>
</html>

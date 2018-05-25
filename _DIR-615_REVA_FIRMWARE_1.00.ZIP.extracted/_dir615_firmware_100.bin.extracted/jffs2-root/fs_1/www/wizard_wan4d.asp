<html>
<head>
<link rel="STYLESHEET" type="text/css" href="css_router.css">
<script language="JavaScript" src="public.js"></script>
<script language="JavaScript">
var submit_button_flag = 0;
	function set_static_ip(){
		var pptp_type = get_by_name("pptp_type");	
		
		if (get_by_id("asp_temp_16").value == "1"){
			pptp_type[0].checked = true;
		}else{
			pptp_type[1].checked = true;
		}
	}
	
	function show_static_ip(){
		var pptp_type = get_by_name("pptp_type");
		
		get_by_id("ip").disabled = pptp_type[0].checked;
		get_by_id("mask").disabled = pptp_type[0].checked;
		get_by_id("gateway").disabled = pptp_type[0].checked;
		get_by_id("dns").disabled = pptp_type[0].checked;
	}
	
	function send_request(){
		var pptp_type = get_by_name("pptp_type");
    	var ip = get_by_id("ip").value;
    	var mask = get_by_id("mask").value;  
    	var gateway = get_by_id("gateway").value;
    	var dns = get_by_id("dns").value;
		var server_ip = get_by_id("server_ip").value;
		
		var temp_ip_obj = new addr_obj(ip.split("."), ip_addr_msg, false, false);
		var temp_mask_obj = new addr_obj(mask.split("."), subnet_mask_msg, false, false);
		var temp_gateway_obj = new addr_obj(gateway.split("."), gateway_msg, false, false);
		var temp_gateway_obj = new addr_obj(gateway.split("."), gateway_msg, false, false);
		var temp_dns_obj = new addr_obj(dns.split("."), dns_server_msg, false, false);
                
		if (pptp_type[1].checked){    	      
        	if (!check_lan_setting(temp_ip_obj, temp_mask_obj, temp_gateway_obj)){
        		return false;
        	}
        	if (!check_address(temp_dns_obj)){
				return false;				
			}
        }
    	
    	if(server_ip == ""){
    		alert(msg[ZERO_SERVER_IP]);
    		return false;
       	}
       	
       	if (!check_pwd("pptppwd", "pptppwd2")){
       		return false;
       	}
       	
       	if (pptp_type[1].checked){
       		get_by_id("asp_temp_16").value = "0";
       		get_by_id("asp_temp_19").value = ip;
       		get_by_id("asp_temp_20").value = mask;
       		get_by_id("asp_temp_21").value = gateway;
       		get_by_id("asp_temp_09").value = dns;
        	if(get_by_id("dns").value =="" || get_by_id("dns").value =="0.0.0.0"){
				get_by_id("asp_temp_08").value = 0;
			}else{
				get_by_id("asp_temp_08").value = 1;
			}
       	}else{
       		get_by_id("asp_temp_16").value = "1";
       	}
       	
       	get_by_id("asp_temp_17").value = get_by_id("pptpuserid").value;
       	get_by_id("asp_temp_18").value = get_by_id("pptppwd").value;
       	get_by_id("asp_temp_22").value = get_by_id("server_ip").value;
        
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
<table border=0 cellspacing=0 cellpadding=0 align=center width=30>
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
 
  <div align="center"><img src="wlan_masthead.gif" width="836" height="92" align="middle"></div>
  </td>
</tr>
</table>
</div>
</td>
</tr>
<tr>
  <td bgcolor="#FFFFFF"><p>&nbsp;</p>    <table width="650" border="0" align="center">
    <tr>
      <td><div id=box_header-w>
        <h1 align="left" class="h1-w">SET USERNAME AND PASSWORD CONNECTION (PPTP)</h1>
        <div align="left">
          <p class="box_msg-w">To set up this connection you will need to have a Username and Password from your Internet Service Provider. You also need PPTP IP adress. If you do not have this information, please contact your ISP.</p>
          <form id="form1" name="form1" method="post" action="apply.cgi">
         	<input type="hidden" name="html_response_page" value="wizard_wan5.asp">
			<input type="hidden" name="html_response_message" value="">
			<input type="hidden" name="html_response_return_page" value="wizard_wan5.asp">
			<input type="hidden" name="reboot_type" value="none">
			
			
			<input type="hidden" id="asp_temp_08" name="asp_temp_08" value="0">
			<input type="hidden" id="asp_temp_09" name="asp_temp_09">
			<input type="hidden" id="asp_temp_16" name="asp_temp_16" value="<% CmoGetCfg("asp_temp_16","none"); %>">
			<input type="hidden" id="asp_temp_17" name="asp_temp_17">
			<input type="hidden" id="asp_temp_18" name="asp_temp_18">				
			<input type="hidden" id="asp_temp_19" name="asp_temp_19">
			<input type="hidden" id="asp_temp_20" name="asp_temp_20">
			<input type="hidden" id="asp_temp_21" name="asp_temp_21">
			<input type="hidden" id="asp_temp_22" name="asp_temp_22">
				
            <div>
              <div id=w2>
                <table width="525" align="center" class=formarea >
                  <tr>
                    <td width="220" class=form_label><div align="right" class="w11_bold">Address Mode&nbsp;:</div></td>
                    <td width="304"><span class="style3">
                <input name="pptp_type" type="radio" value="1" onClick="show_static_ip()">
                </span><span class="w11">Dynamic IP</span><span class="style3">&nbsp;&nbsp;
                <input name="pptp_type" type="radio" value="0" onClick="show_static_ip()">
                </span><span class="w11">Static IP </span></td>
                  </tr>
                  <tr>
                    <td width="220" class=form_label style3><div align="right" class="w11_bold"><strong>PPTP IP Address&nbsp;:</strong></div></td>
                    <td><font face=Arial size=2>
                      <input type=text id=ip name=ip size=32 maxlength=15 value="<% CmoGetCfg("asp_temp_19","none"); %>">
                    </font> </td>
                  </tr>
                  <tr>
                    <td width="220" class=form_label style3><div align="right" class="w11_bold"><strong>PPTP Subnet Mask&nbsp;:</strong></div></td>
                    <td><font face=Arial size=2>
                      <input type=text id=mask name=mask size=32 maxlength=15 value="<% CmoGetCfg("asp_temp_20","none"); %>">
                    </font> </td>
                  </tr>
                  <tr>
                    <td width="220" class=form_label style3><div align="right" class="w11_bold"><strong>PPTP Gateway IP Address&nbsp;:</strong></div></td>
                    <td><font face=Arial size=2>
                      <input type=text id=gateway name=gateway size=32 maxlength=15 value="<% CmoGetCfg("asp_temp_21","none"); %>">
                    </font> </td>
                  </tr>
                  <tr>
                    <td width="220" class=form_label style3><div align="right" class="w11_bold"><strong>PPTP DNS Address&nbsp;:</strong></div></td>
                    <td><font face=Arial size=2>
                      <input type=text id=dns name=dns size=32 maxlength=15 value="<% CmoGetCfg("asp_temp_09","none"); %>">
                    </font> </td>
                  </tr>
                  <tr>
                    <td width="220" class=form_label style3><div align="right" class="w11_bold"><strong>PPTP Server IP Address <br>
                  (may be same as gateway)&nbsp;:</strong></div></td>
                    <td><font face=Arial size=2>
                      <input type=text id=server_ip name=server_ip size=32 maxlength=15 value="<% CmoGetCfg("asp_temp_22","none"); %>">
                    </font> </td>
                  </tr>
                  <tr>
                    <td width="220" class=form_label style3><div align="right" class="w11_bold"><strong>User Name&nbsp;:</strong></div></td>
                    <td> <font face=Arial size=2>
                      <input type=text id=pptpuserid name=pptpuserid size=32 maxlength=63 value="<% CmoGetCfg("asp_temp_17","none"); %>">
                    </font> </td>
                  </tr>
                  <tr>
                    <td width="220" class=form_label style3><div align="right" class="w11_bold"><strong>Password&nbsp;:</strong></div></td>
                    <td><font face=Arial size=2>
                      <input type=password id=pptppwd name=pptppwd size=32 maxlength=31 value="<% CmoGetCfg("asp_temp_18","none"); %>">
                    </font> </td>
                  </tr>
                  <tr>
                    <td width="220" class=form_label style3><div align="right" class="w11_bold"><strong>Verify Password&nbsp;:</strong></div></td>
                    <td> <font face=Arial size=2>
                      <input type=password id=pptppwd2 name=pptppwd2 size=32 maxlength=31 value="<% CmoGetCfg("asp_temp_18","none"); %>">
                    </font> </td>
                  </tr>
                  <tr>
                    <td width="220" class=form_label style3><div align="right"><strong></strong></div></td>
              <td><input type="button" class="button_submit" name="prev" value="Prev" onClick="window.location.href='wizard_wan3.asp'">
                <input type="submit" class="button_submit" name="next" value="Next" onClick="return send_request()">
                        <input type="button" class="button_submit" name="cancel" value="Cancel" onClick="window.location.href='index.asp';">
                    </td>
                  </tr>
                  <tbody>
                  </tbody>
                </table>
              </div>
            </div>
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
	set_static_ip();
	show_static_ip();
</script>
</html>

<html>
<head>
<link rel="STYLESHEET" type="text/css" href="css_router.css">
<script language="JavaScript" src="public.js"></script>
<script>
var submit_button_flag = 0;
	function send_request(){
		var sec =get_by_name("security");
		 if(sec[0].checked == true){
		 	get_by_id("asp_temp_35").value= "3";
		 }else if(sec[1].checked == true){
		 	get_by_id("asp_temp_35").value= "2";
		 }else if(sec[2].checked == true){
		 	get_by_id("asp_temp_35").value= "1";
		 }else if(sec[3].checked == true){
		 	get_by_id("asp_temp_35").value= "0";
		 	get_by_id("html_response_page").value = "wizard_wlan4.asp";
		 }else{
		 	alert("no select");
		 }
		
		
		if(submit_button_flag == 0){
		submit_button_flag = 1;
		return true;
		}else{
		return false;
		}
		//return true; 		
	}

	function onPageLoad(){
		var dot11_mode = "<% CmoGetCfg("wlan0_dot11_mode","none"); %>";
		
		if(dot11_mode=="11n"){
			get_by_name("security")[2].disabled = true;
		}
	}

</script>
<title></title>
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.style4 {font-size: 10px}
-->
</style>
</head>
<body topmargin="1" leftmargin="0" rightmargin="0" bgcolor="#757575">
<table border=0 cellspacing=0 cellpadding=0 align=center width=838>
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
  <img src="wlan_masthead.gif" width="836" height="92" align="middle">
  </div></td>
</tr>
</table>
</div>
</td>
</tr>
<tr>
<td bgcolor="#FFFFFF">
  </td>
</tr>
<tr>
  <td bgcolor="#FFFFFF"><p>&nbsp;</p>    <table width="650" border="0" align="center">
    <tr>
      <td><div id=box_header-w>
        <h1 align="left" class="h1-w">Step 2: Secure your Wireless Network</h1>
        <div align="left">
          <p class="box_msg-w">This wizard will guide you through a step-by-step process to configure your new D-Link router and connect to the Internet.</p>
          <form id="form1" name="form1" method="post" action="apply.cgi">
		  <input type="hidden" name="html_response_page"  id="html_response_page" value="wizard_wlan3.asp">
			<input type="hidden" name="html_response_message" value="">
			<input type="hidden" name="html_response_return_page" value="wizard_wlan3.asp">
			<input type="hidden" name="reboot_type" value="none">
		  
            <div id=w2>
              <P align="left" class=w11>In order to protect your network from hackers and unauthorized users, it is highly recommended you choose one of the following wireless network security settings.<br>
                  <br>
          There are three levels of wireless security -Better Security, or Best Security. The level you choose depends on the security features your wireless adapters support.<br>
              </P>
			  <input type="hidden" id="asp_temp_35" name="asp_temp_35">
              <table align="center" class="formarea">
                <tr>
                  <td class="form_label"><div align="right"><span class="w11_bold">BEST</span>&nbsp;
                          <input type="radio" name="security" value="3">
                  </div></td>
                  <td class="w11">Select this option if your wireless adapters SUPPORT WPA2</td>
                </tr>
                <tr>
                  <td class="form_label"><span class="w11_bold">BETTER</span>&nbsp;
                      <input type="radio" name="security" value="2"></td>
                  <td class="w11">Select this option if your wireless adapters SUPPORT WPA</td>
                </tr>
                <tr>
                  <td class="form_label"><div align="right"><span class="w11_bold">GOOD</span>&nbsp;
                          <input type="radio" name="security" value="1">
                  </div></td>
                  <td class="w11">Select this option if your wireless adapters DO NOT SUPPORT WPA</td>
                </tr>
                <tr>
                  <td class="form_label"><div align="right"><span class="w11_bold">NONE</span>&nbsp;
                          <input name="security" type="radio" value="0" checked>
                  </div></td>
                  <td class="w11">Select this option if you do not want to activate any security features</td>
                </tr>
              </table>
              <p align="left"><span class="box_msg-w">For information on which security features your wireless adapters support, please refer to the adapters' documentation.<br>
              </span></p>
              <div id="w3">
                <p align="left" class="w11">Note: All D-Link wireless adapters currently support WPA.</p>
              </div>
              <p align="center">
                <input type="button" class="button_submit" name="prev_b" value="Prev" onClick="window.location.href='wizard_wlan1.asp'">
                <input type="submit" class="button_submit" name="next_b2" value="Next" onClick="return send_request()">
                <input type="button" class="button_submit" name="cancel_b" value="Cancel" onClick="window.location.href='index.asp'">
              </p>
              <p align="left"></p>
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
<script>
onPageLoad();
</script>
<div align="center">Copyright &copy; 2004-2005 D-Link Systems, Inc. </div>
</body>
</html>

<html lang=en-US xml:lang="en-US" xmlns="http://www.w3.org/1999/xhtml">
<head><title>D-LINK SYSTEMS, INC | WIRELESS ROUTER | HOME</title>
<script language="Javascript" src="public.js"></script>
<script language="JavaScript">
	function onPageLoad(){
		get_by_id("html_response_page").value = get_by_id("html_response_return_page").value;
	}
	
	function do_count_down(){
		//get_by_id("button").disabled = true;
	
		get_by_id("show_sec").innerHTML = count;
		
		if (count == 0) {
	        //get_by_id("button").disabled = false;
	        back();
	        return;
	    }
		
		
		
		if (count > 0) {
	        count--;
	        setTimeout('do_count_down()',1000);
	    }
	
	}

	function back(){
		var login_who="<% CmoGetStatus("get_current_user"); %>";
		if(login_who== "user"){
			window.location.href ="index.asp";
		}else{
			window.location.href = get_by_id("html_response_page").value;
		}
		
	}
</script>
<link rel="STYLESHEET" type="text/css" href="css_router.css">
<style type="text/css">
<!--
.style1 {color: #FF6600}
-->
</style>
<title></title>
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
</head>
<body topmargin="1" leftmargin="0" rightmargin="0" bgcolor="#757575">
<div >
<form id="form1" name="form1" method="post">
<input type="hidden" id="html_response_page" name="html_response_page" value="index.asp">
<input type="hidden" id="html_response_message" name="html_response_message" value="<% CmoGetCfg("html_response_message","none"); %>">
<input type="hidden" id="html_response_return_page" name="html_response_return_page" value="<% CmoGetCfg("html_response_return_page","none"); %>">
<input type="hidden" name="reboot_type" value="none">
  <table width="838" height="100" border=0 align="center" cellPadding=0 cellSpacing=0 id=table_shell>
  <tbody>
<script>
	var count_down_value = true;
	var page_value = get_by_id("html_response_return_page").value;
	if(page_value == "tools_schedules.asp"){
		count_down_value = false;
	}else if(page_value == "tools_vct.asp"){
		count_down_value = false;
	}
</script>
  <tr>
    <td bgcolor="#FFFFFF">
      <div align="center">
        <table id="header_container" border="0" cellpadding="5" cellspacing="0" width="838" align="center">
          <tr>
            <td width="100%">Product Page: <a href="http://support.dlink.com/">DIR-615</a></td>
            <td align="right" nowrap>Hardware Version: A1 &nbsp;</td>
            <td align="right" nowrap>Firmware Version: <% CmoGetStatus("version"); %></td>
          </tr>
        </table>
        <img src="wlan_masthead.gif" width="836" height="92"></div></td>
    </tr>
  <tr>
    <td>
      <table width="838" border=0 align="center" cellPadding=0 cellSpacing=0 >
        <tbody>
        <tr>
          <td bgcolor="#FFFFFF"></td></tr>
        <tr>
          <td bgcolor="#FFFFFF"></td>
        </tr>
        <tr>
          <td bgcolor="#FFFFFF"><p>&nbsp;</p>            <table width="650" border="0" align="center">
            <tr>
              <td height="15"><div id=box_header>
                  <H1 align="left"><span class="style1">&nbsp;</span>
                      <!-- insert name=title -->
                  </H1>
                  <div align="left">
                    <p align="center"><script>
					var login_who="<% CmoGetStatus("get_current_user"); %>";
					if(login_who== "user"){
						document.write("Only admin account can change the settings.");
					}else{
						document.write(get_by_id("html_response_message").value);
					}
					if(count_down_value){
						document.write('&nbsp;Please wait&nbsp;<span id="show_sec"></span>&nbsp; seconds.');
					}
					</script>
                        <!-- repeat name=msg -->
                    </p>
                    <p align="center">&nbsp;</p>
                    <p align="center">
                      <script>
                      	if(!count_down_value){
                      		document.write('<input name="button" id="button" type=button class=button_submit value="Continue" onClick="back()">');
                      	}
                      </script>
                    </p>
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
        </tbody></table>     </td>
    </tr>
  </tbody></table></form>
  <div align="center">Copyright &copy; 2004-2005 D-Link Systems, Inc. </div>
</div>


</BODY>
<script>
	var count = 20;
	onPageLoad();	
	if(count_down_value){
		do_count_down();
	}
</script>
</html>

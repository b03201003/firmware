<html>
<head>
<link rel="STYLESHEET" type="text/css" href="css_router.css">
<script language="JavaScript" src="public.js"></script>
<script language="JavaScript">
	function show_save_button(){
		var is_edit = <!-- insert name=ac_edit -->;
		
		if (is_edit > -1){
			get_by_id("save").disabled = false;
			get_by_id("perv").disabled = true;
		}		
	}
</script>

<title>D-LINK SYSTEMS, INC | WIRELESS ROUTER | HOME</title>

</head>

<body topmargin="1" leftmargin="0" rightmargin="0" bgcolor="#757575">
	<table id="header_container" border="0" cellpadding="5" cellspacing="0" width="838" align="center">
      <tr>
        <td width="100%">Product Page: <a href="http://support.dlink.com/">DIR-615</a></td>
        <td align="right" nowrap>Hardware Version: A1 &nbsp;</td>
        <td align="right" nowrap>Firmware Version: 2.00</td>
      </tr>
    </table>
	<table id="topnav_container" border="0" cellpadding="0" cellspacing="0" width="838" align="center">
		<tr>
			<td align="center" valign="middle"><img src="wlan_masthead.gif" width="836" height="92"></td>
		</tr>
	</table>
	<table border="0" cellpadding="2" cellspacing="1" width="838" align="center" bgcolor="#FFFFFF">
		<tr id="topnav_container">
			<td height="29"><img src="short_modnum.gif" width="125" height="25"></td>
			<td id="topnavoff"><a href="index.asp">Setup</a></td>
			<td id="topnavon"><a href="adv_virtual.asp">Advanced</a></td>
			<td id="topnavoff"><a href="tools_admin.asp">Tools</a></td>
			<td id="topnavoff"><a href="st_device.asp">Status</a></td>
			<td id="topnavoff"><a href="support_men.asp">Support</a></td>
		</tr>
	</table>
	<table border="1" cellpadding="2" cellspacing="0" width="838" height="100%" align="center" bgcolor="#FFFFFF" bordercolordark="#FFFFFF">
		<tr>
			<td id="sidenav_container" valign="top" width="125" align="right">
				<table cellSpacing=0 cellPadding=0 border=0>
                  <tbody>
                    <tr>
                      <td id=sidenav_container>
                        <div id=sidenav>
                         
                          <UL>
                            <LI>
                              <div><a href="adv_virtual.asp">Port Forwarding</a></div>
                            <LI>
                              <div><a href="adv_appl.asp">Application Rules</a></div>
                            <LI>
                              <div><a href="adv_filters_mac.asp">Network Filter</a></div>
<LI>
							 <div id=sidenavoff>Access control</div>
                            <LI>
                              <div><a href="adv_filters_url.asp">Website Filter</a></div>
                            <LI>
                              <div><a href="adv_dmz.asp">Firewall Settings</a></div>
                            <LI>
                              <div><a href="adv_wlan_perform.asp">advanced Wireless</a></div>
                            <LI>
                              <div><a href="adv_network.asp">advanced Network</a></div>
                            </LI>
                          </UL>
                         
                      </div></td>
                    </tr>
                  </tbody>
                </table></td>
<form id="form1" name="form1" method="post" action="step1.cgi">
			<td valign="top" id="maincontent_container">
				<div id=maincontent>
				 
                          
                  <div class=box>
                    <h2>Step 1: Choose Policy Name</h2>
                    <p align="left"><strong>Choose a unique name for your policy.</strong></p>
                    <table width="525" class=formarea>
                      <tbody>
                        <tr>
                          <td class=form_label><div align="right">Policy Name&nbsp;:</div></td>
                          <td><input name="policy_name" id="policy_name" size="15" maxLength=16></td>
                        </tr>
                      </tbody>
                    </table>
                    <hr>
                    <table width="362" align="center">
    <td>
        <div align="center">
          <input name="perv" type="button" id="perv" value="Perv" onclick="window.location='adv_access_add.asp';">
&nbsp;
          <input name="next" type="submit" id="next" value="Next">
&nbsp;
          <input name="save" type="submit" id="save" value="Save" disabled>
&nbsp;
          <input name="cancel" type="button" id="cancel" value="Cancel" onclick="window.location='adv_access_control.asp';">
      </div></td>
                    </table>
                  </div>
                  <!-- === END MAINCONTENT === -->            
        </div></td></form>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table borderColor=#ffffff cellSpacing=0 borderColorDark=#ffffff cellPadding=2 bgColor=#ffffff borderColorLight=#ffffff border=0>
                  <tbody>
                    <tr>
                      <td id=help_text><b>Helpful Hints.</b><br>
                          <br>                          
                      <strong></strong></td>
                    </tr>
                  </tbody>
                </table></td>
		</tr>
	</table>
	<table id="footer_container" border="0" cellpadding="0" cellspacing="0" width="838" align="center">
		<tr>
			<td width="125" align="center">&nbsp;&nbsp;<img src="wireless_bottom.gif" width="114" height="35"></td>
			<td width="10">&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table>
<br>
<div align="center">Copyright &copy; 2004-2005 D-Link Systems, Inc.</div>
<br>
</body>
<script>
	show_save_button();
</script>
</html>
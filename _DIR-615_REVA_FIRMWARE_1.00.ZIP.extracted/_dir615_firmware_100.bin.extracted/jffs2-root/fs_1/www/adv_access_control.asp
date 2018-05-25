<html>
<head>

<link rel="STYLESHEET" type="text/css" href="css_router.css">
<script language="JavaScript" src="public.js"></script>
<script language="JavaScript">
   
    function del_row(row){
        if (confirm(msg[DEL_RULE_MSG])){
            get_by_id("del_row").value = row;
            send_submit("form1");
        }
    }
    
    function edit_row(row){     
        get_by_id("edit_Row").value = row;
        send_submit("form1");
    }
 
	function show_policy(){
		var policy = get_by_id("access_enable");	
				
		if (policy.checked){
			get_by_id("show_policy").style.display = "";		
			get_by_id("show_table").style.display = "";	
		}else{
			get_by_id("show_policy").style.display = "none";		
			get_by_id("show_table").style.display = "none";	
		
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
                              <div><a href="adv_virtual.asp">Virtual Server</a></div>
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
<form id="form1" name="form1" method="post" action="adv_access_ctl.cgi">
			<td valign="top" id="maincontent_container">
				<div id=maincontent>
				
                  
          <div id=box_header> 
            <h1>Access Control : </h1>
            <p>The Access Control option allows you to control access in and out of your network. Use this feature as Access Controls to only grant access to approved sites, limit web access based on time or dates, and/or block internet access for applications like P2P utilities or games.</p>
            <input name="button" type=submit class=button_submit value="Save Settings">
            <input name="button2" type=reset class=button_submit value="Don't Save Settings"  onClick="window.location.href='adv_access_control.asp'">
          </div>
          <div class=box>
          	<h2>Enable</h2>
                    
            <table width="525" class=formarea>
              <tbody>
                <tr> 
                  <td width="135" class=form_label>Enable Access Control&nbsp;:</td>
					<input type=hidden id="edit_row" name="edit_row" value=-1>
					<input type="hidden" id="del_row" name="del_row" value="0">  
					<input type="hidden" id="serial" name="serial" value="0">
                  <td width="378"><input name="access_enable" id="access_enable" type=checkbox value="1" onClick="show_policy()"></td>
                </tr>
              </tbody>
            </table>
          </div>
		  <div class=box id=show_policy style="display:none"> 
		  <h2>Policy Wizard</h2>
		    <div align="center">
              <input class=button_submit name=add_policy id=add_policy onClick="window.location.href='adv_access_add.asp'" type=button value="Add Policy">
           </div></div>
		  <div class=box id=show_table style="display:none">
		  <h2>Policy Table</h2>
		    <table width="525" id="table1" cellPadding=0 cellSpacing=0>
              <tbody>
    <TR class=form_label_row> 
      <td>Enable</td> 
      <td>Policy</td> 
      <td>Machine</td> 
      <td>Filtering</td> 
      <td>Logged</td> 
      <td>Schedule</td> 
      <td>&nbsp;</td>     
    </tr>
 <!-- repeat name=access_list -->
    
  </tbody>
</table>
		  </div>
		</div></td></form>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table borderColor=#ffffff cellSpacing=0 borderColorDark=#ffffff 
      cellPadding=2 bgColor=#ffffff borderColorLight=#ffffff border=0>
                  <tbody>
                    <tr>
                      <td id=help_text><b>Helpful Hints.</b><br>
                          <br>                          
                      </td>
                    </tr>
                  </tbody>
                </table></td>
		</tr>
	</table>
	<table id="footer_container" border="0" cellpadding="0" cellspacing="0" width="838" align="center">
		<tr>
			<td width="125" align="center">&nbsp;&nbsp;<img src="wireless_bottom.gif" width="114" height="35"></td>
			<td width="10">&nbsp;</td><td>&nbsp;</td>
		</tr>
	</table>
<br>
<div align="center">Copyright &copy; 2004-2005 D-Link Systems, Inc.</div>
<br>
</body>
<script>
show_policy();
</script>
</html>
<html>
<head>
<link rel="STYLESHEET" type="text/css" href="css_router.css">
<script language="JavaScript" src="public.js"></script>
<script language="javascript">

function show_save_button(){
		var is_edit = <!-- insert name=ac_edit -->;
		
		if (is_edit > -1){
			get_by_id("save").disabled = false;
			
		}
	}
	
	function check_select(){
		var cat_type = get_by_name("cat_type");
		if(cat_type[0].checked){
			get_by_id("category").style.display = "";
			get_by_id("check_all").style.display = "none";
			get_by_id("catmenu").style.display = "none";
			get_by_id("catmenu").style.display = "none";
		}else{
			get_by_id("category").style.display = "none";
			get_by_id("check_all").style.display = "";
			get_by_id("catmenu").style.display = "";
			get_by_id("catmenu").style.display = "";
		}

	}
	
	function check_allbox(){
		var bsecure_allchecked = get_by_id("bsecure_allchecked");
		if (bsecure_allchecked.checked){
			for(var i=0; i<34; i++){
				get_by_id("cat_manual_"+i).checked = true;
			
			}		
		}else{
			for(var i=0; i<34; i++){
				get_by_id("cat_manual_"+i).checked = false;
			
			}		
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
                          <!-- === BEGIN SIDENAV === -->
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
                          <!-- === END SIDENAV === -->
                      </div></td>
                    </tr>
                  </tbody>
                </table></td>
		<form id="form1" name="form1" method="post" action="step5.cgi">
			<td valign="top" id="maincontent_container">
				<div id=maincontent>
				  <!-- === BEGIN MAINCONTENT === -->
                          
                  <div class=box>
		  <h2>Step 5: Sentinel Categoriee</h2>
		  <p><strong>Select the Sentinel categories to filter.</strong></p> 
		    <table width="525" class=formarea>
              <tbody>
              <tr>
                <td width="144" class=form_label_top><div align="right">
                Categories Selection&nbsp;:</div></td>
                <td width="359">
                	<input name=cat_type type=radio value=0 onClick="check_select()" checked>
                	By Age 
                	<input name=cat_type type=radio value=1 onClick="check_select()">
                	Manually 
                </td>
               </tr>
               </tbody>
             </table>
            <table width="525" class=formarea  id="category" style="display:none ">
              <tbody>
              <tr>
                <td width="143" class=form_label_top><div align="right">
                Select Age Category&nbsp;:</div></td>
                <td width="360">
                <select name="cat_age" id="cat_age" size=4 width="20"> 
                    <option value=0>Child (0-8)</option> 
                    <option value=1>Adolescent (9-12)</option> 
                    <option value=2>Youth (13-17)</option> 
                    <option value=3>Adult (18+)</option>
                </select> 
                </td></tr></tbody></table>
            <table width="525" id="check_all" style="display:none "class=formarea>
              <tbody>
              <tr>
                <td width="69" class=form_label_top>Check All&nbsp;:</td>
                <td width="444"><input type=checkbox name=bsecure_allchecked id=bsecure_allchecked onclick=check_allbox()>
                </td></tr></tbody>
            </table>
            <table width="525" class=formarea  id="catmenu" style="display:none ">
              <tbody>
      		<tr>
				<td><input type="checkbox" name="cat_manual_0" id="cat_manual_0">Alcohol</td>
				<td><input type="checkbox" name="cat_manual_12" id="cat_manual_12">Gambling</td>
				<td><input type="checkbox" name="cat_manual_24" id="cat_manual_24">Public Proxies</td>
			</tr><tr>
				<td><input type="checkbox" name="cat_manual_1" id="cat_manual_1">Anarchy</td>
				<td><input type="checkbox" name="cat_manual_13" id="cat_manual_13">Games</td>
				<td><input type="checkbox" name="cat_manual_25" id="cat_manual_25">R-rated</td>
			</tr><tr>
				<td><input type="checkbox" name="cat_manual_2" id="cat_manual_2">Automobile</td>
				<td><input type="checkbox" name="cat_manual_14" id="cat_manual_14">Hate</td>
				<td><input type="checkbox" name="cat_manual_26" id="cat_manual_26">Search Engine</td>
			</tr><tr>
				<td><input type="checkbox" name="cat_manual_3" id="cat_manual_3">Banner Ad</td>
				<td><input type="checkbox" name="cat_manual_15" id="cat_manual_15">Humor</td>
				<td><input type="checkbox" name="cat_manual_27" id="cat_manual_27">Shopping</td>
			</tr><tr>
				<td><input type="checkbox" name="cat_manual_4" id="cat_manual_4">Chat</td>
				<td><input type="checkbox" name="cat_manual_16" id="cat_manual_16">Lifestyles</td>
				<td><input type="checkbox" name="cat_manual_28" id="cat_manual_28">Sports</td>
			</tr><tr>
				<td><input type="checkbox" name="cat_manual_5" id="cat_manual_5">Criminal Skills</td>
				<td><input type="checkbox" name="cat_manual_17" id="cat_manual_17">Magazine</td>
				<td><input type="checkbox" name="cat_manual_29" id="cat_manual_29">Tickets</td>
			</tr><tr>
				<td><input type="checkbox" name="cat_manual_6" id="cat_manual_6">Cults</td>
				<td><input type="checkbox" name="cat_manual_18" id="cat_manual_18">News</td>
				<td><input type="checkbox" name="cat_manual_30" id="cat_manual_30">Travel</td>
			</tr><tr>
				<td><input type="checkbox" name="cat_manual_7" id="cat_manual_7">Drugs</td>
				<td><input type="checkbox" name="cat_manual_19" id="cat_manual_19">Obscene</td>
				<td><input type="checkbox" name="cat_manual_31" id="cat_manual_31">Unstable</td>
			</tr><tr>
				<td><input type="checkbox" name="cat_manual_8" id="cat_manual_8">Employment</td>
				<td><input type="checkbox" name="cat_manual_20" id="cat_manual_20">Opinion</td>
				<td><input type="checkbox" name="cat_manual_32" id="cat_manual_32">Web Mail</td>
			</tr><tr>
				<td><input type="checkbox" name="cat_manual_9" id="cat_manual_9">Entertainment</td>
				<td><input type="checkbox" name="cat_manual_21" id="cat_manual_21">Personals</td>
				<td><input type="checkbox" name="cat_manual_33" id="cat_manual_33">Web Newsgroup</td>
			</tr><tr>
				<td><input type="checkbox" name="cat_manual_10" id="cat_manual_10">Financial</td>
				<td><input type="checkbox" name="cat_manual_22" id="cat_manual_22">Pop-ups</td>
				<td>&nbsp;</td>
			</tr><tr>
				<td><input type="checkbox" name="cat_manual_11" id="cat_manual_11">Free Host</td>
				<td><input type="checkbox" name="cat_manual_23" id="cat_manual_23">Pornography</td>
				<td>&nbsp;</td>
			</tr>
		</table>
            <table width="526" class=formarea id="blksite" style="display:yes ">  
              <tbody>
              <tr>
                <td width="136" class=form_label_top><div align="right">
                Block Unrated Sites&nbsp;:</div></td>
                <td width="378"><input name="blkUnratedSite" id="blkUnratedSite" type=checkbox></td>
              </tr></tbody></table>
		    <hr>
            <table width="362" align="center">
              <td> <div align="center"> 
                  <input name="perv" type="button" id="perv" value="Perv" onclick="window.location='Step_4.asp';">
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
			<td width="10">&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table>
<br>
<div align="center">Copyright &copy; 2004-2005 D-Link Systems, Inc.</div>
<br>
</body>
<script>
check_select();
show_save_button();
</script>
</html>
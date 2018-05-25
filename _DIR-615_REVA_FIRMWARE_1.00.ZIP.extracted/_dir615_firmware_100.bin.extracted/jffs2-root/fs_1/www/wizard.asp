
<html>
<head>
<script language="JavaScript" src="public.js"></script>
<link rel="STYLESHEET" type="text/css" href="css_router.css">

<title>D-LINK SYSTEMS, INC | WIRELESS ROUTER | HOME</title>
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.style2 {font-size: 11px}
-->
</style>
</head>

<body topmargin="1" leftmargin="0" rightmargin="0" bgcolor="#757575">
	<table id="header_container" border="0" cellpadding="5" cellspacing="0" width="838" align="center">
      <tr>
        <td width="100%">Product Page: <a href="http://support.dlink.com/">DIR-615</a></td>
        <td align="right" nowrap>Hardware Version: A1 &nbsp;</td>
        <td align="right" nowrap>Firmware Version: <% CmoGetStatus("version"); %></td>
      </tr>
    </table>
	<table id="topnav_container" border="0" cellpadding="0" cellspacing="0" width="838" align="center">
		<tr>
			<td align="center" valign="middle"><img src="wlan_masthead.gif" width="836" height="92"></td>
		</tr>
	</table>
	<table border="0" cellpadding="2" cellspacing="1" width="838" align="center" bgcolor="#FFFFFF">
		<tr id="topnav_container">
			<td><img src="short_modnum.gif" width="125" height="25"></td>
			<td id="topnavon"><a href="index.asp">Setup</a></td>
			<td id="topnavoff"><a href="adv_virtual.asp">Advanced</a></td>
			<td id="topnavoff"><a href="tools_admin.asp">Tools</a></td>
			<td id="topnavoff"><a href="st_device.asp">Status</a></td>
			<td id="topnavoff"><a href="support_men.asp">Support</a></td>
		</tr>
	</table>
	<table border="1" cellpadding="2" cellspacing="0" width="838" height="100%" align="center" bgcolor="#FFFFFF" bordercolordark="#FFFFFF">
		<tr>
			<td id="sidenav_container" valign="top" width="125" align="right">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td id="sidenav_container">
							<div id="sidenav">					
								<ul>
									<li><div id="sidenavoff">Internet</div></li>
									<li>
									  <div id="sidenavon"><a href="wireless.asp">Wireless settings </a></div>
									</li>
									<li>
									  <div id="sidenavon"><a href="lan.asp">Network SETTINGS</a></div>
									</li>
								</ul>							
							</div>
						</td>			
					</tr>
				</table>			
			</td>
			<td valign="top" id="maincontent_container">
				<div id=maincontent>
                    <div id=box_header>
                      <h1>Wizard</h1>
                     The Wizards below will assist you in configuring the basic settings of your new D-Link Router..</P>
                    </div>
                    <div class=box>
                      <h2>Internet Connection Setup Wizard</h2>
                      <p>The following Web-based Setup Wizard is designed to assist you in connecting your new D-Link Router to the Internet. This Setup Wizard will guide you through step-by-step instructions on how to get your Internet connection up and running. Click the button below to begin.</p>
                      <p class=centered>
                        <input name="button" type=button class=button_submit value="Launch Internet Connection Setup Wizard" onClick="window.location.href='wizard_wan.asp'">
                      </p>
                      <p><STRONG>Note:</STRONG> Before launching these wizards, please make sure you have followed all steps outlined in the Quick Installation Guide included in the package.</p>
                    </div>                   
                    <div class=box id=wcn_section style="DISPLAY: none">
                      <h2>Microsoft Windows Connect Now Wizard</h2>
                      <P>The following wizard uses Microsoft's Windows Connect Now technology to automatically configure the wireless settings on your Gateway. Make sure that you have sucessfully run Microsoft's Network Wireless Configuarion Wizard on your computer before using this feature.</p>
                      <div align=center><SPAN id=wcn_activex 
            style="VISIBILITY: hidden; WIDTH: 0px; HEIGHT: 0px">&nbsp;</SPAN>
                          <input name="button2" type=button class=button_submit onclick=javascript:update_wlan(); value="Use Windows Connect Now">
                      </div>
                    </div>                  
                    <div class=box>
                      <h2>Wireless Security Setup Wizard</h2>
                      <p>The following Web-based Setup Wizard is designed to assist you in your wireless network setup. This Setup Wizard will guide you through step-by-step instructions on how to set up your wireless network and how to make it secure.</P>
                      <p class=centered>
                        <input name="button2" type=button class=button_submit onclick="window.location='wizard_wlan.asp';" value="Launch Wireless Security Setup Wizard" >
                      </p>
                      <p><STRONG>Note:</STRONG> Some changes made using this Setup Wizard may require you to change some settings on your wireless client adapters so they can still connect to the D-Link Router.</>
                    </div>
			  </div></td>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table cellSpacing=0 cellPadding=2 bgColor=#ffffff border=0>
                  <tbody>
                    <tr>
                      <td id=help_text><strong>Helpful Hints..</strong><BR>
                         <p class="style2"> If you are currently not able to access the Internet, click on the <strong>Launch Internet Connection Setup Wizard</strong> button to begin setting up your router to connect to the Internet.</p>
                          <p class="style2">  If you need assistance in setting up the wireless portion of your router, click the <strong>Launch Wireless Security Setup Wizard</strong> to begin configuring your wireless settings. </p></td>
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
</html>

<html>
<head>

<link rel="STYLESHEET" type="text/css" href="css_router.css">

<title>D-LINK SYSTEMS, INC | WIRELESS ROUTER | HOME</title>
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<script language="JavaScript" src="public.js"></script>
<script language="JavaScript">
//var curr_page = <% CmoGetStatus("log_current_page"); %>;
//var last_page = <% CmoGetStatus("log_total_page"); %>;

//var curr_page = get_by_id("current_page").value;
//var last_page = get_by_id("total_page").value;

function switch_page(which_page){	
	if (which_page >= 0 && which_page <= last_page){
		get_by_id("current_page").value = which_page;
		send_submit("form1");
	}
}

function start_button(){
	get_by_id("Pp1").disabled = true;
	get_by_id("Np1").disabled = true;
	get_by_id("Fp1").disabled = true;
	get_by_id("Lp1").disabled = true;
	
	setTimeout('disable_button()',1000);
}

function disable_button(){
	get_by_id("Pp1").disabled = false;
	get_by_id("Np1").disabled = false;
	get_by_id("Fp1").disabled = false;
	get_by_id("Lp1").disabled = false;
	
	if (curr_page == "1"){
	    get_by_id("Pp1").disabled = true;
	}
	
	if (curr_page == last_page){
	    get_by_id("Np1").disabled = true;
	}
}

function to_first_page(){
	send_submit("form2");
}

function to_last_page(){
	send_submit("form3");
}

function to_next_page(){
	send_submit("form4");
}

function to_pre_page(){
	send_submit("form5");
}

function clear_log(){
	send_submit("form6");
}

</script>

<style type="text/css">
<!--
.style4 {
	font-size: 11px;
	font-weight: bold;
}
.style5 {font-size: 11px}
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
			<td id="topnavoff"><a href="index.asp">Setup</a></td>
			<td id="topnavoff"><a href="adv_virtual.asp">Advanced</a></td>
			<td id="topnavoff"><a href="tools_admin.asp">Tools</a></td>
			<td id="topnavon"><a href="st_device.asp">Status</a></td>
			<td id="topnavoff"><a href="support_men.asp">Support</a></td>
		</tr>
	</table>
	<table border="1" cellpadding="2" cellspacing="0" width="838" height="100%" align="center" bgcolor="#FFFFFF" bordercolordark="#FFFFFF">
		<tr>
			<td id="sidenav_container" valign="top" width="125" align="right">
				<table border="0" cellpadding="0" cellspacing="0">
                  <tbody>
					<tr>
						<td id="sidenav_container">
							<div id="sidenav">
							<!-- === BEGIN SIDENAV === -->
								<ul>
									<li><div><a href="st_device.asp">Device Info</a></div></li>
									<li><div id="sidenavoff">Log</div></li>
									<li><div><a href="st_stats.asp">Stats</a></div></li>
									<li><div><a href="st_wireless.asp">Wireless</a></div></li>
								</ul>
								<!-- === END SIDENAV === -->
							</div>
						</td>			
					</tr>
                  </tbody>
				</table>			
			</td>
			<td valign="top" id="maincontent_container">			  <div id="maincontent">
					<!-- === BEGIN MAINCONTENT === -->
<div id="box_header"> 
						<h1>View Log</h1>
						<p>View Log displays the activities occurring on the DIR-615.</p> </div>
					<!-- === END MAINCONTENT === -->
<div class="box">
                    <h2>lOG FILES</h2>
<form id="form1" name="form1" method="post" action="apply.cgi">
<input type="hidden" name="html_response_page" value="back.asp">
<input type="hidden" name="html_response_message" value="The setting is saved.">
<input type="hidden" name="html_response_return_page" value="st_log.asp">

<input type="hidden" name="total_log" id="total_log" value="<% CmoGetLog(); %>">
                    <table cellpadding="1" cellspacing="1" border="0" width="525">
                      <tr>
                        <td align="right"><div align="left">
                           <input type=button class=button_submit  value="First Page" id="Fp1" name="Fp1" onClick="to_first_page()">
							<input type=button class=button_submit  value="Last Page" id="Lp1" name="Lp1" onClick="to_last_page()">
							<input type=button class=button_submit  value="Previous" id="Pp1" name="Pp1" onClick="to_pre_page()">
							<input type=button class=button_submit  value="Next" id="Np1" name="Np1" onClick="to_next_page()">
							<input type=button class=button_submit  value="Clear" name=clear id=clear onClick="clear_log()">
							<input type=hidden id="current_page" name="current_page" value="<% CmoGetStatus("log_current_page"); %>">
							<input type=hidden id="total_page" name="total_page" value="<% CmoGetStatus("log_total_page"); %>">
					<font size=1></font> </div></td>
                      </tr>
                      <tr> 
                  <td><font face="Tahoma" size="2"><% CmoGetStatus("log_current_page"); %>
                  /<% CmoGetStatus("log_total_page"); %><!-- insert name="pageNum" --></font></td>
                </tr>
                    </table>
                    <table borderColor=#ffffff cellSpacing=1 cellPadding=2 width=525 bgColor=#dfdfdf border=1>
                      <tbody>
                        <tr>
                          <td width="120"><strong>Time</strong></td>
						  <td width="80"><strong>Type</strong></td>
                          <td ><strong>Message</strong></td>
                          <!--<td align=middle>Source</td>-->
                          <!--<td align=middle>Destination</td>-->
                          <!--<td align=middle>Note</td>-->
                        </tr>
                        <!-- repeat name=log_list -->
                        <script>
							var temp_entry = get_by_id("total_log").value.split("|syslog|");
							for (var i = 0; i < temp_entry.length; i++){
								var entry = temp_entry[i].split("|");
								if(entry.length > 1){
									document.write("<tr><td width=\"120\">" + entry[0] + "</td><td width=\"80\">" + entry[1] + "</td><td>" + entry[2] + "</td></tr>");
								}
							}
						</script>
                      </tbody>
                    </table>
</form>

</div>
              <p>&nbsp;</p>
				</div></td>
				<form id="form2" name="form2" method="post" action="log_first_page.cgi"><input type="hidden" name="html_response_page" value="st_log.asp"><input type="hidden" name="html_response_return_page" value="st_log.asp"></form>
<form id="form3" name="form3" method="post" action="log_last_page.cgi"><input type="hidden" name="html_response_page" value="st_log.asp"><input type="hidden" name="html_response_return_page" value="st_log.asp"></form>
<form id="form4" name="form4" method="post" action="log_next_page.cgi"><input type="hidden" name="html_response_page" value="st_log.asp"><input type="hidden" name="html_response_return_page" value="st_log.asp"></form>
<form id="form5" name="form5" method="post" action="log_previous_page.cgi"><input type="hidden" name="html_response_page" value="st_log.asp"><input type="hidden" name="html_response_return_page" value="st_log.asp"></form>
<form id="form5" name="form6" method="post" action="log_clear_page.cgi"><input type="hidden" name="html_response_page" value="st_log.asp"><input type="hidden" name="html_response_return_page" value="st_log.asp"></form>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table cellpadding="2" cellspacing="0" border="0" bgcolor="#FFFFFF">
                  <tr>
                    <td id="help_text">
                      <p>&nbsp;</p></td>
                  </tr>
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
var curr_page = <% CmoGetStatus("log_current_page"); %>;
var last_page = <% CmoGetStatus("log_total_page"); %>;

start_button();
</script>
</html>
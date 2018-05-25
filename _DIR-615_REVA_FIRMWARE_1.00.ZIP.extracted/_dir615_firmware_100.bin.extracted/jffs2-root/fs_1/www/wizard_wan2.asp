<html>
<head>
<link rel="STYLESHEET" type="text/css" href="css_router.css">

<title></title>
<script language="JavaScript" src="public.js"></script>
<script language="JavaScript">
var submit_button_flag = 0;
	function set_time_zone(){
		var time_zone = get_by_id("tzone");
		
		for (var i = 0; i < time_zone.length; i++){
			if (time_zone.options[i].value == get_by_id("asp_temp_01").value){
				time_zone.selectedIndex = i;
				break;
			}
		}
	}
	
	function send_request(){
		get_by_id("asp_temp_01").value = get_by_id("tzone").value;		
		
		if(submit_button_flag == 0){
		submit_button_flag = 1;
		return true;
		}else{
		return false;
		}
	}
</script>
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
</head>
<body topmargin="1" leftmargin="0" rightmargin="0" bgcolor="#757575">
<table border=0 cellspacing=0 cellpadding=0 align=center width=838>

<tr>
<td>

  <table width=836 border=0 cellspacing=0 cellpadding=0 align=center height=100>
<tr>
  <td bgcolor="#FFFFFF">    <div align="center">
    <table id="header_container" border="0" cellpadding="5" cellspacing="0" width="838" align="center">
      <tr>
        <td width="100%">Product Page: <a href="http://support.dlink.com/">DIR-615</a></td>
        <td align="right" nowrap>Hardware Version: A1 &nbsp;</td>
        <td align="right" nowrap>Firmware Version: <% CmoGetStatus("version"); %></td>
      </tr>
    </table>
    <img src="wlan_masthead.gif" width="836" height="92" align="middle">
      <br>
  </div>
    <table width="650" border="0" align="center"><br>
    <tr>
      <td><div id=box_header-w>
        <h1 align="left" class="h1-w">Step 2: Select your Time Zone</h1>
        <div align="left">
          <p class="box_msg-w">Select the appropriate time zone for your location. This information is required to configure the time-based options for the router.</p>
          <form id="form1" name="form1" method="post" action="apply.cgi">
          	<input type="hidden" name="html_response_page" value="wizard_wan3.asp">
			<input type="hidden" name="html_response_message" value="">
			<input type="hidden" name="html_response_return_page" value="wizard_wan3.asp">
			<input type="hidden" name="reboot_type" value="none">
			
			<input type="hidden" id="asp_temp_01" name="asp_temp_01" value="<% CmoGetCfg("asp_temp_01","none"); %>">			
            <P align="center" class=box_msg-w><br>
                <font face=Arial>
                <select size=1 id=tzone name=tzone>
                  <option value=-192><font face=Arial>(GMT-12:00) Eniwetok, Kwajalein</font></option>
                  <option value=-176><font face=Arial>(GMT-11:00) Midway Island, Samoa</font></option>
                  <option value=-160><font face=Arial>(GMT-10:00) Hawaii</font></option>
                  <option value=-144><font face=Arial>(GMT-09:00) Alaska</font></option>
                  <option value=-128><font face=Arial>(GMT-08:00) Pacific Time (US &amp; Canada)</font></option>
                  <option value=-112><font face=Arial>(GMT-07:00) Arizona</font></option>
                  <option value=-113><font face=Arial>(GMT-07:00) Mountain Time (US &amp; Canada)</font></option>
                  <option value=-96><font face=Arial>(GMT-06:00) Central Time (US &amp; Canada)</font></option>
                  <option value=-97><font face=Arial>(GMT-06:00) Mexico City, Tegucigalpa</font></option>
                  <option value=-80><font face=Arial>(GMT-05:00) Bogota, Lima, Quito</font></option>
                  <option value=-81><font face=Arial>(GMT-05:00) Eastern Time (US &amp; Canada)</font></option>
                  <option value=-82><font face=Arial>(GMT-05:00) Indiana (East)</font></option>
                  <option value=-64><font face=Arial>(GMT-04:00) Atlantic Time (US &amp; Canada)</font></option>
                  <option value=-65><font face=Arial>(GMT-04:00) Caracas, La Paz</font></option>
                  <option value=-56><font face=Arial>(GMT-03:30) Newfoundland</font></option>
                  <option value=-48><font face=Arial>(GMT-03:00) Brasilia</font></option>
                  <option value=-49><font face=Arial>(GMT-03:00) Buenos Aires, Georgetown</font></option>
                  <option value=-32><font face=Arial>(GMT-02:00) Mid-Atlantic</font></option>
                  <option value=-16><font face=Arial>(GMT-01:00) Azores, Cape Verde Is.</font></option>
                  <option value=0><font face=Arial>(GMT) Casablanca, Monrovia</font></option>
                  <option value=1><font face=Arial>(GMT) Dublin, Edinburgh, Lisbon, London</font></option>
                  <option value=16><font face=Arial>(GMT+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna</font></option>
                  <option value=17><font face=Arial>(GMT+01:00) Belgrade, Bratislave, Budapest, Ljubljana, Prague</font></option>
                  <option value=18><font face=Arial>(GMT+01:00) Brussels, Copenhagen, Madrid, Paris, Vilnius</font></option>
                  <option value=19><font face=Arial>(GMT+01:00) Sarajevo, Skopje, Sofija, Warsaw, Zagreb</font></option>
                  <option value=32><font face=Arial>(GMT+02:00) Athens, Bucharest, Cairo, Istanbul, Minsk</font></option>
                  <option value=33><font face=Arial>(GMT+02:00) Harare, Helsinki, Jerusalem, Pretoria, Riga, Tallinn</font></option>
                  <option value=48><font face=Arial>(GMT+03:00) Baghdad, Kuwait, Riyadh</font></option>
                  <option value=49><font face=Arial>(GMT+03:00) Moscow, St.Petersburg, Volgograd</font></option>
                  <option value=56><font face=Arial>(GMT+03:30) Tehran</font></option>
                  <option value=64><font face=Arial>(GMT+04:00) Abu Dhabi, Baku, Muscat, Tbilist</font></option>
                  <option value=72><font face=Arial>(GMT+04:30) Kabul</font></option>
                  <option value=90><font face=Arial>(GMT+05:00) EKaterinburg, Islamabad, Karachi, Tashikent</font></option>
                  <option value=88><font face=Arial>(GMT+05:30) New Delhi</font></option>
                  <option value=96><font face=Arial>(GMT+06:00) Astana, Almaty, Colombo, Dhaka</font></option>
                  <option value=112><font face=Arial>(GMT+07:00) Bangkok, Hanoi, Jakarta</font></option>
                  <option value=128><font face=Arial>(GMT+08:00) Beijing, Hong Kong, Singapore, Taipei</font></option>
                  <option value=144><font face=Arial>(GMT+09:00) Seoul, Tokoyo, Yakutsk</font></option>
                  <option value=152><font face=Arial>(GMT+09:30) Adelaide, Darwin</font></option>
                  <option value=160><font face=Arial>(GMT+10:00) Canberra, Guam, Port Moresby, Vladivostok</font></option>
                  <option value=176><font face=Arial>(GMT+11:00) Magadan, Solomon Islands</font></option>
                  <option value=192><font face=Arial>(GMT+12:00) Fiji, Kamchatka, Marshall Islands, Willington</font></option>
                </select>
              </font> </P>
              <p> </p>
          <table align="center" class="formarea">
            <tr>
              <td>
                <input type="button" class="button_submit" name="prev_b" value="Prev" onClick="window.location.href='wizard_wan1.asp'">
                <input type="submit" class="button_submit" name="next_b" value="Next" onClick="return send_request()">
                <input type="button" class="button_submit" name="cancel_b" value="Cancel" onClick="window.location='index.asp';">
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
</td>
</tr>
<tr>
<td bgcolor="#FFFFFF">
  
  </td>
</tr>
</table>
<div align="center">Copyright &copy; 2004-2005 D-Link Systems, Inc. </div>
</body>
<script>
	set_time_zone();
</script>
</html>

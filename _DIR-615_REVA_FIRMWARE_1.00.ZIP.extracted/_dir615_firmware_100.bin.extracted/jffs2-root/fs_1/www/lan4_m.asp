<html>
<head>
<title>D-LINK SYSTEMS, INC | WIRELESS ROUTER | HOME</title>
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<script language="Javascript" src="public.js"></script>
</head>
<body bgcolor=#CCCCCC text=#000000 topmargin=0 leftmargin=0>
<form>
<table border=0 cellspacing=0 cellpadding=0 height=211 width=450>
<tr>
<td height=11><img src=wwvct.jpg width=450 height=34></td>
</tr>
<tr>
<td bgcolor=#CCCCCC height=10></td>
</tr>
<tr>
<td height=10 bgcolor=#CCCCCC>
        <table border=0 width=450 height=175 cellpadding=0>
          <tr> 
            <td width="11%" height="76"> 
              <div align="left"><b><font face="Arial" size="2">LAN4</font></b></div>
            </td>
            <td width="37%" height="76"> 
              <div align="center"> 
                <input type="hidden" id="lan_link_03" name="lan_link_03" value="<%  CmoGetStatus("lan_port_status_03"); %>">
								<!-- insert name=link_stat_lan4 -->
								<script>
									if(get_by_id("lan_link_03").value == "connect"){
										document.write("<img src=W_link.gif width=200 height=20 border=0>");
									}else{
										document.write("<img src=W_nolink.gif width=200 height=20 border=0>");
									}
								</script>
                </div>
            </td>
            <td width="35%" height="76"> 
              <div align="center">
			  <input type="hidden" id="lan_port_speed_duplex_03" name="lan_port_speed_duplex_03" value="<%  CmoGetStatus("lan_port_speed_duplex_03"); %>">
								<script>
									var temp_data = get_by_id("lan_port_speed_duplex_03").value;
									var data = temp_data.split("|");
									if(get_by_id("lan_link_03").value == "connect"){
										document.write("<font face=\"Tahoma\" size=\"2\" color=\"#000000\"><strong>"+ data[0] +"Mbps "+ data[1] +" Duplex</strong></font>");
									}else{
										document.write("<font face=\"Tahoma\" size=\"2\" color=\"#000000\">Disconnected</font>");
									}
								
								</script>
                <!-- insert name=link_stat_txt_lan4 -->
               </div>
            </td>
          </tr>
          <tr> 
            <td height=20> 
              <div align="center"></div>
            </td>
            <td height=20>
              <div align="center">
                <font face="Tahoma" size="2"><strong><!-- insert name=lan4_tx --></strong></font>
                </div>
            </td>
            <td height=20>&nbsp;</td>
          </tr>
          <tr> 
            <td height=20> 
              <div align="center"></div>
            </td>
            <td height=20>
              <div align="center">
                <font face="Tahoma" size="2"><strong><!-- insert name=lan4_rx --></strong></font>
                </div>
            </td>
            <td height=20>&nbsp;</td>
          </tr>
        </table>
</td>
</tr>
<tr>
      <td bgcolor=#CCCCCC height=10 align=right><input type="button" name="exit" value="Exit" onClick="window.close()"> 
      </td>
</tr>
</table>
</form>
</body>
</html>

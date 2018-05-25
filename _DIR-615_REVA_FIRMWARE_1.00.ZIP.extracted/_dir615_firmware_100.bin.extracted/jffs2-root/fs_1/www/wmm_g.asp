<HTML>
<HEAD>
<title>DIR-615</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">
<link rel="STYLESHEET" type="text/css" href="css_router.css">
<script language="JavaScript" src="public.js"></script>
<script language="JavaScript">
		function send_request(){
			send_submit("form1");
	}
</script>
</HEAD>

<BODY BGCOLOR=#FFFFFF leftmargin="0" topmargin="0">
<table width="75%" border="0" cellspacing="0" cellpadding="0" align="center" height="600">
  <tr>
    <td>
      <div align="center"></div>
    </td>
  </tr>
  <tr>
    <td>
      <table width=765 border=0 cellpadding=0 cellspacing=0 align="center">
        <tr> 
          <td rowspan=9 width="20" background="down_01.gif">&nbsp; </td>
          <td rowspan=2 width="133">&nbsp; </td>
          <td rowspan=2 width="25" background="down_03.jpg">&nbsp; </td>
          <td width="21">&nbsp; </td>
          <td width="522">&nbsp; </td>
          <td width="19">&nbsp; </td>
          <td width="25" background="down_11.gif">&nbsp; </td>
        </tr>
        <tr> 
          <td width="21" background="down_14.gif">&nbsp; </td>
          <td rowspan=8 width="522" valign="top"> 
            <form id="form1" name="form1" method="post" action="wmm_g.cgi">
              <table width="101%" border="0">              	         
                <tr>
                  <td colspan="2">                    
    <font size="2">WMM Parameters of AP (Access Point)</font><br>
&nbsp;</font>
                    </p>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" id="wmm_ap_g">
                    <tr>
                      <td width="14%" align="center"><font size="2">Access Type</font></td>
                      <td width="14%" align="center"><font size="2">CWMin</font></td>
                      <td width="14%" align="center"><font size="2">CWMax</font></td>
                      <td width="14%" align="center"><font size="2">AIFS</font></td>
                      <td width="14%" align="center"><font size="2">TxopLimit</font></td>
                      <td width="15%" align="center"><font size="2">ACM</font></td>
                      <td width="15%" align="center"><font size="2">Ack-policy</font></td>
                    </tr>
                    <tr>
                      <td width="14%" align="center"><font size="2">Lowest</font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=2 name=wmm_g_ac0_cwmin size=4 value=1>
                      </font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=2 name=wmm_g_ac0_cwmax size=4 value=1>
                      </font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=2 name=wmm_g_ac0_aifs size=4 value=1>
                      </font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=4 name=wmm_g_ac0_txoplimit size=4 value=1>
                      </font></td>
                      <td width="15%" align="center"><font size="2">
                        <input type="checkbox" name=wmm_g_ac0_acm value=1 >
                      </font></td>
                      <td width="15%" align="center"><font size="2">
                        <input type="checkbox" name=wmm_g_ac0_ack value=1 >
                      </font></td>
                    </tr>
                    <tr>
                      <td width="14%" align="center"><font size="2">Low</font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=2 name=wmm_g_ac1_cwmin size=4 value=1>
                      </font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=2 name=wmm_g_ac1_cwmax size=4 value=1>
                      </font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=2 name=wmm_g_ac1_aifs size=4 value=1>
                      </font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=4 name=wmm_g_ac1_txoplimit size=4 value=1>
                      </font></td>
                      <td width="15%" align="center"><font size="2">
                        <input type="checkbox" name=wmm_g_ac1_acm value=1>
                      </font></td>
                      <td width="15%" align="center"><font size="2">
                        <input type="checkbox" name=wmm_g_ac1_ack value=1 >
                      </font></td>
                    </tr>
                    <tr>
                      <td width="14%" align="center"><font size="2">High</font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=2 name=wmm_g_ac2_cwmin size=4 value=1>
                      </font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=2 name=wmm_g_ac2_cwmax size=4 value=1>
                      </font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=2 name=wmm_g_ac2_aifs size=4 value=1>
                      </font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=4 name=wmm_g_ac2_txoplimit size=4 value=1>
                      </font></td>
                      <td width="15%" align="center"><font size="2">
                        <input type="checkbox" name=wmm_g_ac2_acm value=1>
                      </font></td>
                      <td width="15%" align="center"><font size="2">
                        <input type="checkbox" name=wmm_g_ac2_ack value=1 >
                      </font></td>
                    </tr>
                    <tr>
                      <td width="14%" align="center"><font size="2">Highest</font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=2 name=wmm_g_ac3_cwmin size=4 value=1>
                      </font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=2 name=wmm_g_ac3_cwmax size=4 value=1>
                      </font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=2 name=wmm_g_ac3_aifs size=4 value=1>
                      </font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=4 name=wmm_g_ac3_txoplimit size=4 value=1>
                      </font></td>
                      <td width="15%" align="center"><font size="2">
                        <input type="checkbox" name=wmm_g_ac3_acm value=1>
                      </font></td>
                      <td width="15%" align="center"><font size="2">
                        <input type="checkbox" name=wmm_g_ac3_ack value=1 >
                      </font></td>
                    </tr>
                    <tr>
                      <td width="14%" align="center">&nbsp;</td>
                      <td width="14%" align="center">&nbsp;</td>
                      <td width="14%" align="center">&nbsp;</td>
                      <td width="14%" align="center">&nbsp;</td>
                      <td width="14%" align="center">&nbsp;</td>
                      <td width="15%" align="center">&nbsp;</td>
                      <td width="15%" align="center">&nbsp;</td>
                    </tr>
                    <tr>
                      <td width="100%" align="center" colspan="7"><p align="left"><font size="2">WMM Parameters of STA (station)<br>
                  &nbsp;</font></td>
                    </tr>
                    <tr>
                      <td width="14%" align="center"><font size="2">Access Type</font></td>
                      <td width="14%" align="center"><font size="2">CWMin</font></td>
                      <td width="14%" align="center"><font size="2">CWMax</font></td>
                      <td width="14%" align="center"><font size="2">AIFS</font></td>
                      <td width="14%" align="center"><font size="2">TxopLimit</font></td>
                      <td width="15%" align="center"><font size="2">ACM</font></td>
                      <td width="15%" align="center">&nbsp;</td>
                    </tr>
                    <tr>
                      <td width="14%" align="center"><font size="2">Lowest</font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=2 name=wmm_g_sta_ac0_cwmin size=4 value=1>
                      </font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=2 name=wmm_g_sta_ac0_cwmax size=4 value=1>
                      </font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=2 name=wmm_g_sta_ac0_aifs size=4 value=1>
                      </font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=4 name=wmm_g_sta_ac0_txoplimit size=4 value=1>
                      </font></td>
                      <td width="15%" align="center"><font size="2">
                        <input type="checkbox" name=wmm_g_sta_ac0_acm value=1 >
                      </font></td>
                      <td width="15%" align="center">&nbsp;</td>
                    </tr>
                    <tr>
                      <td width="14%" align="center"><font size="2">Low</font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=2 name=wmm_g_sta_ac1_cwmin size=4 value=1>
                      </font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=2 name=wmm_g_sta_ac1_cwmax size=4 value=1>
                      </font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=2 name=wmm_g_sta_ac1_aifs size=4 value=1>
                      </font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=4 name=wmm_g_sta_ac1_txoplimit size=4 value=1>
                      </font></td>
                      <td width="15%" align="center"><font size="2">
                        <input type="checkbox" name=wmm_g_sta_ac1_acm value=1 >
                      </font></td>
                      <td width="15%" align="center">&nbsp;</td>
                    </tr>
                    <tr>
                      <td width="14%" align="center"><font size="2">High</font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=2 name=wmm_g_sta_ac2_cwmin size=4 value=1>
                      </font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=2 name=wmm_g_sta_ac2_cwmax size=4 value=1>
                      </font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=2 name=wmm_g_sta_ac2_aifs size=4 value=1>
                      </font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=4 name=wmm_g_sta_ac2_txoplimit size=4 value=1>
                      </font></td>
                      <td width="15%" align="center"><font size="2">
                        <input type="checkbox" name=wmm_g_sta_ac2_acm value=1 >
                      </font></td>
                      <td width="15%" align="center">&nbsp;</td>
                    </tr>
                    <tr>
                      <td width="14%" align="center"><font size="2">Highest</font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=2 name=wmm_g_sta_ac3_cwmin size=4 value=1>
                      </font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=2 name=wmm_g_sta_ac3_cwmax size=4 value=1>
                      </font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=2 name=wmm_g_sta_ac3_aifs size=4 value=1>
                      </font></td>
                      <td width="14%" align="center"><font size="2">
                        <input maxlength=4 name=wmm_g_sta_ac3_txoplimit size=4 value=1>
                      </font></td>
                      <td width="15%" align="center"><font size="2">
                        <input type="checkbox" name=wmm_g_sta_ac3_acm value=1 >
                      </font></td>
                      <td width="15%" align="center">&nbsp;</td>
                    </tr>
                  </table></td>
                </tr>
                <tr> 
                  <td width="27%">&nbsp;</td>
                  <td width="73%"> 
                    <div align="right">
                      <input name="apply" type="button" id="apply" onClick="send_request()" value="Apply">
                      <input name="cancel" type="button" id="cancel" onClick="location.reload()" value="Cancel">
                      &nbsp; 
                    </div>
                  </td>
                </tr>
              </table>
            </form>
          </td>
          <td width="19">&nbsp; </td>
          <td width="25" background="down_11.gif">&nbsp; </td>
        </tr>
        <tr> 
          <td width="133" height="42" bgcolor="#CCCCCC">&nbsp;</td>
          <td width="25" background="down_03.jpg" height="42">&nbsp; </td>
          <td width="21" background="down_14.gif" height="42">&nbsp; </td>
          <td width="19" background="down_40.gif" height="42">&nbsp; </td>
          <td width="25" background="down_11.gif" height="42">&nbsp; </td>
        </tr>
        <tr> 
          <td width="133" bgcolor="#CCCCCC">&nbsp;</td>
          <td width="25" background="down_03.jpg">&nbsp; </td>
          <td width="21" background="down_14.gif">&nbsp; </td>
          <td width="19" background="down_40.gif">&nbsp; </td>
          <td width="25" background="down_11.gif">&nbsp; </td>
        </tr>
        <tr> 
          <td width="133" bgcolor="#CCCCCC">&nbsp;</td>
          <td width="25" background="down_03.jpg">&nbsp; </td>
          <td width="21" background="down_14.gif">&nbsp; </td>
          <td width="19" background="down_40.gif">&nbsp; </td>
          <td width="25" background="down_11.gif">&nbsp; </td>
        </tr>
        <tr> 
          <td width="133" bgcolor="#CCCCCC">&nbsp;</td>
          <td width="25" background="down_03.jpg">&nbsp; </td>
          <td width="21" background="down_14.gif">&nbsp; </td>
          <td width="19" background="down_40.gif">&nbsp; </td>
          <td width="25" background="down_11.gif">&nbsp; </td>
        </tr>
        <tr> 
          <td width="133" bgcolor="#CCCCCC">&nbsp;</td>
          <td width="25" background="down_03.jpg" rowspan="2">&nbsp; </td>
          <td width="21" background="down_14.gif" rowspan="2">&nbsp; </td>
          <td width="19" background="down_40.gif" rowspan="2">&nbsp; </td>
          <td width="25" background="down_11.gif" rowspan="2">&nbsp; </td>
        </tr>
        <tr>
          <td width="133" bgcolor="#CCCCCC">&nbsp;</td>
        </tr>
        <tr> 
          <td width="133" background="down_37.gif" height="350"></td>
          <td width="25" background="down_03.jpg">
          </td>
          <td width="21" background="down_14.gif">&nbsp; </td>
          <td width="19" background="down_40.gif">&nbsp; </td>
          <td width="25" background="down_11.gif">&nbsp; </td>
        </tr>
        <tr> 
          <td colspan=6 rowspan=2>&nbsp; </td>
          <td width="25">&nbsp; </td>
        </tr>
        <tr> 
          <td width="25">&nbsp; </td>
        </tr>
      </table>	
    </td>
  </tr>
</table>
</BODY>

</HTML>
<html>
<head>

<link rel="STYLESHEET" type="text/css" href="css_router.css">

<title>D-LINK SYSTEMS, INC | WIRELESS ROUTER | HOME</title>
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<script language="JavaScript" src="public.js"></script>
<script language="JavaScript">
var submit_button_flag = 0;
function onPageLoad(){
	get_by_id("apply_2nd_cgi_parameter").value = "";
	get_by_id("apply_2nd_cgi").value = "";

	var sel_time_zone = "<% CmoGetCfg("time_zone","none"); %>";
	if(sel_time_zone == "-192"){
			get_by_id("time_zone").selectedIndex = 0;
	}else if(sel_time_zone == "-176"){
			get_by_id("time_zone").selectedIndex = 1;		
	}else if(sel_time_zone == "-160"){
			get_by_id("time_zone").selectedIndex = 2;
	}else if(sel_time_zone == "-144"){
			get_by_id("time_zone").selectedIndex = 3;
	}else if(sel_time_zone == "-128"){
			get_by_id("time_zone").selectedIndex = 4;
	}else if(sel_time_zone == "-112"){
			get_by_id("time_zone").selectedIndex = 5;
	}else if(sel_time_zone == "-113"){
			get_by_id("time_zone").selectedIndex = 6;
	}else if(sel_time_zone == "-96"){
			get_by_id("time_zone").selectedIndex = 7;
	}else if(sel_time_zone == "-97"){
			get_by_id("time_zone").selectedIndex = 8;
	}else if(sel_time_zone == "-80"){
			get_by_id("time_zone").selectedIndex = 9;
	}else if(sel_time_zone == "-81"){
			get_by_id("time_zone").selectedIndex = 10;
	}else if(sel_time_zone == "-82"){
			get_by_id("time_zone").selectedIndex = 11;
	}else if(sel_time_zone == "-64"){
			get_by_id("time_zone").selectedIndex = 12;
	}else if(sel_time_zone == "-65"){
			get_by_id("time_zone").selectedIndex = 13;
	}else if(sel_time_zone == "-56"){
			get_by_id("time_zone").selectedIndex = 14;
	}else if(sel_time_zone == "-48"){
			get_by_id("time_zone").selectedIndex = 15;
	}else if(sel_time_zone == "-49"){
			get_by_id("time_zone").selectedIndex = 16;
	}else if(sel_time_zone == "-32"){
			get_by_id("time_zone").selectedIndex = 17;
	}else if(sel_time_zone == "-16"){
			get_by_id("time_zone").selectedIndex = 18;
	}else if(sel_time_zone == "0"){
			get_by_id("time_zone").selectedIndex = 19;
	}else if(sel_time_zone == "1"){
			get_by_id("time_zone").selectedIndex = 20;
	}else if(sel_time_zone == "16"){
			get_by_id("time_zone").selectedIndex = 21;
	}else if(sel_time_zone == "17"){
			get_by_id("time_zone").selectedIndex = 22;
	}else if(sel_time_zone == "18"){
			get_by_id("time_zone").selectedIndex = 23;
	}else if(sel_time_zone == "19"){
			get_by_id("time_zone").selectedIndex = 24;
	}else if(sel_time_zone == "32"){
			get_by_id("time_zone").selectedIndex = 25;
	}else if(sel_time_zone == "33"){
			get_by_id("time_zone").selectedIndex = 26;
	}else if(sel_time_zone == "48"){
			get_by_id("time_zone").selectedIndex = 27;
	}else if(sel_time_zone == "49"){
			get_by_id("time_zone").selectedIndex = 28;
	}else if(sel_time_zone == "56"){
			get_by_id("time_zone").selectedIndex = 29;
	}else if(sel_time_zone == "64"){
			get_by_id("time_zone").selectedIndex = 30;
	}else if(sel_time_zone == "72"){
			get_by_id("time_zone").selectedIndex = 31;
	}else if(sel_time_zone == "90"){
			get_by_id("time_zone").selectedIndex = 32;
	}else if(sel_time_zone == "88"){
			get_by_id("time_zone").selectedIndex = 33;
	}else if(sel_time_zone == "96"){
			get_by_id("time_zone").selectedIndex = 34;
	}else if(sel_time_zone == "112"){
			get_by_id("time_zone").selectedIndex = 35;
	}else if(sel_time_zone == "128"){
			get_by_id("time_zone").selectedIndex = 36;
	}else if(sel_time_zone == "144"){
			get_by_id("time_zone").selectedIndex = 37;
	}else if(sel_time_zone == "152"){
			get_by_id("time_zone").selectedIndex = 38;
	}else if(sel_time_zone == "160"){
			get_by_id("time_zone").selectedIndex = 39;
	}else if(sel_time_zone == "176"){
			get_by_id("time_zone").selectedIndex = 40;																					
	}else{
			get_by_id("time_zone").selectedIndex = 41;
	}
	
	var sel_time_daylight_saving_enable = "<% CmoGetCfg("time_daylight_saving_enable","none"); %>";
	var p_time_daylight_saving_enable = get_by_id("daylight_enable");
	if(sel_time_daylight_saving_enable == "1"){
			p_time_daylight_saving_enable.checked =true;
	}else{
			p_time_daylight_saving_enable.checked =false;
	}
	
	var sel_time_daylight_saving_start_month = "<% CmoGetCfg("time_daylight_saving_start_month","none"); %>";
	if(sel_time_daylight_saving_start_month == "1"){
			get_by_id("time_daylight_saving_start_month").selectedIndex = 0;		
	}else if(sel_time_daylight_saving_start_month == "2"){
			get_by_id("time_daylight_saving_start_month").selectedIndex = 1;
	}else if(sel_time_daylight_saving_start_month == "3"){
			get_by_id("time_daylight_saving_start_month").selectedIndex = 2;
	}else if(sel_time_daylight_saving_start_month == "4"){
			get_by_id("time_daylight_saving_start_month").selectedIndex = 3;
	}else if(sel_time_daylight_saving_start_month == "5"){
			get_by_id("time_daylight_saving_start_month").selectedIndex = 4;
	}else if(sel_time_daylight_saving_start_month == "6"){
			get_by_id("time_daylight_saving_start_month").selectedIndex = 5;
	}else if(sel_time_daylight_saving_start_month == "7"){
			get_by_id("time_daylight_saving_start_month").selectedIndex = 6;
	}else if(sel_time_daylight_saving_start_month == "8"){
			get_by_id("time_daylight_saving_start_month").selectedIndex = 7;
	}else if(sel_time_daylight_saving_start_month == "9"){
			get_by_id("time_daylight_saving_start_month").selectedIndex = 8;
	}else if(sel_time_daylight_saving_start_month == "10"){
			get_by_id("time_daylight_saving_start_month").selectedIndex = 9;
	}else if(sel_time_daylight_saving_start_month == "11"){
			get_by_id("time_daylight_saving_start_month").selectedIndex = 10;
	}else{
			get_by_id("time_daylight_saving_start_month").selectedIndex = 11;
	}
	
	var sel_time_daylight_saving_start_week = "<% CmoGetCfg("time_daylight_saving_start_week","none"); %>";
	if(sel_time_daylight_saving_start_week == "1"){
			get_by_id("time_daylight_saving_start_week").selectedIndex = 0;		
	}else if(sel_time_daylight_saving_start_week == "2"){
			get_by_id("time_daylight_saving_start_week").selectedIndex = 1;
	}else if(sel_time_daylight_saving_start_week == "3"){
			get_by_id("time_daylight_saving_start_week").selectedIndex = 2;
	}else if(sel_time_daylight_saving_start_week == "4"){
			get_by_id("time_daylight_saving_start_week").selectedIndex = 3;
	}else if(sel_time_daylight_saving_start_week == "5"){
			get_by_id("time_daylight_saving_start_week").selectedIndex = 4;
	}
	
	var sel_time_daylight_saving_start_day_of_week = "<% CmoGetCfg("time_daylight_saving_start_day_of_week","none"); %>";
	if(sel_time_daylight_saving_start_day_of_week == "1"){
			get_by_id("time_daylight_saving_start_day_of_week").selectedIndex = 0;		
	}else if(sel_time_daylight_saving_start_day_of_week == "2"){
			get_by_id("time_daylight_saving_start_day_of_week").selectedIndex = 1;
	}else if(sel_time_daylight_saving_start_day_of_week == "3"){
			get_by_id("time_daylight_saving_start_day_of_week").selectedIndex = 2;
	}else if(sel_time_daylight_saving_start_day_of_week == "4"){
			get_by_id("time_daylight_saving_start_day_of_week").selectedIndex = 3;
	}else if(sel_time_daylight_saving_start_day_of_week == "5"){
			get_by_id("time_daylight_saving_start_day_of_week").selectedIndex = 4;
	}else if(sel_time_daylight_saving_start_day_of_week == "6"){
			get_by_id("time_daylight_saving_start_day_of_week").selectedIndex = 5;
	}else{
			get_by_id("time_daylight_saving_start_day_of_week").selectedIndex = 6;
	}
	
	
	var sel_time_daylight_saving_start_time = "<% CmoGetCfg("time_daylight_saving_start_time","none"); %>";
	if(sel_time_daylight_saving_start_time == "0"){
			get_by_id("time_daylight_saving_start_time").selectedIndex = 0;		
	}else if(sel_time_daylight_saving_start_time == "1"){
			get_by_id("time_daylight_saving_start_time").selectedIndex = 1;
	}else if(sel_time_daylight_saving_start_time == "2"){
			get_by_id("time_daylight_saving_start_time").selectedIndex = 2;
	}else if(sel_time_daylight_saving_start_time == "3"){
			get_by_id("time_daylight_saving_start_time").selectedIndex = 3;
	}else if(sel_time_daylight_saving_start_time == "4"){
			get_by_id("time_daylight_saving_start_time").selectedIndex = 4;
	}else if(sel_time_daylight_saving_start_time == "5"){
			get_by_id("time_daylight_saving_start_time").selectedIndex = 5;
	}else if(sel_time_daylight_saving_start_time == "6"){
			get_by_id("time_daylight_saving_start_time").selectedIndex = 6;
	}else if(sel_time_daylight_saving_start_time == "7"){
			get_by_id("time_daylight_saving_start_time").selectedIndex = 7;
	}else if(sel_time_daylight_saving_start_time == "8"){
			get_by_id("time_daylight_saving_start_time").selectedIndex = 8;
	}else if(sel_time_daylight_saving_start_time == "9"){
			get_by_id("time_daylight_saving_start_time").selectedIndex = 9;
	}else if(sel_time_daylight_saving_start_time == "10"){
			get_by_id("time_daylight_saving_start_time").selectedIndex = 10;
	}else if(sel_time_daylight_saving_start_time == "11"){
			get_by_id("time_daylight_saving_start_time").selectedIndex = 11;
	}else if(sel_time_daylight_saving_start_time == "12"){
			get_by_id("time_daylight_saving_start_time").selectedIndex = 12;
	}else if(sel_time_daylight_saving_start_time == "13"){
			get_by_id("time_daylight_saving_start_time").selectedIndex = 13;
	}else if(sel_time_daylight_saving_start_time == "14"){
			get_by_id("time_daylight_saving_start_time").selectedIndex = 14;
	}else if(sel_time_daylight_saving_start_time == "15"){
			get_by_id("time_daylight_saving_start_time").selectedIndex = 15;
	}else if(sel_time_daylight_saving_start_time == "16"){
			get_by_id("time_daylight_saving_start_time").selectedIndex = 16;
	}else if(sel_time_daylight_saving_start_time == "17"){
			get_by_id("time_daylight_saving_start_time").selectedIndex = 17;
	}else if(sel_time_daylight_saving_start_time == "18"){
			get_by_id("time_daylight_saving_start_time").selectedIndex = 18;
	}else if(sel_time_daylight_saving_start_time == "19"){
			get_by_id("time_daylight_saving_start_time").selectedIndex = 19;
	}else if(sel_time_daylight_saving_start_time == "20"){
			get_by_id("time_daylight_saving_start_time").selectedIndex = 20;
	}else if(sel_time_daylight_saving_start_time == "21"){
			get_by_id("time_daylight_saving_start_time").selectedIndex = 21;
	}else if(sel_time_daylight_saving_start_time == "22"){
			get_by_id("time_daylight_saving_start_time").selectedIndex = 22;
	}else if(sel_time_daylight_saving_start_time == "23"){
			get_by_id("time_daylight_saving_start_time").selectedIndex = 23;
	}
	
	var sel_time_daylight_saving_end_month = "<% CmoGetCfg("time_daylight_saving_end_month","none"); %>";
	if(sel_time_daylight_saving_end_month == "1"){
			get_by_id("time_daylight_saving_end_month").selectedIndex = 0;		
	}else if(sel_time_daylight_saving_end_month == "2"){
			get_by_id("time_daylight_saving_end_month").selectedIndex = 1;
	}else if(sel_time_daylight_saving_end_month == "3"){
			get_by_id("time_daylight_saving_end_month").selectedIndex = 2;
	}else if(sel_time_daylight_saving_end_month == "4"){
			get_by_id("time_daylight_saving_end_month").selectedIndex = 3;
	}else if(sel_time_daylight_saving_end_month == "5"){
			get_by_id("time_daylight_saving_end_month").selectedIndex = 4;
	}else if(sel_time_daylight_saving_end_month == "6"){
			get_by_id("time_daylight_saving_end_month").selectedIndex = 5;
	}else if(sel_time_daylight_saving_end_month == "7"){
			get_by_id("time_daylight_saving_end_month").selectedIndex = 6;
	}else if(sel_time_daylight_saving_end_month == "8"){
			get_by_id("time_daylight_saving_end_month").selectedIndex = 7;
	}else if(sel_time_daylight_saving_end_month == "9"){
			get_by_id("time_daylight_saving_end_month").selectedIndex = 8;
	}else if(sel_time_daylight_saving_end_month == "10"){
			get_by_id("time_daylight_saving_end_month").selectedIndex = 9;
	}else if(sel_time_daylight_saving_end_month == "11"){
			get_by_id("time_daylight_saving_end_month").selectedIndex = 10;
	}else{
			get_by_id("time_daylight_saving_end_month").selectedIndex = 11;
	}
	
	var sel_time_daylight_saving_end_week = "<% CmoGetCfg("time_daylight_saving_end_week","none"); %>";
	if(sel_time_daylight_saving_end_week == "1"){
			get_by_id("time_daylight_saving_end_week").selectedIndex = 0;		
	}else if(sel_time_daylight_saving_end_week == "2"){
			get_by_id("time_daylight_saving_end_week").selectedIndex = 1;
	}else if(sel_time_daylight_saving_end_week == "3"){
			get_by_id("time_daylight_saving_end_week").selectedIndex = 2;
	}else if(sel_time_daylight_saving_end_week == "4"){
			get_by_id("time_daylight_saving_end_week").selectedIndex = 3;
	}else if(sel_time_daylight_saving_end_week == "5"){
			get_by_id("time_daylight_saving_end_week").selectedIndex = 4;
	}
	
	var sel_time_daylight_saving_end_day_of_week = "<% CmoGetCfg("time_daylight_saving_end_day_of_week","none"); %>";
	if(sel_time_daylight_saving_end_day_of_week == "1"){
			get_by_id("time_daylight_saving_end_day_of_week").selectedIndex = 0;		
	}else if(sel_time_daylight_saving_end_day_of_week == "2"){
			get_by_id("time_daylight_saving_end_day_of_week").selectedIndex = 1;
	}else if(sel_time_daylight_saving_end_day_of_week == "3"){
			get_by_id("time_daylight_saving_end_day_of_week").selectedIndex = 2;
	}else if(sel_time_daylight_saving_end_day_of_week == "4"){
			get_by_id("time_daylight_saving_end_day_of_week").selectedIndex = 3;
	}else if(sel_time_daylight_saving_end_day_of_week == "5"){
			get_by_id("time_daylight_saving_end_day_of_week").selectedIndex = 4;
	}else if(sel_time_daylight_saving_end_day_of_week == "6"){
			get_by_id("time_daylight_saving_end_day_of_week").selectedIndex = 5;
	}else{
			get_by_id("time_daylight_saving_end_day_of_week").selectedIndex = 6;
	}
	
	var sel_time_daylight_saving_end_time = "<% CmoGetCfg("time_daylight_saving_end_time","none"); %>";
	if(sel_time_daylight_saving_end_time == "0"){
			get_by_id("time_daylight_saving_end_time").selectedIndex = 0;		
	}else if(sel_time_daylight_saving_end_time == "1"){
			get_by_id("time_daylight_saving_end_time").selectedIndex = 1;
	}else if(sel_time_daylight_saving_end_time == "2"){
			get_by_id("time_daylight_saving_end_time").selectedIndex = 2;
	}else if(sel_time_daylight_saving_end_time == "3"){
			get_by_id("time_daylight_saving_end_time").selectedIndex = 3;
	}else if(sel_time_daylight_saving_end_time == "4"){
			get_by_id("time_daylight_saving_end_time").selectedIndex = 4;
	}else if(sel_time_daylight_saving_end_time == "5"){
			get_by_id("time_daylight_saving_end_time").selectedIndex = 5;
	}else if(sel_time_daylight_saving_end_time == "6"){
			get_by_id("time_daylight_saving_end_time").selectedIndex = 6;
	}else if(sel_time_daylight_saving_end_time == "7"){
			get_by_id("time_daylight_saving_end_time").selectedIndex = 7;
	}else if(sel_time_daylight_saving_end_time == "8"){
			get_by_id("time_daylight_saving_end_time").selectedIndex = 8;
	}else if(sel_time_daylight_saving_end_time == "9"){
			get_by_id("time_daylight_saving_end_time").selectedIndex = 9;
	}else if(sel_time_daylight_saving_end_time == "10"){
			get_by_id("time_daylight_saving_end_time").selectedIndex = 10;
	}else if(sel_time_daylight_saving_end_time == "11"){
			get_by_id("time_daylight_saving_end_time").selectedIndex = 11;
	}else if(sel_time_daylight_saving_end_time == "12"){
			get_by_id("time_daylight_saving_end_time").selectedIndex = 12;
	}else if(sel_time_daylight_saving_end_time == "13"){
			get_by_id("time_daylight_saving_end_time").selectedIndex = 13;
	}else if(sel_time_daylight_saving_end_time == "14"){
			get_by_id("time_daylight_saving_end_time").selectedIndex = 14;
	}else if(sel_time_daylight_saving_end_time == "15"){
			get_by_id("time_daylight_saving_end_time").selectedIndex = 15;
	}else if(sel_time_daylight_saving_end_time == "16"){
			get_by_id("time_daylight_saving_end_time").selectedIndex = 16;
	}else if(sel_time_daylight_saving_end_time == "17"){
			get_by_id("time_daylight_saving_end_time").selectedIndex = 17;
	}else if(sel_time_daylight_saving_end_time == "18"){
			get_by_id("time_daylight_saving_end_time").selectedIndex = 18;
	}else if(sel_time_daylight_saving_end_time == "19"){
			get_by_id("time_daylight_saving_end_time").selectedIndex = 19;
	}else if(sel_time_daylight_saving_end_time == "20"){
			get_by_id("time_daylight_saving_end_time").selectedIndex = 20;
	}else if(sel_time_daylight_saving_end_time == "21"){
			get_by_id("time_daylight_saving_end_time").selectedIndex = 21;
	}else if(sel_time_daylight_saving_end_time == "22"){
			get_by_id("time_daylight_saving_end_time").selectedIndex = 22;
	}else if(sel_time_daylight_saving_end_time == "23"){
			get_by_id("time_daylight_saving_end_time").selectedIndex = 23;
	}
	
	var sel_ntp_client_enable = "<% CmoGetCfg("ntp_client_enable","none"); %>";
	var p_ntp_client_enable = get_by_id("ntp_enable");
	if(sel_ntp_client_enable == "1"){
			p_ntp_client_enable.checked =true;
	}else{
			p_ntp_client_enable.checked =false;
	}
/*	
	var sel_ntp_sync_interval = "<% CmoGetCfg("ntp_sync_interval","none"); %>";
	if(sel_ntp_sync_interval == "1"){
			get_by_id("ntp_sync_interval").selectedIndex = 0;		
	}else if(sel_ntp_sync_interval == "4"){
			get_by_id("ntp_sync_interval").selectedIndex = 1;
	}else if(sel_ntp_sync_interval == "8"){
			get_by_id("ntp_sync_interval").selectedIndex = 2;
	}else if(sel_ntp_sync_interval == "12"){
			get_by_id("ntp_sync_interval").selectedIndex = 3;
	}else if(sel_ntp_sync_interval == "24"){
			get_by_id("ntp_sync_interval").selectedIndex = 4;
	}else if(sel_ntp_sync_interval == "48"){
			get_by_id("ntp_sync_interval").selectedIndex = 5;
	}else{
			get_by_id("ntp_sync_interval").selectedIndex = 6;
	}
*/
	
	
	var temp_time = get_by_id("system_time").value;
	var Dtime = temp_time.split("/");
	if(Dtime[0] == "2002"){
			get_by_id("year").selectedIndex = 0;		
	}else if(Dtime[0] == "2003"){
			get_by_id("year").selectedIndex = 1;
	}else if(Dtime[0] == "2004"){
			get_by_id("year").selectedIndex = 2;
	}else if(Dtime[0] == "2005"){
			get_by_id("year").selectedIndex = 3;
	}else if(Dtime[0] == "2006"){
			get_by_id("year").selectedIndex = 4;
	}else if(Dtime[0] == "2007"){
			get_by_id("year").selectedIndex = 5;
	}else if(Dtime[0] == "2008"){
			get_by_id("year").selectedIndex = 6;
	}else if(Dtime[0] == "2009"){
			get_by_id("year").selectedIndex = 7;
	}else if(Dtime[0] == "2010"){
			get_by_id("year").selectedIndex = 8;
	}else if(Dtime[0] == "2011"){
			get_by_id("year").selectedIndex = 9;
	}else{
			get_by_id("year").selectedIndex = 10;		
	}
	
	if(Dtime[1] == "1"){
			get_by_id("mon").selectedIndex = 0;		
	}else if(Dtime[1] == "2"){
			get_by_id("mon").selectedIndex = 1;
	}else if(Dtime[1] == "3"){
			get_by_id("mon").selectedIndex = 2;
	}else if(Dtime[1] == "4"){
			get_by_id("mon").selectedIndex = 3;
	}else if(Dtime[1] == "5"){
			get_by_id("mon").selectedIndex = 4;
	}else if(Dtime[1] == "6"){
			get_by_id("mon").selectedIndex = 5;
	}else if(Dtime[1] == "7"){
			get_by_id("mon").selectedIndex = 6;
	}else if(Dtime[1] == "8"){
			get_by_id("mon").selectedIndex = 7;
	}else if(Dtime[1] == "9"){
			get_by_id("mon").selectedIndex = 8;
	}else if(Dtime[1] == "10"){
			get_by_id("mon").selectedIndex = 9;
	}else if(Dtime[1] == "11"){
			get_by_id("mon").selectedIndex = 10;
	}else{
			get_by_id("mon").selectedIndex = 11;
	}
	
	if(Dtime[2] == "1"){
			get_by_id("day").selectedIndex = 0;		
	}else if(Dtime[2] == "2"){
			get_by_id("day").selectedIndex = 1;
	}else if(Dtime[2] == "3"){
			get_by_id("day").selectedIndex = 2;
	}else if(Dtime[2] == "4"){
			get_by_id("day").selectedIndex = 3;
	}else if(Dtime[2] == "5"){
			get_by_id("day").selectedIndex = 4;
	}else if(Dtime[2] == "6"){
			get_by_id("day").selectedIndex = 5;
	}else if(Dtime[2] == "7"){
			get_by_id("day").selectedIndex = 6;
	}else if(Dtime[2] == "8"){
			get_by_id("day").selectedIndex = 7;
	}else if(Dtime[2] == "9"){
			get_by_id("day").selectedIndex = 8;
	}else if(Dtime[2] == "10"){
			get_by_id("day").selectedIndex = 9;
	}else if(Dtime[2] == "11"){
			get_by_id("day").selectedIndex = 10;
	}else if(Dtime[2] == "12"){
			get_by_id("day").selectedIndex = 11;
	}else if(Dtime[2] == "13"){
			get_by_id("day").selectedIndex = 12;
	}else if(Dtime[2] == "14"){
			get_by_id("day").selectedIndex = 13;
	}else if(Dtime[2] == "15"){
			get_by_id("day").selectedIndex = 14;
	}else if(Dtime[2] == "16"){
			get_by_id("day").selectedIndex = 15;
	}else if(Dtime[2] == "17"){
			get_by_id("day").selectedIndex = 16;
	}else if(Dtime[2] == "18"){
			get_by_id("day").selectedIndex = 17;
	}else if(Dtime[2] == "19"){
			get_by_id("day").selectedIndex = 18;
	}else if(Dtime[2] == "20"){
			get_by_id("day").selectedIndex = 19;
	}else if(Dtime[2] == "21"){
			get_by_id("day").selectedIndex = 20;
	}else if(Dtime[2] == "22"){
			get_by_id("day").selectedIndex = 21;
	}else if(Dtime[2] == "23"){
			get_by_id("day").selectedIndex = 22;
	}else if(Dtime[2] == "24"){
			get_by_id("day").selectedIndex = 23;
	}else if(Dtime[2] == "25"){
			get_by_id("day").selectedIndex = 24;
	}else if(Dtime[2] == "26"){
			get_by_id("day").selectedIndex = 25;
	}else if(Dtime[2] == "27"){
			get_by_id("day").selectedIndex = 26;
	}else if(Dtime[2] == "28"){
			get_by_id("day").selectedIndex = 27;
	}else if(Dtime[2] == "29"){
			get_by_id("day").selectedIndex = 28;
	}else if(Dtime[2] == "30"){
			get_by_id("day").selectedIndex = 29;				
	}else{
			get_by_id("day").selectedIndex = 30;
	}
	
	if(Dtime[3] == "00"){
			get_by_id("hour").selectedIndex = 0;
			get_by_id("ampm").selectedIndex = 0;		
	}else if(Dtime[3] == "01"){
			get_by_id("hour").selectedIndex = 1;
			get_by_id("ampm").selectedIndex = 0;
	}else if(Dtime[3] == "02"){
			get_by_id("hour").selectedIndex = 2;
			get_by_id("ampm").selectedIndex = 0;
	}else if(Dtime[3] == "03"){
			get_by_id("hour").selectedIndex = 3;
			get_by_id("ampm").selectedIndex = 0;
	}else if(Dtime[3] == "04"){
			get_by_id("hour").selectedIndex = 4;
			get_by_id("ampm").selectedIndex = 0;
	}else if(Dtime[3] == "05"){
			get_by_id("hour").selectedIndex = 5;
			get_by_id("ampm").selectedIndex = 0;
	}else if(Dtime[3] == "06"){
			get_by_id("hour").selectedIndex = 6;
			get_by_id("ampm").selectedIndex = 0;
	}else if(Dtime[3] == "07"){
			get_by_id("hour").selectedIndex = 7;
			get_by_id("ampm").selectedIndex = 0;
	}else if(Dtime[3] == "08"){
			get_by_id("hour").selectedIndex = 8;
			get_by_id("ampm").selectedIndex = 0;
	}else if(Dtime[3] == "09"){
			get_by_id("hour").selectedIndex = 9;
			get_by_id("ampm").selectedIndex = 0;
	}else if(Dtime[3] == "10"){
			get_by_id("hour").selectedIndex = 10;
			get_by_id("ampm").selectedIndex = 0;
	}else if(Dtime[3] == "11"){
			get_by_id("hour").selectedIndex = 11;
			get_by_id("ampm").selectedIndex = 0;
	}else if(Dtime[3] == "12"){
			get_by_id("hour").selectedIndex = 0;
			get_by_id("ampm").selectedIndex = 1;
	}else if(Dtime[3] == "13"){
			get_by_id("hour").selectedIndex = 1;
			get_by_id("ampm").selectedIndex = 1;
	}else if(Dtime[3] == "14"){
			get_by_id("hour").selectedIndex = 2;
			get_by_id("ampm").selectedIndex = 1;
	}else if(Dtime[3] == "15"){
			get_by_id("hour").selectedIndex = 3;
			get_by_id("ampm").selectedIndex = 1;
	}else if(Dtime[3] == "16"){
			get_by_id("hour").selectedIndex = 4;
			get_by_id("ampm").selectedIndex = 1;
	}else if(Dtime[3] == "17"){
			get_by_id("hour").selectedIndex = 5;
			get_by_id("ampm").selectedIndex = 1;
	}else if(Dtime[3] == "18"){
			get_by_id("hour").selectedIndex = 6;
			get_by_id("ampm").selectedIndex = 1;
	}else if(Dtime[3] == "19"){
			get_by_id("hour").selectedIndex = 7;
			get_by_id("ampm").selectedIndex = 1;
	}else if(Dtime[3] == "20"){
			get_by_id("hour").selectedIndex = 8;
			get_by_id("ampm").selectedIndex = 1;
	}else if(Dtime[3] == "21"){
			get_by_id("hour").selectedIndex = 9;
			get_by_id("ampm").selectedIndex = 1;
	}else if(Dtime[3] == "22"){
			get_by_id("hour").selectedIndex = 10;
			get_by_id("ampm").selectedIndex = 1;
	}else if(Dtime[3] == "23"){
			get_by_id("hour").selectedIndex = 11;
			get_by_id("ampm").selectedIndex = 1;
	}
	
	if(Dtime[4] == "00"){
			get_by_id("min").selectedIndex = 0;		
	}else if(Dtime[4] == "01"){
			get_by_id("min").selectedIndex = 1;
	}else if(Dtime[4] == "02"){
			get_by_id("min").selectedIndex = 2;
	}else if(Dtime[4] == "03"){
			get_by_id("min").selectedIndex = 3;
	}else if(Dtime[4] == "04"){
			get_by_id("min").selectedIndex = 4;
	}else if(Dtime[4] == "05"){
			get_by_id("min").selectedIndex = 5;
	}else if(Dtime[4] == "06"){
			get_by_id("min").selectedIndex = 6;
	}else if(Dtime[4] == "07"){
			get_by_id("min").selectedIndex = 7;
	}else if(Dtime[4] == "08"){
			get_by_id("min").selectedIndex = 8;
	}else if(Dtime[4] == "09"){
			get_by_id("min").selectedIndex = 9;
	}else if(Dtime[4] == "10"){
			get_by_id("min").selectedIndex = 10;
	}else if(Dtime[4] == "11"){
			get_by_id("min").selectedIndex = 11;
	}else if(Dtime[4] == "12"){
			get_by_id("min").selectedIndex = 12;
	}else if(Dtime[4] == "13"){
			get_by_id("min").selectedIndex = 13;
	}else if(Dtime[4] == "14"){
			get_by_id("min").selectedIndex = 14;
	}else if(Dtime[4] == "15"){
			get_by_id("min").selectedIndex = 15;
	}else if(Dtime[4] == "16"){
			get_by_id("min").selectedIndex = 16;
	}else if(Dtime[4] == "17"){
			get_by_id("min").selectedIndex = 17;
	}else if(Dtime[4] == "18"){
			get_by_id("min").selectedIndex = 18;
	}else if(Dtime[4] == "19"){
			get_by_id("min").selectedIndex = 19;
	}else if(Dtime[4] == "20"){
			get_by_id("min").selectedIndex = 20;
	}else if(Dtime[4] == "21"){
			get_by_id("min").selectedIndex = 21;
	}else if(Dtime[4] == "22"){
			get_by_id("min").selectedIndex = 22;
	}else if(Dtime[4] == "23"){
			get_by_id("min").selectedIndex = 23;
	}else if(Dtime[4] == "24"){
			get_by_id("min").selectedIndex = 24;
	}else if(Dtime[4] == "25"){
			get_by_id("min").selectedIndex = 25;
	}else if(Dtime[4] == "26"){
			get_by_id("min").selectedIndex = 26;
	}else if(Dtime[4] == "27"){
			get_by_id("min").selectedIndex = 27;
	}else if(Dtime[4] == "28"){
			get_by_id("min").selectedIndex = 28;
	}else if(Dtime[4] == "29"){
			get_by_id("min").selectedIndex = 29;
	}else if(Dtime[4] == "30"){
			get_by_id("min").selectedIndex = 30;
	}else if(Dtime[4] == "31"){
			get_by_id("min").selectedIndex = 31;
	}else if(Dtime[4] == "32"){
			get_by_id("min").selectedIndex = 32;
	}else if(Dtime[4] == "33"){
			get_by_id("min").selectedIndex = 33;
	}else if(Dtime[4] == "34"){
			get_by_id("min").selectedIndex = 34;
	}else if(Dtime[4] == "35"){
			get_by_id("min").selectedIndex = 35;
	}else if(Dtime[4] == "36"){
			get_by_id("min").selectedIndex = 36;
	}else if(Dtime[4] == "37"){
			get_by_id("min").selectedIndex = 37;
	}else if(Dtime[4] == "38"){
			get_by_id("min").selectedIndex = 38;
	}else if(Dtime[4] == "39"){
			get_by_id("min").selectedIndex = 39;
	}else if(Dtime[4] == "40"){
			get_by_id("min").selectedIndex = 40;
	}else if(Dtime[4] == "41"){
			get_by_id("min").selectedIndex = 41;
	}else if(Dtime[4] == "42"){
			get_by_id("min").selectedIndex = 42;
	}else if(Dtime[4] == "43"){
			get_by_id("min").selectedIndex = 43;
	}else if(Dtime[4] == "44"){
			get_by_id("min").selectedIndex = 44;
	}else if(Dtime[4] == "45"){
			get_by_id("min").selectedIndex = 45;
	}else if(Dtime[4] == "46"){
			get_by_id("min").selectedIndex = 46;
	}else if(Dtime[4] == "47"){
			get_by_id("min").selectedIndex = 47;
	}else if(Dtime[4] == "48"){
			get_by_id("min").selectedIndex = 48;
	}else if(Dtime[4] == "49"){
			get_by_id("min").selectedIndex = 49;
	}else if(Dtime[4] == "50"){
			get_by_id("min").selectedIndex = 50;
	}else if(Dtime[4] == "51"){
			get_by_id("min").selectedIndex = 51;
	}else if(Dtime[4] == "52"){
			get_by_id("min").selectedIndex = 52;
	}else if(Dtime[4] == "53"){
			get_by_id("min").selectedIndex = 53;
	}else if(Dtime[4] == "54"){
			get_by_id("min").selectedIndex = 54;
	}else if(Dtime[4] == "55"){
			get_by_id("min").selectedIndex = 55;
	}else if(Dtime[4] == "56"){
			get_by_id("min").selectedIndex = 56;
	}else if(Dtime[4] == "57"){
			get_by_id("min").selectedIndex = 57;
	}else if(Dtime[4] == "58"){
			get_by_id("min").selectedIndex = 58;
	}else{
			get_by_id("min").selectedIndex = 59;		
	}
	
	if(Dtime[5] == "00"){
			get_by_id("sec").selectedIndex = 0;		
	}else if(Dtime[5] == "01"){
			get_by_id("sec").selectedIndex = 1;
	}else if(Dtime[5] == "02"){
			get_by_id("sec").selectedIndex = 2;
	}else if(Dtime[5] == "03"){
			get_by_id("sec").selectedIndex = 3;
	}else if(Dtime[5] == "04"){
			get_by_id("sec").selectedIndex = 4;
	}else if(Dtime[5] == "05"){
			get_by_id("sec").selectedIndex = 5;
	}else if(Dtime[5] == "06"){
			get_by_id("sec").selectedIndex = 6;
	}else if(Dtime[5] == "07"){
			get_by_id("sec").selectedIndex = 7;
	}else if(Dtime[5] == "08"){
			get_by_id("sec").selectedIndex = 8;
	}else if(Dtime[5] == "09"){
			get_by_id("sec").selectedIndex = 9;
	}else if(Dtime[5] == "10"){
			get_by_id("sec").selectedIndex = 10;
	}else if(Dtime[5] == "11"){
			get_by_id("sec").selectedIndex = 11;
	}else if(Dtime[5] == "12"){
			get_by_id("sec").selectedIndex = 12;
	}else if(Dtime[5] == "13"){
			get_by_id("sec").selectedIndex = 13;
	}else if(Dtime[5] == "14"){
			get_by_id("sec").selectedIndex = 14;
	}else if(Dtime[5] == "15"){
			get_by_id("sec").selectedIndex = 15;
	}else if(Dtime[5] == "16"){
			get_by_id("sec").selectedIndex = 16;
	}else if(Dtime[5] == "17"){
			get_by_id("sec").selectedIndex = 17;
	}else if(Dtime[5] == "18"){
			get_by_id("sec").selectedIndex = 18;
	}else if(Dtime[5] == "19"){
			get_by_id("sec").selectedIndex = 19;
	}else if(Dtime[5] == "20"){
			get_by_id("sec").selectedIndex = 20;
	}else if(Dtime[5] == "21"){
			get_by_id("sec").selectedIndex = 21;
	}else if(Dtime[5] == "22"){
			get_by_id("sec").selectedIndex = 22;
	}else if(Dtime[5] == "23"){
			get_by_id("sec").selectedIndex = 23;
	}else if(Dtime[5] == "24"){
			get_by_id("sec").selectedIndex = 24;
	}else if(Dtime[5] == "25"){
			get_by_id("sec").selectedIndex = 25;
	}else if(Dtime[5] == "26"){
			get_by_id("sec").selectedIndex = 26;
	}else if(Dtime[5] == "27"){
			get_by_id("sec").selectedIndex = 27;
	}else if(Dtime[5] == "28"){
			get_by_id("sec").selectedIndex = 28;
	}else if(Dtime[5] == "29"){
			get_by_id("sec").selectedIndex = 29;
	}else if(Dtime[5] == "30"){
			get_by_id("sec").selectedIndex = 30;
	}else if(Dtime[5] == "31"){
			get_by_id("sec").selectedIndex = 31;
	}else if(Dtime[5] == "32"){
			get_by_id("sec").selectedIndex = 32;
	}else if(Dtime[5] == "33"){
			get_by_id("sec").selectedIndex = 33;
	}else if(Dtime[5] == "34"){
			get_by_id("sec").selectedIndex = 34;
	}else if(Dtime[5] == "35"){
			get_by_id("sec").selectedIndex = 35;
	}else if(Dtime[5] == "36"){
			get_by_id("sec").selectedIndex = 36;
	}else if(Dtime[5] == "37"){
			get_by_id("sec").selectedIndex = 37;
	}else if(Dtime[5] == "38"){
			get_by_id("sec").selectedIndex = 38;
	}else if(Dtime[5] == "39"){
			get_by_id("sec").selectedIndex = 39;
	}else if(Dtime[5] == "40"){
			get_by_id("sec").selectedIndex = 40;
	}else if(Dtime[5] == "41"){
			get_by_id("sec").selectedIndex = 41;
	}else if(Dtime[5] == "42"){
			get_by_id("sec").selectedIndex = 42;
	}else if(Dtime[5] == "43"){
			get_by_id("sec").selectedIndex = 43;
	}else if(Dtime[5] == "44"){
			get_by_id("sec").selectedIndex = 44;
	}else if(Dtime[5] == "45"){
			get_by_id("sec").selectedIndex = 45;
	}else if(Dtime[5] == "46"){
			get_by_id("sec").selectedIndex = 46;
	}else if(Dtime[5] == "47"){
			get_by_id("sec").selectedIndex = 47;
	}else if(Dtime[5] == "48"){
			get_by_id("sec").selectedIndex = 48;
	}else if(Dtime[5] == "49"){
			get_by_id("sec").selectedIndex = 49;
	}else if(Dtime[5] == "50"){
			get_by_id("sec").selectedIndex = 50;
	}else if(Dtime[5] == "51"){
			get_by_id("sec").selectedIndex = 51;
	}else if(Dtime[5] == "52"){
			get_by_id("sec").selectedIndex = 52;
	}else if(Dtime[5] == "53"){
			get_by_id("sec").selectedIndex = 53;
	}else if(Dtime[5] == "54"){
			get_by_id("sec").selectedIndex = 54;
	}else if(Dtime[5] == "55"){
			get_by_id("sec").selectedIndex = 55;
	}else if(Dtime[5] == "56"){
			get_by_id("sec").selectedIndex = 56;
	}else if(Dtime[5] == "57"){
			get_by_id("sec").selectedIndex = 57;
	}else if(Dtime[5] == "58"){
			get_by_id("sec").selectedIndex = 58;
	}else{
			get_by_id("sec").selectedIndex = 59;		
	}
	
	
	
}


	function show_time(){
		var time_type = get_by_id("ntp_enable");
		var is_disable = true;
		
		if (time_type.checked){
			is_disable = false;
		}
		
		get_by_id("ntp_server").disabled = is_disable;
		get_by_id("ntp_btn").disabled = is_disable;		        
		get_by_id("page_ntp_servers").disabled = is_disable;	
        //get_by_id("ntp_sync_interval").disabled = is_disable;
		get_by_id("year").disabled = !is_disable;
		get_by_id("mon").disabled = !is_disable;
		get_by_id("day").disabled = !is_disable;
		get_by_id("hour").disabled =!is_disable;
		get_by_id("min").disabled = !is_disable;
		get_by_id("sec").disabled = !is_disable;
		get_by_id("set").disabled = !is_disable;
		get_by_id("ampm").disabled = !is_disable; 
		
		get_by_id("daylight_enable").disabled = is_disable;
		show_daylight();
	}
	
	function show_daylight(){
		var daylight = get_by_id("daylight_enable");
		var time_type = get_by_id("ntp_enable");
		var is_disable = true;
		
		if (daylight.checked && time_type.checked){
			is_disable = false;
		}
		
		get_by_id("time_daylight_saving_start_month").disabled = is_disable;
		get_by_id("time_daylight_saving_start_week").disabled = is_disable;
		get_by_id("time_daylight_saving_start_day_of_week").disabled = is_disable;
		get_by_id("time_daylight_saving_start_time").disabled = is_disable;
		get_by_id("time_daylight_saving_end_month").disabled = is_disable;
		get_by_id("time_daylight_saving_end_week").disabled = is_disable;		
		get_by_id("time_daylight_saving_end_day_of_week").disabled = is_disable;
		get_by_id("time_daylight_saving_end_time").disabled = is_disable;
	}
	
	function copy_ntp_server(){
		if (get_by_id("page_ntp_servers").selectedIndex > 0){
			get_by_id("ntp_server").value = get_by_id("page_ntp_servers").value;
		}
	}
		
	function set_time(){
		var date = new Date();
		var year = get_by_id("year");
		var temp_hour = date.getHours();
		var time_type = 0;
		
		for(var i = 0; i < year.options.length; i++){
			if (year.options[i].value == date.getFullYear()){
				year.selectedIndex = i;
				break;
			}
		}
		
		if (temp_hour > 11){
			temp_hour -= 12;
			time_type = 1;
		}
		
		get_by_id("mon").selectedIndex = date.getMonth();
		get_by_id("day").selectedIndex = date.getDate() - 1;
		get_by_id("hour").selectedIndex = temp_hour; 
		get_by_id("min").selectedIndex = date.getMinutes(); 
		get_by_id("sec").selectedIndex = date.getSeconds();
		get_by_id("ampm").selectedIndex = time_type;
	}
	
	function send_request(){
		var daylight_enable = get_by_id("daylight_enable");
	
		if (daylight_enable.checked==true){						
			get_by_id("time_daylight_saving_enable").value = "1";
		}else{		
			get_by_id("time_daylight_saving_enable").value = "0";
		}
	
		var ntp_enable = get_by_id("ntp_enable");
	
		if (ntp_enable.checked==true){						
			get_by_id("ntp_client_enable").value = "1";
		}else{		
			get_by_id("ntp_client_enable").value = "0";
		}
	
		var time_type = get_by_id("ntp_enable");
		if (time_type.checked== false){
			var year = get_by_id("year").value;
			var mon = get_by_id("mon").value;
			var day = get_by_id("day").value;
			
			if(get_by_id("ampm").value==1){
				var hour = parseInt(get_by_id("hour").value) + 12;
			}else{
				var hour = get_by_id("hour").value;
			}
			
			var minu = get_by_id("min").value;
			var sec = get_by_id("sec").value;
			
			var dat =year +"/"+ mon +"/"+ day +"/"+ hour +"/"+ minu +"/"+ sec;
			get_by_id("system_time").value = dat;		
			
			get_by_id("apply_2nd_cgi_parameter").value = dat;
			get_by_id("apply_2nd_cgi").value = "system_time.cgi";	
		}else{
			if(get_by_id("ntp_server").value == ""){
				alert("Please enter NTP Server");
				return false;
			}
		}
		
		
		if(submit_button_flag == 0){
		submit_button_flag = 1;
		return true;
		}else{
		return false;
		}
		//return true;
	}
	
</script>

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
			<td id="topnavon"><a href="tools_admin.asp">Tools</a></td>
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
							<!-- === BEGIN SIDENAV === -->
								<ul>
									<li><div><a href="tools_admin.asp">Admin</a></div></li>
									<li><div id="sidenavoff">Time</div></li>
									<li><div><a href="tools_system.asp">System</a></div></li>
									<li><div><a href="tools_firmw.asp">Firmware</a></div></li>
									<li><div><a href="tools_ddns.asp">DDNS</a></div></li>
								    <li><div><a href="tools_vct.asp">SYSTEM CHECK</a></div></li>
<li><div><a href="tools_schedules.asp">SCHEDULES</a></div></li>
							      <li><div><a href="st_log_settings.asp">Log settings</a></div></li>
								</ul>
								<!-- === END SIDENAV === -->
							</div>
						</td>			
					</tr>
				</table>			
			</td>
<form id="form1" name="form1" method="post" action=apply.cgi>
<input type="hidden" name="html_response_page" value="back.asp">
<input type="hidden" name="html_response_message" value="The setting is saved.">
<input type="hidden" name="html_response_return_page" value="tools_time.asp">

<input type="hidden" id="apply_2nd_cgi" name="apply_2nd_cgi" value="">
<input type="hidden" id="apply_2nd_cgi_parameter" name="apply_2nd_cgi_parameter" value="">
<input type="hidden" id="system_time" name="system_time" value="<% CmoGetStatus("system_time"); %>">

			<td valign="top" id="maincontent_container">
				<div id=maincontent>
                  <div id=box_header>
                      <h1>Time</h1>
                      <h4>Time Configuration</h4>                    
                      <p>The Time Configuration option allows you to configure, update, and maintain the correct time on the internal system clock. From this section you can set the time zone that you are in and set the NTP (Network Time Protocol) Server. Daylight Saving can also be configured to automatically adjust the time when needed.
                      </p>
                    <input name="button" type="submit" class=button_submit value="Save Settings" onClick="return send_request()">                    
                    <input name="button2" type=button class=button_submit value="Don't Save Settings"  onClick="window.location.href='tools_time.asp'">
                  </div>
                    <div class=box>
                      <h2>Time Configuration</h2>
                     
                      <table width="525" class=formarea >
                        <tr>
                          <td width="150" height="20" class=form_label><div align="right">Current Router Time :<br>
                          </div></td>
                          <td width="367">&nbsp;<strong>
						  <script>
							var temp_entry ="<% CmoGetStatus("system_time"); %>";
							var entry = temp_entry.split("/");
							var v_mon="";
							if(entry[1]=="1"){
								v_mon = "Jan";
							}else if(entry[1]=="2"){
								v_mon = "Feb";
							}else if(entry[1]=="3"){
								v_mon = "Mar";
							}else if(entry[1]=="4"){
								v_mon = "Apr";
							}else if(entry[1]=="5"){
								v_mon = "May";
							}else if(entry[1]=="6"){
								v_mon = "Jun";
							}else if(entry[1]=="7"){
								v_mon = "Jul";
							}else if(entry[1]=="8"){
								v_mon = "Aug";
							}else if(entry[1]=="9"){
								v_mon = "Sep";
							}else if(entry[1]=="10"){
								v_mon = "Oct";
							}else if(entry[1]=="11"){
								v_mon = "Nov";
							}else if(entry[1]=="12"){
								v_mon = "Dec";
							}else{
								v_mon = "";
							}
									document.write(v_mon + "/" + entry[2] + "/" + entry[0] + " " + entry[3] + ":" + entry[4] + ":" + entry[5]);
							
						</script>
							
                          
						  
						  </strong> </td>
                        </tr>
                        <tr>
                          <td height="20" class=form_label>
                            <div align="right">Time Zone : </div></td>
                          <td><span class="form_label">&nbsp;
                            <select name="time_zone" size=1 id="time_zone">
                              <option value=-192>(GMT-12:00) Eniwetok, Kwajalein</option>
                              <option value=-176>(GMT-11:00) Midway Island, Samoa</option>
                              <option value=-160>(GMT-10:00) Hawaii</option>
                              <option value=-144>(GMT-09:00) Alaska</option>
                              <option value=-128>(GMT-08:00) Pacific Time (US &amp; Canada)</option>
                              <option value=-112>(GMT-07:00) Arizona</option>
                              <option value=-113>(GMT-07:00) Mountain Time (US &amp; Canada)</option>
                              <option value=-96>(GMT-06:00) Central Time (US &amp; Canada)</option>
                              <option value=-97>(GMT-06:00) Mexico City, Tegucigalpa</option>
                              <option value=-80>(GMT-05:00) Bogota, Lima, Quito</option>
                              <option value=-81>(GMT-05:00) Eastern Time (US &amp; Canada)</option>
                              <option value=-82>(GMT-05:00) Indiana (East)</option>
                              <option value=-64>(GMT-04:00) Atlantic Time (US &amp; Canada)</option>
                              <option value=-65>(GMT-04:00) Caracas, La Paz</option>
                              <option value=-56>(GMT-03:30) Newfoundland</option>
                              <option value=-48>(GMT-03:00) Brasilia</option>
                              <option value=-49>(GMT-03:00) Buenos Aires, Georgetown</option>
                              <option value=-32>(GMT-02:00) Mid-Atlantic</option>
                              <option value=-16>(GMT-01:00) Azores, Cape Verde Is.</option>
                              <option value=0>(GMT) Casablanca, Monrovia</option>
                              <option value=1>(GMT) Dublin, Edinburgh, Lisbon, London</option>
                              <option value=16>(GMT+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna</option>
                              <option value=17>(GMT+01:00) Belgrade, Bratislave, Budapest, Ljubljana, Prague</option>
                              <option value=18>(GMT+01:00) Brussels, Copenhagen, Madrid, Paris, Vilnius</option>
                              <option value=19>(GMT+01:00) Sarajevo, Skopje, Sofija, Warsaw, Zagreb</option>
                              <option value=32>(GMT+02:00) Athens, Bucharest, Cairo, Istanbul, Minsk</option>
                              <option value=33>(GMT+02:00) Harare, Helsinki, Jerusalem, Pretoria, Riga, Tallinn</option>
                              <option value=48>(GMT+03:00) Baghdad, Kuwait, Riyadh</option>
                              <option value=49>(GMT+03:00) Moscow, St.Petersburg, Volgograd</option>
                              <option value=56>(GMT+03:30) Tehran</option>
                              <option value=64>(GMT+04:00) Abu Dhabi, Baku, Muscat, Tbilist</option>
                              <option value=72>(GMT+04:30) Kabul</option>
                              <option value=90>(GMT+05:00) EKaterinburg, Islamabad, Karachi, Tashikent</option>
                              <option value=88>(GMT+05:30) New Delhi</option>
                              <option value=96>(GMT+06:00) Astana, Almaty, Colombo, Dhaka</option>
                              <option value=112>(GMT+07:00) Bangkok, Hanoi, Jakarta</option>
                              <option value=128>(GMT+08:00) Beijing, Hong Kong, Singapore, Taipei</option>
                              <option value=144>(GMT+09:00) Seoul, Tokyo, Yakutsk</option>
                              <option value=152>(GMT+09:30) Adelaide, Darwin</option>
                              <option value=160>(GMT+10:00) Canberra, Guam, Port Moresby, Vladivostok</option>
                              <option value=176>(GMT+11:00) Magadan, Solomon Islands</option>
                              <option value=192>(GMT+12:00) Fiji, Kamchatka, Marshall Islands, Willington</option>
                            </select>
                          </span></td>
                        </tr>
                        <tbody>
                          <tr>
                            <td height="33" class=form_label><div align="right">Enable Daylight Saving&nbsp;:</div></td>
                            <td valign="middle">
                              <table>
                                <tbody>
                                  <tr>
                                    <td width=130 height="25">
									
									<input name="daylight_enable" type=checkbox id="daylight_enable" value="1" onClick="show_daylight()">
									<input type="hidden" id="time_daylight_saving_enable" name="time_daylight_saving_enable" value="<% CmoGetCfg("time_daylight_saving_enable","none"); %>">
									</td>
                                    <td colSpan=3>&nbsp;                                    </td>
                                  </tr>
                                 <!-- <tr>
                                    <td width=130 height="26">Daylight Saving Offset</td>
                                    <td colSpan=3><select name="offset" id="offset">
                                        <option value=-7200 
                          selected>-2:00</option>
                                        <option 
                          value=-5400>-1:30</option>
                                        <option 
                          value=-3600>-1:00</option>
                                        <option 
                          value=-1800>-0:30</option>
                                        <option 
                          value=1800>+0:30</option>
                                        <option 
                          value=3600>+1:00</option>
                                        <option 
                          value=5400>+1:30</option>
                                        <option 
                          value=7200>+2:00</option>
                                      </select>
                                    </td>
                                  </tr>-->
                                </tbody>
                            </table>                            </td>
                          </tr>
                          <tr>
                            <td height="80"></td>
                            <td>
                              <table cellSpacing=0 cellPadding=2 border=0>
                                <tbody>
                                  <tr>
                                    <td></td>
                                    <td>Month</td>
                                    <td>Week</td>
                                    <td>Day of Week</td>
                                    <td>Time</td>
                                  </tr>
                                  <tr>
                                    <td height="34">DST Start&nbsp;</td>
                                    <td><select id="time_daylight_saving_start_month" name="time_daylight_saving_start_month" size=1 style="WIDTH: 50px">
                                      <option value=1>Jan</option>
                                      <option value=2>Feb</option>
                                      <option value=3>Mar</option>
                                      <option value=4>Apr</option>
                                      <option value=5>May</option>
                                      <option value=6>Jun</option>
                                      <option value=7>Jul</option>
                                      <option value=8>Aug</option>
                                      <option value=9>Sep</option>
                                      <option value=10>Oct</option>
                                      <option value=11>Nov</option>
                                      <option value=12>Dec</option>
                                    </select>
                                    </td>
                                    <td><select id="time_daylight_saving_start_week" name="time_daylight_saving_start_week" style="WIDTH: 50px">
                                      <option value="1">1st</option>
                                      <option value="2">2nd</option>
                                      <option value="3">3rd</option>
                                      <option value="4">4th</option>
                                      <option value="5">5th</option>
                                    </select>
                                    </td>
                                    <td><select name="time_daylight_saving_start_day_of_week" id="time_daylight_saving_start_day_of_week" style="WIDTH: 50px">
                                        <option value="1" 
                          selected>Sun</option>
                                        <option value="2">Mon</option>
                                        <option value="3">Tue</option>
                                        <option 
                          value="4">Wed</option>
                                        <option value="5">Thu</option>
                                        <option value="6">Fri</option>
                                        <option 
                          value="7">Sat</option>
                                      </select>
                                    </td>
                                    <td><select name="time_daylight_saving_start_time" id="time_daylight_saving_start_time" style="WIDTH: 60px">
                                        <option value=0 
                          selected>12 am</option>
                                        <option value=1>1 am</option>
                                        <option value=2>2 am</option>
                                        <option value=3>3 am</option>
                                        <option value=4>4 am</option>
                                        <option 
                          value=5>5 am</option>
                                        <option value=6>6 am</option>
                                        <option value=7>7 am</option>
                                        <option value=8>8 am</option>
                                        <option value=9>9 am</option>
                                        <option 
                          value=10>10 am</option>
                                        <option value=11>11 am</option>
                                        <option value=12>12 pm</option>
                                        <option 
                          value=13>1 pm</option>
                                        <option value=14>2 pm</option>
                                        <option value=15>3 pm</option>
                                        <option value=16>4 pm</option>
                                        <option value=17>5 pm</option>
                                        <option 
                          value=18>6 pm</option>
                                        <option value=19>7 pm</option>
                                        <option value=20>8 pm</option>
                                        <option value=21>9 pm</option>
                                        <option value=22>10 pm</option>
                                        <option 
                          value=23>11 pm</option>
                                      </select>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td>DST End&nbsp;</td>
                                    <td><select id="time_daylight_saving_end_month" name="time_daylight_saving_end_month" size=1 style="WIDTH: 50px">
                                      <option value=1>Jan</option>
                                      <option value=2>Feb</option>
                                      <option value=3>Mar</option>
                                      <option value=4>Apr</option>
                                      <option value=5>May</option>
                                      <option value=6>Jun</option>
                                      <option value=7>Jul</option>
                                      <option value=8>Aug</option>
                                      <option value=9>Sep</option>
                                      <option value=10>Oct</option>
                                      <option value=11>Nov</option>
                                      <option value=12>Dec</option>
                                    </select>
                                    </td>
                                    <td><select id="time_daylight_saving_end_week" name="time_daylight_saving_end_week" style="WIDTH: 50px">
                                      <option value="1">1st</option>
                                      <option value="2">2nd</option>
                                      <option value="3">3rd</option>
                                      <option value="4">4th</option>
                                      <option value="5">5th</option>
                                    </select>
                                    </td>
                                    <td><select name="time_daylight_saving_end_day_of_week" id="time_daylight_saving_end_day_of_week" style="WIDTH: 50px">
                                        <option value=1 
                          selected>Sun</option>
                                        <option value=2>Mon</option>
                                        <option value=3>Tue</option>
                                        <option 
                          value=4>Wed</option>
                                        <option value=5>Thu</option>
                                        <option value=6>Fri</option>
                                        <option 
                          value=7>Sat</option>
                                      </select>
                                    </td>
                                    <td><select name="time_daylight_saving_end_time" id="time_daylight_saving_end_time" style="WIDTH: 60px">
                                        <option value=0 
                          selected>12 am</option>
                                        <option value=1>1 am</option>
                                        <option value=2>2 am</option>
                                        <option value=3>3 am</option>
                                        <option value=4>4 am</option>
                                        <option 
                          value=5>5 am</option>
                                        <option value=6>6 am</option>
                                        <option value=7>7 am</option>
                                        <option value=8>8 am</option>
                                        <option value=9>9 am</option>
                                        <option 
                          value=10>10 am</option>
                                        <option value=11>11 am</option>
                                        <option value=12>12 pm</option>
                                        <option 
                          value=13>1 pm</option>
                                        <option value=14>2 pm</option>
                                        <option value=15>3 pm</option>
                                        <option value=16>4 pm</option>
                                        <option value=17>5 pm</option>
                                        <option 
                          value=18>6 pm</option>
                                        <option value=19>7 pm</option>
                                        <option value=20>8 pm</option>
                                        <option value=21>9 pm</option>
                                        <option value=22>10 pm</option>
                                        <option 
                          value=23>11 pm</option>
                                      </select>
                                    </td>
                                  </tr>
                                </tbody>
                            </table></td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                    <div class=box>
                      <h2>Automatic Time Configuration</h2>
                      <table width="525" class=formarea summary="">
                        <tbody>
                          <tr>
                            <td width="145" height="26" class=form_label><div align="right">Enable NTP server&nbsp;:</div></td>
                            <td width="367">&nbsp;
							
							<input name="ntp_enable" type=checkbox id="ntp_enable" value="1" onClick="show_time()">
							<input type="hidden" id="ntp_client_enable" name="ntp_client_enable" value="<% CmoGetCfg("ntp_client_enable","none"); %>">
                            </td>
                          </tr>
                          <!--tr>
                            <td width="145" height="20" class=form_label>
                              <div align="right">Interval : </div></td>
                            <td><span class="form_label">&nbsp;&nbsp;
                              <select id="ntp_sync_interval" name="ntp_sync_interval" size="1">
                                <option value="1">1 hrs</option>
                                <option value="4">4 hrs</option>
                                <option value="8">8 hrs</option>
                                <option value="12">12 hrs</option>
                                <option value="24">24 hrs</option>
                                <option value="48">48 hrs</option>
                                <option value="72">72 hrs</option>
                              </select>
                            </span></td>
                          </tr-->
                          <tr>
                            <td width="145" height="36" class=form_label><div align="right">NTP Server Used&nbsp;:</div></td>
                            <td>&nbsp;&nbsp;&nbsp;<input name="ntp_server" id="ntp_server" value="<% CmoGetCfg("ntp_server","none"); %>">
                                <span>
                                <input name="ntp_btn" id="ntp_btn" type=button value="<<" onClick="copy_ntp_server()">
                                </span>                      
								<select name=page_ntp_servers id=page_ntp_servers>
                                  <option value=0 selected>Select NTP Server</option>
                                  <option value="ntp1.dlink.com">ntp1.dlink.com</option>
                                  <option value="ntp.dlink.com.tw">ntp.dlink.com.tw</option>
                                </select>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  <div class=box>
                      <h2>Set the Date and Time Manually</h2>
                      <P class=box_msg></P>
                      <table width="525" cellpadding="1" cellspacing="1" class=formarea>
                        <tbody>
                          <tr>
                            <td class=form_label>Date And Time : 
                            <br></td>
                            <td><b>&nbsp;</b> </td>
                          </tr>
                          <tr>
                            <td colspan=2>
                              <table width="100%" border=0 cellpadding=2 cellspacing=0>
                                <tbody>
                                  <tr>
                                    <td colspan="2">&nbsp;</td>
                                    <td colspan="4">&nbsp;</td>
                                  </tr>
                                  <tr>
								  
                                    <td>Year</td>
                                    <td><font face="Arial, Helvetica, sans-serif" size=2>
                                      <select id="year" name="year" size=1 style="WIDTH: 50px">
                                        <option value=2002>2002</option>
                                        <option value=2003>2003</option>
                                        <option value=2004>2004</option>
                                        <option value=2005>2005</option>
                                        <option value=2006>2006</option>
                                        <option value=2007>2007</option>
                                        <option value=2008>2008</option>
                                        <option value=2009>2009</option>
                                        <option value=2010>2010</option>
                                        <option value=2011>2011</option>
                                        <option value=2012>2012</option>
                                      </select>
                                    </font></td>
                                    <td>Month</td>
                                    <td><font face="Arial, Helvetica, sans-serif" size=2>
                                      <select id="mon" name="mon" size=1 style="WIDTH: 50px">
                                        <option value=1>Jan</option>
                                        <option value=2>Feb</option>
                                        <option value=3>Mar</option>
                                        <option value=4>Apr</option>
                                        <option value=5>May</option>
                                        <option value=6>Jun</option>
                                        <option value=7>Jul</option>
                                        <option value=8>Aug</option>
                                        <option value=9>Sep</option>
                                        <option value=10>Oct</option>
                                        <option value=11>Nov</option>
                                        <option value=12>Dec</option>
                                      </select>
                                    </font> </td>
                                    <td>Day</td>
                                    <td><font face="Arial, Helvetica, sans-serif" size=2>
                                      <select size=1 id="day" name="day" style="WIDTH: 50px">
                                        <option value=1 selected>01</option>
                                        <option value=2>02</option>
                                        <option value=3>03</option>
                                        <option value=4>04</option>
                                        <option value=5>05</option>
                                        <option value=6>06</option>
                                        <option value=7>07</option>
                                        <option value=8>08</option>
                                        <option value=9>09</option>
                                        <option value=10>10</option>
                                        <option value=11>11</option>
                                        <option value=12>12</option>
                                        <option value=13>13</option>
                                        <option value=14>14</option>
                                        <option value=15>15</option>
                                        <option value=16>16</option>
                                        <option value=17>17</option>
                                        <option value=18>18</option>
                                        <option value=19>19</option>
                                        <option value=20>20</option>
                                        <option value=21>21</option>
                                        <option value=22>22</option>
                                        <option value=23>23</option>
                                        <option value=24>24</option>
                                        <option value=25>25</option>
                                        <option value=26>26</option>
                                        <option value=27>27</option>
                                        <option value=28>28</option>
                                        <option value=29>29</option>
                                        <option value=30>30</option>
                                        <option value=31>31</option>
                                      </select>
                                    </font></td>
                                  </tr>
                                  <tr>
                                    <td>Hour</td>
                                    <td><font face="Arial, Helvetica, sans-serif" size=2>
                                      <select size=1 id="hour" name="hour" style="WIDTH: 50px">
                                        <option value=0 selected>00</option>
                                        <option value=1>01</option>
                                        <option value=2>02</option>
                                        <option value=3>03</option>
                                        <option value=4>04</option>
                                        <option value=5>05</option>
                                        <option value=6>06</option>
                                        <option value=7>07</option>
                                        <option value=8>08</option>
                                        <option value=9>09</option>
                                        <option value=10>10</option>
                                        <option value=11>11</option>
                                        
                                    </select>
                                    </font></td>
                                    <td>Minute</td>
                                    <td><font face="Arial, Helvetica, sans-serif" size=2>
                                      <select size=1 id="min" name="min" style="WIDTH: 50px">
                                        <option value=0 selected>00</option>
                                        <option value=1>01</option>
                                        <option value=2>02</option>
                                        <option value=3>03</option>
                                        <option value=4>04</option>
                                        <option value=5>05</option>
                                        <option value=6>06</option>
                                        <option value=7>07</option>
                                        <option value=8>08</option>
                                        <option value=9>09</option>
                                        <option value=10>10</option>
                                        <option value=11>11</option>
                                        <option value=12>12</option>
                                        <option value=13>13</option>
                                        <option value=14>14</option>
                                        <option value=15>15</option>
                                        <option value=16>16</option>
                                        <option value=17>17</option>
                                        <option value=18>18</option>
                                        <option value=19>19</option>
                                        <option value=20>20</option>
                                        <option value=21>21</option>
                                        <option value=22>22</option>
                                        <option value=23>23</option>
                                        <option value=24>24</option>
                                        <option value=25>25</option>
                                        <option value=26>26</option>
                                        <option value=27>27</option>
                                        <option value=28>28</option>
                                        <option value=29>29</option>
                                        <option value=30>30</option>
                                        <option value=31>31</option>
                                        <option value=32>32</option>
                                        <option value=33>33</option>
                                        <option value=34>34</option>
                                        <option value=35>35</option>
                                        <option value=36>36</option>
                                        <option value=37>37</option>
                                        <option value=38>38</option>
                                        <option value=39>39</option>
                                        <option value=40>40</option>
                                        <option value=41>41</option>
                                        <option value=42>42</option>
                                        <option value=43>43</option>
                                        <option value=44>44</option>
                                        <option value=45>45</option>
                                        <option value=46>46</option>
                                        <option value=47>47</option>
                                        <option value=48>48</option>
                                        <option value=49>49</option>
                                        <option value=50>50</option>
                                        <option value=51>51</option>
                                        <option value=52>52</option>
                                        <option value=53>53</option>
                                        <option value=54>54</option>
                                        <option value=55>55</option>
                                        <option value=56>56</option>
                                        <option value=57>57</option>
                                        <option value=58>58</option>
                                        <option value=59>59</option>
                                      </select>
                                    </font></td>
                                    <td>Second</td>
                                    <td><font face="Arial, Helvetica, sans-serif" size=2>
                                      <select size=1 id="sec" name="sec" style="WIDTH: 50px">
                                        <option value=0 selected>00</option>
                                        <option value=1>01</option>
                                        <option value=2>02</option>
                                        <option value=3>03</option>
                                        <option value=4>04</option>
                                        <option value=5>05</option>
                                        <option value=6>06</option>
                                        <option value=7>07</option>
                                        <option value=8>08</option>
                                        <option value=9>09</option>
                                        <option value=10>10</option>
                                        <option value=11>11</option>
                                        <option value=12>12</option>
                                        <option value=13>13</option>
                                        <option value=14>14</option>
                                        <option value=15>15</option>
                                        <option value=16>16</option>
                                        <option value=17>17</option>
                                        <option value=18>18</option>
                                        <option value=19>19</option>
                                        <option value=20>20</option>
                                        <option value=21>21</option>
                                        <option value=22>22</option>
                                        <option value=23>23</option>
                                        <option value=24>24</option>
                                        <option value=25>25</option>
                                        <option value=26>26</option>
                                        <option value=27>27</option>
                                        <option value=28>28</option>
                                        <option value=29>29</option>
                                        <option value=30>30</option>
                                        <option value=31>31</option>
                                        <option value=32>32</option>
                                        <option value=33>33</option>
                                        <option value=34>34</option>
                                        <option value=35>35</option>
                                        <option value=36>36</option>
                                        <option value=37>37</option>
                                        <option value=38>38</option>
                                        <option value=39>39</option>
                                        <option value=40>40</option>
                                        <option value=41>41</option>
                                        <option value=42>42</option>
                                        <option value=43>43</option>
                                        <option value=44>44</option>
                                        <option value=45>45</option>
                                        <option value=46>46</option>
                                        <option value=47>47</option>
                                        <option value=48>48</option>
                                        <option value=49>49</option>
                                        <option value=50>50</option>
                                        <option value=51>51</option>
                                        <option value=52>52</option>
                                        <option value=53>53</option>
                                        <option value=54>54</option>
                                        <option value=55>55</option>
                                        <option value=56>56</option>
                                        <option value=57>57</option>
                                        <option value=58>58</option>
                                        <option value=59>59</option>
                                      </select>
                                    </font></td>
                                    <td>
                                      <select name="ampm" id="ampm" style="WIDTH: 50px">
                                        <option value=0 selected>AM</option>
                                        <option value=1>PM</option>
                                      </select>
                                    </td>
                                  </tr>
                                </tbody>
                              </table>
                              <br>
                              <input name="set" id="set"  type=button class=button_submit  onClick="set_time()" value="Copy Your Computer's Time Settings">
                            </td>
                          </tr>
                        </tbody>
                      </table>
                  </div>
				</div></td></form>
				<form id="form2" name="form2" method="post" action="system_time.cgi">
				<input type="hidden" name="html_response_return_page" value="tools_time.asp">
				</form>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table cellpadding="2" cellspacing="0" border="0" bgcolor="#FFFFFF">
					<tr>
					  <td id="help_text">
							<strong>Helpful Hints..</strong><br>
							<br>
							If you plan on using the scheduling feature of this router, then making sure the time is correct is extremely important.  Either enter the time manually by clicking the<strong> Copy Your Computers Time Settings</strong> button, or use the<strong> Automatic Time Configuration</strong> option to have your router synchronize with a time server on the Internet.
					  </td>
					</tr>
				</table>
			</td>
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
	onPageLoad();
	show_time();
	show_daylight();
</script>
</html>
<html>
<head>
<link rel="STYLESHEET" type="text/css" href="css_router.css">
<title>D-LINK SYSTEMS, INC | WIRELESS ROUTER | HOME</title>
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<script language="Javascript" src="public.js"></script>
<script language=JavaScript>
var submit_button_flag = 0;
var data_list = new Array();
	
var DataArray = new Array();

//Always/1111111/00:00/24:00
function Data(name, weekdays, start_time, end_time, onList) 
{
	this.Name = name;
	this.Weekdays = weekdays;
	this.Weekdays_W = show_day_word(weekdays);
	this.Stime = start_time;
	this.Etime = end_time;
	this.OnList = onList ;
}

function set_schedule_array(){
	var index = 0;
	for (var i = 0; i < 20; i++){
		var temp_schedule;
		var k=i;
		if(parseInt(i,10)<10){
			k="0"+i;
		}
		
		temp_schedule = (get_by_id("schedule_rule_" + k).value).split("/");
		
		if (temp_schedule.length > 1){
			if(temp_schedule[1].length > 0){
				DataArray[DataArray.length++] = new Data(temp_schedule[0],temp_schedule[1], temp_schedule[2], temp_schedule[3],index);
				index++;
			}
		}
	}
	get_by_id("max_row").value = DataArray.length;
}

function edit_row(index){
	var week_str = new Array(7);
	var num=0;
	get_by_id("name").value= DataArray[index].Name;
	
	for (var i = 0; i < 7; i++){
		if (DataArray[index].Weekdays.charAt(i) == "1"){
			week_str[i] = 1;
		}else{
			week_str[i] = 0;
		}
	}
	var p_all_week = get_by_name("all_week");
	if(DataArray[index].Weekdays == "1111111"){
		p_all_week[0].checked = true;
	}else{
		p_all_week[1].checked = true;
		
		for(var j=0;j<7;j++){
			if(week_str[j]== 1){
				var temp_check = get_by_id("day" + j);
				temp_check.checked= true;	
			}else{
				var temp_check = get_by_id("day" + j);
				temp_check.checked= false;
			}
		}
		
	}
	
	var all_day = 0;
	var st_hour,st_min,en_hour,en_min;
	if(DataArray[index].Stime=="00:00" && DataArray[index].Etime=="24:00"){
		all_day = 1;						
	}else{						
		var temp_s= DataArray[index].Stime.split(":");
		var temp_e= DataArray[index].Etime.split(":");
		
		st_min= temp_s[1];
		en_min= temp_e[1];
		get_by_id("start_min").value = st_min;
		get_by_id("end_min").value = en_min;
		
		if(parseInt(temp_s[0],10)>11){
			get_by_id("start_time").selectedIndex = 1; //pm
			st_hour=parseInt(temp_s[0],10)-12;
			if(st_hour < 1){
				st_hour = parseInt(12);
			}
			if(st_hour < 10){
				get_by_id("start_hour").value = "0" + st_hour;
			}else{
				get_by_id("start_hour").value = st_hour;
			}
		}else{
			get_by_id("start_time").selectedIndex = 0;  //am
			st_hour=parseInt(temp_s[0],10);
			if(st_hour < 1){
				st_hour = parseInt(12);
			}
			if(st_hour < 10){
				get_by_id("start_hour").value = "0" + st_hour;
			}else{
				get_by_id("start_hour").value = st_hour;
			}
			
		}
		
		if(parseInt(temp_e[0],10)>11){
			get_by_id("end_time").selectedIndex = 1; //pm
			en_hour=parseInt(temp_e[0],10)-12;
			if(en_hour < 1){
				en_hour = parseInt(12);
			}
			if(en_hour < 10){
				get_by_id("end_hour").value = "0" + en_hour;
			}else{
				get_by_id("end_hour").value = en_hour;
			}
			
			
		}else{
			get_by_id("end_time").selectedIndex = 0;  //am
			en_hour=parseInt(temp_e[0],10);
			if(en_hour < 1){
				en_hour = parseInt(12);
			}
			if(en_hour < 10){
				get_by_id("end_hour").value = "0" + en_hour;
			}else{
				get_by_id("end_hour").value = en_hour;
			}
			
		}
		
		
	}
	
	var p_time_type = get_by_id("time_type");
	if(all_day == 1){
			p_time_type.checked =true;
			get_by_id("start_hour").value = "12";
			get_by_id("start_min").value = "00";
			set_selectIndex(0,get_by_id("start_time"));
			get_by_id("end_hour").value = "12";
			get_by_id("end_min").value = "00";
			set_selectIndex(0,get_by_id("end_time"));
	}else{
			p_time_type.checked =false;
	}
	
	
	get_by_id("edit").value = index;
	change_color("table1", index+1);
	
	show_day();
	show_time();	
}

function del_row(row){	
	if (confirm(msg[DEL_SCHEDULE_MSG])){
		get_by_id("del_row").value = row;
		delete_row();
		clear_schedule();
	}
}

function delete_row(){
	var del_index = parseInt(get_by_id("del_row").value,10)+1;
	var tb1 = get_by_id("table1"); 
	if (del_index >= DataArray.length){
		var oTr = tb1.deleteRow(del_index);
	}else{
		for(var i=del_index;i<DataArray.length;i++){
			var temp_time_array = DataArray[i].Stime+ "~" + DataArray[i].Etime;
			if(DataArray[i].Stime=="00:00" && DataArray[i].Etime=="24:00"){
				temp_time_array = "All Day";
			}
			var edit = i-1;
			get_by_id("table1").rows[i].cells[0].innerHTML = "<center>"+ DataArray[i].Name +"</center>"
			get_by_id("table1").rows[i].cells[1].innerHTML = "<center>"+ DataArray[i].Weekdays_W +"</center>"
			get_by_id("table1").rows[i].cells[2].innerHTML = "<center>"+ temp_time_array +"</center>"
			get_by_id("table1").rows[i].cells[3].innerHTML = "<a href=\"javascript:edit_row("+ edit +")\"><img src=\"edit.jpg\" border=\"0\" alt=\"edit\"></a><a href=\"javascript:del_row("+ edit +")\"><img src=\"delete.jpg\"  border=\"0\" alt=\"delete\"></a>";
		}
		var oTr = tb1.deleteRow(DataArray.length);
	}
	delete_data();
}
	
function delete_data(){
	var num = parseInt(get_by_id("del_row").value,10);
	for(i=num ; i<DataArray.length-1 ;i++){
		DataArray[i].Name = DataArray[i+1].Name;
		DataArray[i].Weekdays = DataArray[i+1].Weekdays;
		DataArray[i].Weekdays_W = DataArray[i+1].Weekdays_W;
		DataArray[i].Stime = DataArray[i+1].Stime;
		DataArray[i].Etime = DataArray[i+1].Etime;
		DataArray[i].OnList = DataArray[i+1].OnList;
	}
	--DataArray.length;
	get_by_id("max_row").value = parseInt(DataArray.length);
}
	
	
function show_day(){
	var all_week = get_by_name("all_week");

	for (var i = 0; i < 7; i++){
		get_by_id("day" + i).disabled = all_week[0].checked;
	}
}
	
function show_time(){
	var time_type = get_by_id("time_type");
	
	get_by_id("start_hour").disabled = time_type.checked;
	get_by_id("start_min").disabled = time_type.checked;
	get_by_id("start_time").disabled = time_type.checked;
	get_by_id("end_hour").disabled = time_type.checked;
	get_by_id("end_min").disabled = time_type.checked;
	get_by_id("end_time").disabled = time_type.checked;
}

var dayNames = new Array("Sun","Mon","Tue","Wed","Thu","Fri","Sat");

function show_day_word(Weeddays_word){
	var week_word = new Array(0,0,0,0,0,0,0);
	var s0,s1,s2,s3,s4,s5,s6;
	for(i=0;i<Weeddays_word.length;i++){
		if(Weeddays_word.charAt(i)=="1"){
			week_word[i] = "1"
		}
	}
	s_day="";
	var Cday_num = 0;
	for(i=0;i<week_word.length;i++){
		if(week_word[i] == "1"){
			if(Cday_num > 0){
				s_day = s_day +" ";
			}
			s_day = s_day + dayNames[i];
			Cday_num++;
		}
	}
	if(Cday_num >= 7){
		s_day="All week";
	}
	return s_day;
}

function update_data(){
	for (i=0;i<20;i++){
		if(i < DataArray.length){
			var dat = DataArray[i].Name +"/"+ DataArray[i].Weekdays +"/"+ DataArray[i].Stime +"/"+ DataArray[i].Etime;
		}else{
			var dat = "";
		}
		if (i < 10){
			get_by_id("schedule_rule_0" + i).value = dat;
		}else{
			get_by_id("schedule_rule_" + i).value = dat;
		}
	}
}

function update_DataArray(){
	var index = parseInt(get_by_id("edit").value,10);
	var insert = false;
	if(index == "-1"){
		if(get_by_id("max_row").value == 19){
		alert("Schedule rules is Full! Please Delete an Entry.");
		}else{
			index = parseInt(get_by_id("max_row").value,10) + 1;
			get_by_id("max_row").value = index;
			insert = true;
		}
	}
	
	var days_in_week="";
	var start_time_total,end_time_total;
	var p_all_week = get_by_name("all_week");
	if(p_all_week[0].checked == true){
		days_in_week = "1111111"
	}else{
		for(var i=0;i<7;i++){
			if(get_by_id("day"+ i).checked== true){
				days_in_week += "1";
			}else{
				days_in_week += "0"
			}
		}
		if(days_in_week == "0000000"){
			alert("Please select days.");
		}
	}
	
	var p_all_day=get_by_id("time_type");
	if (p_all_day.checked==true){			
		start_time_total= "00:00";
		end_time_total="24:00";
	}else{
		var s_hour,s_min;
		var e_hour,e_min;
		
		//start time
		if(parseInt(get_by_id("start_min").value,10)<10){
			s_min= "0" + parseInt(get_by_id("start_min").value,10);
		}else{
			s_min= get_by_id("start_min").value;
		}
		
		if(get_by_id("start_time").selectedIndex ==1){	//pm
			s_hour = time_hour(parseInt(get_by_id("start_hour").value,10)) +12;	
		}else{											//am
			if(time_hour(parseInt(get_by_id("start_hour").value,10))<10){
				s_hour ="0" + time_hour(parseInt(get_by_id("start_hour").value,10));
			}else{
				s_hour = get_by_id("start_hour").value;
			}
		}
		start_time_total =s_hour + ":" + s_min;
		
		//end time		
		if(parseInt(get_by_id("end_min").value,10)<10){
			e_min= "0" + parseInt(get_by_id("end_min").value,10);
		}else{
			e_min= get_by_id("end_min").value;
		}
		
		if(get_by_id("end_time").selectedIndex ==1){	//pm
			e_hour = time_hour(parseInt(get_by_id("end_hour").value,10)) +12;
		}else{											//am
			if(time_hour(parseInt(get_by_id("end_hour").value,10))<10){
				e_hour ="0" + time_hour(parseInt(get_by_id("end_hour").value,10));
			}else{
				e_hour = get_by_id("end_hour").value;
			}
		}
		end_time_total =e_hour + ":" + e_min;
	}
	
	var schedule_name = get_by_id("name").value;
	if(insert){
		DataArray[DataArray.length++] = new Data(schedule_name, days_in_week, start_time_total, end_time_total,index-1);
	}else{
		DataArray[index].Name = schedule_name;
		DataArray[index].Weekdays = days_in_week;
		DataArray[index].Weekdays_W = show_day_word(days_in_week);
		DataArray[index].Stime = start_time_total;
		DataArray[index].Etime = end_time_total;
		DataArray[index].OnList = index;
	}
}

function time_hour(hour){
	var hour_c = hour;
	if (parseInt(hour,10) >= 12){
		hour_c = 00;
	}
	return hour_c;
}
	
	
function add_row(){
	if(!check_time_schedule()){
		return false;
	}
	update_DataArray();
	if(get_by_id("edit").value == "-1"){     //add
		var tb1 = get_by_id("table1"); 
		var oTr = tb1.insertRow(-1);
		var oTd1 = oTr.insertCell(-1);
		var oTd2 = oTr.insertCell(-1);
		var oTd3 = oTr.insertCell(-1);
		var oTd4 = oTr.insertCell(-1);

		var del = parseInt(get_by_id("max_row").value,10);
		var i = del - 1;
		
		var temp_time_array = DataArray[i].Stime+ "~" + DataArray[i].Etime;
		if(DataArray[i].Stime=="00:00" && DataArray[i].Etime=="24:00"){
			temp_time_array = "All Day";
		}
		
		oTd1.innerHTML = "<center>"+ DataArray[i].Name +"</center>";
		oTd2.innerHTML = "<center>"+ DataArray[i].Weekdays_W +"</center>";
		oTd3.innerHTML = "<center>"+ temp_time_array +"</center>";
		oTd4.innerHTML = "<a href=\"javascript:edit_row("+ i +")\"><img src=\"edit.jpg\" border=\"0\" alt=\"edit\"></a><a href=\"javascript:del_row("+ i +")\"><img src=\"delete.jpg\"  border=\"0\" alt=\"delete\"></a></center>";
	
	}else{                                      //update
		var i = parseInt(get_by_id("edit").value,10);
		
		var temp_time_array = DataArray[i].Stime+ "~" + DataArray[i].Etime;
		if(DataArray[i].Stime=="00:00" && DataArray[i].Etime=="24:00"){
			temp_time_array = "All Day";
		}
		
		get_by_id("table1").rows[i+1].cells[0].innerHTML = "<center>"+ DataArray[i].Name +"</center>"
		get_by_id("table1").rows[i+1].cells[1].innerHTML = "<center>"+ DataArray[i].Weekdays_W +"</center>"
		get_by_id("table1").rows[i+1].cells[2].innerHTML = "<center>"+ temp_time_array +"</center>"
		get_by_id("table1").rows[i+1].cells[3].innerHTML = "<a href=\"javascript:edit_row("+ i +")\"><img src=\"edit.jpg\" border=\"0\" alt=\"edit\"></a><a href=\"javascript:del_row("+ i +")\"><img src=\"delete.jpg\"  border=\"0\" alt=\"delete\"></a>";
	}
	clear_schedule();
}

function check_time_schedule(){
	var time_type = get_by_id("time_type");
	var edit_index = parseInt(get_by_id("edit").value,10);
	if(get_by_id("del_row").value == "-1"){	
		if (get_by_id("name").value.length <= 0){
			alert(msg[SCHEDULE_NAME_ERROR]);
			return false;
		}else{
			var temp_obj = get_by_id("name").value;
			
			var space_num = 0;
			for (i=0;i<temp_obj.length;i++){
				if (temp_obj.charAt(i)==" "){	
					space_num++
				}
				if (!check_ascii_key_fun(temp_obj.substring(i, i+1))){
					alert("Schedule Name is invalid. the legal characters are 0~9, A~Z, or a~z.");
					return false;
				}
			}
			if(parseInt(space_num) >= parseInt(temp_obj.length)){
				alert(msg[SCHEDULE_NAME_SPACE_ERROR]);
				return false;
			}
		}
		if (!time_type.checked){
			if (!check_integer(get_by_id("start_hour").value, 1, 12) || !check_integer(get_by_id("start_min").value, 0, 59)){
				alert(msg[START_TIME_ERROR]);
				return false;
			}
				
			if (!check_integer(get_by_id("end_hour").value, 1, 12) || !check_integer(get_by_id("end_min").value, 0, 59)){
				alert(msg[END_TIME_ERROR]);
				return false;
			}
			if (get_by_id("start_time").selectedIndex > get_by_id("end_time").selectedIndex){
				alert(msg[TIME_RANGE_ERROR]);
				return false;
			}else{
				var start_hourc = time_hour(parseInt(get_by_id("start_hour").value,10));
				var end_hourc = time_hour(parseInt(get_by_id("end_hour").value,10));
				var temp_start_time = (start_hourc * 60) + (12 * 60 * get_by_id("start_time").selectedIndex) + (parseInt(get_by_id("start_min").value,10));
				var temp_end_time = (end_hourc * 60) + (12 * 60 * get_by_id("end_time").selectedIndex) + (parseInt(get_by_id("end_min").value,10));
				if (temp_start_time > temp_end_time){
					alert(msg[TIME_RANGE_ERROR]);
					return false;
				}
		
				if(temp_start_time - temp_end_time == 0){
					get_by_id("time_type").checked = true;
				}
				
				if((temp_start_time > 1439) && (temp_end_time - temp_start_time > 0)){
					alert(msg[START_TIME_ERROR]);
					return false;
				}
		
				if((temp_end_time > 1440) && (temp_end_time - temp_start_time > 0)){
					alert(msg[END_TIME_ERROR]);
					return false;
				}
			}
		}
		for(var j=0;j<DataArray.length;j++){
			if(DataArray[j].Name==get_by_id("name").value){
				if(DataArray[j].Name != ""  &&  (edit_index==DataArray[j].OnList)){
					continue;
				}else{
					alert(msg[STATIC_DHCP_NAME]);
					return false;
				}			
			}
		}
	}
	return true;
}

function send_request(){
	update_data();
	if(submit_button_flag == 0){
		submit_button_flag = 1;
		return true;
	}else{
		return false;
	}
}

function clear_schedule(){
	var i = parseInt(get_by_id("edit").value,10)+1;
	get_by_id("table1").rows[i].style.backgroundColor = "#FFFFFF";
	
	get_by_id("name").value = "";
	get_by_name("all_week")[1].checked = true;
	show_day();
	for(i=0;i<7;i++){
		get_by_id("day"+i).checked = false;
	}
	get_by_id("time_type").checked = false;
	get_by_id("start_hour").value = "";
	get_by_id("start_min").value = "";
	set_selectIndex(0,get_by_id("start_time"));
	get_by_id("end_hour").value = "";
	get_by_id("end_min").value = "";
	set_selectIndex(0,get_by_id("end_time"));
	get_by_id("edit").value = -1;
	get_by_id("del_row").value = -1;
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
								<ul>
									<li><div><a href="tools_admin.asp">Admin</a></div></li>
									<li><div><a href="tools_time.asp">Time</a></div></li>
									<li><div><a href="tools_system.asp">System</a></div></li>
									<li><div><a href="tools_firmw.asp">Firmware</a></div></li>
									<li><div><a href="tools_ddns.asp">DDNS</a></div></li>
									<li><div><a href="tools_vct.asp">SYSTEM CHECK</a></div></li>
									<li><div id="sidenavoff">SCHEDULES</div></li>
									<li><div><a href="st_log_settings.asp">Log settings</a></div></li>
								</ul>
							</div>
						</td>			
					</tr>
				</table>			
			</td>
			<form id="form1" name="form1" method="post" action="apply.cgi">
			<input type="hidden" name="html_response_page" value="back.asp">
	   <input type="hidden" name="html_response_message" value="The setting is saved.">
	   <input type="hidden" name="html_response_return_page" value="tools_schedules.asp">
				<input type="hidden" id="edit" name="edit" value="-1">
				<input type="hidden" id="del_row" name="del_row" value="-1">
				<input type="hidden" id="max_row" name="max_row" value="-1">
				
<input type="hidden" id="schedule_rule_00" name="schedule_rule_00" value="<% CmoGetCfg("schedule_rule_00","none"); %>">				
<input type="hidden" id="schedule_rule_01" name="schedule_rule_01" value="<% CmoGetCfg("schedule_rule_01","none"); %>">
<input type="hidden" id="schedule_rule_02" name="schedule_rule_02" value="<% CmoGetCfg("schedule_rule_02","none"); %>">		
<input type="hidden" id="schedule_rule_03" name="schedule_rule_03" value="<% CmoGetCfg("schedule_rule_03","none"); %>">				
<input type="hidden" id="schedule_rule_04" name="schedule_rule_04" value="<% CmoGetCfg("schedule_rule_04","none"); %>">
<input type="hidden" id="schedule_rule_05" name="schedule_rule_05" value="<% CmoGetCfg("schedule_rule_05","none"); %>">
<input type="hidden" id="schedule_rule_06" name="schedule_rule_06" value="<% CmoGetCfg("schedule_rule_06","none"); %>">				
<input type="hidden" id="schedule_rule_07" name="schedule_rule_07" value="<% CmoGetCfg("schedule_rule_07","none"); %>">
<input type="hidden" id="schedule_rule_08" name="schedule_rule_08" value="<% CmoGetCfg("schedule_rule_08","none"); %>">	
<input type="hidden" id="schedule_rule_09" name="schedule_rule_09" value="<% CmoGetCfg("schedule_rule_09","none"); %>">
<input type="hidden" id="schedule_rule_10" name="schedule_rule_10" value="<% CmoGetCfg("schedule_rule_10","none"); %>">				
<input type="hidden" id="schedule_rule_11" name="schedule_rule_11" value="<% CmoGetCfg("schedule_rule_11","none"); %>">
<input type="hidden" id="schedule_rule_12" name="schedule_rule_12" value="<% CmoGetCfg("schedule_rule_12","none"); %>">		
<input type="hidden" id="schedule_rule_13" name="schedule_rule_13" value="<% CmoGetCfg("schedule_rule_13","none"); %>">				
<input type="hidden" id="schedule_rule_14" name="schedule_rule_14" value="<% CmoGetCfg("schedule_rule_14","none"); %>">
<input type="hidden" id="schedule_rule_15" name="schedule_rule_15" value="<% CmoGetCfg("schedule_rule_15","none"); %>">
<input type="hidden" id="schedule_rule_16" name="schedule_rule_16" value="<% CmoGetCfg("schedule_rule_16","none"); %>">				
<input type="hidden" id="schedule_rule_17" name="schedule_rule_17" value="<% CmoGetCfg("schedule_rule_17","none"); %>">
<input type="hidden" id="schedule_rule_18" name="schedule_rule_18" value="<% CmoGetCfg("schedule_rule_18","none"); %>">	
<input type="hidden" id="schedule_rule_19" name="schedule_rule_19" value="<% CmoGetCfg("schedule_rule_19","none"); %>">
				
			<td valign="top" id="maincontent_container">
				<div id="maincontent">
					
				  <div id="box_header"> 
						<h1>Schedules</h1>
						<p>The Schedule configuration option is used to manage schedule rules for various firewall and parental control features.</p>
                        <p>
                          <input name="button" id="button" type="submit" class=button_submit value="Save Settings" onClick="return send_request()">
                          <input name="button2" type=button class=button_submit value="Don't Save Settings"  onClick="window.location.href='tools_schedules.asp'">
						</p>
				  </div>
				  <div class=box>
                    <h2>Add Schedule Rule</h2>
                    <table cellSpacing=1 cellPadding=1 width=525 border=0>
                      <tr>
                        <td class="form_label"><div align="right">Name :</div></td>
                        <td width="384" height="20" valign="top">&nbsp;&nbsp;<input id="name" name="name" type="text" size="20" maxlength="16"></td>
                      </tr>
                      <tr>
                        <td class="form_label">
                          <div align="right">Day(s) :</div></td>
                        <td height="20" valign="top">&nbsp;<input type="radio" name="all_week" value="1" onClick="show_day()">
                        All Week
                        &nbsp;<input type="radio" name="all_week" value="0" onClick="show_day()" checked>
                        Select Day(s)                     
					    </td>
                      </tr>
                      <tr>
                        <td width="150">
                          <div align="right"></div></td>
                        <td height="20" valign="top">&nbsp;<input type="checkbox" id="day0" name="day0" value="1">&nbsp;Sun
                        	<input type="checkbox" id="day1" name="day1" value="1">&nbsp;Mon
                        	<input type="checkbox" id="day2" name="day2" value="1">&nbsp;Tue
                        	<input type="checkbox" id="day3" name="day3" value="1">&nbsp;Wed
                        	<input type="checkbox" id="day4" name="day4" value="1">&nbsp;Thu
                        	<input type="checkbox" id="day5" name="day5" value="1">&nbsp;Fri
                        	<input type="checkbox" id="day6" name="day6" value="1">&nbsp;Sat
                        </td>
                      </tr>
                          <tr>
                            <td class="form_label">
                              <div align="right">All Day - 24 hrs :</div></td>
                            <td height="20" valign="middle">&nbsp;<input id="time_type"  name="time_type" type="checkbox" value="1" onClick="show_time()">
<input type="hidden" id="h0" name="h0">				
<input type="hidden" id="h1" name="h1">
<input type="hidden" id="h2" name="h2">		
<input type="hidden" id="h3" name="h3">				
<input type="hidden" id="h4" name="h4">
<input type="hidden" id="h5" name="h5">
<input type="hidden" id="h6" name="h6">	
							</td>
                           
                          </tr>
                          <tr>
                            <td class="form_label"><div align="right">Start Time :</div></td>
                            <td height="20" valign="top">&nbsp;&nbsp;<input id="start_hour" name="start_hour" type="text" style="width: 40px" maxlength="2">
:
  <input id="start_min" name="start_min" type="text" style="width: 40px" maxlength="2">
  <select style="width: 50px" id="start_time" name="start_time">
    <option value="0">AM</option>
    <option value="1">PM</option>
  </select>
&nbsp;(hour:minute, 12 hour time)</td>
                          </tr>
                          <tr>
                            <td class="form_label">
                              <div align="right">End Time :</div></td>
                            <td height="20" valign="top">&nbsp;&nbsp;<input id="end_hour" name="end_hour" type="text" style="width: 40px" maxlength="2">
:
  <input id="end_min" name="end_min" type="text" style="width: 40px" maxlength="2">
  <select style="width: 50px" id="end_time" name="end_time">
    <option value="0">AM</option>
    <option value="1">PM</option>
  </select>
&nbsp;(hour:minute, 12 hour time) </td>
                          </tr>
					<tr>
					<td>&nbsp;</td>
					<td>&nbsp;&nbsp;<input type="button" name="add_to_tmp" id="add_to_tmp" value="Save" onClick="add_row()">
					&nbsp;&nbsp;<input type="button" name="clear_revdhcp" id="clear_revdhcp" value="Clear" onClick="clear_schedule()"></td>
					</tr>
                    </table>
                  </div>
				  <div class=box>
                    <h2>Schedule Rules List</h2>
                    <table id="table1" cellSpacing=1 cellPadding=1 width=524 border=0>
                      <tr>
                        <td width="202">
                          <div align="center"><strong>Name</strong></div></td>
                        <td width="107"><div align="center"><strong>Day(s)</strong></div></td>
                        <td width="130"><div align="center"><strong>Time Frame</strong></div></td>                      
                        <td width="72" height="20" valign="top">&nbsp;</td>
                      </tr>
                      <!-- repeat name=show_schedule_list --> 
					  <script>	
						set_schedule_array();
						for(i=0;i<DataArray.length;i++){
							var temp_time_array = DataArray[i].Stime+ "~" + DataArray[i].Etime;
							if(DataArray[i].Stime=="00:00" && DataArray[i].Etime=="24:00"){
								temp_time_array = "All Day";
							}
							document.write("<tr><td align=\"center\">"+ DataArray[i].Name +"</td><td align=\"center\">"+ DataArray[i].Weekdays_W +"</td><td align=\"center\">"+ temp_time_array +"</td><td><a href=\"javascript:edit_row("+ i +")\"><img src=\"edit.jpg\" width=\"15\" height=\"17\" border=\"0\" alt=\"edit\"></a> <a href=\"javascript:del_row("+ i +")\"><img src=\"delete.jpg\" width=\"15\" height=\"18\" border=\"0\" alt=\"delete\"></a></td></tr>");
						}
					</script>
					                                      
                    </table>
              </form>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table cellpadding="2" cellspacing="0" border="0" bgcolor="#FFFFFF">
					<tr>
					  <td id="help_text">
						  <strong>Helpful Hints..</strong><br>
							
					        <p class="style1"> Define schedules that can later be applied to Virtual Server and Port Forwarding rules. </p></td>
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
	show_day();
</script>
</html>
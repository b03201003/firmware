<html>
<head>
<script language="JavaScript" src="public.js"></script>
	<script language="JavaScript">
var submit_button_flag = 0;	
var dDat = new Array();
var dDat1 = new Array();

var DataArray = new Array();

//1/dddd/192.168.55.55/112255448877
function Data(enable, name, ip, mac, onList) 
{
	this.Enable = enable;
	this.Name = name;
	this.IP = ip;
	this.MAC = mac;
	this.OnList = onList ;
}

function set_reservation(){
	var index = 0;
	for (var i = 0; i < 20; i++){
		var temp_dhcp;
		var k=i;
		if(parseInt(i,10)<10){
			k="0"+i;
		}
		temp_dhcp = (get_by_id("dhcpd_reserve_" + k).value).split("/");
		if (temp_dhcp.length > 1){
			if(temp_dhcp[1].length > 0){
				DataArray[DataArray.length++] = new Data(temp_dhcp[0],temp_dhcp[1], temp_dhcp[2], temp_dhcp[3],index);
				index++;
			}
		}
	}
	get_by_id("max_row").value = DataArray.length;
}

function onPageLoad(){
	var sel_dns_relay = "<% CmoGetCfg("dns_relay","none"); %>";
	var p_dns_relay = get_by_id("DNSrelay");
	if(sel_dns_relay == "1"){
			p_dns_relay.checked =true;
	}else{
			p_dns_relay.checked =false;
	}
	
	var sel_dhcpsvr = "<% CmoGetCfg("dhcpsvr","none"); %>";
	var p_dhcpsvr = get_by_id("dhcpsvr");
	if(sel_dhcpsvr == "1"){
			p_dhcpsvr.checked =true;
	}else{
			p_dhcpsvr.checked =false;
	}
	
	var sel_dhcpsvr = "<% CmoGetCfg("dhcpd_enable","none"); %>";
	var p_dhcpsvr = get_by_id("dhcpsvr");
	if(sel_dhcpsvr == "1"){
			p_dhcpsvr.checked =true;
	}else{
			p_dhcpsvr.checked =false;
	}
	
	
	var dhcpd_start = get_by_id("dhcpd_start").value;
	var dhcpd_end = get_by_id("dhcpd_end").value;
	var start_ip = dhcpd_start.split(".");
	var end_ip = dhcpd_end.split(".");
	get_by_id("start_ip4").value = start_ip[3];
	get_by_id("end_ip4").value = end_ip[3];
	
	get_by_id("r_ip1").innerHTML = start_ip[0];
	get_by_id("r_ip2").innerHTML = start_ip[1];
	get_by_id("r_ip3").innerHTML = start_ip[2];
}

function clear_rev_dhcp(){
	get_by_id("dhcpd_reservation").checked = false;
	get_by_id("name").value = "";
	get_by_id("static_ip4").value = "";
	get_by_id("mac").value = "";
	
	get_by_id("edit").value = -1;
}

function clone_mac_action(){
	get_by_id("mac").value = get_by_id("mac_clone_addr").value;
}

function change_ip(){
		var ip = get_by_id("lan_ipaddr").value;
		var start_ip = get_by_id("dhcpd_start");
		var end_ip = get_by_id("dhcpd_end");		
		var start_ip_4 = get_by_id("start_ip4").value;
		var end_ip4 = get_by_id("end_ip4").value;
		start_ip.value = ip.substring(0, ip.lastIndexOf(".")) +"." + start_ip_4;
		end_ip.value = ip.substring(0, ip.lastIndexOf(".")) + "." + end_ip4;		
	}


function set_lan_dhcp_list(){
	var temp_dhcp_list = get_by_id("dhcp_list").value.split(",");
	
	for (var i = 0; i < temp_dhcp_list.length; i++){	
		var temp_data = temp_dhcp_list[i].split("/");
		if(temp_data.length > 1){
		document.write("<option value='" + temp_data[0] + "," + temp_data[1] + "," + temp_data[2] + "'>" + temp_data[0] + "</option>");		
		}
	}
}


function clone_mac(){
    var dat, ip, mac;
	
	if (get_by_id("dhcp").selectedIndex > 0 ){
		dat = get_by_id("dhcp").options[get_by_id("dhcp").selectedIndex].value.split(",");
		ip = dat[1].split(".");
		mac = dat[2];
		get_by_id("name").value = dat[0];
		get_by_id("static_ip4").value = ip[3];
		if(dat != null){
				get_by_id("mac").value = mac;
		}
	}else{
		alert(msg[SELECT_COMPUTER_ERROR]);
	}
}

function edit_row(index){
	var ip = DataArray[index].IP.split(".");	
	var enable = get_by_id("dhcpd_reservation");
	
	
	get_by_id("name").value = DataArray[index].Name;
	get_by_id("static_ip4").value = ip[3];
	
	
	get_by_id("mac").value = DataArray[index].MAC;
	
	if (parseInt(DataArray[index].Enable)){
		enable.checked = true;
	}else{
		enable.checked = false;
	}
	
	get_by_id("edit").value = index;
	change_color("table1", index);
}

function del_row(index){
	if (confirm(msg[DEL_STATIC_DHCP_MSG])){
		get_by_id("del_row").value = index;
		delete_row();
	}
}

function disable_ip(){
	var dhcpsvr = get_by_id("dhcpsvr");
	var revdhcp = get_by_id("dhcpd_reservation");
	var is_disable;
	
	if (dhcpsvr.checked){
		is_disable = false;
	}else{
		is_disable = true;
	}
	
	get_by_id("start_ip4").disabled = is_disable;
	get_by_id("end_ip4").disabled = is_disable;
	get_by_id("dhcpd_lease_time").disabled = is_disable;
	revdhcp.disabled = is_disable;
	
	get_by_id("name").disabled = is_disable;
	get_by_id("static_ip4").disabled = is_disable;
	get_by_id("mac").disabled = is_disable;
	get_by_id("dhcp").disabled = is_disable;
    get_by_id("button22").disabled = is_disable;
	get_by_id("clone").disabled = is_disable;
}

function update_data(){
	for (i=0;i<20;i++){
		if(i < DataArray.length){
			var dat = DataArray[i].Enable +"/"+ DataArray[i].Name +"/"+ DataArray[i].IP +"/"+ DataArray[i].MAC;
		}else{
			var dat = "";
		}
		if (i < 10){
			get_by_id("dhcpd_reserve_0" + i).value = dat;
		}else{
			get_by_id("dhcpd_reserve_" + i).value = dat;
		}
	}
}

function update_DataArray(){
	var index = parseInt(get_by_id("edit").value,10);
	var insert = false;
	if(index == "-1"){
		if(get_by_id("max_row").value == 19){
			alert("DHCP Reservations List is Full! Please Delete an Entry.");
		}else{
			index = parseInt(get_by_id("max_row").value,10) + 1;
			get_by_id("max_row").value = index;
			insert = true;
		}
	}
	
	var p_dhcpd_reservation = get_by_id("dhcpd_reservation");
	var sel_dhcpd_reservation = "0";
	if(p_dhcpd_reservation.checked ==true){
		var sel_dhcpd_reservation = "1";	
	}
	
	var ip = get_by_id("lan_ipaddr").value;
	var r4_ip = get_by_id("static_ip4").value;
	var full_ip = ip.substring(0, ip.lastIndexOf(".")) +"." + r4_ip;
	var dhcp_name = get_by_id("name").value;
	var mac_value = get_by_id("mac").value
	if(insert){
		DataArray[DataArray.length++] = new Data(sel_dhcpd_reservation, dhcp_name, full_ip, mac_value,index-1);
	}else{
		DataArray[index].Enable = sel_dhcpd_reservation;
		DataArray[index].Name = dhcp_name;
		DataArray[index].IP = full_ip;
		DataArray[index].MAC = mac_value;
		DataArray[index].OnList = index;
	}
}

function delete_data(){
	var num = parseInt(get_by_id("del_row").value,10) - 1;
	for(i=num ; i<DataArray.length-1 ;i++){
		DataArray[i].Enable = DataArray[i+1].Enable;
		DataArray[i].Name = DataArray[i+1].Name;
		DataArray[i].IP = DataArray[i+1].IP;
		DataArray[i].MAC = DataArray[i+1].MAC;
		DataArray[i].OnList = DataArray[i+1].OnList;
	}
	--DataArray.length;
	get_by_id("max_row").value = parseInt(DataArray.length);
}
	
function delete_row(){
	var del_index = parseInt(get_by_id("del_row").value,10);
	var tb1 = get_by_id("table1"); 
	if (del_index >= DataArray.length){
		var oTr = tb1.deleteRow(del_index);
	}else{
		for(var i=del_index;i<DataArray.length;i++){
			var is_checked = "";
			if(parseInt(DataArray[i].Enable)){
				is_checked = " checked";
			}
			var edit = i-1;
			get_by_id("table1").rows[i].cells[0].innerHTML = "<center><input type=\"checkbox\" name=\"enable"+ i +"\" "+ is_checked +" disabled></center>";
			get_by_id("table1").rows[i].cells[1].innerHTML = "<center>"+ DataArray[i].Name +"</center>"
			get_by_id("table1").rows[i].cells[2].innerHTML = "<center>"+ DataArray[i].MAC +"</center>"
			get_by_id("table1").rows[i].cells[3].innerHTML = "<center>"+ DataArray[i].IP +"</center>"
			get_by_id("table1").rows[i].cells[4].innerHTML = "<center><a href=\"javascript:edit_row("+ edit +")\"><img src=\"edit.jpg\" border=\"0\" alt=\"edit\"></a><a href=\"javascript:del_row("+ i +")\"><img src=\"delete.jpg\"  border=\"0\" alt=\"delete\"></a></center>";
		}
		var oTr = tb1.deleteRow(DataArray.length);
	}
	delete_data();
}
		
function check_reserve_dhcp(){
	var revdhcp = get_by_id("dhcpd_reservation");
	var ip = get_by_id("lan_ipaddr").value;
	var static_ip4 = get_by_id("static_ip4");
	var temp_mac = "";
	var edit_index = parseInt(get_by_id("edit").value,10);
	var full_ip= ip.substring(0, ip.lastIndexOf(".")) +"." + static_ip4.value;
	
	temp_mac = get_by_id("mac").value;
	
	if(get_by_id("del_row").value == "-1" && get_by_id("name").value !=""){
		var tmp_mac = temp_mac.split(":"); 
		if(tmp_mac[0] != "00"){
			alert("The first mac value must be 00.");
			return false;
		}
	}
	static_obj = new ip4_obj(static_ip4.value, 1, 254, ZERO_STATIC_DHCP_IP, INVALID_STATIC_DHCP_IP);
	if (get_by_id("name").value.length <= 0){
		alert(msg[STATIC_DHCP_NAME]);
		return false;
	}else if (!check_ip4(static_obj)){
		return false;
	}else if (temp_mac == "00:00:00:00:00:00"){
		alert(temp_mac +" is not a valid MAC address.");
		return false;
	}else if (!check_mac(temp_mac)){
		alert(msg[MAC_ADDRESS_ERROR]);
		return false;
	}
	for(var j=0;j<DataArray.length;j++){
		if(DataArray[j].Name==get_by_id("name").value){
			if(DataArray[j].Name != ""  &&  (edit_index==DataArray[j].OnList)){
				continue;
			}else{
				alert(msg[STATIC_DHCP_NAME]);
				return false;
			}			
		}else if(DataArray[j].IP==full_ip){
			if(DataArray[j].IP != ""  &&  (edit_index==DataArray[j].OnList)){
				continue;
			}else{
				alert("IP Address '"+ full_ip +"' is already used.");
				return false;
			}
		}else if(DataArray[j].MAC==temp_mac){
			if(DataArray[j].MAC != ""  &&  (edit_index==DataArray[j].OnList)){
				continue;
			}else{
				alert("Reserved IP address for this MAC address '"+ temp_mac +"' is already set.");
				return false;
			}			
		}
	}
	
	return true;
}

function add_row(){
	if(!check_reserve_dhcp()){
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
		var oTd5 = oTr.insertCell(-1);
		
		if(get_by_id("dhcpd_reservation").checked == true){
			var is_checked = " checked";	
		}else{
			var is_checked = "";
		}
		
		var ip = get_by_id("lan_ipaddr").value;
		var r4_ip = get_by_id("static_ip4").value;
		var full_ip= ip.substring(0, ip.lastIndexOf(".")) +"." + r4_ip;
		var del = parseInt(get_by_id("max_row").value,10);
		var i = del - 1;
		oTd1.innerHTML = "<center><input type=\"checkbox\" name=\"enable"+ i +"\" "+ is_checked +" disabled></center>";
		oTd2.innerHTML = "<center>"+ get_by_id("name").value +"</center>";
		oTd3.innerHTML = "<center>"+ get_by_id("mac").value +"</center>";
		oTd4.innerHTML = "<center>"+ full_ip +"</center>";
		oTd5.innerHTML = "<center><a href=\"javascript:edit_row("+ i +")\"><img src=\"edit.jpg\" border=\"0\" alt=\"edit\"></a><a href=\"javascript:del_row("+ del +")\"><img src=\"delete.jpg\"  border=\"0\" alt=\"delete\"></a></center>";
	
	}else{                                      //update
		
		if(get_by_id("dhcpd_reservation").checked == true){
			var is_checked = " checked";	
		}else{
			var is_checked = "";
		}
		
		var ip = get_by_id("lan_ipaddr").value;
		var r4_ip = get_by_id("static_ip4").value;
		var full_ip= ip.substring(0, ip.lastIndexOf(".")) +"." + r4_ip;
		var i = parseInt(get_by_id("edit").value,10)+1;
		var edit = parseInt(get_by_id("edit").value);
		get_by_id("table1").rows[i].cells[0].innerHTML = "<center><input type=\"checkbox\" name=\"enable"+ i +"\" "+ is_checked +" disabled></center>";
		get_by_id("table1").rows[i].cells[1].innerHTML = "<center>"+ get_by_id("name").value +"</center>"
		get_by_id("table1").rows[i].cells[2].innerHTML = "<center>"+ get_by_id("mac").value +"</center>"
		get_by_id("table1").rows[i].cells[3].innerHTML = "<center>"+ full_ip +"</center>"
		get_by_id("table1").rows[i].cells[4].innerHTML = "<center><a href=\"javascript:edit_row("+ edit +")\"><img src=\"edit.jpg\" border=\"0\" alt=\"edit\"></a><a href=\"javascript:del_row("+ i +")\"><img src=\"delete.jpg\"  border=\"0\" alt=\"delete\"></a></center>";
	}
	clear_rev_dhcp();
}
		
function send_request(){
	var dhcpsvr = get_by_id("dhcpsvr");
	var revdhcp = get_by_id("dhcpd_reservation");
	var start_ip4 = get_by_id("start_ip4");
	var end_ip4 = get_by_id("end_ip4");
	var static_ip4 = get_by_id("static_ip4");
	var start_obj, end_obj, static_obj;
	var temp_mac = "";
	var temp_ip = "<% CmoGetCfg("lan_ipaddr","none"); %>";
	var temp_mask = "<% CmoGetCfg("lan_netmask","none"); %>";
    var ip = get_by_id("lan_ipaddr").value;
	var mask = get_by_id("lan_netmask").value;			
	var temp_ip_obj = new addr_obj(ip.split("."), ip_addr_msg, false, false);
	var temp_mask_obj = new addr_obj(mask.split("."), subnet_mask_msg, false, false);
	var DNSrelay = get_by_id("DNSrelay");
	var dhcp_les = get_by_id("dhcpd_lease_time").value;		
	var dhcpd_domain_name = get_by_id("dhcpd_domain_name").value
	var reboot_type_value = false;
	
	if (!check_address(temp_ip_obj, temp_mask_obj) || !check_mask(temp_mask_obj)){		
			return false;	
	}
	
	if(Find_word(dhcpd_domain_name,"'") || Find_word(dhcpd_domain_name,'"') || Find_word(dhcpd_domain_name,"/")){
		alert("Local domain name invalid. the legal characters can not enter ',/,''");
		return false;
	}
	
	if (dhcpsvr.checked){
		start_obj = new ip4_obj(start_ip4.value, 1, 254, ZERO_START_IP, INVALID_START_IP);
		end_obj = new ip4_obj(end_ip4.value, 1, 254, ZERO_END_IP, INVALID_END_IP);
		
		if (!check_ip4(start_obj)){
			return false;
		}else if (!check_ip4(end_obj)){
			return false;
		}else if(parseInt(temp_ip_obj.addr[3])>=(parseInt(start_ip4.value)) && (parseInt(temp_ip_obj.addr[3])<=parseInt(end_ip4.value))){
			alert(msg[LAN_RANG_ERROR]);
			return false;
		}else if (parseInt(start_ip4.value) >= parseInt(end_ip4.value)){
			alert(msg[IP_RANGE_ERROR]);
			return false;					
		}else if (!check_integer(dhcp_les,1,999999)){
			alert("Dhcp Lease Time is invalid");
			return false;					
		}		
	}
	
    if (check_address(temp_ip_obj, temp_mask_obj) && check_mask(temp_mask_obj)){
		change_ip();
		update_data();
		
		if (dhcpsvr.checked){
			get_by_id("dhcpd_enable").value = "1";
		}else{
			get_by_id("dhcpd_enable").value = "0";
		}
		
		if (DNSrelay.checked==true){			
			get_by_id("dns_relay").value = "1";
		}else{
			get_by_id("dns_relay").value = "0";
		}
		
		if((temp_ip != ip) || (temp_mask != mask)){
			reboot_type_value = true;
		}
		
		if(reboot_type_value){
			get_by_id("reboot_type").value = "reboot";
			get_by_id("html_response_page").value = "count_down.asp";
		}
		
		if(submit_button_flag == 0){
			submit_button_flag = 1;
			return true;
		}else{
			return false;
		}
	}else{
		return false;
	}	
				
}
	</script>

<link rel="STYLESHEET" type="text/css" href="css_router.css">

<title>D-LINK SYSTEMS, INC | WIRELESS ROUTER | HOME</title>
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.style1 {font-size: 11px}
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
									<li><div id="sidenavoon"><a href="index.asp">Internet</a></div>
									</li>
									<li><div id="sidenavon"><a href="wireless.asp">Wireless settings</a></div>
									</li>
									<li><div id="sidenavoff">Network settings</div>
									</li>
								</ul>
							</div>
						</td>			
					</tr>
				</table>			
			</td>
       <form id="form1" name="form1" method="post" action="apply.cgi">
	   <input type="hidden" id="html_response_page" name="html_response_page" value="back.asp">
	   <input type="hidden" name="html_response_message" value="The setting is saved.">
	   <input type="hidden" name="html_response_return_page" value="lan.asp">
       		<input type="hidden" id="edit" name="edit" value="-1">
                <input type="hidden" id="del_row" name="del_row" value="-1">		
				<input type="hidden" id="max_row" name="max_row" value="-1">
				<input type="hidden" name="mac_clone_addr" id="mac_clone_addr" value="<% CmoGetStatus("mac_clone_addr"); %>">
<input type="hidden" id="dhcpd_reserve_00" name="dhcpd_reserve_00" value="<% CmoGetCfg("dhcpd_reserve_00","none"); %>">				
<input type="hidden" id="dhcpd_reserve_01" name="dhcpd_reserve_01" value="<% CmoGetCfg("dhcpd_reserve_01","none"); %>">
<input type="hidden" id="dhcpd_reserve_02" name="dhcpd_reserve_02" value="<% CmoGetCfg("dhcpd_reserve_02","none"); %>">		
<input type="hidden" id="dhcpd_reserve_03" name="dhcpd_reserve_03" value="<% CmoGetCfg("dhcpd_reserve_03","none"); %>">				
<input type="hidden" id="dhcpd_reserve_04" name="dhcpd_reserve_04" value="<% CmoGetCfg("dhcpd_reserve_04","none"); %>">
<input type="hidden" id="dhcpd_reserve_05" name="dhcpd_reserve_05" value="<% CmoGetCfg("dhcpd_reserve_05","none"); %>">
<input type="hidden" id="dhcpd_reserve_06" name="dhcpd_reserve_06" value="<% CmoGetCfg("dhcpd_reserve_06","none"); %>">				
<input type="hidden" id="dhcpd_reserve_07" name="dhcpd_reserve_07" value="<% CmoGetCfg("dhcpd_reserve_07","none"); %>">
<input type="hidden" id="dhcpd_reserve_08" name="dhcpd_reserve_08" value="<% CmoGetCfg("dhcpd_reserve_08","none"); %>">	
<input type="hidden" id="dhcpd_reserve_09" name="dhcpd_reserve_09" value="<% CmoGetCfg("dhcpd_reserve_09","none"); %>">
<input type="hidden" id="dhcpd_reserve_10" name="dhcpd_reserve_10" value="<% CmoGetCfg("dhcpd_reserve_10","none"); %>">				
<input type="hidden" id="dhcpd_reserve_11" name="dhcpd_reserve_11" value="<% CmoGetCfg("dhcpd_reserve_11","none"); %>">
<input type="hidden" id="dhcpd_reserve_12" name="dhcpd_reserve_12" value="<% CmoGetCfg("dhcpd_reserve_12","none"); %>">		
<input type="hidden" id="dhcpd_reserve_13" name="dhcpd_reserve_13" value="<% CmoGetCfg("dhcpd_reserve_13","none"); %>">				
<input type="hidden" id="dhcpd_reserve_14" name="dhcpd_reserve_14" value="<% CmoGetCfg("dhcpd_reserve_14","none"); %>">
<input type="hidden" id="dhcpd_reserve_15" name="dhcpd_reserve_15" value="<% CmoGetCfg("dhcpd_reserve_15","none"); %>">
<input type="hidden" id="dhcpd_reserve_16" name="dhcpd_reserve_16" value="<% CmoGetCfg("dhcpd_reserve_16","none"); %>">				
<input type="hidden" id="dhcpd_reserve_17" name="dhcpd_reserve_17" value="<% CmoGetCfg("dhcpd_reserve_17","none"); %>">
<input type="hidden" id="dhcpd_reserve_18" name="dhcpd_reserve_18" value="<% CmoGetCfg("dhcpd_reserve_18","none"); %>">	
<input type="hidden" id="dhcpd_reserve_19" name="dhcpd_reserve_19" value="<% CmoGetCfg("dhcpd_reserve_19","none"); %>">	
				<input type="hidden" id="reboot_type" name="reboot_type" value="all">

<input type="hidden" id="dhcp_list" name="dhcp_list" value="<% CmoGetList("dhcpd_leased_table"); %>">
			<td valign="top" id="maincontent_container">			  <div id="maincontent">
				  <div id="box_header"> 
						<h1>Network Settings : </h1>
				   		<p>Use this section to configure the internal network settings of your router and also to configure the built-in DHCP Server to assign IP addresses to the computers on your network. The IP Address that is configured here is the IP Address that you use to access the Web-based management interface. If you change the IP Address here, you may need to adjust your PC's network settings to access the network again. </p>
                        <input name="button" id="button" type="submit" class=button_submit value="Save Settings" onClick="return send_request()">
                        <input name="button2" type=reset class=button_submit value="Don't Save Settings"  onClick="window.location.href='lan.asp'">
		          </div>
					<div class="box"> 
						<h2> Router Settings : </h2>
							<p>Use this section to configure the internal network settings of your router. The IP Address that is configured here is the IP Address that you use to access the Web-based management interface. If you change the IP Address here, you may need to adjust your PC's network settings to access the network again.</p>
                            <table cellpadding="1" cellspacing="1" border="0" width="525">
								<tr>
									<td width="200" align="right" class="form_label"> Router IP Address :</td>
								  <td>&nbsp;&nbsp;&nbsp;<input name="lan_ipaddr" type="text" id="lan_ipaddr" size="20" maxlength="15" value='<% CmoGetCfg("lan_ipaddr","none"); %>'>								    <span>
							      </span>							        </td>
								</tr>
								<tr>
									<td width="200" align="right" class="form_label"> Default Subnet Mask :</td>
									<td>&nbsp;&nbsp;&nbsp;<input name="lan_netmask" type="text" id="lan_netmask" size="20" maxlength="15" value="<% CmoGetCfg("lan_netmask","none"); %>"></td>
								</tr>
								<tr>
                                  <td width="200" align="right" class="form_label"> Local Domain Name :</td>
                                  <td>&nbsp;&nbsp;
                                  <input name="dhcpd_domain_name" type="text" id="dhcpd_domain_name" size="40" maxlength="30" value="<% CmoGetCfg("dhcpd_domain_name","none"); %>"></td>
							  </tr>
								<tr>
									<td width="200" align="right" class="form_label"> Enable DNS Relay :</td>
									<td>&nbsp;
									<input name="DNSrelay" type=checkbox id="DNSrelay">
									<input type="hidden" id="dns_relay" name="dns_relay" value="<% CmoGetCfg("dns_relay","none"); %>">
									</td>
									
								</tr>														
					  </table>
				  </div>
					<div class="box"> 
						<h2> DHCP Server Settings : </h2>
							<p>Use this section to configure the built-in DHCP Server to assign IP addresses to the computers on your network.</p>
                          <table width="525" border=0 cellPadding=1 cellSpacing=1 class=formarea summary="">
                              <tbody>
                                <tr>
                                  <td width="200" class="form_label"><div align="right">Enable DHCP Server :</div></td>
								  
								  <input type="hidden" id="dhcpd_enable" name="dhcpd_enable" value="<% CmoGetCfg("dhcpd_enable","none"); %>">
                                  <td>&nbsp;<input name="dhcpsvr" type=checkbox id="dhcpsvr" onClick="disable_ip()"></td>
                                </tr>
                                <tr>
                                  <td width="200" class=form_label><div align="right"> DHCP IP Address Range :</div></td>
                                  <td width="318">&nbsp;
								    <input name="start_ip4" type="text" id="start_ip4" size="3" maxlength="3">
								    &nbsp;to
         						    <input name="end_ip4" type="text" id="end_ip4" size="3" maxlength="3"> 
       						       (addresses within the LAN subnet) </td>
								   <input type="hidden" id="dhcpd_start" name="dhcpd_start" value="<% CmoGetCfg("dhcpd_start","none"); %>">
								   <input type="hidden" id="dhcpd_end" name="dhcpd_end" value="<% CmoGetCfg("dhcpd_end","none"); %>">
                                </tr>
                                <tr>
                                  <td width="200" class=form_label><div align="right"> DHCP Lease Time :</div></td>
                                  <td>&nbsp;
								    
								    <input type="text" id="dhcpd_lease_time" name="dhcpd_lease_time" size="6" maxlength="6" value="<% CmoGetCfg("dhcpd_lease_time","none"); %>"> (minutes)								    </td>
                                </tr>
                                
                              </tbody>
                    </table>
				  </div>
					<div class=box>
            <h2>Add DHCP Reservation : </h2>
            <table width="525" border=0 cellPadding=1 cellSpacing=1 class=formarea>
              <tbody>
              <tr>
                <td width="200" class=form_label><div align="right">Enable :</div></td>
                <td width="318">&nbsp;<input name="dhcpd_reservation" type=checkbox id="dhcpd_reservation" value="1"> 
              </td></tr>
              <tr>
                <td class=form_label><div align="right">Computer Name :&nbsp;</div></td>
                <td>&nbsp;&nbsp;<input name="name" id="name" size="19" maxLength=19>
                  <input name="button22" id="button22" type=button value="<<" style="width: 24; height: 24" onClick="clone_mac()"> 		
                  <select id=dhcp name=dhcp size=1>
					<option value="-1">Computer Name</option>
				  <script>set_lan_dhcp_list()</script>
				</select></td>
              </tr>
              <tr>
                <td width="200" class="form_label"><div align="right">IP Address :</div></td>
                <td>&nbsp;<span id="r_ip1"></span><!-- insert name=ip1 -->
                    . 
                    <span id="r_ip2"></span><!-- insert name=ip2 -->
                    . 
                    <span id="r_ip3"></span><!-- insert name=ip3 -->
                    .  
                  <input type=text id="static_ip4" name="static_ip4" size=3 maxlength=3>                  &nbsp;
                  </td>
              </tr>
              <tr>
                <td width="200" class=form_label><div align="right">MAC Address :</div></td>
                <td>&nbsp;
                  <input type=text id=mac name=mac maxlength=17 value="00:00:00:00:00:00" size="19">
</td>
              </tr>
              <tr>
                <td width="200" class=form_label><div align="right"></div></td>
                <td>&nbsp;&nbsp;<input name="clone" type="button"  id="clone" value="Copy Your PC's MAC Address" onClick="clone_mac_action()">
                  </td>
              </tr>
			  <tr>
					<td>&nbsp;</td>
					<td>&nbsp;&nbsp;<input type="button" name="add_to_tmp" id="add_to_tmp" value="Save" onClick="add_row()">
					&nbsp;&nbsp;<input type="button" name="clear_revdhcp" id="clear_revdhcp" value="Clear" onClick="clear_rev_dhcp()"></td>
			  </tr>
			  </tbody></table>
            </div>
			        <div class="box">
			    <h2>DHCP Reservations List:</h2>
                <table width="90%"  border="0">
                  <tr>
                    <td><table width="500" id="table1" border=0 cellPadding=1 cellSpacing=1 class="formlisting">
                  <tr class="form_label_row"> 
                    <td><strong>Enable</strong></td>
                    <td><strong>Computer Name</strong></td>
                    <td><strong>MAC Address</strong></td>
                    <td><strong>IP Address</strong></td>                  
                  </tr>                 
				<script>	
					set_reservation();
					for(i=0;i<DataArray.length;i++){
						var is_checked = "";
						if(parseInt(DataArray[i].Enable)){
							is_checked = " checked";
						}
						document.write("<tr class=\"form_label_row\"><td><input type=\"checkbox\" name=\"enable"+ i +"\" "+ is_checked +" disabled></td><td>"+ DataArray[i].Name +"</td><td>"+ DataArray[i].MAC +"</td><td>"+ DataArray[i].IP +"</td><td><a href=\"javascript:edit_row("+ i +")\"><img src=\"edit.jpg\" border=\"0\" alt=\"edit\"></a><a href=\"javascript:del_row("+ parseInt(i+1,10) +")\"><img src=\"delete.jpg\"  border=\"0\" alt=\"delete\"></a></td></tr>");
					}
				</SCRIPT>
              </TBODY></TABLE></TD></TR></TBODY></TABLE></DIV>
                        <div class=box>
                          <h2>Dynamic DHCP Client List : </h2>
                          <table width="90%"  border="0">
                          <tr>
                            <td><table width="90%" border=0 cellPadding=1 cellSpacing=1 class="formlisting" align="center">
                              <tr class="form_label_row">
                                <td><strong>Computer Name</strong></td>
                                <td><strong>IP Address</strong></td>
                                <td><strong>MAC Address</strong></td>
                                <td><strong>Expired Time</strong></td>
                              </tr>
                            <script>
							if(get_by_id("dhcp_list").value !=""){
								var temp_dhcp_list = get_by_id("dhcp_list").value.split(",");
	
								for (var i = 0; i < temp_dhcp_list.length; i++){	
									var temp_data = temp_dhcp_list[i].split("/");
									if(temp_data.length > 1){
									document.write("<tr bgcolor=\"#FFFFFF\" class=\"form_label_row\"><td><font face=\"Tahoma\" size=\"2\">"+ temp_data[0] +"</font></td><td><font face=\"Tahoma\" size=\"2\">"+ temp_data[1] +"</font></td><td><font face=\"Tahoma\" size=\"2\">"+ temp_data[2] +"</font></td><td><font face=\"Tahoma\" size=\"2\">"+ temp_data[3] +"</font></td></tr>");		
									}
								}
							}	
							</script>
                            </table></td>
                          </tr>
                          </table>
                        </div>
				</div></td></form>
				<form id="form2" name="form2" method="post" action="mac_clone.cgi"><input type="hidden" name="html_response_page" value="lan.asp"><input type="hidden" name="html_response_return_page" value="lan.asp"></form>
			<td valign="top" width="150" id="sidehelp_container" align="left">
				<table cellSpacing=0 cellPadding=2 bgColor=#ffffff border=0>
                  <tbody>
                    <tr>
                      <td id=help_text><strong>Helpful Hints..</strong><br>
                         <p class="style1"> If you already have a DHCP server on your network or are using static IP addresses on all the devices on your network, uncheck <strong>Enable DHCP Server </strong> to disable this feature. </p>
                          <p class="style1"> In order to ensure that devices on your network are always assigned the same IP address, add a <strong>DHCP Reservation </strong> for each device. </p></td>
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
	onPageLoad();
	disable_ip();
</script>
</html>
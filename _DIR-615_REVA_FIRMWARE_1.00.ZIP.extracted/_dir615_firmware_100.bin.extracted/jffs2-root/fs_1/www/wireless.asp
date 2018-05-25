<html>
<head>
<script language="JavaScript" src="public.js"></script>
<script language="JavaScript"> 
var submit_button_flag = 0;
var DataArray = new Array();

	function Data(enable, text, value , onList) 
	{
		this.Enable = enable;
		this.Text = text;
		this.Value = value;
		this.OnList = onList ;
	}

	function onPageLoad(){
		var sel_wlan0_enable = "<% CmoGetCfg("wlan0_enable","none"); %>";
		var p_wlan0_enable = get_by_id("w_enable");
		if(sel_wlan0_enable == "1"){
			p_wlan0_enable.checked =true;
		}else{
			p_wlan0_enable.checked =false;
		}
		
		get_by_id("show_ssid").value = hex_to_a(get_by_id("wlan0_ssid").value);
		
		var sel_wlan0_auto_channel_enable = "<% CmoGetCfg("wlan0_auto_channel_enable","none"); %>";
		var p_wlan0_auto_channel_enable = get_by_id("auto_channel");
		if(sel_wlan0_auto_channel_enable == "1"){
			p_wlan0_auto_channel_enable.checked =true;
		}else{
			p_wlan0_auto_channel_enable.checked =false;
		}
		
		var sel_wlan0_ssid_broadcast = "<% CmoGetCfg("wlan0_ssid_broadcast","none"); %>";
		var p_wlan0_ssid_broadcast = get_by_name("ssid_bro");
		if(sel_wlan0_ssid_broadcast == "1"){
			p_wlan0_ssid_broadcast[0].checked =true;
		}else{
			p_wlan0_ssid_broadcast[1].checked =true;
		}
	
		var sel_dot11_mode = "<% CmoGetCfg("wlan0_dot11_mode","none"); %>";
		if(sel_dot11_mode=="11bgn"){
				get_by_id("dot11_mode").selectedIndex = 0;				
		}else if(sel_dot11_mode=="11n"){
				get_by_id("dot11_mode").selectedIndex = 1;
		}else if(sel_dot11_mode=="11bg"){
				get_by_id("dot11_mode").selectedIndex = 2;
		}else{
				get_by_id("dot11_mode").selectedIndex = 3;
		}
	
	
		var wlan0_wep_display= "<% CmoGetCfg("wlan0_wep_display","none"); %>";
		if(wlan0_wep_display=="hex"){
				get_by_id("wlan0_wep_display").selectedIndex = 0;				
		}else{
				get_by_id("wlan0_wep_display").selectedIndex = 1;
		}

		var wlan0_psk_cipher_type= "<% CmoGetCfg("wlan0_psk_cipher_type","none"); %>";

		var temp_r0 = get_by_id("wlan0_eap_radius_server_0").value;
		var Dr0 = temp_r0.split("/");
		if(Dr0.length>1){
			get_by_id("radius_ip1").value=Dr0[0];
			get_by_id("radius_port1").value=Dr0[1];
			get_by_id("radius_pass1").value=Dr0[2];
		}
		
		var temp_r1 = get_by_id("wlan0_eap_radius_server_1").value;
		var Dr1 = temp_r1.split("/");
		if(Dr0.length>1){
			get_by_id("radius_ip2").value=Dr1[0];
			get_by_id("radius_port2").value=Dr1[1];
			get_by_id("radius_pass2").value=Dr1[2];
		}
		
		var wlan0_wep_default_key= "<% CmoGetCfg("wlan0_wep_default_key","none"); %>";
		if(wlan0_wep_default_key=="1"){
				get_by_id("wep_def_key").selectedIndex = 0;				
		}else if(wlan0_wep_default_key=="2"){
				get_by_id("wep_def_key").selectedIndex = 1;
		}else if(wlan0_wep_default_key=="3"){
				get_by_id("wep_def_key").selectedIndex = 2;		
		}else{
				get_by_id("wep_def_key").selectedIndex = 3;
		}

		//wep_key_len-->0-->5,1-->13
		var wlan0_security= "<% CmoGetCfg("wlan0_security","none"); %>";		
		if(wlan0_security == "disable"){
			set_selectIndex(0,get_by_id("wep_type"));
		}else if(wlan0_security == "wep_open_64"){
			set_selectIndex(1,get_by_id("wep_type"));
			set_selectIndex(0,get_by_id("auth_type"));
			set_selectIndex(5,get_by_id("wep_key_len"));
		}else if(wlan0_security == "wep_open_128"){
			set_selectIndex(1,get_by_id("wep_type"));
			set_selectIndex(0,get_by_id("auth_type"));
			set_selectIndex(13,get_by_id("wep_key_len"));
		}else if(wlan0_security == "wep_share_64"){
			set_selectIndex(1,get_by_id("wep_type"));
			set_selectIndex(1,get_by_id("auth_type"));
			set_selectIndex(5,get_by_id("wep_key_len"));
		}else if(wlan0_security == "wep_share_128"){
			set_selectIndex(1,get_by_id("wep_type"));
			set_selectIndex(1,get_by_id("auth_type"));
			set_selectIndex(13,get_by_id("wep_key_len"));
		}else if(wlan0_security == "wpa_psk"){
			set_selectIndex(2,get_by_id("wep_type"));
			set_selectIndex(2,get_by_id("wpa_type"));
		}else if(wlan0_security == "wpa_eap"){
			set_selectIndex(3,get_by_id("wep_type"));
			set_selectIndex(2,get_by_id("wpa_type"));
		}else if(wlan0_security == "wpa2_psk"){
			set_selectIndex(2,get_by_id("wep_type"));
			set_selectIndex(1,get_by_id("wpa_type"));
		}else if(wlan0_security == "wpa2_eap"){
			set_selectIndex(3,get_by_id("wep_type"));
			set_selectIndex(1,get_by_id("wpa_type"));
		}else if(wlan0_security == "wpa2auto_psk"){
			set_selectIndex(2,get_by_id("wep_type"));
			set_selectIndex(0,get_by_id("wpa_type"));
		}else if(wlan0_security == "wpa2auto_eap"){
			set_selectIndex(3,get_by_id("wep_type"));
			set_selectIndex(0,get_by_id("wpa_type"));
		}else{
			alert("security error");
		}
		
		
		
		if(get_by_id("wlan0_wep_display").selectedIndex == 0 && get_by_id("wep_key_len").selectedIndex == 0){
			get_by_id("key1_64_ascii").style.display = "none"; 
			get_by_id("key2_64_ascii").style.display = "none"; 
			get_by_id("key3_64_ascii").style.display = "none"; 
			get_by_id("key4_64_ascii").style.display = "none";
			get_by_id("key1_128_ascii").style.display = "none"; 
			get_by_id("key2_128_ascii").style.display = "none"; 
			get_by_id("key3_128_ascii").style.display = "none"; 
			get_by_id("key4_128_ascii").style.display = "none";
			get_by_id("key1_64_hex").style.display = ""; 
			get_by_id("key2_64_hex").style.display = ""; 
			get_by_id("key3_64_hex").style.display = ""; 
			get_by_id("key4_64_hex").style.display = "";
			get_by_id("key1_128_hex").style.display = "none"; 
			get_by_id("key2_128_hex").style.display = "none"; 
			get_by_id("key3_128_hex").style.display = "none"; 
			get_by_id("key4_128_hex").style.display = "none";
			
			 
		}else if(get_by_id("wlan0_wep_display").selectedIndex == 0 && get_by_id("wep_key_len").selectedIndex == 1){
			get_by_id("key1_64_ascii").style.display = "none"; 
			get_by_id("key2_64_ascii").style.display = "none"; 
			get_by_id("key3_64_ascii").style.display = "none"; 
			get_by_id("key4_64_ascii").style.display = "none";
			get_by_id("key1_128_ascii").style.display = "none"; 
			get_by_id("key2_128_ascii").style.display = "none"; 
			get_by_id("key3_128_ascii").style.display = "none"; 
			get_by_id("key4_128_ascii").style.display = "none";
			get_by_id("key1_64_hex").style.display = "none"; 
			get_by_id("key2_64_hex").style.display = "none"; 
			get_by_id("key3_64_hex").style.display = "none"; 
			get_by_id("key4_64_hex").style.display = "none";
			get_by_id("key1_128_hex").style.display = ""; 
			get_by_id("key2_128_hex").style.display = ""; 
			get_by_id("key3_128_hex").style.display = ""; 
			get_by_id("key4_128_hex").style.display = "";
		}else if(get_by_id("wlan0_wep_display").selectedIndex == 1 && get_by_id("wep_key_len").selectedIndex == 0){
			get_by_id("key1_64_ascii").style.display = ""; 
			get_by_id("key2_64_ascii").style.display = ""; 
			get_by_id("key3_64_ascii").style.display = ""; 
			get_by_id("key4_64_ascii").style.display = "";
			get_by_id("key1_128_ascii").style.display = "none"; 
			get_by_id("key2_128_ascii").style.display = "none"; 
			get_by_id("key3_128_ascii").style.display = "none"; 
			get_by_id("key4_128_ascii").style.display = "none";
			get_by_id("key1_64_hex").style.display = "none"; 
			get_by_id("key2_64_hex").style.display = "none"; 
			get_by_id("key3_64_hex").style.display = "none"; 
			get_by_id("key4_64_hex").style.display = "none";
			get_by_id("key1_128_hex").style.display = "none"; 
			get_by_id("key2_128_hex").style.display = "none"; 
			get_by_id("key3_128_hex").style.display = "none"; 
			get_by_id("key4_128_hex").style.display = "none";
		}else{
			get_by_id("key1_64_ascii").style.display = "none"; 
			get_by_id("key2_64_ascii").style.display = "none"; 
			get_by_id("key3_64_ascii").style.display = "none"; 
			get_by_id("key4_64_ascii").style.display = "none";
			get_by_id("key1_128_ascii").style.display = ""; 
			get_by_id("key2_128_ascii").style.display = ""; 
			get_by_id("key3_128_ascii").style.display = ""; 
			get_by_id("key4_128_ascii").style.display = "";
			get_by_id("key1_64_hex").style.display = "none"; 
			get_by_id("key2_64_hex").style.display = "none"; 
			get_by_id("key3_64_hex").style.display = "none"; 
			get_by_id("key4_64_hex").style.display = "none";
			get_by_id("key1_128_hex").style.display = "none"; 
			get_by_id("key2_128_hex").style.display = "none"; 
			get_by_id("key3_128_hex").style.display = "none"; 
			get_by_id("key4_128_hex").style.display = "none";
		}
		
		get_by_id("wpapsk1").value = hex_to_a(get_by_id("wlan0_psk_pass_phrase").value);
		
		//®³¨ú wep_type ªº­È
		for(i=0;i<get_by_id("wep_type").length;i++){
			DataArray[DataArray.length++] = new Data(true,get_by_id("wep_type").options[i].text,get_by_id("wep_type").options[i].value,i);
		}
	}

	function change_wep_key_fun(){
		var key_length =get_by_id("wep_key_len").value;
		var key_type = get_by_id("wlan0_wep_display").value;
		
		if(key_length=="5" && key_type=="hex"){
			get_by_id("key1_64_ascii").style.display = "none"; 
			get_by_id("key2_64_ascii").style.display = "none"; 
			get_by_id("key3_64_ascii").style.display = "none"; 
			get_by_id("key4_64_ascii").style.display = "none";
			get_by_id("key1_128_ascii").style.display = "none"; 
			get_by_id("key2_128_ascii").style.display = "none"; 
			get_by_id("key3_128_ascii").style.display = "none"; 
			get_by_id("key4_128_ascii").style.display = "none";
			get_by_id("key1_64_hex").style.display = ""; 
			get_by_id("key2_64_hex").style.display = ""; 
			get_by_id("key3_64_hex").style.display = ""; 
			get_by_id("key4_64_hex").style.display = "";
			get_by_id("key1_128_hex").style.display = "none"; 
			get_by_id("key2_128_hex").style.display = "none"; 
			get_by_id("key3_128_hex").style.display = "none"; 
			get_by_id("key4_128_hex").style.display = "none";
		}else if(key_length=="13" && key_type=="hex"){
			get_by_id("key1_64_ascii").style.display = "none"; 
			get_by_id("key2_64_ascii").style.display = "none"; 
			get_by_id("key3_64_ascii").style.display = "none"; 
			get_by_id("key4_64_ascii").style.display = "none";
			get_by_id("key1_128_ascii").style.display = "none"; 
			get_by_id("key2_128_ascii").style.display = "none"; 
			get_by_id("key3_128_ascii").style.display = "none"; 
			get_by_id("key4_128_ascii").style.display = "none";
			get_by_id("key1_64_hex").style.display = "none"; 
			get_by_id("key2_64_hex").style.display = "none"; 
			get_by_id("key3_64_hex").style.display = "none"; 
			get_by_id("key4_64_hex").style.display = "none";
			get_by_id("key1_128_hex").style.display = ""; 
			get_by_id("key2_128_hex").style.display = ""; 
			get_by_id("key3_128_hex").style.display = ""; 
			get_by_id("key4_128_hex").style.display = "";
		}else if(key_length=="5" && key_type=="ascii"){
			get_by_id("key1_64_ascii").style.display = ""; 
			get_by_id("key2_64_ascii").style.display = ""; 
			get_by_id("key3_64_ascii").style.display = ""; 
			get_by_id("key4_64_ascii").style.display = "";
			get_by_id("key1_128_ascii").style.display = "none"; 
			get_by_id("key2_128_ascii").style.display = "none"; 
			get_by_id("key3_128_ascii").style.display = "none"; 
			get_by_id("key4_128_ascii").style.display = "none";
			get_by_id("key1_64_hex").style.display = "none"; 
			get_by_id("key2_64_hex").style.display = "none"; 
			get_by_id("key3_64_hex").style.display = "none"; 
			get_by_id("key4_64_hex").style.display = "none";
			get_by_id("key1_128_hex").style.display = "none"; 
			get_by_id("key2_128_hex").style.display = "none"; 
			get_by_id("key3_128_hex").style.display = "none"; 
			get_by_id("key4_128_hex").style.display = "none";
		}else{
			get_by_id("key1_64_ascii").style.display = "none"; 
			get_by_id("key2_64_ascii").style.display = "none"; 
			get_by_id("key3_64_ascii").style.display = "none"; 
			get_by_id("key4_64_ascii").style.display = "none";
			get_by_id("key1_128_ascii").style.display = ""; 
			get_by_id("key2_128_ascii").style.display = ""; 
			get_by_id("key3_128_ascii").style.display = ""; 
			get_by_id("key4_128_ascii").style.display = "";
			get_by_id("key1_64_hex").style.display = "none"; 
			get_by_id("key2_64_hex").style.display = "none"; 
			get_by_id("key3_64_hex").style.display = "none"; 
			get_by_id("key4_64_hex").style.display = "none";
			get_by_id("key1_128_hex").style.display = "none"; 
			get_by_id("key2_128_hex").style.display = "none"; 
			get_by_id("key3_128_hex").style.display = "none"; 
			get_by_id("key4_128_hex").style.display = "none";
		}
	}


	function disable_wireless(){	
		get_by_id("wlan0_channel").disabled = !get_by_id("w_enable").checked;
		get_by_id("auto_channel").disabled = !get_by_id("w_enable").checked;
		if(!get_by_id("w_enable").checked){
			get_by_id("show_wep").style.display = "none";
			get_by_id("show_wpa_psk").style.display = "none";
    		get_by_id("show_wpa_eap").style.display = "none";
    		get_by_id("show_wpa_mode").style.display = "none";
    		set_selectIndex(0,get_by_id("wep_type"));
    	}
	}
	
	function disable_channel(){		
		if (get_by_id("auto_channel").checked){
			get_by_id("wlan0_channel").disabled = true;
		}else{
			get_by_id("wlan0_channel").disabled = false;
		}
	}
		     
    function check_8021x(){
    	var ip1 = get_by_id("radius_ip1").value;
    	var ip2 = get_by_id("radius_ip2").value;
        var temp_ip1 = new addr_obj(ip1.split("."), radius1_msg, false, false);
        var temp_ip2 = new addr_obj(ip2.split("."), radius2_msg, true, false);
        var temp_radius1 = new raidus_obj(temp_ip1, get_by_id("radius_port1").value, get_by_id("radius_pass1").value);
        var temp_radius2 = new raidus_obj(temp_ip2, get_by_id("radius_port2").value, get_by_id("radius_pass2").value);
        
        if (!check_radius(temp_radius1)){
    		return false;        	               
    	}else if (ip2 != "" && ip2 != "0.0.0.0"){
    		if (!check_radius(temp_radius2)){
    			return false;        	               
    		}
    	}
    	
    	return true;	    
    }
	    
    function check_wpa(){
    	var wep_type = get_by_id("wep_type");
		
    	
    	if (wep_type.selectedIndex == 3){
			return check_8021x();
		}else if (wep_type.selectedIndex == 2){
        	var psk_value = get_by_id("wpapsk1").value;
            if (psk_value.length < 8){                   
	        	alert(msg[PSK_LENGTH_ERROR]);
	            return false;
           	}else if (psk_value.length > 63){
           		if(psk_value.match(/[^0-9]/g)){
           			alert(msg[PSK_OVER_LEN]);
           			get_by_id("wpapsk1").value = psk_value.substring(0, 63);
           		}
           	}
        }
        return true;         
    }
   
  
	function show_wpa_wep(){			
		var wep_type = get_by_id("wep_type").options[get_by_id("wep_type").selectedIndex].value;	
		
		get_by_id("show_wep").style.display = "none";
		get_by_id("show_wpa_psk").style.display = "none";
    	get_by_id("show_wpa_eap").style.display = "none";
    	get_by_id("show_wpa_mode").style.display = "none";	
    	
		if (wep_type > 0){
			if (wep_type == 1){	// wep
				get_by_id("show_wep").style.display = "";
        	}else if (wep_type == 2){	// wpa-personal
        		get_by_id("show_wpa_mode").style.display = "";
        		get_by_id("show_wpa_psk").style.display = "";
        		get_by_id("show_wpa_eap").style.display = "none";
        	}else if (wep_type == 3){	// wpa-enterprise
        		get_by_id("show_wpa_mode").style.display = "";
        		get_by_id("show_wpa_psk").style.display = "none";
        		get_by_id("show_wpa_eap").style.display = "";
        	}
		}
    }

	function precheck_key(){
		var wep_type = get_by_id("wep_type");
		
		if(wep_type.selectedIndex == 0){
			return true;
		}else{
			return check_key();	
		}
	}
	
function check_wep_key_fun(){
		var wep_def_key = get_by_name("wep_def_key");
		var wep_key_type = get_by_id("wlan0_wep_display").value;
		var wep_key_len = get_by_id("wep_key_len").value;
		var key_len_msg;
		if(get_by_id("wlan0_wep_display").value== "hex" && get_by_id("wep_key_len").value== "5"){		
	        for(j=1;j<5;j++){
				var key = get_by_id("key"+ j +"_64_hex").value;		//key1
				if (key == ''){
					alert(msg[WEP_KEY_EMPTY]);
		        	return false;
	        	}
				           	  
				if (key.length < 10){
	                alert("The length of Key" + j + " must be " + 10 + " characters");
	                return false;
				}else{
					for (var j = 0; j < key.length; j++){
	            		if (!check_hex(key.substring(j, j+1))){
	            			alert("Key" + j + " is invalid. The legal characters are 0~9, A~F, or a~f");
	            			return false;
	            		}
	            	}
				}
        	}
		}else if(get_by_id("wlan0_wep_display").value== "hex" && get_by_id("wep_key_len").value== "13"){
									
	        for(j=1;j<5;j++){
	        	var key = get_by_id("key"+ j +"_128_hex").value;	//key1
				if (key == ''){
					alert(msg[WEP_KEY_EMPTY]);
		        	return false;
	        	}
				if (key.length < 26){
                	alert("The length of Key" + j + " must be " + 26 + " characters");
                	return false;
				}else{
					for (var j = 0; j < key.length; j++){
	            		if (!check_hex(key.substring(j, j+1))){
	            			alert("Key" + j + " is invalid. The legal characters are 0~9, A~F, or a~f");
	            			return false;
	            		}
	            	}
				}
			}
		}else if(get_by_id("wlan0_wep_display").value== "ascii"&& get_by_id("wep_key_len").value== "5"){	
								
        	for(var j=1;j<5;j++){
        		var key = get_by_id("key"+ j+"_64_ascii").value;	//key1
				if (key == ''){
					alert(msg[WEP_KEY_EMPTY]);
			        return false;
	        	}
				if (key.length < 5){
	                 alert("The length of Key" + j + " must be " + get_by_id("wep_key_len").value + " characters");
	                return false;
				}
        	}
		}else if(get_by_id("wlan0_wep_display").value== "ascii" && get_by_id("wep_key_len").value== "13"){	
									
        	for(var j=1;j<5;j++){
        		var key = get_by_id("key"+ j +"_128_ascii").value;	//key1
				if (key == ''){
					alert(msg[WEP_KEY_EMPTY]);
		        	return false;
        		}				           	  
				if (key.length < 13){
	                alert("The length of Key" + j + " must be " + get_by_id("wep_key_len").value + " characters");
                	return false;
				}	
        	}
		}else {
			alert("wep error!");
			return false;
		}
	
		return true;
	}	
	
	    
	function send_request(){				
		var wep_type_value = get_by_id("wep_type").options[get_by_id("wep_type").selectedIndex].value;
		
		if(!(check_ssid("show_ssid"))){
				return false;
		}

		if(wep_type_value == 1){
			if(!(check_wep_key_fun())){
				return false;
			}
		}
		
		if(wep_type_value == 2 || wep_type_value == 3 || wep_type_value == 4){
			if(!(check_wpa())){
				return false;
			}
		}

		var w_enable = get_by_id("w_enable");	
		if (w_enable.checked==true){						
			get_by_id("wlan0_enable").value = "1";
		}else{		
			get_by_id("wlan0_enable").value = "0";
		}	
				
		var auto_channel = get_by_id("auto_channel");	
		if (auto_channel.checked==true){						
			get_by_id("wlan0_auto_channel_enable").value = "1";
		}else{		
			get_by_id("wlan0_auto_channel_enable").value = "0";
		}		
				
		if(get_by_id("dot11_mode").selectedIndex == 0){
			get_by_id("wlan0_dot11_mode").value="11bgn";
		}else if(get_by_id("dot11_mode").selectedIndex == 1){
			get_by_id("wlan0_dot11_mode").value="11n";
		}else if(get_by_id("dot11_mode").selectedIndex == 2){
			get_by_id("wlan0_dot11_mode").value="11bg";
		}else if(get_by_id("dot11_mode").selectedIndex == 3){
			get_by_id("wlan0_dot11_mode").value="11g";
		}else{
			alert("11 N setting error");
		}	
				
				
				
		var ssid_bro = get_by_name("ssid_bro");	
		if (ssid_bro[0].checked){
			get_by_id("wlan0_ssid_broadcast").value = "1";
		}else{		
			get_by_id("wlan0_ssid_broadcast").value = "0";
		}		
				
		if(get_by_id("wep_def_key").selectedIndex == 0){
			get_by_id("wlan0_wep_default_key").value = "1";
		}else if(get_by_id("wep_def_key").selectedIndex == 1){
			get_by_id("wlan0_wep_default_key").value = "2";
		}else if(get_by_id("wep_def_key").selectedIndex == 2){
			get_by_id("wlan0_wep_default_key").value = "3";
		}else if(get_by_id("wep_def_key").selectedIndex == 3){
			get_by_id("wlan0_wep_default_key").value = "4";
		}else{
			alert("save def key error");
		}
		
		if(wep_type_value == 0){	//Disabled
			get_by_id("wlan0_security").value = "disable";
		}else if (wep_type_value == 1){ 	//WEP
			if(get_by_id("auth_type").selectedIndex == 0){
				if(get_by_id("wep_key_len").selectedIndex == 0){
					get_by_id("wlan0_security").value = "wep_open_64";
				}else{
					get_by_id("wlan0_security").value = "wep_open_128";
				}			
			}else{
				if(get_by_id("wep_key_len").selectedIndex == 0){
					get_by_id("wlan0_security").value = "wep_share_64";
				}else{
					get_by_id("wlan0_security").value = "wep_share_128";
				}
			}
		}else if (wep_type_value == 2){	//PSK
			if(get_by_id("wpa_type").selectedIndex == 0){
				get_by_id("wlan0_security").value = "wpa2auto_psk";
			}else if(get_by_id("wpa_type").selectedIndex == 1){
				get_by_id("wlan0_security").value = "wpa2_psk";
			}else{
				get_by_id("wlan0_security").value = "wpa_psk";
			}
			get_by_id("wlan0_psk_pass_phrase").value =	a_to_hex(get_by_id("wpapsk1").value);
		}else if (wep_type_value == 3){	//EAP
			if(get_by_id("wpa_type").selectedIndex == 0){
				get_by_id("wlan0_security").value = "wpa2auto_eap";
			}else if(get_by_id("wpa_type").selectedIndex == 1){
				get_by_id("wlan0_security").value = "wpa2_eap";
			}else{
				get_by_id("wlan0_security").value = "wpa_eap";
			}
			var r_ip_0 = get_by_id("radius_ip1").value;
			var r_port_0 = get_by_id("radius_port1").value;
			var r_pass_0 = get_by_id("radius_pass1").value;
			var dat0 =r_ip_0 +"/"+ r_port_0 +"/"+ r_pass_0;
			get_by_id("wlan0_eap_radius_server_0").value = dat0;
				
			var r_ip_1 = get_by_id("radius_ip2").value;
			var r_port_1 = get_by_id("radius_port2").value;
			var r_pass_1 = get_by_id("radius_pass2").value;
			var dat1 =r_ip_1 +"/"+ r_port_1 +"/"+ r_pass_1;
			get_by_id("wlan0_eap_radius_server_1").value = dat1;
		}else{
			alert("save sec error");
		}		
		
				
		//save wep key
		if(wep_type_value == 1){
			if(get_by_id("wlan0_wep_display").selectedIndex == 0){
				if(get_by_id("wep_key_len").selectedIndex == 0){
					get_by_id("wlan0_wep64_key_1").value = get_by_id("key1_64_hex").value;
					get_by_id("wlan0_wep64_key_2").value = get_by_id("key2_64_hex").value;
					get_by_id("wlan0_wep64_key_3").value = get_by_id("key3_64_hex").value;
					get_by_id("wlan0_wep64_key_4").value = get_by_id("key4_64_hex").value;
				}else if(get_by_id("wep_key_len").selectedIndex == 1){
					get_by_id("wlan0_wep128_key_1").value =	get_by_id("key1_128_hex").value;
					get_by_id("wlan0_wep128_key_2").value =	get_by_id("key2_128_hex").value;
					get_by_id("wlan0_wep128_key_3").value =	get_by_id("key3_128_hex").value;
					get_by_id("wlan0_wep128_key_4").value =	get_by_id("key4_128_hex").value;
				}else{
					alert("save key error");
				}
			}else if(get_by_id("wlan0_wep_display").selectedIndex == 1){
				if(get_by_id("wep_key_len").selectedIndex == 0){
					get_by_id("wlan0_wep64_key_1").value = get_by_id("key1_64_ascii").value;
					get_by_id("wlan0_wep64_key_2").value = get_by_id("key2_64_ascii").value;
					get_by_id("wlan0_wep64_key_3").value = get_by_id("key3_64_ascii").value;
					get_by_id("wlan0_wep64_key_4").value = get_by_id("key4_64_ascii").value;
				}else if(get_by_id("wep_key_len").selectedIndex == 1){
					get_by_id("wlan0_wep128_key_1").value =	get_by_id("key1_128_ascii").value;
					get_by_id("wlan0_wep128_key_2").value =	get_by_id("key2_128_ascii").value;
					get_by_id("wlan0_wep128_key_3").value =	get_by_id("key3_128_ascii").value;
					get_by_id("wlan0_wep128_key_4").value =	get_by_id("key4_128_ascii").value;
				}else{
					alert("save key error");
				}
			}else{
				alert("save wep key hex ascii error");
			}
		}
		if(submit_button_flag == 0){
			submit_button_flag = 1;
			get_by_id("wlan0_ssid").value = a_to_hex(get_by_id("show_ssid").value);
			return true;
		}else{
			return false;
		}
	}

	function set_channel(){
		var channel_list = "<% CmoGetStatus("wlan0_channel_list"); %>";
		var current_channel = <% CmoGetCfg("wlan0_channel","none"); %>;
		var ch = channel_list.split(",");
		var obj = get_by_id("wlan0_channel");
		var count = 0;
		
		for (var i = 0; i < ch.length; i++){			
			var ooption = document.createElement("option");						
			ooption.text = ch[i];
			ooption.value = ch[i];				
			obj.options[count++] = ooption;
								
			if (ch[i] == current_channel){
				ooption.selected = true;
			}        		
		}
	}
	
function security_change(obj_value){
	var wep_type = get_by_id("wep_type");
	var wep_type_value = wep_type.options[wep_type.selectedIndex].value;
	var index = Get_selectIndex_num(1,wep_type)
	if(obj_value == "11n" && index < 5){
		if(DataArray[index].Enable){
			wep_type.remove(index);
			DataArray[index].Enable = false;
		}
	}else if(index > 5){
		Clear_list();
		for(i=0;i<DataArray.length;i++){
			wep_type.options.add(new Option(DataArray[i].Text, DataArray[i].Value, false, false));
			DataArray[i].Enable = true;
		}
	}
	set_selectIndex(wep_type_value,wep_type);
}

function Clear_list(){
	var wep_type=get_by_id("wep_type");
	for(var k=wep_type.length;k>-1;k--){
		wep_type.remove(k);
	}
	return true;	
}

var ExpandCollapse = false;
function doExpandCollapse(obj)
{
	if(ExpandCollapse){
		get_by_id("show_advanced").style.display="";
		obj.value = "<< Advanced";
		ExpandCollapse = false;
	}else{
		get_by_id("show_advanced").style.display="none";
		obj.value = "Advanced >>";
		ExpandCollapse = true;
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
									<li><div id="sidenavoff">Wireless Settings</div>
									</li>
									<li><div id="sidenavon"><a href="lan.asp">Network Settings</a></div>
									</li>
								</ul>
							</div>
						</td>			
					</tr>
				</table>			
		  </td>
			<form id="form1" name="form1" method="post" action="apply.cgi">
			<input type="hidden" name="html_response_page" value="back.asp">
<input type="hidden" id="html_response_message" name="html_response_message" value="The setting is saved.">
<input type="hidden" id="html_response_return_page" name="html_response_return_page" value="wireless.asp">
<input type="hidden" id="reboot_type" name="reboot_type" value="wireless">
<input type="hidden" id="wlan0_ssid" name="wlan0_ssid" value="<% CmoGetCfg("wlan0_ssid","none"); %>">
			
			       	<input type="hidden" id="apply" name="apply" value="0">                                    
              <td valign="top" id="maincontent_container">
				<div id="maincontent">
				  <div id="box_header"> 
						<h1>Wireless</h1>
						<h4>Wireless Network Settings</h4>
						<p>Use this section to configure the wireless settings for your D-Link Router. Please note that changes made on this section may also need to be duplicated on your Wireless Client.</p>
						<input name="button" type="submit" class=button_submit value="Save Settings" onClick="return send_request()">
                        <input name="button2" type=reset class=button_submit value="Don't Save Settings"  onClick="window.location.href='wireless.asp'">
					</div>
					<div class="box"> 
						<h2>Wireless Network Settings : </h2>
							<table cellpadding="1" cellspacing="1" border="0" width="525">
								<tr>
									<td width="200" align="right" class="form_label">Enable Wireless :</td>
									<td>&nbsp;
									<input name="w_enable" type="checkbox" id="w_enable" value="1" onClick="disable_wireless()" checked>
									<input type="hidden" id="wlan0_enable" name="wlan0_enable" value="<% CmoGetCfg("wlan0_enable","none"); %>">
									</td>
								</tr>
								<tr>
									<td width="200" align="right" class="form_label">Wireless Network Name :</td>
								<td>&nbsp;&nbsp;&nbsp;<input name="show_ssid" type="text" id="show_ssid" size="20" maxlength="32" value=""> 
									(Also called the SSID)</td>
								</tr>
								<tr>
                                  <td width="200" align="right" class="form_label">Wireless Channel :</td>
                              <td>&nbsp;&nbsp; <select name="wlan0_channel" id="wlan0_channel"></select></td>
							  </tr>
								<tr>
                                  <td width="200" align="right" class="form_label">Enable Auto Channel Scan :</td>
                                  <td>&nbsp;
								  <input name="auto_channel" type="checkbox" id="auto_channel" value="1" onClick="disable_channel()">
								  <input type="hidden" id="wlan0_auto_channel_enable" name="wlan0_auto_channel_enable" value="<% CmoGetCfg("wlan0_auto_channel_enable","none"); %>">
                                      <script>
										set_channel();										
									</script>
                                  </td>
							  </tr>
							  <!--
								<tr>
                                  <td width="200">
                                    <div align="right">Super G Mode :</font></div></td>
                                  <td>&nbsp;
                                    <select id="Superg" name="Superg" onChange="send_submit('form1')">
                                      <option value="0">Disabled</option>
                                      <option value="1">Super G without Turbo</option>
                                      <option value="2">Super G with Dynamic Turbo</option>
                                    </select>
                                  </td>
							  </tr>
								<tr>
                                  <td width="200">
                                	<div align="right">Enable Extended Range Mode :</font></div>
                                  </td>
                              	<td>&nbsp;<input name="xrMode" type="checkbox" id="xrMode" value="1"></td>
							  </tr>
							  -->
							    <tr>
                                  <td width="200">
                              		<div class="form_label">802.11 Mode :</div>
                                  </td>
                              	   <td>&nbsp;&nbsp; <select id="dot11_mode" name="dot11_mode" onChange="security_change(this[this.selectedIndex].value);">                              	   
										<option value="11bgn" selected>802.11 b/g/n mixed</option>
										<option value="11n">802.11 n only</option>
										<option value="11bg">802.11 b/g mixed</option>
										<option value="11g">802.11 g only</option>
									</select>
									<input type="hidden" id="wlan0_dot11_mode" name="wlan0_dot11_mode" value="<% CmoGetCfg("wlan0_dot11_mode","none"); %>">
								</td>
							  </tr>
								<tr>
                                  <td width="200" align="right" class="form_label">Visibility Status&nbsp;:</td>
                              	<td>&nbsp;
								<input type="radio" id="ssid_bro" name="ssid_bro" value="1">
									Visible
								<input type="radio" id="ssid_bro" name="ssid_bro" value="0">
									Invisible
								<input type="hidden" id="wlan0_ssid_broadcast" name="wlan0_ssid_broadcast" value="<% CmoGetCfg("wlan0_ssid_broadcast","none"); %>">
								</td>
							  </tr>														
							</table>
					</div>
					
					<div class="box"> 
						<h2>Wireless Security Mode : </h2>
						<p>To protect your privacy you can configure wireless security features. This device supports three wireless security modes including: WEP, WPA-Personal, and WPA-Enterprise. WEP is the original wireless encryption standard. WPA provides a higher level of security. WPA-Personal does not require an authentication server. The WPA-Enterprise option requires an external RADIUS server.</p>
							<table cellpadding="1" cellspacing="1" border="0" width="525">
							<input type="hidden" id="wlan0_security" name="wlan0_security" value="<% CmoGetCfg("wlan0_security","none"); %>">
								<tr>
									<td width="200" align="right" class="form_label">Security Mode :</td>
								<td>&nbsp;&nbsp;&nbsp;<select id="wep_type" name="wep_type" onChange="show_wpa_wep()" >
										<option value="0" selected>None</option>
										<option value="1">WEP</option>
										<option value="2">WPA-Personal</option>
										<option value="3">WPA-Enterprise</option>
									</select>
								</td>
								</tr>
							</table>
					</div>
					<div class="box" id="show_wep" style="display:none"> 
						<h2>WEP : </h2>
						<div class="box box_alert">
							<p>If you choose the WEP security option this device will <strong>ONLY</strong> operate in <strong>Legacy Wireless mode (802.11B/G)</strong>. This means you will <strong>NOT</strong> get 11N performance due to the fact that WEP is not supported by the Draft 11N specification.</p>
						</div>
						
						<p>WEP is the wireless encryption standard. To use it you must enter the same key(s) into the router and the wireless stations. For 64 bit keys you must enter 10 hex digits into each key box. For 128 bit keys you must enter 26 hex digits into each key box. A hex digit is either a number from 0 to 9 or a letter from A to F. For the most secure use of WEP set the authentication type to &quot;Shared Key&quot; when WEP is enabled. </p>
							
	              	    <p>You may also enter any text string into a WEP key box, in which case it will be converted into a hexadecimal key using the ASCII values of the characters. A maximum of 5 text characters can be entered for 64 bit keys, and a maximum of 13 characters for 128 bit keys.<br></p>
                  	<table cellpadding="1" cellspacing="1" border="0" width="525">
								<tr>
									<td width="200" align="right" class="form_label">Authentication :</td>
									<td>&nbsp;
										<select name="auth_type" id="auth_type">
											<option value="0">Open</option>
											<option value="1">Shared Key</option>
									  </select>
									</td>
								</tr>
								<tr> 
                        <td width="200"> 
                          <div align="right" class="form_label">WEP Encryption :</font></div>
                        </td>
                        <td>&nbsp; 
                          <select id="wep_key_len" name="wep_key_len" size=1 onChange="change_wep_key_fun()">
                            <option value="5">64Bit</option>
                            <option value="13">128Bit</option>
                          </select>
                        </td>
                      </tr>
							<tr> 
                        <td width="200"> 
                          <div align="right" class="form_label">Key Type :</font></div>
                        </td>
                        <td>&nbsp; 
                          <select id="wlan0_wep_display" name="wlan0_wep_display" onChange="change_wep_key_fun()">
                            <option value="hex">HEX</option>
                            <option value="ascii" selected>ASCII</option>
                          </select>
                        </td>
                      </tr>
						<tr>
									<td width="200" align="right" class="form_label">Default WEP Key :</td>
									<td>&nbsp;
										<select name="wep_def_key" id="wep_def_key">
											<option value="0">WEP Key 1</option>
											<option value="1">WEP Key 2</option>
											<option value="2">WEP Key 3</option>
											<option value="3">WEP Key 4</option>
									  </select>
										<input type="hidden" id="wlan0_wep_default_key" name="wlan0_wep_default_key" value="<% CmoGetCfg("wlan0_wep_default_key","none"); %>">
									  
									</td>
					  </tr>
								<tr>
									<td width="200" align="right" class="form_label">WEP Key 1 :</td>
								<td>&nbsp;
								<input type="text" id="key1_64_hex" name="key1_64_hex" maxlength="10" size="15" value="<% CmoGetCfg("wlan0_wep64_key_1","hex"); %>" style="display:none ">
								<input type="text" id="key1_128_hex" name="key1_128_hex" maxlength="26" size="31" value="<% CmoGetCfg("wlan0_wep128_key_1","hex"); %>" style="display:none ">
								<input type="text" id="key1_64_ascii" name="key1_64_ascii" maxlength="5" size="10" value="<% CmoGetCfg("wlan0_wep64_key_1","ascii"); %>" style="display:none ">
								<input type="text" id="key1_128_ascii" name="key1_128_ascii" maxlength="13" size="18" value="<% CmoGetCfg("wlan0_wep128_key_1","ascii"); %>" style="display:none ">
								
								<input type="hidden" id="wlan0_wep64_key_1" name="wlan0_wep64_key_1" value="<% CmoGetCfg("wlan0_wep64_key_1","hex"); %>">
								<input type="hidden" id="wlan0_wep128_key_1" name="wlan0_wep128_key_1" value="<% CmoGetCfg("wlan0_wep128_key_1","hex"); %>">
								<input type="hidden" id="tes" name="tes" value="<% CmoGetCfg("wlan0_wep64_key_1","ascii"); %>">
								<!-- insert name=key1 --></td>
								</tr>
								<tr>
									<td width="200" align="right" class="form_label">WEP Key 2 :</td>
								<td>&nbsp;
								<input type="text" id="key2_64_hex" name="key2_64_hex" maxlength="10" size="15" value="<% CmoGetCfg("wlan0_wep64_key_2","hex"); %>" style="display:none ">
								<input type="text" id="key2_128_hex" name="key2_128_hex" maxlength="26" size="31" value="<% CmoGetCfg("wlan0_wep128_key_2","hex"); %>" style="display:none ">
								<input type="text" id="key2_64_ascii" name="key2_64_ascii" maxlength="5" size="10" value="<% CmoGetCfg("wlan0_wep64_key_2","ascii"); %>" style="display:none ">
								<input type="text" id="key2_128_ascii" name="key2_128_ascii" maxlength="13" size="18" value="<% CmoGetCfg("wlan0_wep128_key_2","ascii"); %>" style="display:none ">
								
								<input type="hidden" id="wlan0_wep64_key_2" name="wlan0_wep64_key_2" value="<% CmoGetCfg("wlan0_wep64_key_2","hex"); %>">
								<input type="hidden" id="wlan0_wep128_key_2" name="wlan0_wep128_key_2" value="<% CmoGetCfg("wlan0_wep128_key_2","hex"); %>">
								<!-- insert name=key2 --></td>
								</tr>
								<tr>
									<td width="200" align="right" class="form_label">WEP Key 3 :</td>
								<td>&nbsp;
								<input type="text" id="key3_64_hex" name="key3_64_hex" maxlength="10" size="15" value="<% CmoGetCfg("wlan0_wep64_key_3","hex"); %>" style="display:none ">
								<input type="text" id="key3_128_hex" name="key3_128_hex" maxlength="26" size="31" value="<% CmoGetCfg("wlan0_wep128_key_3","hex"); %>" style="display:none ">
								<input type="text" id="key3_64_ascii" name="key3_64_ascii" maxlength="5" size="10" value="<% CmoGetCfg("wlan0_wep64_key_3","ascii"); %>" style="display:none ">
								<input type="text" id="key3_128_ascii" name="key3_128_ascii" maxlength="13" size="18" value="<% CmoGetCfg("wlan0_wep128_key_3","ascii"); %>" style="display:none ">
								
								<input type="hidden" id="wlan0_wep64_key_3" name="wlan0_wep64_key_3" value="<% CmoGetCfg("wlan0_wep64_key_3","hex"); %>">
								<input type="hidden" id="wlan0_wep128_key_3" name="wlan0_wep128_key_3" value="<% CmoGetCfg("wlan0_wep128_key_3","hex"); %>">
								<!-- insert name=key3 --></td>
								</tr>
								<tr>
									<td width="200" align="right" class="form_label">WEP Key 4 :</td>
								<td>&nbsp;
								<input type="text" id="key4_64_hex" name="key4_64_hex" maxlength="10" size="15" value="<% CmoGetCfg("wlan0_wep64_key_4","hex"); %>" style="display:none ">
								<input type="text" id="key4_128_hex" name="key4_128_hex" maxlength="26" size="31" value="<% CmoGetCfg("wlan0_wep128_key_4","hex"); %>" style="display:none ">
								<input type="text" id="key4_64_ascii" name="key4_64_ascii" maxlength="5" size="10" value="<% CmoGetCfg("wlan0_wep64_key_4","ascii"); %>" style="display:none ">
								<input type="text" id="key4_128_ascii" name="key4_128_ascii" maxlength="13" size="18" value="<% CmoGetCfg("wlan0_wep128_key_4","ascii"); %>" style="display:none ">
								
								<input type="hidden" id="wlan0_wep64_key_4" name="wlan0_wep64_key_4" value="<% CmoGetCfg("wlan0_wep64_key_4","hex"); %>">
								<input type="hidden" id="wlan0_wep128_key_4" name="wlan0_wep128_key_4" value="<% CmoGetCfg("wlan0_wep128_key_4","hex"); %>">
								<!-- insert name=key4 --></td>
								</tr>
					  </table>
					</div>
					
					
									  <!--STar -->
					<div class="box" id="show_wpa_mode" style="display:none"> 
						<h2>WPA : </h2>
						<p>Use <strong>WPA or WPA2</strong> mode to achieve a balance of strong security and best compatibility. This mode uses WPA for legacy clients while maintaining higher security with stations that are WPA2 capable. Also the strongest cipher that the client supports will be used. For best security, use <strong>WPA2 Only</strong> mode. This mode uses AES(CCMP) cipher and legacy stations are not allowed access with WPA security.	For maximum compatibility, use <strong>WPA Only</strong>. This mode uses TKIP cipher. Some gaming and legacy devices work only in this mode.</p>
						<p>To achieve better wireless performance use <strong>WPA2 Only</strong> security mode (or in other words AES cipher).</p>
						<table cellpadding="1" cellspacing="1" border="0" width="525">
							<TR><TD width="200"><div align="right" class="form_label">WPA Mode&nbsp;:</div></TD>
							<TD width="318" >&nbsp;&nbsp;&nbsp;<select id="wpa_type" name="wpa_type"> 
								<option value="0">Auto (WPA or WPA2)</option> 
								<option value="1">WPA2 Only</option> 
								<option value="2">WPA Only</option>
							</select> </TD></TR>
						</table>
					</div>
				  	<div class="box"  id="show_wpa_psk" style="display:none"> 
				  		<h2>Pre-Shared Key : </h2>
						<table width="525" border="0" cellpadding="1" cellspacing="1">
							<tr>
								<td width="200" align="right" class="form_label">Pre-Shared Key :</td>
								<td width="318" colspan="2">&nbsp;&nbsp;<input type="password" id="wpapsk1" name="wpapsk1" size="40" maxlength="64" value="">
					  			<input type="hidden" id="wlan0_psk_pass_phrase" name="wlan0_psk_pass_phrase" size="40" maxlength="64" value="<% CmoGetCfg("wlan0_psk_pass_phrase","none"); %>">
							</td></tr>
						</table>
				 	</div>
					<div class="box"  id="show_wpa_eap" style="display:none"> 
						<h2>EAP (802.1x) : </h2>
						<p>When WPA enterprise is enabled, the router uses EAP (802.1x) to authenticate clients via a remote RADIUS server. </p>
						<table width="525" border="0" cellpadding="1" cellspacing="1">
							<tr>
								<input type="hidden" id="wlan0_eap_radius_server_0" name="wlan0_eap_radius_server_0" value="<% CmoGetCfg("wlan0_eap_radius_server_0","none"); %>">
								<input type="hidden" id="wlan0_eap_radius_server_1" name="wlan0_eap_radius_server_1" value="<% CmoGetCfg("wlan0_eap_radius_server_1","none"); %>">
					  		</tr>
							<tr>
					  			<td width="220" class="form_label">RADIUS server IP Address:</td>
					  			<td width="298">&nbsp;
					    			<input id="radius_ip1" name="radius_ip1" maxlength=15 size=15>
					  			</td>
				  			</tr>
							<tr>
					  			<td width="220" class="form_label">RADIUS server Port: </td>						  			
					  			<td>&nbsp;
					    			<input type="text" id="radius_port1" name="radius_port1" size="8" maxlength="5" value="1812">
					    		</td>
				  			</tr>
							<tr>
					  			<td width="220" class="form_label">RADIUS server Shared Secret: </td>				  			
					  			<td>&nbsp;
					    			<input type="password" id="radius_pass1" name="radius_pass1" size="32" maxlength="64">
					  			</td>
				  			</tr></table>									
							<p>
							  <INPUT id="button3" name="button3" type=button class=button_submit onclick="doExpandCollapse(this);" value="Advanced >>">
                            </p>
							<div id="show_advanced" style="display:">
								<p class="box_msg">Optional backup RADIUS server:</p>
								<table width="525" border="0" cellpadding="1" cellspacing="1">
									<tr>
							  			<td width="220" class="form_label">Second RADIUS server IP Address:</td>
										<td width="298">&nbsp;
								    		<input id="radius_ip2" name="radius_ip2" maxlength=15 size=15>
                            			</td>
									</tr>
									<tr>
							  			<td width="220" class="form_label">Second RADIUS server Port: </td>
						  				<td>&nbsp;
							      			<input type="text" id="radius_port2" name="radius_port2" size="8" maxlength="5" value="1812">
                          				</td>
					  				</tr>
									<tr>
							  			<td width="220" class="form_label">Second RADIUS server Shared Secret: </td>
						  				<td>&nbsp;
						      				<input type="password" id="radius_pass2" name="radius_pass2" size="32" maxlength="64">
	                          			</td>
                          			</tr>
								</table>
							</div>
					</div>
				<!--End-->
				  
				  
				  
		  </form>
            <td valign="top" width="150" id="sidehelp_container" align="left">
				<table cellSpacing=0 cellPadding=2 bgColor=#ffffff border=0>
                  <tbody>
                    <tr>
                      <td id=help_text><strong>Helpful Hints..</strong><br>
                         
                          <p><span class="style1">Changing your Wireless Network Name is the first step in securing your wireless network. We recommend that you change it to a familiar name that does not contain any personal information.</span></p>
                          <!--<p class="style1"> If you are not utilizing Super G with Dynamic Turbo for it's speed improvements, we recommend that you Enable Auto Channel Scan so that the router can select the best possible channel for your wireless network to operate on.</p>-->
                          <p class="style1"> We recommend that you Enable Auto Channel Scan so that the router can select the best possible channel for your wireless network to operate on.</p>
                          <p class="style1">  If you have enabled Wireless Security, make sure you write down WEP Key or Passphrase that you have configured. You will need to enter this information on any wireless device that you connect to your wireless network. </p></td>
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
 <script>
 			onPageLoad();                     
            disable_wireless();
            disable_channel();
            show_wpa_wep();
            security_change(get_by_id("wlan0_dot11_mode").value);
            doExpandCollapse(get_by_id("button3"));
        </script>    
<br>
<div align="center">Copyright &copy; 2004-2005 D-Link Systems, Inc.</div>
<br>
</body>
<!-- insert name=restore_cfg -->
</html>
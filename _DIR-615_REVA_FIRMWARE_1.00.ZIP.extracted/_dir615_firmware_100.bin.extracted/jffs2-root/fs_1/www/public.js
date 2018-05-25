var subnet_mask = new Array(0, 128, 192, 224, 240, 248, 252, 254, 255);

var msg = new Array("The IP Address entered is invalid",	//INVALID_IP_ADDRESS
					"The IP Address cannot be zero.",	//ZERO_IP_ADDRESS
					"IP Address",	//IP_ADDRESS_DESC
					"The Subnet Mask entered is invalid",	//INVALID_MASK_ADDRESS
					"The Subnet Mask cannot be zero",	//ZERO_MASK_ADDRESS
					"Subnet Mask",	//MASK_ADDRESS_DESC
					"The Gateway IP Address entered is invalid",	//INVALID_GATEWAY_ADDRESS
					"The Gateway IP Address cannot be zero",	//ZERO_GATEWAY_ADDRESS
					"Gateway IP Address",	//GATEWAY_ADDRESS_DESC
					"The IP Address and the Gateway IP Address are not in the same subnet",	//NOT_SAME_DOMAIN
					"The Starting IP Address entered is invalid (IP Range: 1~254)",	//INVALID_START_IP
					"Please enter another Starting IP Address",	//ZERO_START_IP
					"Starting IP Address",	//START_IP_DESC
					"The LAN IP Address and the Start IP Address are not in the same subnet",	//START_INVALID_DOMAIN
					"The Ending IP Address entered is invalid (IP Range: 1~254)",	//INVALID_END_IP
					"Please enter another Ending IP Address",	//ZERO_END_IP
					"Ending IP Address",	//END_IP_DESC
					"The LAN IP Address and the End IP Address are not in the same subnet",	//END_INVALID_DOMAIN
					"The Primary DNS Address entered is invalid",	//INVALID_DNS_ADDRESS
					"The Primary DNS Address cannot be zero",	//ZERO_DNS_ADDRESS
					"Primary DNS Address",	//DNS_ADDRESS_DESC
					"The SSID field cannot be blank",	//SSID_EMPTY_ERROR					
					"WEP cannot be disabled when the Authentication type is set to Shared Key",	//AUTH_TYPE_ERROR
					"The length of the Passphrase must be at least 8 characters",	//PSK_LENGTH_ERROR
					"The Confirmed Passphrase does not match the Passphrase",	//PSK_MATCH_ERROR
					"The Confirmed Password does not match the New Password",	//MATCH_PWD_ERROR
					"The selected WEP key field cannot be blank",	//WEP_KEY_EMPTY
					"Please enter another Key",	//WIZARD_KEY_EMPTY
					"Quit setup wizard and discard settings?",	//QUIT_WIZARD
					"The legal characters for a MAC Address are 0~9, A~F, or a~f",	//MAC_ADDRESS_ERROR	 																	
					"The Ending IP Address must be greater than the Starting IP Address",	//IP_RANGE_ERROR
					"The Secondary DNS Address entered is invalid",	//INVALID_SEC_DNS_ADDRESS
					"The Secondary DNS Address cannot be zero",	//ZERO_SEC_DNS_ADDRESS
					"Secondary DNS Address",	//SEC_DNS_ADDRESS_DESC
					"The confirmed password does not match the new Admin password",	//ADMIN_PASS_ERROR
					"The confirmed password does not match the new User password",	//USER_PASS_ERROR
					"Please enter another Server Name",	//DDNS_SERVER_ERROR
					"Please enter another Host Name",	//DDNS_HOST_ERROR
					"Please enter another User Name",	//DDNS_USER_ERROR
					"Please enter another Password",	//DDNS_PASS_ERROR
					"Restore to Factory Default Settings?",	//RESTORE_DEFAULT
					"Are you sure you want to reboot the router?",	//REBOOT_ROUTER
					"Load settings from a saved configuration file?",	//LOAD_SETTING
					"Please select a saved configuration file to upload",	//LOAD_FILE_ERROR
					"Only the Admin account can download the settings",	//DOWNLOAD_SETTING_ERROR
					"Please enter either a Host Name or an IP Address",	//PING_IP_ERROR
					"Please enter another SMTP Server or IP Address",	//SMTP_SERVER_ERROR
					"Please enter a valid email Address",	//EMAIL_ADDRESS_ERROR
					"Are you sure that you want to delete this Virtual Server Rule?",	//DEL_SERVER_MSG
					"Are you sure that you want to delete this Application Rule",	//DEL_APPLICATION_MSG
					"Are you sure that you want to delete this Filter?",	//DEL_FILTER_MSG
					"Are you sure that you want to delete this Route?",	//DEL_ROUTE_MSG
					"Are you sure that you want to delete this MAC Address?",	//DEL_MAC_MSG
					"Are you sure that you want to delete this Keyword?",	//DEL_KEYWORD_MSG
					"Are you sure that you want to delete this Domain?",	//DEL_DOMAIN_MSG
					"Are you sure that you want to delete this Entry?",	//DEL_ENTRY_MSG
					"Are you sure that you want to delete this DHCP Reservation?",	//DEL_STATIC_DHCP_MSG
					"Please enter another name",	//NAME_ERROR
					"Please enter a Trigger Port number",	//TRIGGER_PORT_ERROR
					"Please enter a Firewall Port number",	//PUBLIC_PORT_ERROR
					"Please enter another Private Port number",	//PRIVATE_PORT_ERROR
					"Please enter a Private IP Address.",	//PRIVATE_IP_ERROR
					"Please enter another port number",	//PORT_ERROR
					"Please select a Keyword to delete",	//DEL_KEYWORD_ERROR
					"The Keyword entered already exists in the list",	//SAME_KEYWORD_ERROR
					"Please enter another Keyword",	//KEYWORD_ERROR
					"Unable to add another Keyword",	//ADD_KEYWORD_ERROR
					"Please select a Blocked Domain to delete",	//DEL_BLOCK_DOMAIN_ERROR
					"Please select a Permitted Domain to delete",	//DEL_PERMIT_DOMAIN_ERROR
					"The Domain entered already exists in the list of Blocked Domains",	//SAME_BLOCK_DOMAIN
					"Please enter another Blocked Domain",	//BLOCK_DOMAIN_ERROR
					"Unable to add another Blocked Domain",	//ADD_BLOCK_DOMAIN_ERROR
					"The Domain entered already exists in the list of Permitted Domains",	//SAME_PERMIT_DOMAIN
					"Please enter another Permitted Domain",	//PERMIT_DOMAIN_ERROR
					"Unable to add another Permitted Domain",	//ADD_PERMIT_DOMAIN_ERROR
					"Please select a Firmware file to upgrade the router to",	//FIRMWARE_UPGRADE_ERROR
					"Please enter another Domain",	//DOMAIN_ERROR
					"Unable to add another Control Domains",	//ADD_CONTROL_DOMAIN_ERROR
					"Please select a Control Domain to delete",	//DEL_CONTROL_DOMAIN_ERROR
					"Please enter at least one Control Domain",	//CONTROL_DOMAIN_ERROR
					"The RADIUS Server 1 IP Address entered is invalid",	//INVALID_RADIUS_SERVER1_IP
					"The Radius Server 1 IP Address cannot be zero",	//ZERO_RADIUS_SERVER1_IP
					"Radius Server 1 IP Address",	//RADIUS_SERVER1_IP_DESC
					"The RADIUS Server 2 IP Address entered is invalid",	//INVALID_RADIUS_SERVER2_IP
					"The Radius Server 2 IP Address cannot be zero",	//ZERO_RADIUS_SERVER2_IP
					"Radius Server 2 IP Address",	//RADIUS_SERVER2_IP_DESC
					"The IP Address entered is invalid (IP Range: 1~254)",	//INVALID_STATIC_DHCP_IP
					"Please enter another IP Address",	//ZERO_STATIC_DHCP_IP
					"Please enter another Name",	//STATIC_DHCP_NAME
					"The Server IP Address entered is invalid",	//INVALID_SERVER_IP
					"The Server IP Address cannot be zero",	//ZERO_SERVER_IP
					"Server IP Address",	//SERVER_IP_DESC
					"The Passwords entered do not match",	//MATCH_WIZARD_PWD_ERROR
					"The Source Start IP Address entered is invalid",	//INVALID_SOURCE_START_IP
					"The Source Start IP Address cannot be zero",	//ZERO_SOURCE_START_IP
					"Source Start IP Address",	//SOURCE_START_IP_DESC
					"The Source End IP Address entered is invalid",	//INVALID_SOURCE_END_IP
					"The Source End IP Address cannot be zero",	//ZERO_SOURCE_END_IP
					"Source End IP Address",	//SOURCE_END_IP_DESC
					"The Destination Start IP Address entered is invalid",	//INVALID_DEST_START_IP
					"The Destination Start IP Address cannot be zero",	//ZERO_DEST_START_IP
					"Destination Start IP Address",	//DEST_START_IP_DESC
					"The Destination End IP Address entered is invalid",	//INVALID_DEST_END_IP
					"The Destination End IP Address cannot be zero",	//ZERO_DEST_END_IP
					"Destination End IP Address",	//DEST_END_IP_DESC
					"The length of the Passphrase must be between 8 and 63 characters",	//PSK_OVER_LEN
					"Reset JumpStart?",	//RESET_JUMPSTAR
					"Are you sure that you want to delete this rule?",	//DEL_RULE_MSG
					"Are you sure that you want to delete this schedule?",	// DEL_SCHEDULE_MSG
					"Unable to add another schedule",			// ADD_SCHEDULE_ERROR
					"Schedule Name can not empty",	//SCHEDULE_NAME_ERROR
					"Schedule Name can not enter all space",	//SCHEDULE_NAME_SPACE_ERROR
					"The Start Time entered is invalid",	// START_TIME_ERROR
					"The End Time entered is invalid",	// END_TIME_ERROR,
					"The Start Time cannot be greater than the End Time",	//	TIME_RANGE_ERROR
					"Please select a machine first",		// SELECT_MACHINE_ERROR
					"Please select an Application Name first",	// SELECT_APPLICATION_ERROR
					"Please select a Computer Name first",		// SELECT_COMPUTER_ERROR
					"Please enter another Wireless Security Password",	// SECURITY_PWD_ERROR
					"The URL/Domain entered is already in the list",		//	DUPLICATE_URL_ERROR
					"Login Name error",  //LOGIN_NAME_ERROR
					"Login Password error",	//LOGIN_PASS_ERROR
					"DHCP range can't include LAN IP Address."	//LAN_RANG_ERROR
				);
var INVALID_IP_ADDRESS = 0;
var ZERO_IP_ADDRESS = 1;
var IP_ADDRESS_DESC = 2;
var INVALID_MASK_ADDRESS = 3;
var ZERO_MASK_ADDRESS = 4;
var MASK_ADDRESS_DESC = 5;
var INVALID_GATEWAY_ADDRESS = 6;
var ZERO_GATEWAY_ADDRESS = 7;
var GATEWAY_ADDRESS_DESC = 8;
var NOT_SAME_DOMAIN = 9;
var INVALID_START_IP = 10;
var ZERO_START_IP = 11;
var START_IP_DESC = 12;
var START_INVALID_DOMAIN = 13;
var INVALID_END_IP = 14;
var ZERO_END_IP = 15;
var END_IP_DESC = 16;
var END_INVALID_DOMAIN = 17;
var INVALID_DNS_ADDRESS = 18;
var ZERO_DNS_ADDRESS = 19;
var DNS_ADDRESS_DESC = 20;
var SSID_EMPTY_ERROR = 21;
var AUTH_TYPE_ERROR = 22;
var PSK_LENGTH_ERROR = 23;
var PSK_MATCH_ERROR = 24;
var MATCH_PWD_ERROR = 25;
var WEP_KEY_EMPTY = 26;
var WIZARD_KEY_EMPTY = 27;
var QUIT_WIZARD = 28;
var MAC_ADDRESS_ERROR = 29;
var IP_RANGE_ERROR = 30;
var INVALID_SEC_DNS_ADDRESS = 31;
var ZERO_SEC_DNS_ADDRESS = 32;
var SEC_DNS_ADDRESS_DESC = 33;
var ADMIN_PASS_ERROR = 34;
var USER_PASS_ERROR = 35;
var DDNS_SERVER_ERROR = 36;
var DDNS_HOST_ERROR = 37;
var DDNS_USER_ERROR = 38;
var DDNS_PASS_ERROR = 39;
var RESTORE_DEFAULT = 40;
var REBOOT_ROUTER = 41;
var LOAD_SETTING = 42;
var LOAD_FILE_ERROR = 43;
var DOWNLOAD_SETTING_ERROR = 44;
var PING_IP_ERROR = 45;
var SMTP_SERVER_ERROR = 46;
var EMAIL_ADDRESS_ERROR = 47;
var DEL_SERVER_MSG = 48;
var DEL_APPLICATION_MSG = 49;
var DEL_FILTER_MSG = 50;
var DEL_ROUTE_MSG = 51;
var DEL_MAC_MSG = 52;
var DEL_KEYWORD_MSG = 53;
var DEL_DOMAIN_MSG = 54;
var DEL_ENTRY_MSG = 55;
var DEL_STATIC_DHCP_MSG = 56;
var NAME_ERROR = 57;
var TRIGGER_PORT_ERROR = 58;
var PUBLIC_PORT_ERROR = 59;
var PRIVATE_PORT_ERROR = 60;
var PRIVATE_IP_ERROR = 61;
var PORT_ERROR = 62;
var DEL_KEYWORD_ERROR = 63;
var SAME_KEYWORD_ERROR = 64;
var KEYWORD_ERROR = 65;
var ADD_KEYWORD_ERROR = 66;
var DEL_BLOCK_DOMAIN_ERROR = 67;
var DEL_PERMIT_DOMAIN_ERROR = 68;
var SAME_BLOCK_DOMAIN = 69;
var BLOCK_DOMAIN_ERROR = 70;
var ADD_BLOCK_DOMAIN_ERROR = 71;
var SAME_PERMIT_DOMAIN = 72;
var PERMIT_DOMAIN_ERROR = 73;
var ADD_PERMIT_DOMAIN_ERROR = 74;
var FIRMWARE_UPGRADE_ERROR = 75;
var DOMAIN_ERROR = 76;
var ADD_CONTROL_DOMAIN_ERROR = 77;
var DEL_CONTROL_DOMAIN_ERROR = 78;
var CONTROL_DOMAIN_ERROR = 79;
var INVALID_RADIUS_SERVER1_IP = 80;
var ZERO_RADIUS_SERVER1_IP = 81;
var RADIUS_SERVER1_IP_DESC = 82;
var INVALID_RADIUS_SERVER2_IP = 83;
var ZERO_RADIUS_SERVER2_IP = 84;
var RADIUS_SERVER2_IP_DESC = 85;
var INVALID_STATIC_DHCP_IP = 86;
var ZERO_STATIC_DHCP_IP = 87;
var STATIC_DHCP_NAME = 88;
var INVALID_SERVER_IP = 89;
var ZERO_SERVER_IP = 90;
var SERVER_IP_DESC = 91;
var MATCH_WIZARD_PWD_ERROR = 92;
var INVALID_SOURCE_START_IP = 93;
var ZERO_SOURCE_START_IP = 94;
var SOURCE_START_IP_DESC = 95;
var INVALID_SOURCE_END_IP = 96;
var ZERO_SOURCE_END_IP = 97;
var SOURCE_END_IP_DESC = 98;
var INVALID_DEST_START_IP = 99;
var ZERO_DEST_START_IP = 100;
var DEST_START_IP_DESC = 101;
var INVALID_DEST_END_IP = 102;
var ZERO_DEST_END_IP = 103;
var DEST_END_IP_DESC = 104;
var PSK_OVER_LEN = 105;
var RESET_JUMPSTAR = 106;
var DEL_RULE_MSG = 107;
var DEL_SCHEDULE_MSG = 108;
var ADD_SCHEDULE_ERROR = 109;
var SCHEDULE_NAME_ERROR = 110
var SCHEDULE_NAME_SPACE_ERROR = 111;
var START_TIME_ERROR = 112;
var END_TIME_ERROR = 113;
var TIME_RANGE_ERROR = 114;
var SELECT_MACHINE_ERROR = 115;
var SELECT_APPLICATION_ERROR = 116;
var SELECT_COMPUTER_ERROR = 117;
var SECURITY_PWD_ERROR = 118;
var DUPLICATE_URL_ERROR = 119;
var LOGIN_NAME_ERROR = 120;
var LOGIN_PASS_ERROR = 121;
var LAN_RANG_ERROR = 122;

var default_rule = new Array(new rule_obj("FTP", "TCP", 21, 21),
							 new rule_obj("HTTP", "TCP", 80, 80),
							 new rule_obj("HTTPS", "TCP", 443, 443),
							 new rule_obj("DNS", "UDP", 53, 53),
							 new rule_obj("SMTP", "TCP", 25, 25),
							 new rule_obj("POP3", "TCP", 110, 110),
							 new rule_obj("Telnet", "TCP", 23, 23),
							 new rule_obj("IPSec", "UDP", 500, 500),
							 new rule_obj("PPTP", "TCP", 1723, 1723),
							 new rule_obj("NetMeeting", "TCP", 1720, 1720),
							 new rule_obj("DCS-1000", "TCP", 80, 80),
							 new rule_obj("DCS-2000 DCS-5300", "TCP", 800, 800),
							 new rule_obj("i2eye", "TCP", 1720, 1720),
							 new rule_obj("DCS-3120", "TCP", 3120, 3120)
						  );

var default_appl = new Array(new appl_obj("Battle.net", "TCP", "6112", "TCP", "6112"),
							 new appl_obj("Dialpad", "TCP", "7175", "TCP", "51200-51201,51210"),
							 new appl_obj("ICU II", "TCP", "2019", "TCP", "2000-2038,2050-2051,2069,2085,3010-3030"),
							 new appl_obj("MSN Gaming Zone", "TCP", "47624", "TCP", "2300-2400,28800-29000"),
							 new appl_obj("PC-to-Phone", "TCP", "12053", "TCP", "12120,12122,24150-24220"),
							 new appl_obj("Quick Time 4", "TCP", "554", "TCP", "6970-6999")
							);

var ip_addr_msg = new Array("The IP address is an invalid address.",	// INVALID_IP
						    "The IP address can not be zero.",	// ZERO_IP
						    "The 1st address of IP address must be an integer.",	// FIRST_IP_ERROR
						    "The 2nd address of IP address must be an integer.",	// SECOND_IP_ERROR
						    "The 3rd address of IP address must be an integer.",	// THIRD_IP_ERROR
						    "The 4th address of IP address must be an integer.",	// FOURTH_IP_ERROR
						    "The 1st range of IP address must be between 1 to 254.",			// FIRST_RANGE_ERROR
						    "The 2nd range of IP address must be between 0 to 255.",			// SECOND_RANGE_ERROR
						    "The 3rd range of IP address must be between 0 to 255.",			// THIRD_RANGE_ERROR
						    "The 4th range of IP address must be between 1 to 254.",			// FOURTH_RANGE_ERROR
						    "The 4th range of IP address must be between 0 to 255."			// FOURTH_RANGE_ERROR1
						    );
						    
var subnet_mask_msg = new Array("The Subnet Mask is an invalid address.",	// INVALID_IP
						        "The Subnet Mask can not be zero.",	// ZERO_IP
						        "The 1st address of Subnet Mask must be an integer.",	// FIRST_IP_ERROR
						    	"The 2nd address of Subnet Mask must be an integer.",	// SECOND_IP_ERROR
						    	"The 3rd address of Subnet Mask must be an integer.",	// THIRD_IP_ERROR
						    	"The 4th address of Subnet Mask must be an integer.",	// FOURTH_IP_ERROR
						    	"The 1st range of Subnet Mask must be 128, 192, 224, 240, 248, 252, 254, 255.",			// FIRST_RANGE_ERROR
						    	"The 2nd range of Subnet Mask must be 0, 128, 192, 224, 240, 248, 252, 254, 255.",			// SECOND_RANGE_ERROR
						    	"The 3rd range of Subnet Mask must be 0, 128, 192, 224, 240, 248, 252, 254, 255.",			// THIRD_RANGE_ERROR
						    	"The 4th range of Subnet Mask must be 0, 128, 192, 224, 240, 248, 252, 254, 255."			// FOURTH_RANGE_ERROR						    
						    );
var gateway_msg = new Array("The Gateway address is an invalid address.",	// INVALID_IP
						    "The Gateway address can not be zero.",	// ZERO_IP
						    "The 1st address of Gateway address must be an integer.",	// FIRST_IP_ERROR
						    "The 2nd address of Gateway address must be an integer.",	// SECOND_IP_ERROR
						    "The 3rd address of Gateway address must be an integer.",	// THIRD_IP_ERROR
						    "The 4th address of Gateway address must be an integer.",	// FOURTH_IP_ERROR
						    "The 1st range of Gateway address must be between 1 to 254.",			// FIRST_RANGE_ERROR
						    "The 2nd range of Gateway address must be between 0 to 255.",			// SECOND_RANGE_ERROR
						    "The 3rd range of Gateway address must be between 0 to 255.",			// THIRD_RANGE_ERROR
						    "The 4th range of Gateway address must be between 1 to 254.",			// FOURTH_RANGE_ERROR
						    "The 4th range of Gateway address must be between 0 to 255."				// FOURTH_RANGE_ERROR1
						    );
var dns1_addr_msg = new Array("The DNS Server 1 is an invalid address.",	// INVALID_IP
						         "The DNS Server 1 can not be zero.",	// ZERO_IP
						         "The 1st address of DNS Server 1 must be an integer.",	// FIRST_IP_ERROR
						         "The 2nd address of DNS Server 1 must be an integer.",	// SECOND_IP_ERROR
						         "The 3rd address of DNS Server 1 must be an integer.",	// THIRD_IP_ERROR
						         "The 4th address of DNS Server 1 must be an integer.",	// FOURTH_IP_ERROR
						         "The 1st range of DNS Server 1 must be between 1 to 254.",			// FIRST_RANGE_ERROR
						         "The 2nd range of DNS Server 1 must be between 0 to 255.",			// SECOND_RANGE_ERROR
						         "The 3rd range of DNS Server 1 must be between 0 to 255.",			// THIRD_RANGE_ERROR
						         "The 4th range of DNS Server 1 must be between 1 to 254."			// FOURTH_RANGE_ERROR
						         );
var dns2_addr_msg = new Array("The DNS Server 2 is an invalid address.",	// INVALID_IP
						       	 "The DNS Server 2 can not be zero.",	// ZERO_IP
						         "The 1st address of DNS Server 2 must be an integer.",	// FIRST_IP_ERROR
						         "The 2nd address of DNS Server 2 must be an integer.",	// SECOND_IP_ERROR
						         "The 3rd address of DNS Server 2 must be an integer.",	// THIRD_IP_ERROR
						         "The 4th address of DNS Server 2 must be an integer.",	// FOURTH_IP_ERROR
						         "The 1st range of DNS Server 2 must be between 1 to 254.",			// FIRST_RANGE_ERROR
						         "The 2nd range of DNS Server 2 must be between 0 to 255.",			// SECOND_RANGE_ERROR
						         "The 3rd range of DNS Server 2 must be between 0 to 255.",			// THIRD_RANGE_ERROR
						         "The 4th range of DNS Server 2 must be between 1 to 254."			// FOURTH_RANGE_ERROR
						        );
var dns_server_msg = new Array("The DNS Server is an invalid address.",	// INVALID_IP
						          "The DNS Server can not be zero.",	// ZERO_IP
						          "The 1st address of DNS Server must be an integer.",	// FIRST_IP_ERROR
						          "The 2nd address of DNS Server must be an integer.",	// SECOND_IP_ERROR
						          "The 3rd address of DNS Server must be an integer.",	// THIRD_IP_ERROR
						          "The 4th address of DNS Server must be an integer.",	// FOURTH_IP_ERROR
						          "The 1st range of DNS Server must be between 1 to 254.",			// FIRST_RANGE_ERROR
						          "The 2nd range of DNS Server must be between 0 to 255.",			// SECOND_RANGE_ERROR
						          "The 3rd range of DNS Server must be between 0 to 255.",			// THIRD_RANGE_ERROR
						          "The 4th range of DNS Server must be between 1 to 254."			// FOURTH_RANGE_ERROR
						         );


var radius1_msg = new Array("The Radius Server 1 IP address is an invalid address.",	// INVALID_IP
						       "The Radius Server 1 IP address can not be zero.",	// ZERO_IP
						       "The 1st address of Radius Server 1 IP address must be an integer.",	// FIRST_IP_ERROR
						       "The 2nd address of Radius Server 1 IP address must be an integer.",	// SECOND_IP_ERROR
						       "The 3rd address of Radius Server 1 IP address must be an integer.",	// THIRD_IP_ERROR
						       "The 4th address of Radius Server 1 IP address must be an integer.",	// FOURTH_IP_ERROR
						       "The 1st range of Radius Server 1 IP address must be between 1 to 254.",			// FIRST_RANGE_ERROR
						       "The 2nd range of Radius Server 1 IP address must be between 0 to 255.",			// SECOND_RANGE_ERROR
						       "The 3rd range of Radius Server 1 IP address must be between 0 to 255.",			// THIRD_RANGE_ERROR
						       "The 4th range of Radius Server 1 IP address must be between 1 to 254.",			// FOURTH_RANGE_ERROR
						       "", // FOURTH_RANGE_ERROR1
						       "The port of Radius Server 1 is invalid.",	// RADIUS_SERVER_PORT_ERROR
						       "The Shared Secret of Radius Server 1 can not be empty.", // RADIUS_SERVER_SECRET_ERROR
						       "The Shared Secret of Radius Server 1 only allow enter a ~ z, A ~ Z, and 0 ~ 9"	//RADIUS_SERVER_SECRET_ENTER_ERROR
						      );

var radius2_msg = new Array("The Radius Server 2 IP address is an invalid address.",	// INVALID_IP
						       "The Radius Server 2 IP address can not be zero.",	// ZERO_IP
						       "The 1st address of Radius Server 2 IP address must be an integer.",	// FIRST_IP_ERROR
						       "The 2nd address of Radius Server 2 IP address must be an integer.",	// SECOND_IP_ERROR
						       "The 3rd address of Radius Server 2 IP address must be an integer.",	// THIRD_IP_ERROR
						       "The 4th address of Radius Server 2 IP address must be an integer.",	// FOURTH_IP_ERROR
						       "The 1st range of Radius Server 2 IP address must be between 1 to 254.",			// FIRST_RANGE_ERROR
						       "The 2nd range of Radius Server 2 IP address must be between 0 to 255.",			// SECOND_RANGE_ERROR
						       "The 3rd range of Radius Server 2 IP address must be between 0 to 255.",			// THIRD_RANGE_ERROR
						       "The 4th range of Radius Server 2 IP address must be between 1 to 254.",			// FOURTH_RANGE_ERROR
						       "", // FOURTH_RANGE_ERROR1
						       "The port of Radius Server 2 is invalid.",	// RADIUS_SERVER_PORT_ERROR
						       "The Shared Secret of Radius Server 2 can not be empty.", // RADIUS_SERVER_SECRET_ERROR
						       "The Shared Secret of Radius Server 2 only allow enter a ~ z, A ~ Z, and 0 ~ 9"	//RADIUS_SERVER_SECRET_ENTER_ERROR
						      );
var INVALID_IP = 0;
var ZERO_IP = 1;
var FIRST_IP_ERROR = 2;
var SECOND_IP_ERROR = 3;
var THIRD_IP_ERROR = 4;
var FOURTH_IP_ERROR = 5;
var FIRST_RANGE_ERROR = 6;
var SECOND_RANGE_ERROR = 7;
var THIRD_RANGE_ERROR = 8;
var FOURTH_RANGE_ERROR = 9;
var FOURTH_RANGE_ERROR1 = 10;
var RADIUS_SERVER_PORT_ERROR = 11;	// for radius server
var RADIUS_SERVER_SECRET_ERROR = 12; // for radius server
var RADIUS_SERVER_SECRET_ENTER_ERROR = 13;

function rule_obj(name, prot, public_port, private_port){	
	this.name = name;
	this.prot = prot;		// TCP, UDP
	this.public_port = public_port;
	this.private_port = private_port;
}

function appl_obj(name, trigger_prot, trigger_port, public_prot, public_port){
	this.name = name;
	this.trigger_prot = trigger_prot;		// TCP, UDP
	this.trigger_port = trigger_port;
	this.public_prot = public_prot;
	this.public_port = public_port;
}

function set_application_option(){
	for (var i = 0; i < default_rule.length; i++){
		var temp_rule = default_rule[i];
		document.write("<option>" + temp_rule.name + "</option>");
	}
}

function set_special_appl_option(){
	for (var i = 0; i < default_appl.length; i++){
		var temp_appl = default_appl[i];
		document.write("<option>" + temp_appl.name + "</option>");
	}
}

function addr_obj(addr, e_msg, allow_zero, is_network){
	this.addr = addr;
	this.e_msg = e_msg;
	this.allow_zero = allow_zero;		
	this.is_network = is_network;
}

function varible_obj(var_value, desc, min, max, is_even){	
	this.var_value = var_value;
	this.desc = desc;
	this.min = min;
	this.max = max;		
	this.is_even = is_even;		
}

function raidus_obj(ip, port, secret){
	this.ip = ip;
	this.port = port;
	this.secret = secret;
}

function ip4_obj(ip, min_range, max_range, e_msg1, e_msg2){	
	this.ip = ip;	
	this.min_range = min_range;
	this.max_range = max_range;		
	this.e_msg1 = msg[e_msg1];
	this.e_msg2 = msg[e_msg2];	
}

function change_filter(which_filter){
    var html_file;
    
    switch(which_filter){
		case 0 :
	    	html_file = "adv_filters.asp";
	    	break;
		case 1 :
	    	html_file = "adv_filters_mac.asp";
	    	break;	    	
		case 2 :
	    	html_file = "adv_filters_url.asp";
	    	break;
		case 3 :
	    	html_file = "adv_filters_domain.asp";
	    	break;
	}
	
	location.href = html_file;
}

function change_routing(which_routing){
    var html_file;
    
    switch(which_routing){
        case 0 :
            html_file = "adv_routing.asp";
            break;
        case 1 :
            html_file = "adv_routing_dynamic.asp";
            break;
        case 2 :
            html_file = "adv_routing_table.asp";
            break;
    }
    
    location.href = html_file;
}

function check_hex(data){	
	data = data.toUpperCase();
	
	if (!(data >= 'A' && data <= 'F') && !(data >= '0' && data <= '9')){	
		return false;
	}	
	return true;
}

function check_ip4(ip4){
	var temp_ip = (ip4.ip).split(" ");
	
	if (ip4.ip == ""){
		alert(ip4.e_msg1);
		return false;
	}else if (isNaN(ip4.ip) || temp_ip.length > 1 || parseInt(ip4.ip) < ip4.min_range || parseInt(ip4.ip) > ip4.max_range){
		alert(ip4.e_msg2);
		return false;
	}
	return true;
}

function check_key(){            	                        	
	var length = get_length();
	var wep_type = get_by_id("wep_type");
	var wep_def_key = get_by_id("wep_def_key");
	var wep_key_type = get_by_id("wlan0_wep_display").options[get_by_id("wlan0_wep_display").selectedIndex];
	if (wep_type.selectedIndex == 1 ){		                                 	                	
    	for (var i = 1; i < 5; i++){					
		    var key = get_by_id("key" + i).value;
		    
		    if (get_by_id("wep_def_key").selectedIndex == (i-1)){
		        if (key == ''){
    	            alert(msg[WEP_KEY_EMPTY]);
			        return false;
    	        }
		    }
	        if (key != ''){
	            if (key.length < length){
	                alert("The length of Key" + i + " must be " + length + " characters");
	                return false;
	            }else{
	            	if (wep_key_type.value == "hex"){	// check the key is hex or not
		            	for (var j = 0; j < key.length; j++){
		            		if (!check_hex(key.substring(j, j+1))){
		            			alert("Key" + i + " is invalid. The legal characters are 0~9, A~F, or a~f");
		            			return false;
		            		}
		            	}
		            }
	            }
	        }                	  
    	}                	                	
	}
	return true;
}

function check_mac(mac){
    var temp_mac = mac.split(":");
    var error = true;
    
    if (temp_mac.length == 6){
	    for (var i = 0; i < 6; i++){        
	        var temp_str = temp_mac[i];
	        
	        if (temp_str == ""){
	            error = false;
	        }else{
	            if (!check_hex(temp_str.substring(0,1)) || !check_hex(temp_str.substring(1))){
	                error = false;
	            }
	        }
	        
	        if (!error){
	            break;
	        }
	    }
	}else{
		error = false;
	}
    return error;
}

function check_varible(obj){	
	var temp_obj = (obj.var_value).split(" ");
	
	if (temp_obj == ""){
		alert(obj.desc + " cannot be left blank");	
		return false;
	}else if (temp_obj.length > 1){
		alert("Please enter another " + obj.desc + " value");
		return false;
	}else if (isNaN(obj.var_value)){
		alert(obj.desc + " must be a number");
		return false;
	}else if (parseInt(obj.var_value) < obj.min || parseInt(obj.var_value) > obj.max){
		alert("The " + obj.desc + " value range is " + obj.min + " ~ " + obj.max + "");
		return false;
	}else if (obj.is_even && (parseInt(obj.var_value) % 2 != 0)){
		alert(obj.desc + " must be an even number");
		return false;
	}
	return true;
}

function check_integer(which_value, min, max){	
	var temp_obj = (which_value).split(" ");
	
	if (temp_obj == "" || temp_obj.length > 1 || isNaN(which_value)){	
		return false;
	}else if (parseInt(which_value) < min || parseInt(which_value) > max){
		return false;
	}
	
	return true;
}

function get_seq(index){
	var seq;
	
	switch(index){
		case 0:
			seq = "1st";
			break;
		case 1:
			seq = "2nd";
			break;
		case 2:
			seq = "3rd";
			break;
		case 3:
			seq = "4th";
			break;
	}
	return seq;
}

function check_ip_range(order, my_obj, allow_cast){
	var which_ip = (my_obj.addr[order]).split(" ");
	var start, end;

	if (isNaN(which_ip) || which_ip == "" || which_ip.length > 1 || (which_ip[0].length > 1 && which_ip[0].substring(0,1) == "0")){	// if the address is invalid
		alert(my_obj.e_msg[FIRST_IP_ERROR + order]);
		return false;
	}

	start = 0;							// the checking range will be 0 ~ 255
	end = 255;							// when subnet mask has more than one zero address

	if (order == 0){				// the checking range of 1st address
		start = 1;
		end = 254;
	}else if (order == 3){
		if (!allow_cast){			// when subnet mask has only one zero address
			if (my_obj.is_network){	// if the 4th address is a network address
				start = 0;
			}else{					// if the 4th address is not a network address
				start = 1;
			}
			end = 254;
		}
	}
	
	if (parseInt(which_ip) < start || parseInt(which_ip) > end){
		if (allow_cast){
			alert(my_obj.e_msg[FOURTH_RANGE_ERROR1]);
		}else{
			alert(my_obj.e_msg[FIRST_RANGE_ERROR + order]);
		}
		return false;
	}

	return true;
}

function is_valid_ip(my_obj){
	var count_zero = 0;
	var ip = my_obj.addr;
	
	for(var i = 0; i < ip.length; i++){
		if (ip[i] == "0"){
			count_zero++;
		}								
	}
	
	if (!my_obj.allow_zero && count_zero == 4){
		alert(my_obj.e_msg2);
		return false;
	}else{
		if (count_zero != 4){
			for(var i = 0; i < ip.length; i++){
				if (!check_ip_range(i, my_obj)){
					return false;
				}							
			}
		}
	}
	return true;				
}

function check_address(my_obj, mask_obj){
	var count_zero = 0;
	var count_ip_zero = 0;
	var count_ip_cast = 0;
	var ip = my_obj.addr;
	var mask;
	var allow_cast = false;

	if (my_obj.addr.length == 4){
		// check the ip is "0.0.0.0" or not
		for(var i = 0; i < ip.length; i++){
			if (ip[i] == "0"){
				count_zero++;			
			}				
		}

		if (!my_obj.allow_zero && count_zero == 4){	// if the ip is not allowed to be 0.0.0.0
			alert(my_obj.e_msg[ZERO_IP]);			// but we check the ip is 0.0.0.0
			return false;
		}else{
			if (count_zero != 4){
				if (check_address.arguments.length == 2 && mask_obj != null){
					mask = mask_obj.addr;
					count_zero = 0;					
					for(var i = 0; i < mask.length; i++){
						if (mask[i] == "0"){
							count_zero++;
						}
					}
					
					if (count_zero != 4){
						for (var i = ip.length - count_zero; i < ip.length; i++){			
							if (ip[i] == "0"){
								count_ip_zero++;
							}else if (ip[i] == "255"){
								count_ip_cast++;
							}			
						}
						
						// if ip is a network address and we don't allow it
						// or ip is a broadcast address						
						if (count_zero != 0){
							if ((count_zero == count_ip_zero && !my_obj.is_network) || (count_zero == count_ip_cast)){
								alert(my_obj.e_msg[INVALID_IP]);
								return false;
							}
							
							if (count_zero > 1){
								allow_cast = true;
							}
						}
					}else{
						return true;
					}										
				}
				
				for(var i = 0; i < ip.length; i++){
					if (!check_ip_range(i, my_obj, allow_cast)){
						return false;
					}
				}
			}
		}
	}else{	// if the length of ip is not correct, show invalid ip msg
		alert(my_obj.e_msg[INVALID_IP]);
		return false;
	}

	return true;
}

/*
function check_address(my_obj){					
	if (my_obj.addr.length == 4){										
		if (!is_valid_ip(my_obj)){					
			return false;
		}else{
			return true;
		}
	}else{
		alert(my_obj.e_msg1);
		return false;
	}				
}
*/

function check_mask(my_mask){
	var temp_mask = my_mask.addr;

	if (temp_mask.length == 4){
		for (var i = 0; i < temp_mask.length; i++){
			var which_ip = temp_mask[i].split(" ");
			var mask = parseInt(temp_mask[i]);
			var in_range = false;
			var j = 0;

			if (isNaN(which_ip) || which_ip == "" || which_ip.length > 1 || (which_ip[0].length > 1 && which_ip[0].substring(0,1) == "0")){	// if the address is invalid
				alert(my_mask.e_msg[FIRST_IP_ERROR + i]);
				return false;
			}

			if (i == 0){	// when it's 1st address
				j = 1;		// the 1st address can't be 0
			}

			for (; j < subnet_mask.length; j++){
				if (mask == subnet_mask[j]){
					in_range = true;
					break;
				}else{
					in_range = false;
				}
			}

			if (!in_range){
				alert(my_mask.e_msg[FIRST_RANGE_ERROR + i]);
				return false;
			}

			if (i != 0 && mask != 0){ // when not the 1st range and the value is not 0
				if (parseInt(temp_mask[i-1]) != 255){  // check the previous value is 255 or not
					alert(my_mask.e_msg[INVALID_IP]);
					return false;
				}
			}

			if (i == 3 && parseInt(mask) == 255){	// when the last mask address is 255
				alert(my_mask.e_msg[FOURTH_RANGE_ERROR]);
				return false;
			}
		}
	}else{
		alert(my_mask.e_msg[INVALID_IP]);
		return false;
	}

	return true;
}

function check_domain(ip, mask, gateway){
	var temp_ip = ip.addr;
	var temp_mask = mask.addr;
	var temp_gateway = gateway.addr;
	var is_same = true;
	
	if (temp_gateway[0] == 0 && temp_gateway[1] == 0 && temp_gateway[2] == 0
			&& temp_gateway[3] == 0){
		if (gateway.allow_zero){
			return is_same;
		}
	}
		
	for (var i = 0; i < temp_ip.length - 1; i++){
		if ((temp_ip[i] & temp_mask[i]) != (temp_gateway[i] & temp_mask[i])){
			alert(gateway.e_msg3);
			is_same = false;		// when not in the same subnet mask, return false
			break;
		}
	}

	return is_same;
}

function check_lan_setting(ip, mask, gateway){				

	if (!check_address(ip, mask)){	// when ip is invalid
		return false;
//	}else if (!check_address(temp_mask_obj)){	// when subnet mask is invalid
//		return false;	
	}else if (!check_mask(mask)){	// when subnet mask is not in the subnet mask range
		return false;   
	}else if (!check_address(gateway, mask)){	// when gateway is invalid
		return false;	
	}else if (!check_domain(ip, mask, gateway)){		// check if the ip and the gateway are in the same subnet mask or not					
		return false;
	}
	return true;
}

function check_pwd(pwd1, pwd2){
	if (get_by_id(pwd1).value != get_by_id(pwd2).value){
		 alert(msg[MATCH_PWD_ERROR]);
		 return false;
	}
	return true;
}

function check_radius(radius){
	if (!check_address(radius.ip)){
		return false;
	}else if (!check_port(radius.port)){
        alert(radius.ip.e_msg[RADIUS_SERVER_PORT_ERROR]);
        return false;
    }else if (radius.secret == ""){
        alert(radius.ip.e_msg[RADIUS_SERVER_SECRET_ERROR]);
        return false;
	}else if (!check_ascii_key_fun(radius.secret)){
		alert(radius.ip.e_msg[RADIUS_SERVER_SECRET_ENTER_ERROR]);
		return false;
	}
	
	return true;
}

function check_ssid(id){
	if (get_by_id(id).value == ""){
	    alert(msg[SSID_EMPTY_ERROR]);
	    return false;
	}
	return true;        
}

function check_port(port){
    var temp_port = port.split(" ");
    
    if (isNaN(port) || port == "" || temp_port.length > 1 
    		|| (parseInt(port) < 1 || parseInt(port) > 65534)){
        return false;
    }
    return true;
}

function check_pf_port(port){
    var temp_port = port.split(" ");
    
    if (isNaN(port) || port == "" || temp_port.length > 1 
    		|| (parseInt(port) < 0 || parseInt(port) > 65535)){
        return false;
    }
    return true;
}

function change_color(table_name, row){
    var obj = get_by_id(table_name);
    for (var i = 1; i < obj.rows.length; i++){
        if (row == i){
            obj.rows[i].style.backgroundColor = "#FFFF00";
        }else{
            obj.rows[i].style.backgroundColor = "#FFFFFF";
        }
    }       
}

function exit_wizard(){
    if (confirm(msg[QUIT_WIZARD])){
        window.close();
    }
}

function get_by_id(id){
	with(document){
		return getElementById(id);
	}
}

function get_by_name(name){
	with(document){
		return getElementsByName(name);
	}
}

function get_length(){
    var wep_key_len = get_by_id("wep_key_len").options[get_by_id("wep_key_len").selectedIndex];
    var wep_key_type = get_by_id("wlan0_wep_display").options[get_by_id("wlan0_wep_display").selectedIndex];
	var length = parseInt(wep_key_len.value);
		
	if (wep_key_type.value == "hex"){
	    length *= 2;
	}
	return length;
}

function openwin(url,w,h) {
	var winleft = (screen.width - w) / 2;
	var wintop = (screen.height - h) / 2;
	window.open(url,"popup",'width='+w+',height='+h+',top='+wintop+',left='+winleft+',scrollbars=yes,status=no,location=no,resizable=yes')
}	

function send_submit(which_form){
	get_by_id(which_form).submit();
}

function set_server(is_enable){
	var enable = get_by_id("enable");
	
    if (is_enable == "1"){
        enable[0].checked = true;
    }else{
        enable[1].checked = true;
    }
}

function set_protocol(which_value, obj){
    for (var i = 0; i < 3; i++){    
        if (which_value == obj.options[i].value){
            obj.selectedIndex = i;
            break;
        }
    }
}

function set_schedule(data, index){ 
	var schd = get_by_name("schd");  
	
    if (data[index] == "0"){
        schd[0].checked = true;      
    }else{
        schd[1].checked = true;        
    }
    
    get_by_id("hour1").selectedIndex = data[index+1];
    get_by_id("min1").selectedIndex = data[index+2];
    get_by_id("am1").selectedIndex = data[index+3];
    get_by_id("hour2").selectedIndex = data[index+4];
    get_by_id("min2").selectedIndex = data[index+5];
    get_by_id("am2").selectedIndex = data[index+6];
    get_by_id("day1").selectedIndex = data[index+7];
    get_by_id("day2").selectedIndex = data[index+8];
}

function set_selectIndex(data, obj){
	
	for (var i = 0; i < obj.options.length; i++){
		if (data == obj.options[i].value){
			obj.selectedIndex = i;
			break;
		}
	}	
}

function set_schedule_option(){
	for (var i = 0; i < 20; i++){
		var temp_sch = get_by_id("schedule_rule_" + i).value;
		var temp_data = temp_sch.split("/");
		
		if (temp_data.length > 1){
			document.write("<option value='" + temp_data[0] + "'>" + temp_data[0] + "</option>");
		}else{
			break;
		}
	}
}

function set_dhcp_list(){
	var temp_dhcp_list = get_by_id("dhcp_list").value.split(",");
	
	for (var i = 0; i < temp_dhcp_list.length; i++){	
		var temp_data = temp_dhcp_list[i].split("/");
		if(temp_data.length > 1){		
		document.write("<option value='" + temp_data[1] + "'>" + temp_data[0] + "</option>");	
		}
	}
}

function set_mac(mac){
	var temp_mac = mac.split(":");
	for (var i = 0; i < 6; i++){
		var obj = get_by_id("mac" + (i+1));
		obj.value = temp_mac[i];
	}
}

function show_dns(type){
    if (type){
        get_by_id("dns1").value = "0.0.0.0";
        get_by_id("dns2").value = "0.0.0.0";
    }
}

function show_wizard(name){
	window.open(name,"Wizard","width=450,height=370");
}

function show_window(name){
	window.open(name,"Window","width=500,height=600,scrollbar=yes");
}

function get_row_data(obj, index){	
		
    try {
    	return obj.cells[index].childNodes[0].data;
    }catch(e) {
        return ("");
    }
}

function copy_application(index){
	var data;
	
	if (get_by_id("application" + index).selectedIndex > 0){
		data = default_rule[get_by_id("application" + index).selectedIndex - 1];		
		get_by_id("name" + index).value = data.name;
		get_by_id("public_port" + index).value = data.public_port;
		get_by_id("private_port" + index).value = data.private_port;
		set_protocol(data.prot, get_by_id("protocol" + index));	
	}else{
		alert(msg[SELECT_APPLICATION_ERROR]);
	}		
}

function copy_special_appl(index){
	var name = get_by_id("name" + index);
	var trigger_port = get_by_id("trigger_port" + index);
	var trigger_type = get_by_id("trigger" + index);
	var public_port = get_by_id("public_port" + index);
	var public_type = get_by_id("public" + index);
	var application = get_by_id("application" + index);		
	var data;
	
	if (application.selectedIndex > 0){
		data = default_appl[application.selectedIndex - 1];
		name.value = data.name;		
		trigger_port.value = data.trigger_port;			
		public_port.value = data.public_port;				
		set_protocol(data.trigger_prot, trigger_type);   
		set_protocol(data.public_prot, public_type);    		
	}else{
		alert(msg[SELECT_APPLICATION_ERROR]);
	}
	
}

function copy_ip(index){

	if (get_by_id("ip_list" + index).selectedIndex > 0){
		get_by_id("ip" + index).value = get_by_id("ip_list" + index).options[get_by_id("ip_list" + index).selectedIndex].value;
	}else{
		alert(msg[SELECT_COMPUTER_ERROR]);
	}
}

function get_random_char(){
	var number_list = "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
	var number = Math.round(Math.random()*62);
	
	return(number_list.substring(number, number + 1));
}

function generate_psk(key){
	var i = key.length;
	
	if (key.length < 8){
		for (; i < 8; i++){
			key += get_random_char();
		}
	}

	return key;
}

function create_wep_key128(passpharse, pharse_len){
    var pseed2 = "";
   	var md5_str = "";
   	var count;
   	
   	
    for(var i = 0; i < 64; i++){
        count = i % pharse_len;
        pseed2 += passpharse.substring(count, count+1);
    }
    
    md5_str = calcMD5(pseed2);   
    
    return md5_str.substring(0, 26).toUpperCase(); 
}
function check_ascii_key_fun(data){	

	if (!(data >= 'A' && data <= 'Z') && !(data >= '0' && data <= '9') && !(data >= 'a' && data <= 'z')){	
		return false;
	}	
	return true;
}

function check_name_key_fun(data){
	if (!(data >= 'A' && data <= 'Z') && !(data >= '0' && data <= '9') && !(data >= 'a' && data <= 'z') && !(data == "-") && !(data == "_")){
		return false;
	}	
	return true;
}

function check_name_word_fun(obj,word){
	for(var k=0;k<obj.length;k++){
		if (!check_name_key_fun(obj.substring(k, k+1))){
			alert(word+" invalid. the legal characters are 0~9, A~Z, or a~z,-,_.");
			return false;
		}
	}
	return true;
}

function Find_word(strOrg,strFind){
	var index = 0;
	index = strOrg.indexOf(strFind,index);
	if (index > -1){
		return true;
	}
	return false;
}

function Get_selectIndex_num(data, obj){
	var index = 9;
	for (var i = 0; i < obj.options.length; i++){
		if (data == obj.options[i].value){
			index = i;
			break;
		}
	}
	return index;
}

function a_to_hex(inValue) {
	var outValue = "";
	if (inValue) {
		for (i = 0; i < inValue.length; i++) {
			if(inValue.charCodeAt(i).toString(16) < 10)
				outValue += 0;
			if(inValue.charCodeAt(i).toString(16) > 'a' && inValue.charCodeAt(i).toString(16) <= 'f')
				if(inValue.charCodeAt(i).toString(16).length == 1)
					outValue += 0;
			outValue += inValue.charCodeAt(i).toString(16);
		}
	}
	return outValue;
}

function hex_to_a(inValue){
	outValue = "";
	var k = '';
	for (i = 0; i < inValue.length; i++) {
		l = i % 2;
		if (l == 0)
			k += "%";
		k += inValue.substr(i, 1);
	}
	outValue = unescape(k);
	return outValue;
}

function change_word(inValue,strFind,strAdd){
	var outValue = "";
	for(var i=0;i<inValue.length;i++){
		if(inValue.substr(i,1) == strFind)
			outValue = outValue + strAdd;
		outValue += inValue.substr(i,1);
	}
	return outValue;
}

function ReplaceAll(strOrg,strFind,strReplace){
	var index = 0;
	while(strOrg.indexOf(strFind,index) != -1){
			strOrg = strOrg.replace(strFind,strReplace);
			index = strOrg.indexOf(strFind,index);
	}
	return strOrg
}
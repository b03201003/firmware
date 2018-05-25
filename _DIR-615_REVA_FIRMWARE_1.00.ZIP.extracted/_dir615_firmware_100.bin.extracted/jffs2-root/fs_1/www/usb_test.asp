<html>
<HEAD>
</head>
<body>

<form action="usb_test.cgi" method=post>
<input type="hidden" name="html_response_return_page" value="usb_test.asp">
<input type="hidden" name="html_response_page" value="usb_test.asp">
<table>
<tr> 
<td><input type="submit" value="usb test" ></td>
</tr>
</table>
</form>
<table>	
		<tr><td>usb test : <% CmoGetStatus("usb_test_result"); %></td></tr> 
		<tr><td>test item : 1. mount usb device </td></tr> 
		<tr><td>test item : 2. create file in usb device </td></tr> 
		<tr><td>test item : 3. remove file from usb device </td></tr> 
		<tr><td>test item : 4. umount usb device </td></tr>  
</table>
</body></html>

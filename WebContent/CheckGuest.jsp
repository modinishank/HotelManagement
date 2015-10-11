<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Check Guest Details</title>
<link rel="stylesheet" type="text/css" href="CSS/Decor.css" />
<script type="text/javascript" src="JavaScript/Action.js">
</script>
</head>
<body>
	<center><%@include file="Header.jsp"%></center>
	<div id="header">
		<marquee>Please Fill Details And Click Find Guest Details</marquee>
	</div>

	<div class="body">
		<div class="body_resize">
			<%
    		String message = "";
    		if(request.getAttribute("message")!=null){
    			message = request.getAttribute("message").toString();
    			%>
			<h2 id="alertMessage" align="center"><%=message%></h2>
			<%
    		}
    	%>

			<div style="min-height: 360px;margin-top: 10px;">
				<center><h2>Check Guest</h2></center>
				<form id="guestCheckPage" name="guestCheckPage" method="post"
					action="GuestController?action=checkGuest" onsubmit="return checkForValidName()">
					<center>
						<table cellpadding="5" cellspacing="5">
							<tr>
								<td>Guest Name:</td>
								<td><input type="text" id="guestName" name="guestName"/></td>
								<td align="center" colspan=4><input type="submit" id="checkGuest" value="Submit Details">
							</tr>
							<tr>
							<td><b id="guestname_error"></b></td>
							</tr>	
						</table>
					</center>
				</form>
				
				<%
			if(request.getAttribute("guestList")!=null)
			{
				ArrayList<Guest> guestList = (ArrayList<Guest>)request.getAttribute("guestList");	
				if(guestList!=null && guestList.size()>0){
		%>
				<div class="CSSTableGenerator" >
					<table style="margin-top: 10px;" class="CSSTableGenerator" >
						 <tr>
	                        <td>Guest ID</td>
	                        <td>Guest Name</td>
	                        <td>Guest Address</td>
	                        <td>Guest Affilation</td>
	                    </tr>
							<%
							for(Guest gst : guestList){
								%>
							<tr>
								<td><%=gst.getId() %></td>
								<td><%=gst.getName() %></td>
								<td><%=gst.getAddress() %></td>
								<td><%=gst.getGuestAffilation() %></td>
							</tr>
							<%
								}
							}
						}
				%>
					</table>
				</div>
				<div class="clr"></div>

			</div>

			<div class="clr"></div>
		</div>
	</div>

	<center><%@include file="Footer.jsp"%></center>
</body>
</html>
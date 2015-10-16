<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Rooms</title>
<link rel="stylesheet" type="text/css" href="CSS/Decor.css" />
<script type="text/javascript" src="JavaScript/Action.js">
</script>
</head>
<body>
	<center><%@include file="Header.jsp"%></center>
	<div id="header">
		<marquee>Please Fill Details And Click Submit Details</marquee>
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
				<center><h2>Make Bookings Now</h2></center>
				<form id="guestPage" name="guestPage" method="post" style="min-height: 340px;">
					<center>
						<table cellpadding="5" cellspacing="5">
							<tr>
								<td>Hotel ID</td>
								<td><input type="text" id="hotelId" name="hotelId" /></td>
							</tr>
							<tr>
								<td>Room Number</td>
								<td><input type="text" id="roomNumber" name="roomNumber" /></td>
							</tr>
							<tr>
								<td>Guest ID</td>
								<td><input type="text" id="guestId" name="guestId" /></td>
							</tr>
							<tr>
								<td>Start Date as YYYY-MM-DD</td>
								<td><input type="text" id="startDate" name="startDate" /></td>
							</tr>
							<tr>
								<td>End Date as YYYY-MM-DD</td>
								<td><input type="text" id="endDate" name="endDate" /></td>
							</tr>
							<tr>
								<td align="center" colspan=4><input type="button" id="bookRoom" value="Submit Details" onClick="onSubmitButton(this.id);">
							</tr>
						</table>
					</center>
				</form>

				<%
					String referenceNumber=(String)request.getAttribute("bookingId");
				if(referenceNumber!=null)
				{
					if(!"exception".equalsIgnoreCase(referenceNumber))
						{
					%>
					<div class="CSSTableGenerator" >
					<table style="margin-top: 10px;" class="CSSTableGenerator" >
						<tr>
							<th>Booking ID</th>
						</tr>
						<tbody>
							<tr>
								<td><%=referenceNumber %></td>
							</tr>
							<%
							 }}
					%>
						</tbody>
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
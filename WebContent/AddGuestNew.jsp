<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Guest Details</title>
<link rel="stylesheet" type="text/css" href="CSS/Decor.css" />
<script type="text/javascript" src="JavaScript/Action.js">
</script>
</head>
<body>
	<center><%@include file="Header.jsp"%></center>
	<div id="header">
		<marquee>Please Fill Details And Click Submit Guest Details</marquee>
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

			<div style="min-height: 360px; margin-top: 30px;">
				<center><h2>Add Guest Details</h2></center>
				<form id="guestPage" name="guestPage" method="post">
					<center>
						<table cellpadding="5" cellspacing="5">
							<tr>
								<td>Guest Name:</td>
								<td><input type="text" id="guestName" name="guestName" /></td>
								<td><b id="name_error"></b></td>
							</tr>
							<tr>
								<td>Guest Address:</td>
								<td><input type="text" id="guestAddress"
									name="guestAddress" /></td>
								<td><b id="address_error"></b></td>
							</tr>
							<tr>
								<td align="center" colspan=4><input type="button"
									id="insertGuest" value="Submit Guest Details"
									onClick="onSubmitGuest(this.id);">
							</tr>
						</table>
					</center>
				</form>

				<div class="clr"></div>

			</div>

			<div class="clr"></div>
		</div>
	</div>

	<center><%@include file="Footer.jsp"%></center>
</body>
</html>
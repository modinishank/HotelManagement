<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Contact Us</title>
<link rel="stylesheet" type="text/css" href="CSS/Decor.css" />
<script type="text/javascript" src="JavaScript/Action.js">
</script>
</head>
<body>
	<center><%@include file="Header.jsp"%></center>
	<div id="header">
		<marquee>Please Fill Details And Send Message</marquee>
	</div>
	<div class="body">
		<div class="body_resize">	
		<%
    		String message = "";
    		if(request.getAttribute("message")!=null){
    			message = request.getAttribute("message").toString();
    			%>
			<h4 id="alertMessage" align="center"><%=message%></h4>
			<%
    		}
    	%>
		<div style="min-height: 360px;margin-top: 10px;">
		<center><h2>Contact Us</h2></center>
        <form method="post" name="contactform" id="contactform" style="margin-left: 150px;">
          <ol>
            <li>
              <label for="name">Your Name*</label>
              <input id="name" name="name" class="text" />
            </li>
            <li>
              <label for="email">E-Mail*</label>
              <input id="email" name="email" class="text" />
            </li>
            <li>
              <label for="contactNo">Contact No</label>
              <input id="contactNumber" name="contactNumber" class="text" />
            </li>
            <li>
              <label for="message">Your Message</label>
              <textarea id="message" name="message" rows="6" cols="50" 
              maxlength="200">Please Enter your message in 200 letters</textarea>
            </li>
            <li class="buttons">
              <input type="button" id="contactUs" value="Send Message" onClick="onSubmitContactUs(this.id);" style="margin-left: 280px;"/>
              <div class="clr"></div>
            </li>
          </ol>
        </form>	
	</div>
	</div>
	</div>
<center><%@include file="Footer.jsp"%></center>
</body>
</html>
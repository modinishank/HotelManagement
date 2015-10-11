<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Contact Us</title>
</head>
<body>
<center><%@include file="Header.jsp"%></center>
	<div style="min-height: 360px;margin-top: 10px;" align="center">
		<center><h2>Contact Us</h2></center>
		
        <form action="#" align="center" method="post" id="contactform" style="    margin-left: 325px;">
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
              <label for="message">Your Message*</label>
              <textarea id="message" name="message" rows="6" cols="50"></textarea>
            </li>
            <li class="buttons">
              <input type="submit" name="imageField" id="imageField"  value="Send message" class="send" style="margin-left: 280px;"/>
              <div class="clr"></div>
            </li>
          </ol>
        </form>	
	</div>
<center><%@include file="Footer.jsp"%></center>
</body>
</html>
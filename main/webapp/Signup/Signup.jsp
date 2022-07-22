<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
 
<%@ include file= "../resources/HomepageNavbar.html" %>
<%@ include file= "../IncludeInHomepages.jsp" %> 
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Laxmi chit fund</title>

</head>
<body>

<h2>Signup Page</h2>
 
<form action="${pageContext.request.contextPath}/Signup" method="post">
  <label for="customerName">Enter your name:</label>
  <input type="text" id="customerName" name="customerName" 
  required pattern="^[A-Z a-z]+$" oninvalid="this.setCustomValidity('Only alphabets and spaces are allowed')"
oninput="this.setCustomValidity('')"><br><br>
  
  <label for="username">Enter a username:</label>
  <input type="text" id="username" name="username" required 
  pattern="^[A-Za-z0-9]+$" oninvalid="this.setCustomValidity('Only alphabets and numbers are allowed')"
oninput="this.setCustomValidity('')"><br><br>
  
  <label for="password">Enter a password:</label>
  <input type="password" id="password" name="password" required>
  
  <br><br>
  
  <input type="submit" value="Submit">
  
	<div class = "centerClass">
	<span class="success">${messages.SignupSuccessful}</span>
	</div>
	
	<div class = "centerClass">
	<span class="error">${messages.SignupFailed}</span>
	</div>
  
  
</form>

<div>
<br><br>
--------------------------------------------------------------- <br>
Make sure that password contains minimum 6 characters, which includes (at least): <br>
1. One upper case alphabet <br>
2. One lower case alphabet <br>
3. One digit <br>
4. One symbol <br>
</div>


</body>
</html>
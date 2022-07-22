<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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


<h2 id="try">Login Page</h2>
 
<!-- <button type="button" onclick="myFunction()">Try it</button> -->
 
 <!-- using method="post" to protect user credentials -->
<form action="${pageContext.request.contextPath}/Login" method="post">
 
  <label for="username">Enter your username:</label>
  <input type="text" id="username" name="username" required><br><br>
  
  <label for="password">Enter your password:</label>
  <input type="password" id="password" name="password" required><br><br>
  
  <input type="submit" value="Submit">
  <br>
  <br>
  
  <div class = "centerClass">
  <span class="error">${LoginFailed}</span>
  </div>
  
  <div class = "centerClass">
  <span class="success">${SignupSuccessful}</span>
  </div>
 
</form>

</body>
</html>
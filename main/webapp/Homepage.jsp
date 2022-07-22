<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%@ include file= "../IncludeInHomepages.jsp" %> 

<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>25 din me paisa double</title>
</head>
<body>



<h2>Welcome to our Banking Application!</h2>


<form action="Signup/Signup.jsp">
<input type = "submit" value="Signup" class = "homepageButtons">
<br>
<br>
</form>

<form action="Login/Login.jsp">
<input type = "submit" value="Login" class = "homepageButtons">
<br>
<br>
</form>

<form action="Homepage/Homepage.jsp">
<input type = "submit" value="Exit" class = "homepageButtons">
</form>

</body>
</html>
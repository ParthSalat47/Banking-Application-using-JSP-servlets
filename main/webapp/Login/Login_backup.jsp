<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login page</title>

<link rel="stylesheet" type="text/css" 
href="../Homepage/Homepage.css">

<script src="Login.js"></script>

</head>
<body>

<h2>Login Page</h2>

	<sql:setDataSource var="db" 
	driver = "com.mysql.cj.jdbc.Driver"
	url = "jdbc:mysql://localhost:3306/customerInfo"
	user = "root"
	password = "root"/>
	

	<!-- Remove exception? -->
	<%-- <c:catch var ="checkException"> --%>  
		<sql:query var="rs" dataSource="${db}">
		select username, password from customerDetails 
		where username= (?) and password = (?)
		<sql:param value="${param.username}" />
		<sql:param value="${param.password}" />
		</sql:query>
		
		<c:set var="authenticate" scope="page" value="false"/>
		<c:forEach items="${rs.rows}" var="data">
		<c:if test = "${data.username == param.username}">
			<c:if test = "${data.password == param.password}">
				<h3>Logged in successfully!</h3>	
				<c:set var="authenticate" scope="page" value="true"/>
				<br>
				<p>Click <a href="../Dashboard/Dashboard.jsp">here</a> 
				to go to your dashboard.</p>
			</c:if>
		</c:if>
		</c:forEach>

	<%-- </c:catch> --%>

	<c:if test = "${authenticate == 'false'}">
		<h3>Wrong username or password!</h3>
		<br>Click <a href="Login.html">here</a> to login again.
	</c:if>
	
	<!-- ----------------Setting variables---------------- -->
	
	<c:set var="savedUsername" value = "${param.username}"
		scope = "session" />
	
	<c:set var="userCookie" scope = "session" value = "true" />


</body>
</html>
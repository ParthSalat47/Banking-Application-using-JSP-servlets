<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
 
<%-- import = "jdbc/JDBC.java" --%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" 
href="../Homepage/Homepage.css">
</head>
<body>

<h2>Signup Page</h2>

	<sql:setDataSource var="db" 
	driver = "com.mysql.cj.jdbc.Driver"
	url = "jdbc:mysql://localhost:3306/customerInfo"
	user = "root"
	password = "root"/>
	
	
	
	<c:catch var ="checkException">  
		<sql:update var="rs" dataSource="${db}">
		insert into customerDetails values (?, ?, ?, 0)
		<sql:param value="${param.username}" />
		<sql:param value="${param.password}" />
		<sql:param value="${param.customerName}" />
		<%-- <sql:param value="${param.accBalance}" /> --%>
		</sql:update>
		
		<h3>Signed up successfully!</h3>
		<br>
		<p>Please <a href="../Login/Login.html">login</a> to use our services.</p>
		
		<!-- ----------------Setting variables---------------- -->
		
		<c:set var="savedUsername" value = "${param.username}"
		scope = "session" />
		
		<c:set var="userType" value = "newUser"
		scope = "session" />
		
	</c:catch>
	
	<c:if test = "${checkException != null}">  
		<p>This username already exists. Kindly enter another username.</p>
		<br>Click <a href="Signup.html">here</a> to signup again.
	</c:if>
	
	
	
</body>
</html>
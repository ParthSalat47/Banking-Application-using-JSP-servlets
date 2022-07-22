<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" 
href="../../Homepage/Homepage.css">

</head>
<body>

<c:if test="${userCookie != 'true'}">
 <c:redirect url = "../../Miscellaneous/NoCookies.jsp" />
</c:if>

	<h2>Previous Transactions</h2>

	<sql:setDataSource var="db" 
	driver = "com.mysql.cj.jdbc.Driver"
	url = "jdbc:mysql://localhost:3306/customerInfo"
	user = "root"
	password = "root"/>
	
	<!-- ---------------------- -->
	
	<c:if test = "${userType == 'newUser'}">  
		<h3 class="centerClass">No history to show.</h3>
	</c:if>
	
	<!-- ---------------------- --> 
	 
	<c:if test = "${userType == 'oldUser'}"> 
	<sql:query var="rs" dataSource="${db}">
	select transactionType, amount from transactionDetails
	where username = (?);
	<sql:param value="${savedUsername}" />
	</sql:query>
	
	
	<p id="accountHistory">
	<c:forEach items="${rs.rows}" var="data">
	<br>
	<c:out value="${data.transactionType}"/>
	:
	<c:out value="${data.amount}"/>
	<br>--------------
	</c:forEach>
	</p>
	</c:if>


</body>
</html>
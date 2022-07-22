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


<sql:setDataSource var="db" 
	driver = "com.mysql.cj.jdbc.Driver"
	url = "jdbc:mysql://localhost:3306/customerInfo"
	user = "root"
	password = "root"/>

	<sql:query var="rs" dataSource="${db}">
	select accBalance from customerDetails
	where username = (?);
	<sql:param value="${savedUsername}" />
	</sql:query>
	
	<h2>Your account balance is:</h2>
	<c:forEach items="${rs.rows}" var="data">
	<h1 id='accBalance'><c:out value="${data.accBalance}"></c:out></h1>
	<c:set var="savedBalance" value = "${data.accBalance}"
		scope = "session" />
	</c:forEach>
	

</body>
</html>
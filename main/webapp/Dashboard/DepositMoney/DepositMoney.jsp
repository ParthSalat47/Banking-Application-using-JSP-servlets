<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%-- <%@ taglib uri="java.sun.com/jsp/jstl/fmt" prefix="fmt" %> --%>

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

<h2>Deposit page</h2>

	<sql:setDataSource var="db" 
	driver = "com.mysql.cj.jdbc.Driver"
	url = "jdbc:mysql://localhost:3306/customerInfo"
	user = "root"
	password = "root"/>
	
	
	
	<c:if test = "${param.amountDeposit <= 0}">  
		<p>Please enter an amount greater than 0.</p>
		<br>Click <a href="DepositHome.jsp">here</a> to deposit again.
	</c:if>
	
	<c:catch var ="checkException">
	<c:if test = "${param.amountDeposit > 0}"> 
	<c:set var="newAmount" scope="page" value="0"/>
	
	<sql:update var="rs" dataSource="${db}">
		update customerDetails
		set accBalance = (?)
		where username = (?);
		<sql:param value="${param.amountDeposit + savedBalance}" />
		<sql:param value="${savedUsername}" />
	</sql:update>
	
	<sql:update var="rs" dataSource="${db}">
		insert into transactionDetails (username, transactionType, amount)
		values (?, 'Deposit', ?);
		<sql:param value="${savedUsername}" />
		<sql:param value="${param.amountDeposit}" />
	</sql:update>
	
	<c:set var="userType" value = "oldUser"
		scope = "session" />
	
		<h3>Deposited successfully!</h3>
		<br>
		<p>Click <a href="../Dashboard.jsp">here</a> to go back to Dashboard.</p>
	</c:if>	
	</c:catch>
	
	<c:if test = "${checkException != null}">  
		<p>Transaction failed. Please try again.</p>
		<br>Click <a href="DepositHome.jsp">here</a> to deposit again.
		<br>
		<c:out value="${checkException}"/>
	</c:if>

</body>
</html>
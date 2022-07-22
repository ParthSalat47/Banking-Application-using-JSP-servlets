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

<h2>Withdraw page</h2>

	<sql:setDataSource var="db" 
	driver = "com.mysql.cj.jdbc.Driver"
	url = "jdbc:mysql://localhost:3306/customerInfo"
	user = "root"
	password = "root"/>
	
	<c:set var="allow" scope="page" value="true"/>
	
	<c:if test = "${param.amountWithdraw <= 0}">  
		<p>Please enter an amount greater than 0.</p>
		<br>Click <a href="WithdrawHome.jsp">here</a> to withdraw again.
		<c:set var="allow" scope="page" value="false"/>
	</c:if>
	
	<c:if test = "${param.amountWithdraw > savedBalance}">  
		<c:if test = "${savedBalance != 0}">
		Please enter an amount less than 
		<c:out value="${savedBalance}"  escapeXml="false"/>.  
		<br><br>
		Click <a href="WithdrawHome.jsp">here</a> to withdraw again.
		<c:set var="allow" scope="page" value="false"/>
		</c:if>
	</c:if>

	<c:if test = "${savedBalance == 0}">  
		Your current balance is 0. Please deposit first in order to withdraw. 
		<br><br>
		Click <a href="../Dashboard.jsp">here</a> to go back to Dashboard.
		<c:set var="allow" scope="page" value="false"/>
	</c:if>	
	
	
	<c:catch var ="checkException">
	<!-- The above tests will try to make allow false. -->
	<c:if test = "${allow == true}"> 
	<c:set var="newAmount" scope="page" value="0"/>
	
	<sql:update var="rs" dataSource="${db}">
		update customerDetails
		set accBalance = (?)
		where username = (?);
		<sql:param value="${savedBalance - param.amountWithdraw}" />
		<sql:param value="${savedUsername}" />
	</sql:update>
	
	<sql:update var="rs" dataSource="${db}">
		insert into transactionDetails (username, transactionType, amount)
		values (?, 'Withdraw', ?);
		<sql:param value="${savedUsername}" />
		<sql:param value="${param.amountWithdraw}" />
	</sql:update>
	
	<c:set var="userType" value = "oldUser"
		scope = "session" />
	
		<h3>Withdrawn successfully!</h3>
		<br>
		<p>Click <a href="../Dashboard.jsp">here</a> to go back to Dashboard.</p>
	</c:if>	
	</c:catch>
	
	<c:if test = "${checkException != null}">  
		<p>Transaction failed. Please try again.</p>
		<br>Click <a href="WithdrawHome.jsp">here</a> to withdraw again.
	</c:if>



</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" 
href="../Homepage/Homepage.css">

</head>
<body>
 
<c:if test="${userCookie != 'true'}">
 <c:redirect url = "../Miscellaneous/NoCookies.jsp" />
</c:if>
 
<!-- Displays dashboard only if user cookie is true. -->
<c:if test="${userCookie == 'true'}">
<h2>Dashboard</h2>

<form action="BalanceInquiry/BalanceInquiry.jsp">
<input type = "submit" value="Balance Inquiry" class = "homepageButtons">
<br>
<br>
</form>

<form action="AccountHistory/AccountHistory.jsp">
<input type = "submit" value="Account History" class = "homepageButtons">
<br>
<br>
</form>

<form action="WithdrawMoney/WithdrawHome.jsp">
<input type = "submit" value="Withdraw money" class = "homepageButtons">
<br>
<br>
</form>

<form action="DepositMoney/DepositHome.jsp">
<input type = "submit" value="Deposit money" class = "homepageButtons">
<br>
<br>
</form>

<form action="../Homepage.html">
<input type = "submit" value="Log out" class = "homepageButtons">
<br>
<br>
</form>

</c:if>


</body>

</html>
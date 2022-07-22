<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%-- <%@ include file= "../resources/LoggedInNavbar.html" %> --%>
<%@ include file= "../IncludeInEveryPage.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dashboard</title>

 
</head>
<body>


<h2>Dashboard</h2>

<form action="${pageContext.request.contextPath}/BalanceInquiry">
<input type = "submit" value="Balance Inquiry" class = "homepageButtons">
<br>
<br>
</form>

<form action="${pageContext.request.contextPath}/AccountHistory">
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

<form action="${pageContext.request.contextPath}/Logout">
<input type = "submit" value="Log out" class = "homepageButtons">
<br>
<br>
</form>




</body>

</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%@ include file= "../../resources/LoggedInNavbar.html" %>
<%@ include file= "../../IncludeInEveryPage.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Withdraw page</title>


</head>

<body>

<h3 class="centerClass">Enter the amount you want to withdraw:</h3>

<form action="${pageContext.request.contextPath}/Withdraw">
<input type="number" id="WithdrawMoneyInput" name="amountWithdraw" 
class = "inputField" required><br><br>
<input type = "submit" value="Withdraw money" class = "homepageButtons"
id = "WithdrawButton">
<br>
<br>

<div class = "centerClass">
<span class="error">${messages.withdraw}</span>
</div>
<div class = "centerClass">
<span class="success">${messages.withdrawSuccess}</span>
</div>

</form>

</body>

</html>
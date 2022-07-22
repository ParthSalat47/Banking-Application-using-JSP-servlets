<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%@ include file= "../../resources/LoggedInNavbar.html" %>
<%@ include file= "../../IncludeInEveryPage.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Deposit Page</title>


</head>
<body>


<h3 class="centerClass">Enter the amount you want to deposit:</h3>

<form action="${pageContext.request.contextPath}/Deposit">
<input type="number" id="DepositMoneyInput" name="amountDeposit" 
class = "inputField" required><br><br>
<input type = "submit" value="Deposit money" class = "homepageButtons"
id = "depositButton">
<br>
<br>

<div class = "centerClass">
<span class="error">${messages.depositFail}</span>
</div>
<div class = "centerClass">
<span class="success">${messages.depositSuccess}</span>
</div>

</form>

</body>
</html>
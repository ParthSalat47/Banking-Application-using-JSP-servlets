<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<jsp:include page="../../IncludeInEveryPage.jsp"></jsp:include>
<jsp:include page="${request.getContextPath()}/AfterLoggingIn.jsp"></jsp:include>

</head>
<body>

<% 
	/* To prevent back button after log out: */
	response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");


	/* Redirect to homepage is user is not authenticated */
	if(session.getAttribute("username") == null)
	{
		response.sendRedirect("../../Homepage.html");
	}
	
%>

<h3 class="centerClass">Failed to load Account History. Please try again later.</h3>

<!-- <p>Click <a href = "../Dashboard.jsp">here</a> to go back to dashboard.</p> -->


</body>
</html>
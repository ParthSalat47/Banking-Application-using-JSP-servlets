<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<!-- The css to be included in every page -->
<link rel="stylesheet" type="text/css" 
href="${pageContext.request.contextPath}/Homepage/Homepage.css">

</head>
<body>

<% 
	/* To prevent back button after log out: */
	response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");

	/* Redirect to dashboard if user is Logged in*/
	if(session.getAttribute("username") != null)
	{
		response.sendRedirect(request.getContextPath() + "/Dashboard/Dashboard.jsp");
	} 
	
	/* Redirect to homepage is user is not authenticated */
	/* if(session.getAttribute("username") == null)
	{
		response.sendRedirect(request.getContextPath() + "/Homepage.jsp");
	} */
	
	
%>
	
	
	
</body>
</html>
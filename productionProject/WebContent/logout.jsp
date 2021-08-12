<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout</title>
</head>
<body>
<%
session.setAttribute("email", null);
session.setAttribute("name",null);
session=request.getSession(false);  
session.invalidate();
response.sendRedirect("index.html");
%>
</body>
</html>
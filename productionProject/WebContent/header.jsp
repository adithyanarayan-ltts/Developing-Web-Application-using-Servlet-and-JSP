<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="main.css">
</head>
<body>
<span><i><b>Hi <%=request.getSession().getAttribute("email")%></b></i></span>



<span style="padding-left:400px">
<a href="dashboard.jsp"><button class="button">Home</button></a>
<a href="logout.jsp"><button class="button">Logout</button></a></span><br><br>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Production and Movie Houses</title>
</head>
<body>
<%
    if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
%>
You are not logged in<br/>
<span>Please <a href="index.html"> Login</a></span>
<%} else {
%>
<span><i><b>Hi <%=request.getSession().getAttribute("email")%></b></i></span>
<span style="padding-left:550px"><a href="logout.jsp">Logout</a></span>
<h1> Welcome to the Movie Production Houses</h1>
<a href="addProduction.jsp">Add Production</a><br><br>
<a href="viewproductions.jsp">View Productions</a><br><br>
<a href="addMovie.jsp">Add Movie</a><br><br>
<a href="viewMovies.jsp">View Movies</a>
<%
    }
%>
</body>
</html>
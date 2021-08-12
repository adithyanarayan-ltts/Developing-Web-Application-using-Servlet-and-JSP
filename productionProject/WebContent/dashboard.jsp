<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="main.css">
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
<span style="padding-left:500px"><a href="logout.jsp"><button class="button">Logout</button></a></span>
<div style="text-align:center">

<h1> Welcome to the Movie Production Houses</h1>
<a href="addProduction.jsp"><button class="button">Add Production</button></a><br><br>
<a href="viewproductions.jsp"><button class="button">View Productions</button></a><br><br>
<a href="addMovie.jsp"><button class="button">Add Movie</button></a><br><br>
<a href="viewMovies.jsp"><button class="button">View Movies</button></a>
</div>
<%
    }
%>
</body>
</html>
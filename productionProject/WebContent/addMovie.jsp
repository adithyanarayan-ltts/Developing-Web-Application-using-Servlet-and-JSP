<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert Movie</title>
</head>
<body>
<%
    if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
%>
You are not logged in<br/>
<span>Please <a href="index.html"> Login</a></span>
<%} else {
%>
<a href="dashboard.jsp">Home</a>
<h2> Add a new Movie</h2><br>
<form action="./InsertMovieController" method="post">
Movie Id: <input type="number" name="mid"><br><br>
Movie Name: <input type="text" name="mname"><br><br>
Hero Name: <input type="text" name="heroname"><br><br>
Heroine: <input type="text" name="heroine"><br><br>
Release Date: <input type="date" name="releasedate"><br><br>
Language: <input type="text" name="language"><br><br>
Length: <input type="number" name="length"><br><br>
Movie Type: <input type="text" name="movietype"><br><br>
Production Id: <input type="number" name="pid"><br><br>
<input type="submit" value="Insert Movie"><br><br>
</form>
<%
}%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="main.css">
<title>Insert Movie</title>
</head>
<body>
<%
    if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
%>
You are not logged in. <span>Please <a href="index.html"><button class="button">Login</button></a><br><br></span>
<%} else {
%>
<%@ include file="header.jsp" %>
<div style="text-align:center">
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
<button class="button" type="submit">Insert Movie</button><br><br>
</form>
</div>
<%
}%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="com.ltts.productionproject.model.*, com.ltts.productionproject.dao.*,java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Movie</title>
<link rel="stylesheet" href="main.css">
</head>
<body>
<%
    if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
%>
You are not logged in. <span>Please <a href="index.html"><button class="button">Login</button></a><br><br></span>

<%} else {
%>
<%
MovieDao md =new MovieDao();
int id = Integer.parseInt(request.getParameter("id"));
Movie m = md.getMovieFromId(id);
%>
<%@ include file="header.jsp" %>

<div style="text-align:center">

<h2> Update Movie</h2><br>
<form action="./UpdateMovieController" method="post">
Movie Id: <input type="number" name="mid" value="<%=m.getMovieId()%>" readonly><br><br>
Movie Name: <input type="text" name="mname" value="<%=m.getMovieName() %>"><br><br>
Hero Name: <input type="text" name="heroname" value="<%=m.getHeroName() %>"><br><br>
Heroine: <input type="text" name="heroine" value="<%=m.getHeroine() %>"><br><br>
Release Date: <input type="date" name="releasedate" value="<%=m.getReleaseDate() %>"><br><br>
Language: <input type="text" name="language" value="<%=m.getLanguage() %>"><br><br>
Length: <input type="number" name="length" value="<%=m.getLength() %>"><br><br>
Movie Type: <input type="text" name="movietype" value="<%=m.getMovieType() %>"><br><br>
Production Id: <input type="number" name="pid" value="<%=m.getProductionId() %>"><br><br>
<button class="button" type="submit">Update Movie</button><br><br></form>
</div>
<%} %>
</body>
</html>
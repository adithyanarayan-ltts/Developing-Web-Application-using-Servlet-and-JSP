<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Production</title>
<link rel="stylesheet" href="main.css">
</head>
<body>
<%
    if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
%>
You are not logged in. <span>Please <a href="index.html"><button class="button">Login</button></a><br><br></span>
<%} else {
%>
<jsp:include page="header.jsp"></jsp:include>
<div style="text-align:center">
<h2> Add a new Production</h2><br>
<form action="./InsertProductionController" method="post">
Production Id: <input type="number" name="pid"><br><br>
Production Name: <input type="text" name="pname"><br><br>
City/Address: <input type="text" name="address"><br><br>
Year Begun: <input type="number" name="year"><br><br>
Owner Name: <input type="text" name="oname"><br><br>
Date Started: <input type="date" name="datestarted"><br><br>
<button class="button" type="submit">Insert Production</button><br><br>
</form>
</div>
<%} %>
</body>
</html>
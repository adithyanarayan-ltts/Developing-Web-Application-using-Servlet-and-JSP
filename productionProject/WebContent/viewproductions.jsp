<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
    <%@ page import="com.ltts.productionproject.model.*, com.ltts.productionproject.dao.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Productions</title>
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
	ProductionDao pd = new ProductionDao();
	List<Production> li = pd.getAllProductions();
	session.setAttribute("li",li);
%>
<%@ include file="header.jsp" %>
<table>
<tr>
<th>Id</th>
<th>Name</th>
<th>Address</th>
<th>Year Begun</th>
<th>Owner Name</th>
<th>Date Begun</th>
</tr>

<c:forEach var="p" items="${li}">
<tr>
<td><c:out value="${p.getProductionId()}"></c:out></td>
<td><c:out value="${p.getProductionName()}"></c:out></td>
<td><c:out value="${p.getAddress()}"></c:out></td>
<td><c:out value="${p.getDateOfStarted()}"></c:out></td>
<td><c:out value="${p.getOwnerName()}"></c:out></td>
<td><c:out value="${p.getDateStarted()}"></c:out></td>
<td><a href="updateProduction.jsp?id=${p.getProductionId()}"><button class="button">Edit Production</button></a></td>
<td><a href="deleteProduction.jsp?id=${p.getProductionId()}"><button class="button">Delete Production</button></a></td>
</tr>
</c:forEach>

<%--
<%for(Production p:li){ %>
<tr>
<td><%= p.getProductionId()%></td>
<td><%= p.getProductionName()%></td>
<td><%= p.getAddress() %></td>
<td><%= p.getDateOfStarted() %></td>
<td><%= p.getOwnerName() %></td>
<td><%= p.getDateStarted()%></td>
</tr>
<% } %>
 --%>
</table>
<%
    }
%>
</body>
</html>
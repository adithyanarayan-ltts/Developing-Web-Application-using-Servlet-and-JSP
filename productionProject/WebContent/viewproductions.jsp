<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.ltts.productionproject.model.*, com.ltts.productionproject.dao.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Productions</title>
</head>
<body>

<%
    if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
%>
You are not logged in<br/>
<span>Please <a href="index.html"> Login</a></span>
<%} else {
%>
<%
	ProductionDao pd = new ProductionDao();
	List<Production> li = pd.getAllProductions();
%>
<a href="dashboard.jsp">Home</a>
<table>
<tr>
<th>Id</th>
<th>Name</th>
<th>Address</th>
<th>Year Begun</th>
<th>Owner Name</th>
<th>Date Begun</th>
</tr>

<%for(Production p:li){ %>
<tr>
<td><%= p.getProductionId()%></td>
<td><%= p.getProductionName()%></td>
<td><%= p.getAddress() %></td>
<td><%= p.getDateOfStarted() %></td>
<td><%= p.getOwnerName() %></td>
<td><%= p.getDateStarted()%></td>
<td><a href="updateProduction.jsp?id=<%=p.getProductionId()%>">Edit Production</a>
<td><a href="deleteProduction.jsp?id=<%=p.getProductionId() %>">Delete Production</a>
</tr>
<% } %>
<%
    }
%>
</table>
</body>
</html>
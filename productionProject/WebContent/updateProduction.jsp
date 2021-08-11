<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.ltts.productionproject.model.*, com.ltts.productionproject.dao.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Production</title>
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
ProductionDao pd =new ProductionDao();
int id = Integer.parseInt(request.getParameter("id"));
Production p = pd.getProductionFromId(id);
%>
<h2> Edit a Production</h2><br>
<form action="./UpdateProductionController" method="post">
Production Id: <input type="number" name="pid" value="<%=p.getProductionId()%>" readonly><br><br>
Production Name: <input type="text" name="pname" value = "<%=p.getProductionName()%>"><br><br>
City/Address: <input type="text" name="address" value = "<%=p.getAddress()%>"><br><br>
Year Begun: <input type="number" name="year" value = "<%=p.getDateOfStarted()%>"><br><br>
Owner Name: <input type="text" name="oname" value = "<%=p.getOwnerName()%>"><br><br>
Date Started: <input type="date" name="datestarted" value = "<%=p.getDateStarted()%>"><br><br>
<input type="submit" value="Update Production"><br><br>
</form>
<%} %>
</body>
</html>
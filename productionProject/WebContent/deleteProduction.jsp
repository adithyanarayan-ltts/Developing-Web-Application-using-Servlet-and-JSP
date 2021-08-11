<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="com.ltts.productionproject.model.*, com.ltts.productionproject.dao.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Production</title>
</head>
<body>

<%
ProductionDao pd =new ProductionDao();
int id = Integer.parseInt(request.getParameter("id"));
RequestDispatcher rd =null;
if(pd.deleteProduction(id)){
	System.out.println("Successfully Deleted.");
	rd = request.getRequestDispatcher("dashboard.jsp");
	rd.forward(request, response);
}
else {
	System.out.println("Error due to some exception.");
	rd = request.getRequestDispatcher("viewproductions.jsp");
	rd.forward(request, response);
}
%>
</body>
</html>
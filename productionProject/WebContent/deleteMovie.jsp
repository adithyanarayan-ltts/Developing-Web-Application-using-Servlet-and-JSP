<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.ltts.productionproject.model.*, com.ltts.productionproject.dao.*,java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Movie</title>
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
MovieDao md =new MovieDao();
int id = Integer.parseInt(request.getParameter("id"));
RequestDispatcher rd =null;
if(md.deleteMovie(id)){
	System.out.println("Successfully Deleted.");
	rd = request.getRequestDispatcher("dashboard.jsp");
	rd.forward(request, response);
}
else {
	System.out.println("Error due to some exception.");
	rd = request.getRequestDispatcher("viewMovies.jsp");
	rd.forward(request, response);
}
%>
<%
    }
%>

</body>
</html>
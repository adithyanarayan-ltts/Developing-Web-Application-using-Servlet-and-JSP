<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.ltts.productionproject.model.*,com.ltts.productionproject.dao.*,java.util.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List of all Movies</title>
</head>
<body>

<%
	MovieDao md = new MovieDao();
%>

<%
    if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
%>
You are not logged in<br/>
<span>Please <a href="index.html"> Login</a></span>
<%} else {
%>
<a href="dashboard.jsp">Home</a>
<form name="f1" method="get" action="#">
       <select name="languages">
           <option>All</option>
           <option>Hindi</option>
           <option>Tamil</option>   
           <option>Telugu</option>
           <option>Kannada</option>
       </select>
     <input type="submit" name="submit" value="Select Language"/>
    </form>
    <%-- To display selected value from dropdown list. --%>
     <% 
                String s=request.getParameter("languages");
     			List<Movie> li = new ArrayList<Movie>();
                if (s !=null)
                {
                    out.println("Selected language is : "+s);
                    if(s.equals("All")){
                    	li = md.getAllMovies();
                    }
                    else{
                    	li=md.getMoviesByLanguage(s);
                    }
                }

            	
      %>
<table>
<tr>
<th>Id</th>
<th>Name</th>
<th>Hero</th>
<th>Heroine</th>
<th>Release Date</th>
<th>Language</th>
<th>Length</th>
<th>Movie Type</th>
<th>Production Id</th>
</tr>

<%

for(Movie m:li){
	
%>
<tr>
<td><%= m.getMovieId() %></td>
<td><%= m.getMovieName() %></td>
<td><%= m.getHeroName() %></td>
<td><%= m.getHeroine() %></td>
<td><%= m.getReleaseDate() %></td>
<td><%= m.getLanguage() %></td>
<td><%= m.getLength() %></td>
<td><%= m.getMovieType() %></td>
<td><%= m.getProductionId() %></td>
<td><a href="updateMovie.jsp?id=<%=m.getMovieId()%>">Edit Movie</a>
<td><a href="deleteMovie.jsp?id=<%=m.getMovieId() %>">Delete Movie</a>
</tr>
<%
} %>
</table>
<%
    }
%>
 
</body>
</html>
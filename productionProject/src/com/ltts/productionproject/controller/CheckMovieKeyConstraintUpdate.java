package com.ltts.productionproject.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import com.ltts.productionproject.dao.ProductionDao;
import com.ltts.productionproject.model.Production;

/**
 * Servlet Filter implementation class CheckMovieKeyConstraintUpdate
 */
@WebFilter("/UpdateMovieController")
public class CheckMovieKeyConstraintUpdate implements Filter {

    /**
     * Default constructor. 
     */
    public CheckMovieKeyConstraintUpdate() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		PrintWriter out = response.getWriter();
		System.out.println("Inside Filter");
		int id= Integer.parseInt(request.getParameter("mid"));
		int pid=Integer.parseInt(request.getParameter("pid"));
		ProductionDao pd = new ProductionDao();
		try {
			Production p = pd.getProductionFromId(pid);
			chain.doFilter(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			response.setContentType("text/html");  
			out.println("<script type=\"text/javascript\">");  
			out.println("alert('Invalid Production Id. Try again');");  
			out.println("</script>");
			out.println("<link rel=\"stylesheet\" href=\"main.css\">");
			out.println("<a href='viewMovies.jsp'><Button class='button'>Back</button></a>");
			e.printStackTrace();
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}

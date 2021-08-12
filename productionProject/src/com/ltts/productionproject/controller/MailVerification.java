package com.ltts.productionproject.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ltts.productionproject.model.Member;

/**
 * Servlet implementation class MailVerification
 */
@WebServlet("/MailVerification")
public class MailVerification extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MailVerification() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String name = request.getParameter("name");
		String password = request.getParameter("pass");
		String email = request.getParameter("email");
		String location = request.getParameter("loc");
		SendMail sm = new SendMail();
		String code = sm.randomCode();
		Member m = new Member(name,password,email,location,code);
		
		PrintWriter out = response.getWriter();
		
		
		//String code = sm.code;
		boolean test = sm.sendMail(m);
		   if(test){
               HttpSession session  = request.getSession();
               session.setAttribute("authcode", m);
               response.sendRedirect("verifyCode.jsp");
           }else{
      		  out.println("Failed to send verification email");
      	   }
	}

}

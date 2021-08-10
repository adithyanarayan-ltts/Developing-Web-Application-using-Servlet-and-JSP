package com.ltts.productionproject.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ltts.productionproject.dao.MemberDao;
import com.ltts.productionproject.model.Member;

/**
 * Servlet implementation class CheckMemberController
 */
@WebServlet("/CheckMemberController")
public class CheckMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckMemberController() {
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
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		MemberDao md = new MemberDao();
		Member b = new Member();
		try {
			b = md.checkMember(email, pass);
		}
		catch(Exception e) {
			System.out.println(e);
		}
		finally {
			RequestDispatcher rd =null;
			if(b.getEmail().compareTo(email)==0 && b.getPassword().compareTo(pass)==0 ) {
				System.out.println("Successful Login.");
				rd = request.getRequestDispatcher("dashboard.html");
				rd.forward(request, response);
			}
			else {
				System.out.println("Error due to some exception.");
				rd = request.getRequestDispatcher("error.html");
				rd.forward(request, response);
			}
		}
			
	}

}

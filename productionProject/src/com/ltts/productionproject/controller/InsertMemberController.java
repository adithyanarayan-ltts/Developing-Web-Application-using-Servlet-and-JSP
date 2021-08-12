package com.ltts.productionproject.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ltts.productionproject.dao.MemberDao;
import com.ltts.productionproject.model.Member;

/**
 * Servlet implementation class InsertMemberController
 */
@WebServlet("/InsertMemberController")
public class InsertMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMemberController() {
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
//		String name = request.getParameter("name");
//		String email = request.getParameter("email");
//		String password = request.getParameter("pass");
//		String location = request.getParameter("loc");
//		Member m= new Member(name,password,email,location);
//		MemberDao md = new MemberDao();
//		boolean b=false;
//		try {
//			 b = md.insertMember(m);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			System.out.println(e);
//		}
//		finally {
//			RequestDispatcher rd =null;
//			if(b==true) {
//				System.out.println("Successfully Inserted.");
//				rd = request.getRequestDispatcher("index.html");
//				rd.forward(request, response);
//			}
//			else {
//				System.out.println("Error due to some exception.");
//				rd = request.getRequestDispatcher("error.html");
//				rd.forward(request, response);
//			}
//		}
		
		MemberDao md = new MemberDao();
        try {
            
            HttpSession session = request.getSession();
            Member m= (Member) session.getAttribute("authcode");
            
            String code = request.getParameter("authcode");
            
            //SendMail sm = new SendMail();
            
            if(code.equals(m.getCode())){
        		RequestDispatcher rd = null;
        		rd = request.getRequestDispatcher("register.html");
        		if(md.insertMember(m))
        			{
        				rd = request.getRequestDispatcher("index.html");
        			} 
        		rd.forward(request, response);
            }else{
            	PrintWriter out = response.getWriter();
                out.println("Incorrect verification code");
                response.sendRedirect("register.html");
            }
        }catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

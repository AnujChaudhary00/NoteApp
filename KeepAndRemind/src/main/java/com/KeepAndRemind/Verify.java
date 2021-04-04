package com.KeepAndRemind;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.LoginDao.LoginDao;


@WebServlet("/Verify")
public class Verify extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		LoginDao dao= new LoginDao();
		
		try
		{
			if(dao.check(username, password))
			{
				HttpSession session=request.getSession();
				session.setAttribute("token", username);
				response.sendRedirect("index.jsp");
			}
			else
			{
				response.sendRedirect("LoginSignUp.jsp");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}

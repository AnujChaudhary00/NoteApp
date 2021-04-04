package com.LoginDao;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.mysql.jdbc.Driver;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;


public class LoginDao extends HttpServlet {
	String url="jdbc:mysql://localhost:3306/keepandremind";
	String user="root";
	String pass="Chaudhary#1";
	
	public boolean check(String username,String password) throws ClassNotFoundException, SQLException
	{
		String sql="select * from user where username='"+username+"' and pass='"+password+"'";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,user,pass);
		PreparedStatement st=con.prepareStatement(sql);
		ResultSet rs=st.executeQuery(sql);
		if(rs.next())
		{
			return true;
		}
		return false;
		
	}

}

package com.craft.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.craft.dbcon.ConnectDB;
import com.user.pojo.User;

/**
 * Servlet implementation class BuyerLogin
 */
public class BuyerLogin2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyerLogin2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String bemail =  request.getParameter("bemail");
		String bpass = request.getParameter("bpass");
		
		
		
		try{
			Connection con = ConnectDB.getConnect();
			PreparedStatement ps = con.prepareStatement("Select * from buyer where bemail = ? and bpass = ?");
			ps.setString(1,bemail);
			ps.setString(2,bpass);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				User.setBid(rs.getInt(1));
				System.out.println("Admin logged in successfully...");
				response.sendRedirect("buyerdashboard.html");
				
			}
			else{
				response.sendRedirect("index.html");
			}
		}
		catch(Exception e){
			e.printStackTrace();
			response.sendRedirect("error.html");
		}
		
	}

}

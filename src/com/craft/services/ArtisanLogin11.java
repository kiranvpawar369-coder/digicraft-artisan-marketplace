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
 * Servlet implementation class ArtisanLogin
 */
public class ArtisanLogin11 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArtisanLogin11() {
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
		
		
		String aemail =  request.getParameter("aemail");
		String apass = request.getParameter("apass");
		
		try{
			Connection con = ConnectDB.getConnect();
			PreparedStatement ps = con.prepareStatement("Select * from artisan where a_email = ? AND a_pass = ? AND a_status = 'aproved'");
			ps.setString(1,aemail);
			ps.setString(2,apass);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				User.setA_id(rs.getInt(1));
				System.out.println("Admin logged in successfully...");
				response.sendRedirect("artisandashboard.html");
				
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

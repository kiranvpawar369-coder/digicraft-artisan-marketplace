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

/**
 * Servlet implementation class ChangePassAdmin
 */
public class ChangePassAdmin6 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassAdmin6() {
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
		
		String cpass = request.getParameter("cpass");
		String npass = request.getParameter("npass");
		String confirmpassword = request.getParameter("confirmpassword");
		
		try{
			if(npass.equals(confirmpassword)){
			Connection con = ConnectDB.getConnect();
			PreparedStatement ps = con.prepareStatement("Select aemail from admin where apass = ?");
			ps.setString(1,cpass);
			ResultSet rs = ps.executeQuery();
			
			
			
			if(rs.next()){
				
				String aemail = rs.getString("aemail");
				PreparedStatement ps1 = con.prepareStatement("UPDATE admin SET apass = ? where aemail = ?");
				ps1.setString(1, npass);
				ps1.setString(2, aemail);
				
				int rs1 = ps1.executeUpdate();
				
				if(rs1>0){
					response.sendRedirect("adminlogin.html");
				}
				else{
					response.sendRedirect("error.html");
				}
				
			}
			else{
				response.sendRedirect("error.html");
				}
			} else {
				response.sendRedirect("error.html");
			}
				
		}
		catch(Exception e){
			
			e.printStackTrace();
			
		}
	}

}

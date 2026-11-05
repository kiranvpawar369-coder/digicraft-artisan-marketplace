package com.craft.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.craft.dbcon.ConnectDB;

/**
 * Servlet implementation class BuyerRegistration
 */
public class BuyerRegistration4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyerRegistration4() {
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
		
		String bemail = request.getParameter("bemail");
		String bpass = request.getParameter("bpass");
		String bname = request.getParameter("bname");
		String baddress = request.getParameter("baddress");
		String bcontact = request.getParameter("bcontact");
		
		try{
			
			Connection con = ConnectDB.getConnect();
			PreparedStatement ps = con.prepareStatement("INSERT INTO buyer (bname, bcontaact, baddress, bemail, bpass) VALUES (?, ?, ?, ?, ?)");
			ps.setString(1, bname);
			ps.setString(2, bcontact);
			ps.setString(3, baddress);
			ps.setString(4, bemail);
			ps.setString(5, bpass);
			
			int i = ps.executeUpdate();
			
			if(i>0){
				response.sendRedirect("buyerlogin.html");
			}
			else{
				response.sendRedirect("error.html");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}

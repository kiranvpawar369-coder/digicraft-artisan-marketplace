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
 * Servlet implementation class ArisanRegistration
 */
public class ArisanRegistration5 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArisanRegistration5() {
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
		String a_email = request.getParameter("a_email");
		String a_pass = request.getParameter("a_pass");
		String a_name = request.getParameter("a_name");
		String a_crafttype = request.getParameter("a_crafttype");
		String a_contact = request.getParameter("a_contact");
		
		try{
			
			Connection con = ConnectDB.getConnect();
			PreparedStatement ps = con.prepareStatement("INSERT INTO artisan (a_name, a_contact, a_carfttype, a_email, a_pass) VALUES (?, ?, ?, ?, ?)");
			ps.setString(1, a_name);
			ps.setString(2, a_contact);
			ps.setString(3, a_crafttype);
			ps.setString(4, a_email);
			ps.setString(5, a_pass);
			
			int i = ps.executeUpdate();
			
			if(i>0){
				response.sendRedirect("artisanlogin.html");
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

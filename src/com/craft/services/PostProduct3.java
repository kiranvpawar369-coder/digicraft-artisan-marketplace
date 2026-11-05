package com.craft.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.craft.dbcon.ConnectDB;
import com.user.pojo.User;

/**
 * Servlet implementation class PostProduct
 */
public class PostProduct3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostProduct3() {
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
		
		String productName = request.getParameter("productName");
		String description = request.getParameter("description");
		String price = request.getParameter("price");
		String stock = request.getParameter("stock");
		String postDate = request.getParameter("postDate");
		int a_id = User.getA_id();
		try{
			
			Connection con = ConnectDB.getConnect();
			PreparedStatement ps = con.prepareStatement("INSERT INTO products (pname, pdes, pprice, pstock, pdate, a_id) VALUES (?, ?, ?, ?, ?, ?)");
			ps.setString(1, productName);
			ps.setString(2, description);
			ps.setString(3, price);
			ps.setString(4, stock);
			ps.setString(5, postDate);
			ps.setInt(6, a_id);
			
			int i = ps.executeUpdate();
			
			if(i>0){
				response.sendRedirect("artisandashboard.html");
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

<%@page import="com.craft.dbcon.ConnectDB" %>
<%@page import="java.sql.*"%>
<%@page import="com.user.pojo.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="margin: 0; padding: 0; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f9f9f9;">

  <div style="max-width: 1000px; margin: 100px auto 50px; padding: 20px;">
    <h2 style="text-align: center; color: #2c3e50; margin-bottom: 30px;">Available Products</h2>

    <div style="overflow-x: auto;">
      <table style="width: 100%; border-collapse: collapse; background-color: #fff; box-shadow: 0 3px 10px rgba(0,0,0,0.1); border-radius: 10px; overflow: hidden;">
        <thead style="background-color: #3498db; color: white;">
          <tr>
            <th style="padding: 12px; text-align: left;">Product Name</th>
            <th style="padding: 12px; text-align: left;">Description</th>
            <th style="padding: 12px; text-align: left;">Price</th>
            <th style="padding: 12px; text-align: left;">Stock</th>
            <th style="padding: 12px; text-align: left;">Action</th>
          </tr>
        </thead>
        <tbody>
        <%
        try {
        	int bid = Integer.parseInt(request.getParameter("bid"));
        	int pid = Integer.parseInt(request.getParameter("p_id"));
        	
            Connection con = ConnectDB.getConnect();
            PreparedStatement ps = con.prepareStatement("UPDATE products SET bid = ? WHERE pid = ?;");
            ps.setInt(1, bid);
            ps.setInt(2, pid);
            
            int i = ps.executeUpdate();

            if(i>0) {
             	response.sendRedirect("viewProducts.jsp");
            }
            else{
            	response.sendRedirect("error.html");
            }
        } catch(Exception e) {
        	e.printStackTrace();
        }
        %>
        </tbody>
      </table>
    </div>
  </div>

</body>
</html>
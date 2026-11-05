<%@page import="com.craft.dbcon.ConnectDB" %>
<%@page import="java.sql.*"%>
<%@page import="com.user.pojo.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DigiCraft | View Products</title>
</head>
<body style="margin: 0; padding: 0; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f9f9f9;">

  <div style="max-width: 1000px; margin: 100px auto 50px; padding: 20px;">
    <h2 style="text-align: center; color: #2c3e50; margin-bottom: 30px;">Order Placed</h2>

    <div style="overflow-x: auto;">
      <table style="width: 100%; border-collapse: collapse; background-color: #fff; box-shadow: 0 3px 10px rgba(0,0,0,0.1); border-radius: 10px; overflow: hidden;">
        <thead style="background-color: #3498db; color: white;">
          <tr>
            <th style="padding: 12px; text-align: left;">Product Name</th>
            <th style="padding: 12px; text-align: left;">Description</th>
            <th style="padding: 12px; text-align: left;">Price</th>
          </tr>
        </thead>
        <tbody>
        <%
        try {
          int bid = User.getBid(); // Get Buyer ID from session object or static method
          Connection con = ConnectDB.getConnect();
          PreparedStatement ps = con.prepareStatement("SELECT * FROM products where bid=?");
          ps.setInt(1, bid);
          ResultSet rs = ps.executeQuery();

          while(rs.next()) {
            int productId = rs.getInt(1); // Assuming ID is in column 1
        %>
          <tr style="border-bottom: 1px solid #eee;">
            <td style="padding: 12px;"><%= rs.getString(4) %></td> <!-- Product Name -->
            <td style="padding: 12px;"><%= rs.getString(5) %></td> <!-- Description -->
            <td style="padding: 12px;"><%= rs.getString(7) %></td> <!-- Price -->
          </tr>
        <%
          }
        } catch(Exception e) {
        %>
          <tr>
            <td colspan="4" style="padding: 15px; text-align: center; color: red; background-color: #fff3f3;">
              Error loading product data: <%= e.getMessage() %>
            </td>
          </tr>
        <%
        }
        %>
        </tbody>
      </table>
    </div>
  </div>

</body>
</html>

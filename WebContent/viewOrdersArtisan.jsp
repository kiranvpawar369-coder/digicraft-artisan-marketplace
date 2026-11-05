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
    <h2 style="text-align: center; color: #2c3e50; margin-bottom: 30px;">Order Placed</h2>

    <div style="overflow-x: auto;">
      <table style="width: 100%; border-collapse: collapse; background-color: #fff; box-shadow: 0 3px 10px rgba(0,0,0,0.1); border-radius: 10px; overflow: hidden;">
        <thead style="background-color: #3498db; color: white;">
          <tr>
            <th style="padding: 12px; text-align: left;">Customer Name</th>
            <th style="padding: 12px; text-align: left;">Contact</th>
            <th style="padding: 12px; text-align: left;">Email</th>
            <th style="padding: 12px; text-align: left;">Product Name</th>
          </tr>
        </thead>
        <tbody>
        <%
        try {
          int a_id = User.getA_id(); 
          System.out.println(a_id);
          // Get Buyer ID from session object or static method
          Connection con = ConnectDB.getConnect();
          PreparedStatement ps = con.prepareStatement("SELECT * FROM products where a_id=?");
          ps.setInt(1, a_id);
          ResultSet rs = ps.executeQuery();

          while(rs.next()) {
            int bid = rs.getInt("bid"); // Assuming ID is in column 1
            String pname = rs.getString("pname");
            
            PreparedStatement ps1 = con.prepareStatement("select * from buyer where bid=?");
            ps1.setInt(1,bid);
            ResultSet rs1 = ps1.executeQuery();
            
            while(rs1.next()){
            	System.out.println(rs.getString("pname"));
            	%>
                <tr style="border-bottom: 1px solid #eee;">
                  <td style="padding: 12px;"><%= rs1.getString(2) %></td> <!-- Product Name -->
                  <td style="padding: 12px;"><%= rs1.getString(3) %></td> <!-- Description -->
                  <td style="padding: 12px;"><%= rs1.getString(5) %></td> <!-- Price -->
                  <td style="padding: 12px;"><%= pname %></td> <!-- Price -->
                </tr>
              <%
            }
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
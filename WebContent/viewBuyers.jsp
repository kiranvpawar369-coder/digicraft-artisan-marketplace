<%@page import="com.craft.dbcon.ConnectDB" %>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>DigiCraft | View Buyers</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f9f9f9;
      padding: 30px;
    }
    .table-wrapper {
      background: #fff;
      padding: 25px;
      border-radius: 10px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      max-width: 1000px;
      margin: auto;
    }
    h2 {
      text-align: center;
      color: #e74c3c;
      margin-bottom: 25px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      font-size: 16px;
    }
    th, td {
      padding: 12px 16px;
      border-bottom: 1px solid #ddd;
      text-align: left;
    }
    th {
      background-color: #e74c3c;
      color: white;
      text-transform: capitalize;
    }
    tr:hover {
      background-color: #f1f1f1;
    }
    .error-message {
      color: red;
      font-weight: bold;
      text-align: center;
      padding: 10px;
    }
    .delete-btn {
      background-color: #e74c3c;
      color: white;
      padding: 6px 12px;
      border: none;
      border-radius: 4px;
      font-size: 14px;
      font-weight: bold;
      cursor: pointer;
      transition: background 0.3s;
    }
    .delete-btn:hover {
      background-color: #c0392b;
    }
    form {
      margin: 0;
    }
  </style>
</head>
<body>

  <div class="table-wrapper">
    <h2>Registered Buyers</h2>
    <table class="citizens-table">
      <thead>
        <tr>
          <th>Name</th>
          <th>Contact</th>
          <th>Address</th>
          <th>Email</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <%
        try {
            Connection con = ConnectDB.getConnect();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM buyer");
            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
              int buyerId = rs.getInt(1); // Assuming ID is in column 1
        %>
        <tr>
          <td><%= rs.getString(2) %></td>
          <td><%= rs.getString(3) %></td>
          <td><%= rs.getString(4) %></td>
          <td><%= rs.getString(5) %></td>
          <td>
            <form action="delete-buyer.jsp" method="post">
              <input type="hidden" name="buyerId" value="<%= buyerId %>">
              <button type="submit" class="delete-btn">Delete</button>
            </form>
          </td>
        </tr>
        <%
            }
        } catch(Exception e) {
        %>
        <tr>
          <td colspan="5" class="error-message">
            Error loading buyer data: <%= e.getMessage() %>
          </td>
        </tr>
        <%
        }
        %>
      </tbody>
    </table>
  </div>

</body>
</html>

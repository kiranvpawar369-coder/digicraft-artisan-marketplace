<%@page import="com.craft.dbcon.ConnectDB" %>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Artisan Status</title>
<style>
  body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f9f9f9;
    padding: 30px;
  }

  .table-wrapper {
    width: 100%;
    background: #fff;
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
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
  }

  tr:hover {
    background-color: #f1f1f1;
  }

  select {
    padding: 6px 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
    font-size: 14px;
  }

  input[type="submit"] {
    padding: 8px 14px;
    background-color: #3498db;
    color: white;
    border: none;
    border-radius: 4px;
    font-weight: 500;
    cursor: pointer;
  }

  input[type="submit"]:hover {
    background-color: #2980b9;
  }

  .error-message {
    color: red;
    font-weight: bold;
    text-align: center;
  }
</style>
</head>
<body>

<div class="table-wrapper">
  <h2>Manage Artisan Status</h2>
  <table>
    <thead>
      <tr>
        <th>Name</th>
        <th>Craft Type</th>
        <th>Contact</th>
        <th>Email</th>
        <th>Status</th>
        <th>Action</th>
        <th>Delete<th/>
      </tr>
    </thead>
    <tbody>
      <%
        try {
          Connection con = ConnectDB.getConnect();
          PreparedStatement ps = con.prepareStatement("SELECT * FROM artisan");
          ResultSet rs = ps.executeQuery();

          while(rs.next()) {
            int artisanId = rs.getInt(1); // Assuming first column is ID
            String name = rs.getString(2);
            String craft = rs.getString(3);
            String contact = rs.getString(4);
            String email = rs.getString(5);
            String status = rs.getString(7); // Assuming 7th column is status
      %>
      <tr>
        <td><%= name %></td>
        <td><%= craft %></td>
        <td><%= contact %></td>
        <td><%= email %></td>
        <td>
          <form action="updateArtisanStatus.jsp" method="post" style="display:flex; gap:10px; align-items:center;">
		    <input type="hidden" name="artisanId" value="<%= artisanId %>">
		    <select name="status">
		        <option value="Pending" <%= "Pending".equalsIgnoreCase(status) ? "selected" : "" %>>Pending</option>
		        <option value="aproved" <%= "Approved".equalsIgnoreCase(status) ? "selected" : "" %>>Approved</option>
		        <option value="disaproved" <%= "Disapproved".equalsIgnoreCase(status) ? "selected" : "" %>>Disapproved</option>
		    </select>
		    <input type="submit" value="Update">
		</form>

        </td>
        <td>
            <form action="deleteArtisan.jsp" method="post">
              <input type="hidden" name="a_id" value="<%= artisanId %>">
              <button type="submit" class="delete-btn">Delete</button>
            </form>
          </td>
      </tr>
      <%
          }
        } catch(Exception e) {
      %>
      <tr>
        <td colspan="6" class="error-message">Error: <%= e.getMessage() %></td>
      </tr>
      <%
        }
      %>
    </tbody>
  </table>
</div>

</body>
</html>

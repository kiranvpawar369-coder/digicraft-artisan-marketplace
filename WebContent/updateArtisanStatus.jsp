<%@page import="java.sql.*" %>
<%@page import="com.craft.dbcon.ConnectDB" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Status Update</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
            padding: 40px;
            text-align: center;
        }

        .message {
            background-color: #fff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            display: inline-block;
            font-size: 18px;
            color: #2c3e50;
        }

        .success {
            color: green;
        }

        .error {
            color: red;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            border-radius: 5px;
            text-decoration: none;
        }

        a:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

<%
    String status = request.getParameter("status");
    String artisanIdStr = request.getParameter("artisanId");

    if (status != null && artisanIdStr != null) {
        try {
            int artisanId = Integer.parseInt(artisanIdStr);

            Connection con = ConnectDB.getConnect();
            PreparedStatement ps = con.prepareStatement("UPDATE artisan SET a_status = ? WHERE a_id = ?");
            ps.setString(1, status);
            ps.setInt(2, artisanId);

            int result = ps.executeUpdate();
            con.close();
%>
            <div style="margin: 20px; padding: 10px; background-color: <%= result > 0 ? "#d4edda" : "#f8d7da" %>; color: <%= result > 0 ? "#155724" : "#721c24" %>; border: 1px solid <%= result > 0 ? "#c3e6cb" : "#f5c6cb" %>; border-radius: 5px;">
                <%= result > 0 ? "Artisan status updated to \"" + status + "\" successfully!" : "Failed to update artisan status. Try again." %>
            </div>
<%
        } catch (NumberFormatException e) {
%>
            <div style="margin: 20px; padding: 10px; background-color: #fff3cd; color: #856404; border: 1px solid #ffeeba; border-radius: 5px;">
                Invalid artisan ID format.
            </div>
<%
        } catch (Exception e) {
%>
            <div style="margin: 20px; padding: 10px; background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; border-radius: 5px;">
                Error: <%= e.getMessage() %>
            </div>
<%
        }
    } else {
%>
        <div style="margin: 20px; padding: 10px; background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; border-radius: 5px;">
            Missing artisan ID or status parameter.
        </div>
<%
    }
%>
</body>
</html>

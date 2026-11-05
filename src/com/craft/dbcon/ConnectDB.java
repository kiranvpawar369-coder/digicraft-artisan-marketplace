package com.craft.dbcon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.*;

public class ConnectDB {

	static Connection con = null;
	
	public static Connection getConnect(){
		
		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  //load the drivers
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/craftdb","root","");
			System.out.println("Connection Established, con = "+con);
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		return con;
	}
	
}

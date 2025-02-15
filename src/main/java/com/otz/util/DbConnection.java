package com.otz.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class DbConnection {
	private static Connection con=null;
	private static PreparedStatement ps=null;
	public static Connection getCon() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/flightbooking","root","preeti");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

}

package com.DBPKG;

import java.sql.*;

public class dbconnection {
	static ResultSet res = null;
	static PreparedStatement pstmt = null;
	static Connection conn = null;
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","asdf","1234");
		return conn;
	}
	public static ResultSet sendQuery(String query) throws SQLException {
		System.out.println("sendQuery1 : "+query);

		pstmt = conn.prepareStatement(query);
		System.out.println("sendQuery-- : "+query);
		res = pstmt.executeQuery();
		System.out.println("sendQuery2 : "+res);
		return res;
	}
}

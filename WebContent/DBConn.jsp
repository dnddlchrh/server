<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<%
PreparedStatement pstmt = null;
ResultSet res = null;
String query = "";
String user = "asdf";
String password = "1234";
Connection conn = null;
try{
	 Class.forName("oracle.jdbc.OracleDriver");
	 conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe",user,password);
}catch(ClassNotFoundException e){
	System.out.println("driver");
}catch(SQLException e){
	System.out.println("oracle");
}
%>

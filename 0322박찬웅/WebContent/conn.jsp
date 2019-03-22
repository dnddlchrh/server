<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "chan";
String password = "1234";
try{
	Class.forName(driver);
	out.println("드라이버 성공");
	DriverManager.getConnection(url,user,password);
	out.println("오라클 성공");
}catch(ClassNotFoundException e){
	System.out.println("드라이버 실패");
}catch(SQLException e){
	System.out.println("오라클 실패");
}
%>
</body>
</html>
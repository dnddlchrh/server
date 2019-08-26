<%@include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String table="tbl_hamsale_01";
	query ="insert into "+table+" values(?, ?, ?, ?, ?)";
	pstmt = conn.prepareStatement(query);
	pstmt.setString(1, request.getParameter("saleno"));
	pstmt.setString(2, request.getParameter("scode"));
	pstmt.setString(3, request.getParameter("saledate"));
	pstmt.setString(4, request.getParameter("hcode"));
	pstmt.setString(5, request.getParameter("amount"));
	res = pstmt.executeQuery();
%>
<script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	alert("입력이 저장되었습니다");
	location.replace("./index.jsp");
</script>
<%@ include file="DBConn.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

String move_url = "./all.jsp";
String s1 ="";
table = "sale_tbl_001";

		query = "INSERT INTO "+table+" values(sale_seq.nextval, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, request.getParameter("sale_store_cd"));
        pstmt.setString(2, request.getParameter("sale_ymd"));
        pstmt.setString(3, request.getParameter("sale_pizza_cd"));
        pstmt.setString(4, request.getParameter("sale_cnt"));
        s1 = "삽입";
System.out.print(query);
res = pstmt.executeQuery();
%>
<script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	alert("<%=s1%> 완료되었습니다");
	location.replace("<%=move_url%>");
</script>
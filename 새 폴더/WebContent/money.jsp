<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="DBConn.jsp" %>
<%@ page import="java.sql.*" %>
<%
query = "select a.custno, a.custname, decode(a.grade,'A','VIP','B','일반','C','') grade, sum(b.price) price from member_tbl_02 a, money_tbl_02 b where a.custno = b.custno group by a.custno, a.custname, a.grade order by price desc";
pstmt = conn.prepareStatement(query);
res = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원 관리</title>
<link rel="stylesheet" href="css/index.css" />
</head>
<body>
<div class="wrap">
<jsp:include page="header.jsp"/>
<jsp:include page="nav.jsp"/>
	<div class="section">
	<div class="tit_comm">회원매출조회</div>
	<table class="money_t" border="1">
		<thead>
			<tr>
				<th style ="width: 110px;">회원번호</th>
				<th style ="width: 100px;">회원성명</th>
				<th style ="width: 130px;">고객등급</th>
				<th style ="width: 130px;">매출</th>
			</tr>
		</thead>
		<tbody>
			<%
			while(res.next()){
				%>
				<tr>
					<td><%=res.getString("custno") %></td>
					<td><%=res.getString("custname") %></td>
					<td><%=res.getString("grade") %></td>
					<td><%=res.getString("price") %></td>
				</tr>
				<%
			}
			%>
		</tbody>
	</table>
</div>
<jsp:include page="footer.jsp"/>
</div>
</body>
</html>
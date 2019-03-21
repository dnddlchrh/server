<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="DBconn.jsp" %>
<%
table = "money_tbl_02";
query = "select a.custno, a.custname, decode(a.grade,'A','VIP','B','일반','C','직원') grade, sum(b.PRIcE) price from member_tbl_02 a, money_tbl_02 b where a.custno = b.custno group by a.custno, a.custname, a.grade order by price desc";
pstmt = conn.prepareStatement(query);
res = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원 관리</title>
</head>
<body>
<div class="wrap">
<jsp:include page="header.jsp"/>
	<section>
	<div class="section_tit">회원매출조회</div>
	<table class="table_mny" border="1">
		<thead>
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>
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
</section>
<jsp:include page="footer.jsp"/>
</div>
</body>
</html>
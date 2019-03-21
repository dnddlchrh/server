<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.*"%>
<%@ include file="/DBconn.jsp" %>
<%
table = "member_tbl_02";
query = "select * from "+table;
pstmt = conn.prepareStatement(query);
res = pstmt.executeQuery();
DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.MEDIUM);
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
	<div class="section_tit">회원목록조회/수정</div>
	<table class="table_comm" border="1">
		<thead>
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
			</tr>
		</thead>
		<tbody>
		<%
				while(res.next()){
					%>
			<tr>
			
				<td><a href="modify.jsp?target=<%=res.getString("custno") %>" class="white_font"><%=res.getString("custno") %></a></td>
				<td><%=res.getString("custname") %></td>
				<td><%=res.getString("phone") %></td>
				<td><%=res.getString("address") %></td>
				<td><%=dateFormat.format(res.getDate("joindate")) %></td>
				<td><%=res.getString("grade") %></td>
				<td><%=res.getString("city") %></td>
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
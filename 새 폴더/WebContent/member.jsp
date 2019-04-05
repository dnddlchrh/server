<%@page import="java.text.*"%>
<%@include file="DBConn.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.MEDIUM);

query = "select custno,custname,phone,address,to_char(joindate, 'yyyy-mm-dd') as joindate,grade,city from member_tbl_02";
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
	<div class="tit_comm">회원목록조회/수정</div>
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
					String custno=res.getString("custno");
					String grade =res.getString("grade");
					switch(grade){
					case "A": grade = "VIP";break;
					case "B": grade = "일반";break;
					case "C": grade = "직원";break;
				}
					%>
			<tr>
				<td><a href="modify.jsp?target=<%=custno%>" class="white"><%=custno%></a></td>
				<td><%=res.getString("custname") %></td>
				<td><%=res.getString("phone") %></td>
				<td><%=res.getString("address") %></td>
				<td><%=res.getString("joindate") %></td>
				<td><%=grade %></td>
				<td><%=res.getString("city") %></td>
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
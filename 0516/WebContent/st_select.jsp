<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="DBConn.jsp" %>
<%
query ="Select id,name,substr(id,1,1),substr(id,2,2),substr(id,4,2),gender from member_tbl";
pstmt=conn.prepareStatement(query);
res=pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrap">
<jsp:include page="header.jsp"></jsp:include>
<div class="section">
<h3 class="tit_comm">학생조회</h3>
<table class="table_comm" border="1">
<tr>
	<th>학번</th>
	<th>이름</th>
	<th>학년</th>
	<th>반</th>
	<th>번호</th>
	<th>성별</th>
</tr>
<%while(res.next()){ %>
<tr>
<td><%=res.getString(1) %></td>
<td><%=res.getString(2) %></td>
<td><%=res.getString(3) %></td>
<td><%=res.getString(4) %></td>
<td><%=res.getString(5) %></td>
<td><%=res.getString(6) %></td>
</tr>
<%}res.close(); %>
</table>
</div>
<%@include file="footer.jsp" %>
</div>
</body>
</html>
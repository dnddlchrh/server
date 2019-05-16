<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="DBConn.jsp" %>
<%
query="Select a.id,a.name,substr(a.id,1,1),substr(a.id,2,2),substr(a.id,4,2),a.gender,b.korean,b.math,b.english,b.history,(b.korean+b.math+b.english+b.history) as scoreall,((b.korean+b.math+b.english+b.history)/4),ROW_NUMBER() OVER(ORDER BY (b.korean+b.math+b.english+b.history) desc)  from member_tbl a, score_tbl b where a.id=b.id order by scoreall desc";
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
	<th>국어</th>
	<th>수학</th>
	<th>영어</th>
	<th>역사</th>
	<th>합계</th>
	<th>평균</th>
	<th>순위</th>
</tr>
<%while(res.next()){ %>
<tr>
<td><%=res.getString(1) %></td>
<td><%=res.getString(2) %></td>
<td><%=res.getString(3) %></td>
<td><%=res.getString(4) %></td>
<td><%=res.getString(5) %></td>
<td><%=res.getString(6) %></td>
<td><%=res.getString(7) %></td>
<td><%=res.getString(8) %></td>
<td><%=res.getString(9) %></td>
<td><%=res.getString(10) %></td>
<td><%=res.getString(11) %></td>
<td><%=res.getString(12) %></td>
<td><%=res.getString(13) %></td>
</tr>
<%}res.close(); %>
</table>
</div>
<%@include file="footer.jsp" %>
</div>
</body>
</html>
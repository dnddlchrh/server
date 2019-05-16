<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="DBConn.jsp" %>
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
<h3 class="tit_comm">학생 성적 등록</h3>
<form action="action.jsp" method="post">
<table class="table_comm">
<tr>
	<th>학번</th>
	<td><input name="id"></td>
</tr>
<tr>
	<th>국어</th>
	<td><input name="korean" type="number" maxlength="3"></td>
</tr>
<tr>
	<th>수학</th>
	<td><input name="math" type="number" maxlength="3"></td>
</tr>
<tr>
	<th>영어</th>
	<td><input name="english" type="number" maxlength="3"></td>
</tr>
<tr>
	<th>역사</th>
	<td><input name="history" type="number" maxlength="3"></td>
</tr>
<tr>
	<td colspan="2"><input type="submit" value="등록"></td>
</tr>
</table>
</form>
</div>
<%@include file="footer.jsp" %>
</div>
</body>
</html>
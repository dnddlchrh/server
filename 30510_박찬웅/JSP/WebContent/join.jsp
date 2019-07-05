<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="DBconn.jsp" %>
<%@page import="java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출 등록</title>
</head>
<body>
<%

/* pstmt=conn.prepareStatement(query);
res=pstmt.executeQuery(); */
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");
String today = formatter.format(new java.util.Date());
%>
<div>
<form action="action.jsp" method="post" name="join" onsubmit="return validate()">
<input type="hidden" value="insert" name="action">
	<table border="1">
		<tr>
			<td>아이디(이메일형식)</td>
			<td><input type="email" name="id"></td>
		</tr>
		<tr>
			<td>비밀번호(8~16자리)</td>
			<td><input type="password" name="pw" pattern=".{8,16}"></td>
		</tr>
		<tr>
			<td>이름(2글자 이상)</td>
			<td><input type="text" name="name" pattern=".{2,}"></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><input type="date" name="birth"></td>
		</tr>
		<tr>
			<td>성별(선택형식)</td>
			<td>
			<select name="gender">
				<option value="남">남</option>
				<option value="여">여</option>
			</select>
			</td>
		</tr>
		<tr>
			<td>가입일시</td>
			<td><input value="<%=today %>" name="in_date" readonly="readonly"></td>
		</tr>
		<tr>
			<td>직업(직접입력)</td>
			<td><input name="job" type="text"></td>
		</tr>
		<tr style="text-align: center;">
		<td colspan="2"><input value="등록" type="submit"><input value="메인으로" type="button" onclick="location.replace('index.jsp')"></td>
		</tr>
	</table>
</form>
</div>
<script type="text/javascript" src="./js/validate.js"></script>
</body>
</html>
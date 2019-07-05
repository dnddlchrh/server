<%@page import="oracle.net.aso.q"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="DBconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<form action="loginchk.jsp" method="post">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input name="id" type="text"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input name="pw" type="password"></td>
		</tr>
		<tr style="text-align: center;">
			<td colspan="2"><input type="submit" value="로그인"></td>
		</tr>
	</table>
</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="DBconn.jsp" %>
<%
String id = (String)session.getAttribute("id");
query = "select id,pw,name,gender,to_char(birth,'yyyymmdd'),to_char(in_date,'yyyymmdd'),job from user_tb1 where id='"+id+"'";
pstmt=conn.prepareStatement(query);
res=pstmt.executeQuery();
res.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="action.jsp" method="post" name="joinobj" onsubmit="return validate1()">
<input type="hidden" value="update" name="action">
	<table border="1">
		<tr>
			<td>아이디(이메일형식)</td>
			<td><input type="email" name="id" value="<%=res.getString(1)%>"></td>
		</tr>
		<tr>
			<td>비밀번호(8~16자리)</td>
			<td><input type="password" name="pw" pattern=".{8,16}" value="<%=res.getString(2)%>"></td>
		</tr>
		<tr>
			<td>이름(2글자 이상)</td>
			<td><input type="text" name="name" pattern=".{2,}" value="<%=res.getString(3)%>"></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><input type="text" name="birth" value="<%=res.getString(5)%>"></td>
		</tr>
		<tr>
			<td>성별(선택형식)</td>
			<td>
			<select name="gender">
				<option value="<%=res.getString(4)%>"><%=res.getString(4)%></option>
				<option value="남">남</option>
				<option value="여">여</option>
			</select>
			</td>
		</tr>
		<tr>
			<td>가입일시</td>
			<td><input value="<%=res.getString(6)%>" name="in_date" readonly="readonly"></td>
		</tr>
		<tr>
			<td>직업(직접입력)</td>
			<td><input name="job" type="text" value="<%=res.getString(7)%>"></td>
		</tr>
		<tr style="text-align: center;">
		<td colspan="2"><input value="등록" type="submit"><input value="메인으로" type="button" onclick="location.replace('index.jsp')"></td>
		</tr>
	</table>
</form>
</body>
</html>
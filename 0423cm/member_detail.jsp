<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, java.text.*"  %>
<%@include file="DBConn.jsp" %>
<%
int no=1;
query ="select count(cust_no) from member_tbl_005 where rownum >=1";
pstmt = conn.prepareStatement(query);
res = pstmt.executeQuery();
if(res.next())no=res.getInt(1)+1+10000;
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
String today = formatter.format(new java.util.Date());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
</head>
<body>
<form action="action.jsp" method="post">
<input type="hidden" value="insert_mem" name="action">
	<table border="1">
		<tr>
			<th colspan="2">회원정보</th>
		</tr>
		<tr>
			<th>고객번호(자동채번)</th>
			<td><input type="text" value="<%=no%>" readonly="readonly" name="cust_no"></td>
		</tr>
		<tr>
			<th>고객명</th>
			<td><input type="text" name="cust_nm" maxlength="5"></td>
		</tr>
		<tr>
			<th>핸드폰번호</th>
			<td><input type="text" name="phone" maxlength="11"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address"></td>
		</tr>
		<tr>
			<th>가입일자(자동설정)</th>
			<td><input type="text" name="join_date" value="<%=today%>" readonly="readonly"></td>
		</tr>
		<tr>
			<th>누적포인트(자동설정)</th>
			<td><input type="text" name="point" value="0" readonly="readonly"></td>
		</tr>
		<tr>
			<th>선호영화</th>
			<td>
				<select name="join_route">
					<option value="">선택</option>
					<option value="01">액션</option>
					<option value="02">공포</option>
					<option value="03">드라마</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>등급(자동설정)</th>
			<td><input type="text" name="grade" value="일반" readonly="readonly"></td>
		</tr>
		<tr>
			<th colspan="2"><input type="submit" value="저장"> <input type="button" onclick="location.href='./member.jsp'" value="돌아가기"></th>
		</tr>
	</table>
</form>
</body>
</html>
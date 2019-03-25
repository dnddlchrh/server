<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrap">
<%@include file="header.jsp" %>
	<div class="section">
		<div class="tit">대여도서 등록</div>
		<table class="rent_tb" border="1">
			<tr>
				<th>대여일자</th>
				<td><input type="text" name="rent_ymd"></td>
			</tr>
			<tr>
				<th>대여번호(자동)</th>
				<td><input type="text" name="rent_no"></td>
			</tr>
			<tr>
				<th>도서코드</th>
				<td><input type="text" name="rent_book"></td>
			</tr>
			<tr>
				<th>고객번호</th>
				<td><input type="text" name="rent_rent" size="30"></td>
			</tr>
			<tr>
				<th>반납기한(대여일 7일 후)</th>
				<td><input type="text" name="close_ymd"></td>
			</tr>
			<tr>
				<td class="table_footer" colspan="2">
					<input type="submit" value="등록">
					<input type="button" value="조회" onclick="histroy.back()">
				</td>
			</tr>
		</table>
	</div>
<%@include file="footer.jsp" %>
</div>
</body>
</html>
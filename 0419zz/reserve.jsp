<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, java.text.*"  %>
<%@include file="DBConn.jsp" %>
<%
int no=1;
query ="select count(r_seq) from reserve_tbl_005 where rownum >=1";
pstmt = conn.prepareStatement(query);
res = pstmt.executeQuery();
if(res.next())no=res.getInt(1)+1;
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy.MM.dd");
String today = formatter.format(new java.util.Date());
query ="select a.movie_nm,a.movie_cd from movie_tbl_005 a,reserve_tbl_005 b where a.movie_cd=b.r_movie_cd group by a.movie_nm,a.movie_cd";
pstmt = conn.prepareStatement(query);
res = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
</head>
<body>
<form action="action.jsp" method="post">
<input type="hidden" value="insert_res" name="action">
	<table border="1">
		<tr>
			<th colspan="2">예매등록</th>
		</tr>
			<tr>
			<th>가입일자(자동설정)</th>
			<td><input type="text" name="r_ymd" value="<%=today%>" readonly="readonly"></td>
		</tr>
		<tr>
			<th>예매번호</th>
			<td><input type="text" value="00<%=no%>" readonly="readonly" name="r_seq"></td>
		</tr>
		<tr>
			<th>선호영화</th>
			<td>
				<select name="movie_nm">
					<option value="">선택</option>
					<%while(res.next()){ %>
					<option value="res.getString('movie_cd')"><%=res.getString(1) %></option>
					<%} %>
				</select>
			</td>
		</tr>
		<tr>
			<th>조조할인 여부</th>
			<td>
				<select name="morning_fg">
					<option value="">선택</option>
				<option value="Y">Y</option>
				<option value="N">N</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>회원번호</th>
			<td><input type="text" name="r_cust_no" ></td>
		</tr>
		<tr>
			<th colspan="2"><input type="submit" value="저장"> <input type="button" onclick="location.href='./member.jsp'" value="돌아가기"></th>
		</tr>
	</table>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="DBConn.jsp" %>
    <%
    query = "SELECT RANK() OVER (ORDER BY sum(cnt) DESC) AS ranking,";
    query+=	"       movie_nm, ";
    query+=	" 	       round(sum(cnt)/(SELECT count(*) FROM reserve_tbl_005)*100, 1)||'%' per,";
    query+=	" 	       sum(cnt)||'건' cntnum,";
    query+=	"  	       ymd";
    query+=	" 	 FROM (";
    query+=	" 	 SELECT movie_nm,";
    query+=	" 	      count(*) cnt,";
    query+=	"       to_char(play_date, 'yyyy-mm-dd') ymd";
   	query+=	" 	  FROM reserve_tbl_005 a, movie_tbl_005 b";
    query+=	" 	 WHERE a.r_movie_cd = b.movie_cd";
  	query+=	"  	 GROUP BY movie_nm, play_date";
 	query+=	" 	 UNION ALL";
    query+=	" 	 SELECT movie_nm, 0, to_char(play_date, 'yyyy-mm-dd') FROM movie_tbl_005";
    query+=	" 	 )";
    query+=	" 	 GROUP BY movie_nm, ymd";
    pstmt = conn.prepareStatement(query);
    res = pstmt.executeQuery();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
<tr>
	<th>순위</th><th>영화제목</th><th>예매율</th><th>예매건수</th><th>개봉일</th>
</tr>
<%while(res.next()){ %>
<tr>
	<td><%=res.getString(1) %></td>
	<td><%=res.getString(2) %></td>
	<td><%=res.getString(3) %></td>
	<td><%=res.getString(4) %></td>
	<td><%=res.getString(5) %></td>
</tr>
<%} %>
<tr>
<td colspan="5"><input type="button" onclick="location.href='./member.jsp'" value="회원관리"><input type="button" onclick="location.href='./reserve.jsp'" value="예매등록"></td>
</tr>
</table>
</body>
</html>
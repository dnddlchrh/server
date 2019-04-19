<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@include file="DBConn.jsp" %>
<%
	query = "select";
	query+=	"		cust_no as 고객번호,";
	query+=	"		cust_nm as 고객명,";
	query+=	"		phone as 핸드폰번호,";
	query+=	"		address as 주소,";
	query+=	"		join_date as 가입일자,";
	query+=	"	point as 누적포인트,";
	query+=	"		case join_route ";
	query+=	"			when '01' then '액션'";
	query+=	"			when '02' then '호러'";
	query+=	"		when '03' then '드라마'";
	query+=	"	end as 선호영화,";
	query+=	"		DECODE(TRUNC(POINT/5000,0),'1','VIP','2','VVIP','일반') AS grade";
	query+=	"		from member_tbl_005";
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
<tr><th>고객번호</th><th>고객명</th><th>핸드폰번호</th><th>주소</th><th>가입일자</th><th>누적포인트</th><th>선호영화</th><th>등급</th></tr>
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
</tr>
<%} %>
<td colspan="8"><input type="button" onclick="location.href='./member_detail.jsp'" value="신규등록"></td>
</table>
</body>
</html>
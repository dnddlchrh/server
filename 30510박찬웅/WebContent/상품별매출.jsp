<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="DBConn.jsp" %>
<%
query ="select c.pcode, c.pname,sum(b.amount*c.cost) as price from TBL_SHOP_01 a,TBL_SALELIST_01 b,TBL_PIZZA_01 c where a.scode=b.scode and b.pcode=c.pcode group by c.pcode, c.pname order by price desc";
pstmt = conn.prepareStatement(query);
res = pstmt.executeQuery();
%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통합매출조회</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<div class="section">
<div class="sec_tit"></div>
<table border="1">
<tr>
<th>피자 코드</th>
<th>피자 명</th>
<th>총매출액</th>
</tr>
<%while(res.next()){ %>
<tr>
<td><%=res.getString(1) %></td>
<td><%=res.getString(2) %></td>
<td class="left">₩<%=res.getString(3) %></td>
</tr>
<%}res.close(); %>

</table>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
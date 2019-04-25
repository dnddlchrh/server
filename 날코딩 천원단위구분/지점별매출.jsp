<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="DBConn.jsp" %>
<%
query ="select a.scode, a.sname,to_char(sum(b.amount*c.cost),'999,999,999,999')  from TBL_SHOP_01 a,TBL_SALELIST_01 b,TBL_PIZZA_01 c where a.scode=b.scode and b.pcode=c.pcode group by a.scode, a.sname order by a.scode asc";
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
<th>지점코드</th>
<th>지점 명</th>
<th>총판매액</th>
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
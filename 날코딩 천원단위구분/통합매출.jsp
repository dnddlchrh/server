<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="DBConn.jsp" %>
<%
query ="select b.saleno,b.scode,b.saledate,b.pcode,b.amount,to_char((b.amount*a.cost),'999,999,999,999') as price  from TBL_PIZZA_01 a,TBL_SALELIST_01 b where a.pcode=b.pcode";
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
<th>매출전표번호</th>
<th>지점</th>
<th>판매일자</th>
<th>피자코드</th>
<th>피자명</th>
<th>판매수량</th>
<th>매출액</th>
</tr>
<%while(res.next()){ %>
<tr>
<td><%=res.getString(1) %></td>
<td><%=res.getString(2) %></td>
<td><%=res.getString(3) %></td>
<td><%=res.getString(4) %></td>
<td><%=res.getString(5) %></td>
<td><%=res.getString(6) %></td>
<td class="left">₩<%=res.getString("price") %></td>
</tr>
<%}res.close(); %>

</table>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="DBConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출현황</title>
</head>
<body>
<div class="wrap">
<jsp:include page="header.jsp"></jsp:include>
<%
query = "SELECT b.STORE_NM,";		
query += " sum(decode(a.pay_type, '01', sale_cnt, 0)*c.GOODS_PRICE*decode(a.sale_fg, '1', 1, '2', -1))||'원' AS cash_amt, ";	
query += " sum(decode(a.pay_type, '02', sale_cnt, 0)*c.GOODS_PRICE*decode(a.sale_fg, '1', 1, '2', -1))||'원' AS card_amt,";	
query += " (sum(decode(a.pay_type, '01', sale_cnt, 0)*c.GOODS_PRICE*decode(a.sale_fg, '1', 1, '2', -1))";	
query += " +sum(decode(a.pay_type, '02', sale_cnt, 0)*c.GOODS_PRICE*decode(a.sale_fg, '1', 1, '2', -1)))||'원' AS tot_amt";	
query += " FROM sale_tbl_003 a, store_tbl_003 b, GOODS_TBL_003 c";	
query += " WHERE a.STORE_CD = b.STORE_CD";	
query += " AND a.GOODS_CD = c.GOODS_CD";	
query += " GROUP BY b.STORE_NM";	
query += " ORDER BY tot_amt desc";	
pstmt=conn.prepareStatement(query);
res=pstmt.executeQuery();
%>
<jsp:include page="nav.jsp"></jsp:include>
<div class="section">
<div class="tit_comm">점포별매출현황</div>
	<table class="table_comm" border="1">
		<tr>
			<th>점포명</th>
			<th>현금매출</th>
			<th>카드매출</th>
			<th>총매출</th>
		</tr>
		<%
			while(res.next()){
		%>
		<tr>
			<td><a class="black" href="look.jsp?target=<%=res.getString(1) %>"><%=res.getString(1) %></a></td>
			<td><%=res.getString(2) %></td>
			<td><%=res.getString(3) %></td>
			<td><%=res.getString(4) %></td>
		</tr>
		<%} %>
	</table>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지매현</title>
</head>
<body>
<div class="wrap">
<%@include file="header.jsp" %>
<%
query = "select ";
query += " a.sale_store_cd,'₩'||sum(a.sale_cnt*b.price) as price, c.store_nm ";
query += " from ";
query += " sale_tbl_001 a, pizza_tbl_002 b, store_tbl_002 c ";
query += " where ";
query += " a.sale_pizza_cd = b.pizza_cd and ";
query += " c.store_cd = a.sale_store_cd ";
query += " group by ";
query += " a.sale_store_cd, c.store_nm ";

pstmt = conn.prepareStatement(query);
res = pstmt.executeQuery();
%>
	<div class="section">
	<div class="tit_comm">지점별 매출 현황</div>
		<table class="table_place" border="1">
			<tr>
				<th>지점 코드</th>
				<th>지점 명</th>
				<th>총매출액</th>
			</tr>
			<%
				while(res.next()){
					%>
			<tr>
				<td><%=res.getString("sale_store_cd") %></td>
				<td><%=res.getString("store_nm") %></td>
				<td class="moneytext_align"><%=res.getString("price") %></td>
			</tr>
			<%
			}%>
		</table>
	</div>
<%@include file="footer.jsp" %>
</div>
</body>
</html>
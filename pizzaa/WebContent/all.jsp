<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통매전</title>
</head>
<body>
<div class="wrap">
<%@include file="header.jsp" %>
<%
query = " select ";//a.sale_no
query += " lpad(a.sale_no, 3, '0') sale_no,a.sale_store_cd, a.sale_ymd, a.sale_pizza_cd, b.pizza_nm, a.sale_cnt, '₩'||(a.sale_cnt*b.price) as price ";
query += " from ";
query += " pizza_tbl_002 b,sale_tbl_001 a ";
query += " where ";
query += " a.sale_pizza_cd = b.pizza_cd ";
//String sql = "select sale_no(sale_seq.nextval,3,0) FROM "
pstmt = conn.prepareStatement(query);
res = pstmt.executeQuery();
%>
	<div class="section">
	<div class="tit_comm">통합매출현황조회</div>
		<table class="table_comm" border="1">
			<tr>
				<th>매출전표번호</th>
				<th>지점</th>
				<th>판매일자</th>
				<th>피자코드</th>
				<th>피자명</th>
				<th>판매수량</th>
				<th class="money_th">매출액</th>
			</tr>
			<%
				while(res.next()){
					%>
			<tr>
				<td><%=res.getString("sale_no") %></td>
				<td><%=res.getString("sale_store_cd") %></td>
				<td><%=res.getString("sale_ymd") %></td>
				<td><%=res.getString("sale_pizza_cd") %></td>
				<td><%=res.getString("pizza_nm") %></td>
				<td><%=res.getString("sale_cnt") %></td>
				<td class="moneytext_align"><%=res.getString("price") %></td>
			</tr>
			<%} %>
		</table>
	</div>
<%@include file="footer.jsp" %>
</div>
</body>
</html>
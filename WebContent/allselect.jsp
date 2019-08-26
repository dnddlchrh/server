<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="DBConn.jsp" %>
<%
	query = "select a.saleno,c.sname,to_char(a.saledate,'YYYY-MM-DD'),a.hcode,b.hname,a.amount,to_char((amount*b.cost),'999,999,999') from tbl_hamsale_01 a,tbl_hamburger_01 b,tbl_hamstore_01 c where a.hcode=b.hcode and a.scode = c.scode";
	pstmt = conn.prepareStatement(query);
	res = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="./js/index.js"></script>
</head>
<body>
<div class="wrap">
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<section>
<div class="sec_tit">
</div>
	<table border="1">
		<tr>
			<td>매출전표번호</td>
			<td>지점</td>
			<td>판매일자</td>
			<td>햄버거코드</td>
			<td>햄버거명</td>
			<td>판매수량</td>
			<td>매출액</td>
		</tr>
	<%while(res.next()){ %>
	<tr>
		<td><%=res.getString(1) %></td>
		<td><%=res.getString(2) %></td>
		<td><%=res.getString(3) %></td>
		<td><%=res.getString(4) %></td>
		<td><%=res.getString(5) %></td>
		<td><%=res.getString(6) %></td>
		<td><%=res.getString(7) %></td>
	</tr>
	<%}res.close(); %>
	</table>

</section>
<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="DBconn.jsp" %>
<%@page import="java.text.*,java.util.Date" %>
<%
query="select goods_cd, goods_nm, to_char(goods_price,'L999,999'),to_char(cost,'L999,999'), to_char(in_date,'yyyy-mm-dd')  from goods_tbl_003";
pstmt=conn.prepareStatement(query);
res=pstmt.executeQuery(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="wrap">
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<section>
	<div class="tit_comm">매출 등록</div>
	<table border="1">
		<tr>
			<th>상품코드</th>
			<th>상품명</th>
			<th>단가</th>
			<th>원가</th>
			<th>입고일자</th>
		</tr>
		<%while(res.next()){ %>
		<tr>
			<td><%=res.getString(1) %></td>
			<td><%=res.getString(2) %></td>
			<td style="text-align: right;"><%=res.getString(3) %></td>
			<td style="text-align: right;"><%=res.getString(4) %></td>
			<td><%=res.getString(5) %></td>
		</tr>
		<%} %>
		<tr>
			<td colspan="5" class="tbl_footer"><input type="button" value="등록" onclick="location.replace('joinobject')"></td>
		</tr>
	</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</div>
<script type="text/javascript" src="./js/validate.js"></script>
</body>
</html>

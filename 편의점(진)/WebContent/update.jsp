<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="DBConn.jsp" %>
<%@page import="java.text.*,java.util.*" %>
<%
String target = request.getParameter("target");
query="Select goods_cd, goods_nm ,goods_price, cost, to_char(in_date,'yyyy-MM-dd')  from goods_tbl_003 where goods_cd ="+target;
pstmt=conn.prepareStatement(query);
res = pstmt.executeQuery();
res.next();
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
<div class="section">
	<h2 class="sec_tit">매출등록</h2>
<form action="action.jsp" onsubmit="return validate1()"  name="joinobj">
<input value="update" type="hidden" name="action">
<table border="1" class="tbl_comm">
	<tr>
		<th>상품코드(변경불가)</th>
		<td><input value="<%=res.getString(1) %>" readonly="readonly" name="goods_cd"></td>
	</tr>
	<tr>
		<th>상품명</th>
		<td>
			<input type="text" name="goods_nm" value="<%=res.getString(2) %>">
		</td>
	</tr>
	<tr>
		<th>단가</th>
		<td>
			<input type="text" name="goods_price" value="<%=res.getString(3) %>">
		</td>
	</tr>
	<tr>
		<th>원가</th>
		<td>
			<input type="text" name="cost" value="<%=res.getString(4) %>">
		</td>
	</tr>
	<tr>
		<th>입고일자(변경불가)</th>
		<td><input value="<%=res.getString(5) %>"readonly="readonly" name="in_date"></td>
	</tr>

	<tr class="tb_footer">
		<td colspan="2"><input value="저장" type="submit"><input value="상품목록" type="button" onclick="history.back()"></td>
	</tr>
</table>
</form>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</div>
<script type="text/javascript" src="./js/index.js"></script>
</body>
</html>
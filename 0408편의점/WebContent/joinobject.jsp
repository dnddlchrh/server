<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="DBConn.jsp" %>
<%@page import="java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출 등록</title>
</head>
<body>
<div class="wrap">
<jsp:include page="header.jsp"></jsp:include>
<%

query = "SELECT goods_cd from goods_tbl_003 where rownum <= 1 order by goods_cd desc";
int goods_cd = 110001;
pstmt=conn.prepareStatement(query);
res=pstmt.executeQuery();
if (res.next()) goods_cd = res.getInt(1)+1;
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");
String today = formatter.format(new java.util.Date());
%>
<jsp:include page="nav.jsp"></jsp:include>
<div class="section">
<div class="tit_comm">매출 등록</div>
<form action="action.jsp" method="post" name="joinobj" onsubmit="return validate1()">
<input type="hidden" value="insert_object" name="action">
	<table border="1" class="table_comm" >
		<tr>
			<th width="300px;">상품코드(자동발생)</th>
			<td width="300px;"><input value="<%=goods_cd%>" name="goods_cd"></td>
		</tr>

		<tr>
		<tr>
		<%
		query = "SELECT a.goods_cd, b.goods_nm from sale_tbl_003 a, goods_tbl_003 b where a.goods_cd=b.goods_cd";
		pstmt = conn.prepareStatement(query);
		res = pstmt.executeQuery();
		%>
			<th>상품명</th>
			<td><input type="text" name="goods_nm"></td>
		</tr>
		<tr>
			<th>단가</th>
			<td><input type="text" name="goods_price"></td>
		</tr>
		<tr>
			<th>원가</th>
			<td><input type="text" name="cost"></td>
		</tr>
		<tr>
			<th>입고일자(자동발생)</th>
			<td><input value="<%=today %>" name="in_date"></td>
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
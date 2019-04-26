<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="DBConn.jsp" %>
<%@page import="java.text.*,java.util.*" %>
<%
query="Select count(goods_cd) no from goods_tbl_003";
pstmt=conn.prepareStatement(query);
res = pstmt.executeQuery();
int no=1;
if(res.next())no=res.getInt(1)+1+110000;
SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
String today = formatter.format(new Date());
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
<input value="insert_object" type="hidden" name="action">
<table border="1" class="tbl_comm">
	<tr>
		<th>상품코드(자동세팅)</th>
		<td><input value="<%=no %>" readonly="readonly" name="goods_cd"></td>
	</tr>
	<tr>
		<th>상품명</th>
		<td>
			<input type="text" name="goods_nm">
		</td>
	</tr>
	<tr>
		<th>단가</th>
		<td>
			<input type="text" name="goods_price">
		</td>
	</tr>
	<tr>
		<th>원가</th>
		<td>
			<input type="text" name="cost">
		</td>
	</tr>
	<tr>
		<th>입고일자(자동세팅)</th>
		<td><input value="<%=today%>" readonly="readonly" name="in_date"></td>
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
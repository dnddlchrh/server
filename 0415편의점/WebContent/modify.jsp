<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="DBConn.jsp" %>
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
String target = request.getParameter("target");
query = "select goods_cd,goods_nm,goods_price,cost,to_char(in_date,'yyyy-mm-dd') as in_date from goods_tbl_003 where goods_cd ="+target;
pstmt=conn.prepareStatement(query);
res=pstmt.executeQuery();
res.next();
%>
<jsp:include page="nav.jsp"></jsp:include>
<div class="section">
<div class="tit_comm">매출 등록</div>
<form action="action.jsp" method="post" name="joinobj" onsubmit="return validate1()">
<input type="hidden" value="update" name="action">
	<table border="1" class="table_comm" >
		<tr>
			<th width="300px;">상품코드(자동발생)</th>
			<td width="300px;"><input value="<%=res.getString("goods_cd")%>" name="goods_cd"></td>
		</tr>

		<tr>
		<tr>
			<th>상품명</th>
			<td><input type="text" name="goods_nm" value="<%=res.getString("goods_nm")%>"></td>
		</tr>
		<tr>
			<th>단가</th>
			<td><input type="text" name="goods_price" value="<%=res.getString("goods_price")%>"></td>
		</tr>
		<tr>
			<th>원가</th>
			<td><input type="text" name="cost" value="<%=res.getString("cost")%>"></td>
		</tr>
		<tr>
			<th>입고일자(자동발생)</th>
			<td><input value="<%= res.getString("in_date")%>" name="in_date"></td>
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
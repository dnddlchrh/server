<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="DBconn.jsp" %>
<%@page import="java.text.*,java.util.Date" %>
<%
query="select lpad(last_number, 6, '0') from user_sequences where sequence_name = 'GOODS_SEQ'";
pstmt=conn.prepareStatement(query);
res=pstmt.executeQuery(); 
res.next();
String no = res.getString(1)==null?"110001":res.getString(1);
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
<section>
	<form action="action.jsp" method="post" name="joinobj" onsubmit="return validate2();">
	<input type="hidden" name="action" value="insert_object">
	<div class="tit_comm">매출 등록</div>
	<table border="1">
		<tr>
			<th>상품코드(자동채번)</th>
			<td><input type="text" name="goods_cd" value="<%=no%>" readonly="readonly"></td>
		</tr>	
		<tr>
			<th>상품명</th>
			<td><input type="text" name="goods_nm"></td>
		</tr>
		<tr>
			<th>단가</th>
			<td><input type="number" name="goods_price"></td>
		</tr>
		<tr>
			<th>원가</th>
			<td><input type="number" name="cost"></td>
		</tr>
		<tr>
			<th>판매일자(자동발생)</th>
			<td><input type="text" name="in_date" value="<%=today%>" readonly="readonly"></td>
		</tr>
		<tr>
			<td colspan="2" class="tbl_footer"><input type="submit" value="저장"><input type="button" onclick="history.back()" value="상품목록"></td>
		</tr>
	</table>
	</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</div>
<script type="text/javascript" src="./js/validate.js"></script>
</body>
</html>

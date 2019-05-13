<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="DBConn.jsp" %>
<%@page import="java.text.*,java.util.*" %>
<%
query=" select lpad(last_number, 4, '0') from user_sequences where sequence_name = 'SALE_SEQ'";
pstmt=conn.prepareStatement(query);
//System.out.println(query);
res = pstmt.executeQuery();
res.next();
String no = res.getString(1)==null?"0001":res.getString(1);
SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
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
<form action="action.jsp" onsubmit="return validate()"  name="joinfr">
<input value="insert" type="hidden" name="action">
<table border="1" class="tbl_comm">
	<tr>
		<th>판매번호(자동발생)</th>
		<td><input value="<%=no %>" readonly="readonly" name="sale_no"></td>
	</tr>
	<tr>
		<th>판매일자(자동발생)</th>
		<td><input value="<%=today%>" readonly="readonly" name="sale_ymd"></td>
	</tr>
	<tr>
		<th>판매구분</th>
		<td>
		<select name="sale_fg">
			<option value="">선택</option>
			<option value="1">판매</option>
			<option value="2">판매취소</option>
		</select>
		</td>
	</tr>
	<%
		query = "SELECT a.store_cd, b.store_nm from sale_tbl_003 a, store_tbl_003 b where a.store_cd=b.store_cd group by a.store_cd, b.store_nm order by store_cd asc";
		pstmt = conn.prepareStatement(query);
		res = pstmt.executeQuery();
		%>
	
	<tr>
		<th>판매점포</th>
		<td>
		<select name="store_cd">
			<option value="">선택</option>
			<% while(res.next()){ %>
			<option value="<%=res.getString("store_cd")%>"><%=res.getString("store_nm") %></option>
			<%}res.close();%>
		</select>
		</td>
	</tr>
		<%
		query = "SELECT a.goods_cd, b.goods_nm from sale_tbl_003 a, goods_tbl_003 b where a.goods_cd=b.goods_cd group by a.goods_cd, b.goods_nm order by a.goods_cd asc";
		pstmt = conn.prepareStatement(query);
		res = pstmt.executeQuery();
		%>
	<tr>
		<th>판매상품</th>
		<td>
		<select name="goods_cd">
			<option value="">선택</option>
			<% while(res.next()){
			%>
			<option value=<%=res.getString("goods_cd")%>><%=res.getString("goods_nm") %></option>
			<%}res.close(); %>
		</select>
		</td>
	</tr>
	<tr>
		<th>판매량</th>
		<td><input type="number" name="sale_cnt"></td>
	</tr>
	<tr>
			<th>수취구분</th>
			<td>
			<select name ="pay_type">
				<option value="">선택</option>
				<option value="01">현금</option>
				<option value="02">카드</option>
			</select>
			</td>
	</tr>
	<tr class="tb_footer">
		<td colspan="2"><input value="등록" type="submit"><input value="조회" type="button" onclick="history.back()"></td>
	</tr>
</table>
</form>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</div>
<script type="text/javascript" src="./js/index.js"></script>
</body>
</html>
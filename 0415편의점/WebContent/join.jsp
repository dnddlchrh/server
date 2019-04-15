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

query = "SELECT sale_no from sale_tbl_003 where rownum >= 1 order by sale_no desc";
int sale_no = 0;
pstmt=conn.prepareStatement(query);
res=pstmt.executeQuery();
while(res.next()) sale_no = sale_no+1;
System.out.println(sale_no);
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");
String today = formatter.format(new java.util.Date());
%>
<jsp:include page="nav.jsp"></jsp:include>
<div class="section">
<div class="tit_comm">매출 등록</div>
<form action="action.jsp" method="post" name="joinfr" onsubmit="return validate()">
<input type="hidden" value="insert" name="action">
	<table border="1" class="table_comm" >
		<tr>
			<th width="300px;">판매번호(자동발생)</th>
			<td width="300px;"><input value="<%=sale_no%>" name="sale_no"></td>
		</tr>
		<tr>
			<th>판매일자(자동발생)</th>
			<td><input value="<%=today %>" name="sale_ymd"></td>
		</tr>
		<tr>
			<th>판매구분</th>
			<td><select name ="sale_fg">
			<option value="">선택</option>
			<option value="1">판매</option>
			<option value="2">판매취소</option>
			</select></td>
		</tr>
		<tr>
		<%
		query = "SELECT a.store_cd, b.store_nm from sale_tbl_003 a, store_tbl_003 b where a.store_cd=b.store_cd";
		pstmt = conn.prepareStatement(query);
		res = pstmt.executeQuery();
		%>
			<th>판매점포</th>
			<td><select name ="store_cd">
			<option value="">선택</option>
			<% while(res.next()){ %>
			<option value="<%=res.getString("store_cd")%>"><%=res.getString("store_nm") %></option>
			<%}%>
			</select></td>
		</tr>
		<tr>
		<%
		query = "SELECT a.goods_cd, b.goods_nm from sale_tbl_003 a, goods_tbl_003 b where a.goods_cd=b.goods_cd";
		pstmt = conn.prepareStatement(query);
		res = pstmt.executeQuery();
		%>
			<th>판매상품</th>
			<td><select name ="goods_cd">
			<option value="">선택</option>
			<% while(res.next()){
			%>
			<option value=<%=res.getString("goods_cd")%>><%=res.getString("goods_nm") %></option>
			<%} %>
			</select></td>
		</tr>
		<tr>
			<th>판매수량</th>
			<td><input type="text" name="sale_cnt"></td>
		</tr>
		<tr>
			<th>수취구분</th>
			<td><select name ="pay_type">
			<option value="">선택</option>
			<option value="1">현금</option>
			<option value="2">카드</option>
			</select></td>
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
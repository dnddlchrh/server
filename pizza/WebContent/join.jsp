<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
</head>
<body>
<div class="wrap">
<%@include file="header.jsp" %>
<%
query = "SELECT sale_no from sale_tbl_001 where rownum <= 1 order by sale_no desc";
int sale_no = 1;
pstmt = conn.prepareStatement(query);
res = pstmt.executeQuery();
if (res.next()) sale_no = res.getInt(1)+1;
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");
String today = formatter.format(new java.util.Date());
query = "SELECT  pizza_cd, pizza_nm from pizza_tbl_002";
pstmt = conn.prepareStatement(query);
res = pstmt.executeQuery();
%>
<div class="section">
<div class="tit_comm">매출전표등록</div>
<form action="action.jsp" name="join_fr" class="content" onsubmit="return validate()" method="post">
	<table class = "table_comm2" border="1">
		<tr>
			<th class="th_comm">매출전표번호</th>
			<td class="td_comm"><input name="chit_num" class="input_comm" value="<%= sale_no %>"></td>
		</tr>
		<tr>
			<th class="th_comm">지점코드</th>
			<td class="td_comm"><input name="sale_store_cd" class="input_comm"></td>
		</tr>
		<tr>
			<th class="th_comm">판매일자</th>
			<td class="td_comm"><input name="sale_ymd" value="<%=today %>"></td>
		</tr>
		<tr>
			<th class="th_comm">피자코드</th>
			<td>
				<select name="sale_pizza_cd" id="pizzacode">
					<option value="">피자선택</option>
					<% while(res.next()){ %>
					<option value="<%=res.getString(1)%>">[<%=res.getString(1) %>]<%=res.getString(2) %></option>
					<%} %>
				</select>
			</td>
		</tr>
		<tr>
			<th class="th_comm">판매수량</th>
			<td class="td_comm"><input name="sale_cnt" class="input_comm"></td>
		</tr>
		<tr class="table_footer_comm" >
			<td colspan="2">
			<input type="submit" value="전표등록">
			<input type="reset" value="다시쓰기">
			</td>
		</tr>
	</table>
</form>
</div>
<%@include file="footer.jsp" %>
</div>
<script type="text/javascript" src="./js/join.js"></script>
</body>
</html>
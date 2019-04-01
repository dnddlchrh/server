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
			<td class="td_comm"><input name="code" class="input_comm"></td>
		</tr>
		<tr>
			<th class="th_comm">판매일자</th>
			<td class="td_comm"><input name="saledaete" value="<%=today %>"></td>
		</tr>
		<tr>
			<th class="th_comm">피자코드</th>
			<td>
				<select name="pizzacode" id="pizzacode">
					<option value="">피자선택</option>
					<option value="A0001">[A0001]쉬림프올인</option>
					<option value="A0002">[A0002]스테이크올인</option>
					<option value="A0003">[A0003]갈릭마블스테이크</option>
					<option value="A0004">[A0004]갈릭버터쉬림프</option>
					<option value="A0005">[A0005]더블갈릭스테이크</option>
					<option value="A0006">[A0006]큐브스테이크</option>
					<option value="A0007">[A0007]토핑킹</option>
					<option value="A0008">[A0008]치즈킹</option>
				</select>
			</td>
		</tr>
		<tr>
			<th class="th_comm">판매수량</th>
			<td class="td_comm"><input name="sales_rate" class="input_comm"></td>
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
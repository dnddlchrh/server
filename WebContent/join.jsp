<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="DBconn.jsp" %>
<%@page import="java.text.*,java.util.Date" %>
<%
query="select lpad(last_number, 4, '0') from user_sequences where sequence_name = 'SALE_SEQ'";
pstmt=conn.prepareStatement(query);
res=pstmt.executeQuery(); 
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
<section>
	<form action="action.jsp" method="post" name="join" onsubmit="return validate();">
	<input type="hidden" name="action" value="insert">
	<div class="tit_comm">매출 등록</div>
	<table border="1">
		<tr>
			<th>판매번호(자동발생)</th>
			<td><input type="text" name="sale_no" value="<%=no%>" readonly="readonly"></td>
		</tr>
		<tr>
			<th>판매일자(자동발생)</th>
			<td><input type="text" name="sale_ymd" value="<%=today%>" readonly="readonly"></td>
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
		<tr>
			<th>판매점포</th>
			<td>
			<%
				query ="SELECT a.store_cd, b.store_nm from sale_tbl_003 a, store_tbl_003 b where a.store_cd=b.store_cd";
				pstmt=conn.prepareStatement(query);
				res=pstmt.executeQuery(); 
			%>
				<select name="store_cd">
					<option value="">선택</option>
					<%while(res.next()){ %>
					<option value="<%=res.getString(1)%>"><%=res.getString(2)%></option>
					<%}res.close(); %>
				</select>
			</td>
		</tr>
		<tr>
			<th>판매상품</th>
			<td>
			<%
				query ="SELECT goods_cd, goods_nm from goods_tbl_003";
				pstmt=conn.prepareStatement(query);
				res=pstmt.executeQuery(); 
			%>
				<select name="goods_cd">
					<option value="">선택</option>
					<%while(res.next()){ %>
					<option value="<%=res.getString(1)%>"><%=res.getString(2)%></option>
					<%}res.close(); %>
				</select>
			</td>
		</tr>
		<tr>
			<th>판매수량</th>
			<td><input type="number" name="sale_cnt"></td>
		</tr>
		<tr>
			<th>수취구분</th>
			<td>
			<select name="pay_type">
					<option value="">선택</option>
					<option value="01">현금</option>
					<option value="02">카드</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2" class="tbl_footer"><input type="submit" value="등록"><input type="button" onclick="history.back()" value="조회"></td>
		</tr>
	</table>
	</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</div>
<script type="text/javascript" src="./js/validate.js"></script>
</body>
</html>

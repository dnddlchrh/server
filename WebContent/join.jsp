<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="DBConn.jsp" %>
<%
	query = "select hcode,hname from tbl_hamburger_01";
	pstmt = conn.prepareStatement(query);
	res = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="./js/index.js"></script>
</head>
<body>
<div class="wrap">
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<section>
<div class="sec_tit">
</div>
<form action="insert.jsp" method="post"  name="sform" onsubmit="return validate();">
	<table border="1">
		<tr>
			<th colspan="2">매출전표등록</th>
		</tr>
		<tr>
			<td>매출전표번호</td>
			<td><input name="saleno"></td>
		</tr>
		<tr>
			<td>지점코드</td>
			<td><input name="scode"></td>
		</tr>
		<tr>
			<td>판매일자</td>
			<td><input name="saledate"></td>
		</tr>
		<tr>
			<td>햄버거코드</td>
			<td>
				<select name="hcode">
					<option value="">피자선택</option>
					<%while(res.next()){ %>
					<option value="<%=res.getString(1)%>">[<%=res.getString(1) %>]<%=res.getString(2) %></option>
					<%}res.close(); %>
				</select>
			</td>
		</tr>
		<tr>
			<td>판매수량</td>
			<td><input name="amount"></td>
		</tr>
		<tr>
			<td colspan="2" class="center" >
				<input type="submit" value="전표등록">
				<input type="reset" value="다시쓰기" onclick="alert('다시 입력 합니다!')">
			</td>
		</tr>
	</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="DBConn.jsp" %>
<%@page import="java.text.*,java.util.*"%>
<%
int no=1;
query ="select count(saleno) from TBL_SALELIST_01 where rownum>=1";
pstmt = conn.prepareStatement(query);
res = pstmt.executeQuery();
if(res.next())no=res.getInt(1)+100000+1;
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
String today = formatter.format(new java.util.Date());
query ="select pcode,pname from TBL_PIZZA_01 order by pcode asc";
pstmt = conn.prepareStatement(query);
res = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출전표등록</title>
</head>
<body>
<div class="wrap">
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<div class="section">
<div class="sec_tit"></div>
<form action="action.jsp" method="post" name="fr" onsubmit="return validate()">
<input type="hidden" value="insert" name="action">
<table border="1">
<tr>
	<th>매출전표번호</th>
	<td><input type="text" name="saleno" readonly="readonly" value="<%=no%>"></td>
</tr>
<tr>
	<th>지점코드</th>
	<td><input type="text" name="scode"></td>
</tr>
<tr>
	<th>판매일자</th>
	<td><input type="text" name="saledate" value="<%=today%>" readonly="readonly"></td>
</tr>
<tr>
	<th>피자코드</th>
	<td>
		<select name="pcode">
			<option value="">피자선택</option>
		<%while(res.next()){ %>
			<option value="<%=res.getString(1)%>">[<%=res.getString(1)%>]<%=res.getString(2)%></option>
			<%}res.close(); %>
		</select>
	</td>
</tr>
<tr>
	<th>판매수량</th>
	<td><input type="text" name="amount"></td>
</tr>
<tr>
<td colspan="2" class="tbl_footer"><input type="submit" value="전표등록"><button type="reset">다시쓰기</button></td>
</tr>
</table>
</form>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</div>
<script type="text/javascript" src="./index.js"></script>
</body>
</html>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="DBConn.jsp" %>
<%@page import="java.text.*,java.util.*" %>
<%
query="select count(sale_no)+100001 from tbl_salelist_01 where rownum >=1";
pstmt=conn.prepareStatement(query);
//System.out.println(query);
res = pstmt.executeQuery();
res.next();
String no = res.getString(1)==null?"100001":res.getString(1);
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
<form action="action.jsp"   name="joinfr">
<input value="insert" type="hidden" name="action">
<table border="1" class="tbl_comm">
	<tr>
		<th>비번호</th>
		<td><input value="<%=no %>" name="sale_no" class="date" onkeydown="keypress(this)"></td>
	</tr>
	<tr>
		<th>판매날짜</th>
		<td><input name="pcode" ></td>
	</tr>
	<tr>
		<th>판매날짜</th>
		<td><input value="<%=today%>" name="sale_ymd" class="date" onkeydown="keypress1(this)"></td>
	</tr>
	<tr>
		<th>매장코드</th>
		<td><input name="scode" ></td>
	</tr>
	<tr>
		<th>판매수량</th>
		<td><input name="amount" ></td>
	</tr>
	<tr class="tb_footer">
		<td colspan="2"><input value="등록" type="submit"><input value="다시쓰기" type="reset"></td>
	</tr>
</table>
</form>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</div>
<script type="text/javascript" src="./js/index.js"></script>
</body>
</html>
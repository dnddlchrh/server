<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="DBConn.jsp" %>
<%@page import="java.text.*,java.util.*" %>
<%
query="Select a.pcode,a.name,to_char(sum(a.cost*b.amount),'999,999,999,999') from tbl_product_01 a,tbl_salelist_01 b where b.pcode=a.pcode group by a.pcode,a.name order by a.pcode asc";
pstmt=conn.prepareStatement(query);
//System.out.println(query);
res = pstmt.executeQuery();

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
<form action="action.jsp" >
<table class="tbl_comm" border="1">
	<tr>
		<th>상품코드</th>
		<th>상품명</th>
		<th>상품별 판매액</th>
	</tr>
	<%while(res.next()){ %>
	<tr>
		<td class="td_comm"><%=res.getString(1) %></td>
		<td><%=res.getString(2) %></td>
		<td class="money_txt"><%=res.getString(3) %></td>
	</tr>
	<%} res.close();%>
</table>
</form>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</div>
<script type="text/javascript" src="./js/index.js"></script>
</body>
</html>
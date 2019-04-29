<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="DBConn.jsp" %>
<%
query="Select goods_cd,goods_nm,to_char(goods_price,'L999,999'),to_char(cost ,'L999,999'),to_char(in_date,'yyyy-MM-dd')  from goods_tbl_003";
pstmt=conn.prepareStatement(query);
res = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<div class="wrap">
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<div class="section">
	<h2 class="sec_tit">상품관리</h2>
<table class="tbl_comm" border="1">
<colgroup>
	<col>
	<col>
	<col width="120px">
	<col width="220px">
	<col>
</colgroup>
	<tr>
		<th>상품코드</th>
		<th>상품명</th>
		<th>단가</th>
		<th>원가</th>
		<th>입고일자</th>
	</tr>
	<%while(res.next()){ %>
	<tr>
		<td class="td_comm"><a class = "blue" href="update.jsp?target='<%=res.getString(1) %>'"><%=res.getString(1) %></a></td>
		<td class="td_comm"><%=res.getString(2) %></td>
		<td class="money_txt"><%=res.getString(3) %></td>
		<td class="money_txt"><%=res.getString(4) %></td>
		<td class="td_comm"><%=res.getString(5) %></td>
	</tr>
	<%} %>
	<tr>
		<th colspan="5"><a href="joinobject.jsp" class="black"><button>등록</button></a></th>
	</tr>
</table>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>
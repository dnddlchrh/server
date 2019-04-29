<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="DBConn.jsp" %>
<%
query="Select menu_cd,menu_nm,price||'원',menu_fg  from menu_tbl_007 order by menu_cd asc";
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
	<col width="20%;">
	<col width="40%;">
	<col width="30%;">
	<col width="10%;">
</colgroup>
	<tr>
		<th>메뉴코드</th>
		<th>메뉴명</th>
		<th>메뉴가격</th>
		<th>메뉴구분</th>
	</tr>
	<%
	String pay_type="";
	while(res.next()){
				switch(res.getString(4)){
				case "0":pay_type="커피";break;
				case "1":pay_type="티";break;
				}
		
		%>
	<tr>
		<td class="td_comm"><a class = "blue" href="update.jsp?target=<%=res.getString(1) %>"><%=res.getString(1) %></a></td>
		<td class="td_comm"><%=res.getString(2) %></td>
		<td class="money_txt"><%=res.getString(3) %></td>
		<td class="td_comm"><%=pay_type %></td>
	</tr>
	<%}res.close(); %>
	<tr>
		<th colspan="5"><a href="menujoin.jsp" class="black"><button>등록</button></a></th>
	</tr>
</table>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>
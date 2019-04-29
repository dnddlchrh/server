<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="DBConn.jsp" %>
<%
query="select";
query+=" a.sale_ymd,";
query+=" a.sale_no,";
query+=" b.store_nm,";
query+=" c.menu_nm,";
query+=" d.size_nm,";
query+=" a.sale_cnt,";
query+=" (price+plus_price)*sale_cnt||'원' as price,";
query+=" a.pay_type";//a.sale_fg 
query+=" from";
query+=" sale_tbl_003 a, store_tbl_007 b,menu_tbl_007 c, size_tbl_007 d";
query+=" where";
query+=" a.store_cd = b.store_cd";
query+=" and";
query+=" a.menu_cd = c.menu_cd";
query+=" and";
query+=" a.size_cd = d.size_cd";
query+=" order by a.sale_no asc";
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
	<col>
	<col>
	<col>
	<col>
	<col>
	<col>//<col>
</colgroup>
	<tr>
		<th>판매일자</th>
		<th>판매번호</th>
		<th>판매메뉴</th>
		<th>점포명</th>
		<th>사이즈</th>
		<th>판매수량</th>
		<th>판매금액</th>
		<th>수취구분</th>
		//<th>판매구분</th>
	</tr>
	<%
	String pay_type="";
	//String ok="";
	while(res.next()){
				switch(res.getString(8)){
				case "01":pay_type="카드";break;
				case "02":pay_type="현금";break;
				}
			/*switch(res.getString(9)){
				case "01":ok="판매";break;
				case "02":ok="취소";break;
				}*/
		
		%>
	<tr>
		<td class="td_comm"><%=res.getString(1) %></td>
		<td class="td_comm"><%=res.getString(2) %></td>
		<td class="td_comm"><%=res.getString(3) %></td>
		<td class="td_comm"><%=res.getString(4) %></td>
		<td class="td_comm"><%=res.getString(5) %></td>
		<td class="td_comm"><%=res.getString(6) %></td>
		<td class="money_txt"><%=res.getString(7) %></td>
		<td class="td_comm"><%=pay_type %></td>
		//<td class="td_comm"><%=ok %></td>
	</tr>
	<%}res.close();
	
	%>
</table>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</div>

</body>
</html>
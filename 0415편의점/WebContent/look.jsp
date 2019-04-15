<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="DBConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%
String target = request.getParameter("target");
query ="select ";
query += " b.sale_fg, lpad(b.sale_no, 4, '0'),to_char(b.sale_ymd,'yyyy-mm-dd') ,c.goods_nm, b.sale_cnt,(b.sale_cnt*c.goods_price) as price,b.pay_type";
query += " from";
query += " store_tbl_003 a, sale_tbl_003 b,goods_tbl_003 c";
query += " where";
query +=" store_nm = '"+target+"' and a.store_cd=b.store_cd and b.goods_cd = c.goods_cd";
System.out.println(query);
pstmt=conn.prepareStatement(query);
res=pstmt.executeQuery();

%>
<div class="section">
<table class="table_comm" border="1">
		<tr>
			<th>판매구분</th>
			<th>판매번호</th>
			<th>판매일자</th>
			<th>상품명</th>
			<th>판매수량</th>
			<th>판매금액</th>
			<th>수취구분</th>
		</tr>
		<%
			while(res.next()){
				String sale_fg="";
				String pay_type="";
				switch(res.getString("sale_fg")){
				case "1" : sale_fg="판매";break;
				case "2" : sale_fg="판매취소";break;
				}
				switch(res.getString("pay_type")){
				case "01" : pay_type="현금";break;
				case "02" : pay_type="카드";break;
				}
		%>
		<tr>
			<td class="td_center"><%=sale_fg %></td>
			<td class="td_center"><%=res.getString(2) %></td>
			<td class="td_center"><%=res.getString(3) %></td>
			<td class="td_center"><%=res.getString("goods_nm") %></td>
			<td class="td_center"><%=res.getString("sale_cnt") %></td>
			<td class="td_right"><%=res.getString("price") %>원</td>
			<td class="td_center"><%=pay_type%></td>
		</tr>
		<%} %>
	</table>
</div>
<jsp:include page="nav.jsp"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
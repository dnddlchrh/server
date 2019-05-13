<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="DBConn.jsp" %>
<%
query="Select ";
query+=" b.store_nm,";
query+=" c.pay_type,";
query+=" sum(CASE when c.pay_type ='01' then c.sale_cnt*a.goods_price else 0 end )||'원' as cash,";
query+=" sum(CASE when c.pay_type ='02' then c.sale_cnt*a.goods_price else 0 end )||'원' as card,";
query+=" sum(c.sale_cnt*a.goods_price)||'원' as allprice";
query+=" from";
query+=" goods_tbl_003 a,";
query+=" store_tbl_003 b,";
query+=" sale_tbl_003 c";
query+=" where";
query+=" a.goods_cd=c.goods_cd";
query+=" and";
query+=" b.store_cd=c.store_cd";
query+=" group by b.store_nm,c.pay_type";
query+=" order by allprice desc";

/* query = "select * from view_001"; */

System.out.println(query);
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
	<tr>
		<th>점표명</th>
		<th>현금매출</th>
		<th>카드매출</th>
		<th>총매출</th>
	</tr>
	<%while(res.next()){ %>
	<tr>
		<td class="td_comm"><a href="look.jsp?target=<%=res.getString(1) %>" class="black"><%=res.getString(1) %></a></td>
		<td class="money_txt"><%=res.getString(3) %></td>
		<td class="money_txt"><%=res.getString(4) %></td>
		<td class="money_txt"><%=res.getString(5) %></td>
		<%-- <td class="money_txt"><%=res.getString(3)+res.getString(4) %></td> --%>
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
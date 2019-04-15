<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@include file="DBConn.jsp" %>
        <%
        query="SELECT * from goods_tbl_003";
        pstmt=conn.prepareStatement(query);
        res=pstmt.executeQuery(); %>
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
<div class="tit_comm">상품관리</div>
<table class="table_comm" border="1" ">
	<tr>
		<th width="80px">상품코드</th>
		<th>상품명</th>
		<th width="120px;">단가</th>
		<th width="200px;">원가</th>
		<th>입고일자</th>
	</tr>
	<%while(res.next()){ %>
	<tr>
		<td  style="text-align: center;"><a href="modify.jsp?target=<%=res.getString("goods_cd")%>" style="color:blue;"><%=res.getString("goods_cd") %></a></td>
		<td  style="text-align: center;"><%=res.getString("goods_nm") %></td>
		<td  style="text-align: right;">₩ <%=res.getString("goods_price") %></td>
		<td  style="text-align: right;">₩ <%=res.getString("cost") %></td>
		<td  style="text-align: center;"><%=res.getString("in_date") %></td>
	</tr>
	<%} %>
	<tr><td colspan="5" style="text-align: center;"><input type="button" value="등록" onclick="location.replace('joinobject.jsp')"></td></tr>
</table>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>
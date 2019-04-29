<%@ include file="DBConn.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
String action = request.getParameter("action");
String move_url = "./";
String s1 ="";
table = "";
switch(action){
	case "insert":
		table = "sale_tbl_003";
		query = "INSERT INTO "+table+" values(sale_seq.nextval,SYSDATE, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(query);
        pstmt.setString(1, request.getParameter("sale_fg"));
        pstmt.setString(2, request.getParameter("store_cd"));
        pstmt.setString(3, request.getParameter("goods_cd"));
        pstmt.setString(4, request.getParameter("sale_cnt"));
        pstmt.setString(5, request.getParameter("pay_type"));
        s1 = "매출이 정상적으로";
		break;
	case "insert_object":
		table = "goods_tbl_003";
		query = "INSERT INTO "+table+" values(goods_seq.nextval, ?, ?, ?, SYSDATE)";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, request.getParameter("goods_nm"));
        pstmt.setString(2, request.getParameter("goods_price"));
        pstmt.setString(3, request.getParameter("cost"));

        s1 = "상품이 정상적으로";
		break;
	case "update":
		table = "goods_tbl_003";
        query  = "update "+table+" SET goods_nm = ?, goods_price = ?, cost = ? where goods_cd = ?";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, request.getParameter("goods_nm"));
        pstmt.setString(2, request.getParameter("goods_price"));
        pstmt.setString(3, request.getParameter("cost"));
        pstmt.setString(4, request.getParameter("goods_cd"));
		s1 = "업데이트가 정상적으로";
		break;
}
System.out.print(query);
System.out.print(query);
res = pstmt.executeQuery();
%>
<script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	alert("<%=s1%> 저장되었습니다");
	location.replace("<%=move_url%>");
</script>
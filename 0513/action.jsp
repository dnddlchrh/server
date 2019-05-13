<%@ include file="DBConn.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
String action = request.getParameter("action");
String move_url = "./";
String s1 ="";
table = "";
switch(action){
	case "insert":
		table = "tbl_salelist_01";
		query = "INSERT INTO "+table+" values(?, ?,SYSDATE, ?, ?)";
		pstmt = conn.prepareStatement(query);
        pstmt.setString(1, request.getParameter("sale_no"));
        pstmt.setString(2, request.getParameter("pcode"));
        pstmt.setString(3, request.getParameter("scode"));
        pstmt.setString(4, request.getParameter("amount"));
        s1 = "매출이 정상적으로";
        System.out.println(request.getParameter("pcode"));
		break;
}
System.out.println(query);
res = pstmt.executeQuery();
%>
<script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	alert("<%=s1%> 저장되었습니다");
	location.replace("<%=move_url%>");
</script>
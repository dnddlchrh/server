    <%@page import="org.omg.PortableInterceptor.SYSTEM_EXCEPTION"%>
<%@ include file="DBConn.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
String action = request.getParameter("action");
String move_url = "./";
String s1 ="";
table = "";
switch(action){
	case "insert":
		table = "TBL_SALELIST_01";
		query = "INSERT INTO "+table+" values(?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, request.getParameter("saleno"));
        pstmt.setString(2, request.getParameter("scode"));
        pstmt.setString(3, request.getParameter("saledate"));
        pstmt.setString(4, request.getParameter("pcode"));
        pstmt.setString(5, request.getParameter("amount"));
        s1 = "매출전표가";
        System.out.println(request.getParameter("saleno"));
        System.out.println(request.getParameter("scode"));
        System.out.println(request.getParameter("saledate"));
        System.out.println(request.getParameter("pcode"));
        System.out.println(request.getParameter("amount"));
        System.out.println(query);
		break;
}
res = pstmt.executeQuery();
%>
<script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	alert("<%=s1%> 저장되었습니다");
	location.replace("<%=move_url%>");
</script>
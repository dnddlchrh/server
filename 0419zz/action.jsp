    <%@ include file="DBConn.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
String action = request.getParameter("action");
String move_url = "./";
String s1 ="";
table = "";
System.out.println(action);
switch(action){
	case "insert_mem":
		table = "member_tbl_005";
		query = "INSERT INTO "+table+" values(?, ?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, request.getParameter("cust_no"));
        pstmt.setString(2, request.getParameter("cust_nm"));
        pstmt.setString(3, request.getParameter("phone"));
        pstmt.setString(4, request.getParameter("address"));
        pstmt.setString(5, request.getParameter("join_date"));
        pstmt.setString(6, request.getParameter("point"));
        pstmt.setString(7, request.getParameter("join_route"));
        s1 = "멤버가";
        
        System.out.println(query);
		break;
	case "insert_res":
		table = "reserve_tbl_005";
}

res = pstmt.executeQuery();
%>
<script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	alert("<%=s1%> 저장되었습니다");
	location.replace("<%=move_url%>");
</script>
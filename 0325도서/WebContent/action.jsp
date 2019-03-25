<%@ include file="DBconn.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
String action = request.getParameter("action");
String move_url = "./";
String s1 ="";
table = "member_tbl_001";
switch(action){
	case "insert":
		query = "INSERT INTO "+table+" values(member_seq.nextval, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, request.getParameter("cust_name"));
        pstmt.setString(2, request.getParameter("phone"));
        pstmt.setString(3, request.getParameter("address"));
        pstmt.setString(4, request.getParameter("join_date"));
        pstmt.setString(5, request.getParameter("stat_fg"));
        s1 = "삽입";
		break;
	case "update":
        query  = "update "+table+" SET cust_name = ?, phone = ?, address = ?, join_date = ?, stat_fg = ? where cust_no = ?";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, request.getParameter("cust_name"));
        pstmt.setString(2, request.getParameter("phone"));
        pstmt.setString(3, request.getParameter("address"));
        pstmt.setString(4, request.getParameter("join_date"));
        pstmt.setString(5, request.getParameter("stat_fg"));
        pstmt.setString(6, request.getParameter("cust_no"));
	System.out.print(request.getParameter("cust_no"));
		s1 = "업데이트";
		move_url = "./cust.jsp";
		break;
}
System.out.print(query);
res = pstmt.executeQuery();
%>
<script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	alert("<%=s1%> 완료되었습니다");
	location.replace("<%=move_url%>");
</script>
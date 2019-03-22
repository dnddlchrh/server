<%@ include file="DBconn.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
String action = request.getParameter("action");
String move_url = "./";
table = "member_tbl_02";
switch(action){
	case "insert":
		query = "INSERT INTO "+table+" values(member_seq.nextval, ?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, request.getParameter("custname"));
        pstmt.setString(2, request.getParameter("phone"));
        pstmt.setString(3, request.getParameter("address"));
        pstmt.setString(4, request.getParameter("joindate"));
        pstmt.setString(5, request.getParameter("grade"));
        pstmt.setString(6, request.getParameter("city"));
		break;
	case "update":
        query  = "update "+table+" SET custname = ?, phone = ?, address = ?, joindate = ?, grade = ?, city = ? where custno = ?";
        pstmt = conn.prepareStatement(query);
		pstmt.setString(1, request.getParameter("custname"));
		pstmt.setString(2, request.getParameter("phone"));
		pstmt.setString(3, request.getParameter("address"));
		pstmt.setString(4, request.getParameter("joindate"));
		pstmt.setString(5, request.getParameter("grade"));
		pstmt.setString(6, request.getParameter("city"));
		pstmt.setString(7, request.getParameter("custno"));
	System.out.print(request.getParameter("custno"));
		move_url = "./member.jsp";
		break;

}
System.out.print(query);

res = pstmt.executeQuery();

%>
<script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	alert("완료되었습니다");
	location.replace("<%=move_url%>");
</script>
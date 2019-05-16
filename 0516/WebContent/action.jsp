<%@ include file="DBConn.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

String move_url = "./st_select.jsp";
String s1 ="";
table = "score_tbl";

		query = "INSERT INTO "+table+" values(?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, request.getParameter("id"));
        pstmt.setString(2, request.getParameter("korean"));
        pstmt.setString(3, request.getParameter("math"));
        pstmt.setString(4, request.getParameter("english"));
        pstmt.setString(5, request.getParameter("history"));
        s1 = "삽입";
System.out.print(query);
res = pstmt.executeQuery();
%>
<script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	alert("<%=s1%> 완료되었습니다");
	location.replace("<%=move_url%>");
</script>
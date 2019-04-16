<%@ include file="DBConn.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
String action = request.getParameter("action");
String move_url = "./";
String s1 ="";
String grade = request.getParameter("grade");
String cla =request.getParameter("class");
String num =request.getParameter("num");
String st_no =grade+cla+num;
table = "student_tbl_004";
switch(action){
	case "insert":
		
		query = "INSERT INTO "+table+" values(?, ?, ?, ?, ?, ?,(select sysdate from dual),null)";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, st_no);
        pstmt.setString(2, request.getParameter("st_major"));
        pstmt.setString(3, request.getParameter("st_nm"));
        pstmt.setString(4, request.getParameter("st_addr"));
        pstmt.setString(5, request.getParameter("st_phone"));
        pstmt.setString(6, request.getParameter("st_email"));
        System.out.println(query);
        s1 = "삽입";
		break;
	case "update":
        query  = "update "+table+" SET st_major = ?, st_nm = ?, st_addr = ?, st_phone = ? where st_no = ?";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, request.getParameter("st_major"));
        pstmt.setString(2, request.getParameter("st_nm"));
        pstmt.setString(3, request.getParameter("st_addr"));
        pstmt.setString(4, request.getParameter("st_phone"));
        pstmt.setString(5, request.getParameter("st_email"));
        pstmt.setString(6, st_no);
		s1 = "업데이트";
		move_url = "./index.jsp";
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
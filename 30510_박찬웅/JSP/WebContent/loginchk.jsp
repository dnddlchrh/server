<%@ include file="DBconn.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pw= request.getParameter("pw");
String move_url="";
String message="";
query = "select id, pw from user_tb1 where id = '"+id+"' and pw ='"+pw+"'";
pstmt = conn.prepareStatement(query);
res = pstmt.executeQuery();

if(res.next()){
	message = "로그인 성공";
	session.setAttribute("id", id);
	move_url="./index.jsp";
}else{
	message = "로그인 실패";	
	move_url="./login.jsp";
}
%>
<script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	alert("<%=message%> 하였습니다");
	location.replace("<%=move_url%>");
</script>



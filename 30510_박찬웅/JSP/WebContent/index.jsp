<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button onclick="location.replace('tablecreate.jsp')">테이블생성</button>
<button onclick="location.replace('join.jsp')">회원가입</button>
<%

String id = (String)session.getAttribute("id");
session.getAttribute(id);

if(id==null){
%>
<button onclick="location.replace('login.jsp')">로그인</button>
<%}else{ %>
<%=id %>님 환영합니다
<button onclick="location.replace('logout.jsp')">로그아웃</button>
<button onclick="location.replace('user.jsp')">회원정보수정</button>
<%} %>



</body>
</html>
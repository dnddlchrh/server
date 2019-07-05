<%@ include file="DBconn.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
String move_url = "./index.jsp";
table = "user_tb1";
query = "create table "+table+" (";
query +=" id varchar2(30) not null,";
query +=" pw varchar2(16) not null,";
query +=" name varchar2(30),";
query +=" gender varchar2(5),";
query +=" birth date,";
query +=" in_date date,";
query +=" job varchar2(10),";
query +=" primary key(id) ";
query +=")";
System.out.println(query);
pstmt=conn.prepareStatement(query);
res = pstmt.executeQuery();
%>
<script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	alert("테이블이 생성되었습니다");
	location.replace("<%=move_url%>");
</script>
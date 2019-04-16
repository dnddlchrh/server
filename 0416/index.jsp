<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="DBConn.jsp" %>
    <%
    query="select substr(st_no,1,1) as grade,substr(st_no,3,1) as class,substr(st_no,5,1) as num,st_major,st_nm,'' as chk from student_tbl_004";
    pstmt=conn.prepareStatement(query);
    System.out.println(query);
    res=pstmt.executeQuery();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<th>학년</th>
		<th>반</th>
		<th>번호</th>
		<th>전공</th>
		<th>이름</th>
		<th>출석</th>
	</tr>
	<%
	request.setCharacterEncoding("UTF-8");
	String chk="";
	
	
	while(res.next()){
		String grade = res.getString(1);
		String cla =res.getString(2);
		String num =res.getString(3);
		String st_no =grade+0+cla+0+num;
		if(res.getString(6)==null)chk="";
	%>
	<tr>
		<td><%=grade %></td>
		<td><%=cla %></td>
		<td><a href="update.jsp?target=<%=st_no%>"><%=num %></a></td>
		<td><%=res.getString(4) %></td>
		<td><%=res.getString(5) %></td>
		<td><%=chk %></td>
	</tr>
	<%} %>
	<tr style="text-align: center;">
		<td colspan="6"><input type="button" onclick="location.href='join.jsp'" value="학생등록"></td>
	</tr>
</table>
</body>
</html>
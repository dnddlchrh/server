<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@include file="DBConn.jsp" %>
    <%
    query="select substr(st_no,1,1) as grade,substr(st_no,3,1) as class,substr(st_no,5,1) as num,st_major,st_nm,st_addr,st_phone,st_email from student_tbl_004 where st_no = '"+request.getParameter("target")+"'";
    pstmt=conn.prepareStatement(query);
    System.out.println(query);
    res=pstmt.executeQuery();
	res.next();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="action.jsp" method="post">
<input value="update" name="action" type="hidden">
<table border="1">
<tr>
<th colspan="2">학생정보 등록</th>
</tr>
<tr>

	<th>학년</th>
	<td>
	<select name="grade">
	<option value="<%=res.getString(1)%>"><%=res.getString(1) %></option>
		<%for(int i=1;i<=3;i++){ %>
		<option value="<%=i %>"><%=i %></option>
		<%} %>
	</select>
	</td>
</tr>
<tr>
	<th>반</th>
	<td>
	<select name="class">
	<option value="<%=res.getString(2)%>"><%=res.getString(2) %></option>
		<%for(int i=1;i<=7;i++){ %>
		<option value="0<%=i %>0"><%=i %></option>
		<%} %>
	</select>
	</td>
</tr>
<tr>
	<th>번호(자동채번)</th>
	<td><input value="<%=res.getString(3)%>" name="num" type="number" maxlength="1"></td>
</tr>
<tr>
	<th>전공</th>
	<td><input name="st_major" type="text" value="<%=res.getString(4)%>"></td>
</tr>
<tr>
	<th>이름</th>
	<td><input name="st_nm" type="text" value="<%=res.getString(5)%>"></td>
</tr>
<tr>
	<th>주소</th>
	<td><input name="st_addr" type="text" value="<%=res.getString(6)%>"></td>
</tr>
<tr>
	<th>전화번호</th>
	<td><input name="st_phone" type="text" value="<%=res.getString(7)%>"></td>
</tr>
<tr>
	<th>이메일</th>
	<td><input name="st_email" type="email" value="<%=res.getString(8)%>"></td>
</tr>
<tr style="text-align: center;">
<td colspan="2"><input type="submit" value="저장"> <input onclick="location.href='index.jsp'" type="button" value="출석부"></td>
</tr>
</table>
</form>
</body>
</html>
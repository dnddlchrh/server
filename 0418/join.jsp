<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@include file="DBConn.jsp" %>
    <%
    query="select count(st_no) from student_tbl_004 where rownum >=1";
    pstmt=conn.prepareStatement(query);
    int no = 1;
    System.out.println(query);
    res=pstmt.executeQuery();
    if(res.next()) no = res.getInt(1)+1;

    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<form action="action.jsp" method="post">
<input value="insert" name="action" type="hidden">
<table border="1">
<tr>
<th colspan="2">학생정보 등록</th>
</tr>
<tr>
	<th>학년</th>
	<td>
	<select name="grade">
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
		<%for(int i=1;i<=7;i++){ %>
		<option value="0<%=i %>0"><%=i %></option>
		<%} %>
	</select>
	</td>
</tr>
<tr>
	<th>번호(자동채번)</th>
	<td><input value="<%=no%>" name="num" type="number" maxlength="1" readonly="readonly"></td>
</tr>
<tr>
	<th>전공</th>
	<td><input name="st_major" type="text"></td>
</tr>
<tr>
	<th>이름</th>
	<td><input name="st_nm" type="text"></td>
</tr>
<tr>
	<th>주소</th>
	<td><input name="st_addr" type="text"></td>
</tr>
<tr>
	<th>전화번호</th>
	<td><input name="st_phone" type="text"></td>
</tr>
<tr>
	<th>이메일</th>
	<td><input name="st_email" type="email"></td>
</tr>
<tr style="text-align: center;">
<td colspan="2"><input type="submit" value="저장"><input onclick="location.href='index.jsp'" type="button" value="출석부"></td>
</tr>
</table>
</form>
</body>
</html>
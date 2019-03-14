<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/DBConn.jsp" %>
<%
table = "userInfo";
query = "select * from "+table;
pstmt = conn.prepareStatement(query);
res = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<table border="1">
			<tr>
				<th>idx</th>
				<th>id</th>
				<th>password</th>
			</tr>
			<%
				while(res.next()){
					%>
					<tr>
						<td><%=res.getString("idx") %></td>
						<td><%=res.getString("id") %></td>
						<td><%=res.getString("password") %></td>
					</tr>
					<%
				}
			%>
		</table>
	</div>
</body>
</html>
<%@ include file="DBconn.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
String action = request.getParameter("action");
String move_url = "./index.jsp";
String s1 ="";
table = "";
query="select id from user_tb1 where id='"+request.getParameter("id")+"'";
pstmt = conn.prepareStatement(query);
res = pstmt.executeQuery();
if(action.equals("insert")){
	if(!res.next()){
	table = "user_tb1";
	query = "INSERT INTO "+table+" values(?, ?, ?, ?, ?, ?, ?)";
	pstmt = conn.prepareStatement(query);
	pstmt.setString(1, request.getParameter("id"));
    pstmt.setString(2, request.getParameter("pw"));
    pstmt.setString(3, request.getParameter("name"));
    pstmt.setString(4, request.getParameter("gender"));
    pstmt.setString(5, request.getParameter("birth"));
    pstmt.setString(6, request.getParameter("in_date"));
    pstmt.setString(7, request.getParameter("job"));
    s1 = "회원가입이 정상적으로";
	}else{
		%>
		<script>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		alert("id가 중복되었습니다.");
		location.replace("<%=move_url%>");
	</script>
		<%
	}
}else if(action.equals("update")){
	table = "user_tb1";
    query  = "update "+table+" SET pw = ?, name = ?, gender = ?, birth = ?, in_date = ?, job = ? where id = ?";
    pstmt = conn.prepareStatement(query);
    pstmt.setString(1, request.getParameter("pw"));
    pstmt.setString(2, request.getParameter("name"));
    pstmt.setString(3, request.getParameter("gender"));
    pstmt.setString(4, request.getParameter("birth"));
    pstmt.setString(5, request.getParameter("in_date"));
    pstmt.setString(6, request.getParameter("job"));
    pstmt.setString(7, request.getParameter("id"));
	s1 = "업데이트가 정상적으로";
}




System.out.println(request.getParameter("id"));
System.out.println(request.getParameter("pw"));
System.out.println(request.getParameter("name"));
System.out.println(request.getParameter("gender"));
System.out.println(request.getParameter("birth"));
System.out.println(request.getParameter("in_date"));
System.out.println(request.getParameter("job"));
System.out.println(query);
res = pstmt.executeQuery();
%>
<script>
	alert("<%=s1%> 완료되었습니다.");
	location.replace("<%=move_url%>");
</script>
<%@ include file="DBConn.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
String action = request.getParameter("action");
String move_url = "./";
String s1 ="";
table = "";
switch(action){
	case "insert":
		table = "sale_tbl_003";
		query = "INSERT INTO "+table+" values(SYSDATE,lpad(sale_seq.nextval,4,'0'), ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(query);
        pstmt.setString(1, request.getParameter("store_cd"));
        pstmt.setString(2, request.getParameter("menu_cd"));
        pstmt.setString(3, request.getParameter("size_cd"));
        pstmt.setString(4, request.getParameter("sale_cnt"));
        pstmt.setString(5, request.getParameter("pay_type"));
        s1 = "매출이 정상적으로";
		break;
	case "insert_menu":
	table = "menu_tbl_007";
	query = "INSERT INTO "+table+" values(menu_seq.nextval, ?, ?, ?)";
	pstmt = conn.prepareStatement(query);
    pstmt.setString(1, request.getParameter("menu_nm"));
    pstmt.setString(2, request.getParameter("price"));
    pstmt.setString(3, request.getParameter("menu_fg"));
    s1 = "메뉴가 정상적으로";
	break;
	case "update":
		table = "menu_tbl_007";
		query = "update "+table+" set menu_nm = ?,price = ?,menu_fg = ? where menu_cd = ?";
		pstmt = conn.prepareStatement(query);
	    pstmt.setString(1, request.getParameter("menu_nm"));
	    pstmt.setString(2, request.getParameter("price"));
	    pstmt.setString(3, request.getParameter("menu_fg"));
	    pstmt.setString(4, request.getParameter("menu_cd"));
	    s1 = "메뉴 업데이트가";
		break;
}
System.out.print(query);
res = pstmt.executeQuery();
%>
<script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	alert("<%=s1%> 저장되었습니다");
	location.replace("<%=move_url%>");
</script>
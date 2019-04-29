<%@ include file="DBConn.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
String target = request.getParameter("target");
String move_url = "./";
String s1 ="";
table = "sale_tbl_003";
query="select";
query+=" a.sale_ymd,";
query+=" a.sale_no,";
query+=" b.store_nm,";
query+=" c.menu_nm,";
query+=" d.size_nm,";
query+=" a.sale_cnt,";
query+=" (price+plus_price)*sale_cnt||'원' as price,";
query+=" a.pay_type,a.sale_fg";
query+=" from";
query+=" sale_tbl_003 a, store_tbl_007 b,menu_tbl_007 c, size_tbl_007 d";
query+=" where";
query+=" a.store_cd = b.store_cd";
query+=" and";
query+=" a.menu_cd = c.menu_cd";
query+=" and";
query+=" a.size_cd = d.size_cd";
query+=" order by a.sale_no asc";
pstmt=conn.prepareStatement(query);
query = "INSERT INTO "+table+" values(SYSDATE,lpad(sale_seq.nextval,4,'0'), ?, ?, ?, ?, ?)";
pstmt = conn.prepareStatement(query);
pstmt.setString(1, request.getParameter("store_cd"));
pstmt.setString(2, request.getParameter("menu_cd"));
pstmt.setString(3, request.getParameter("size_cd"));
pstmt.setString(4, request.getParameter("sale_cnt"));
pstmt.setString(5, request.getParameter("pay_type"));
pstmt.setString(6, request.getParameter("sale_fg"));
%>
<script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
function button_event(){
	if (confirm("해당매출을 취소하시겠습니까?") == true){    //확인
	    document.form.submit();
	}else{   //취소
	    return;
	}
}
</script>
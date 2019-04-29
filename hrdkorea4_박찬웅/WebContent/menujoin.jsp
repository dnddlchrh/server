<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="DBConn.jsp" %>
<%@page import="java.text.*,java.util.*" %>
<%
query=" select lpad(last_number, 5, '0') from user_sequences where sequence_name = 'MENU_SEQ'";
pstmt=conn.prepareStatement(query);
//System.out.println(query);
res = pstmt.executeQuery();
res.next();
String no = res.getString(1)==null?"10001":res.getString(1);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrap">
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<div class="section">
	<h2 class="sec_tit">메뉴등록</h2>
<form action="action.jsp" onsubmit="return validate()"  name="joinfr">
<input value="insert_menu" type="hidden" name="action">
<table border="1" class="tbl_comm">
<colgroup>
<col width="300px;"><col width="300px;">
</colgroup>
	<tr>
		<th>판매번호(자동발생)</th>
		<td><input value="<%=no %>" readonly="readonly" name="menu_cd" type="text"></td>
	</tr>
	<tr>
		<th>메뉴명</th>
		<td><input name="menu_nm" type="text"></td>
	</tr>
	<tr>
		<th>메뉴가격</th>
		<td><input name="price" type="number"></td>
	</tr>
	<tr>
		<th>메뉴구분</th>
		<td>
		<select name="menu_fg">
			<option value="">선택</option>
			<option value="0">커피</option>
			<option value="1">티</option>
		</select>
		</td>
	</tr>
	<tr class="tb_footer">
		<td colspan="2"><input value="등록" type="submit"><input value="조회" type="button" onclick="history.back()"></td>
	</tr>
</table>
</form>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>
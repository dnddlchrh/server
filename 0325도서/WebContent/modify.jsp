<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="DBconn.jsp" %>
<%
String target = request.getParameter("target");
query = "select cust_no,cust_name,phone,address,stat_fg,to_char(join_date,'yyyy-mm-dd') as join_date from member_tbl_001 where cust_no = "+target;
pstmt = conn.prepareStatement(query);
res = pstmt.executeQuery();
res.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원 정보 수정</title>
</head>
<body>
<div class="wrap">
<jsp:include page="header.jsp"/>
    <div class="section">
        <form action="action.jsp" method="post">
        <input type="hidden" name="action" value="update">
		<div class="tit" >홈쇼핑 회원 정보 수정</div>
	  	<table border="1" class="rent_tb">
			<tr>
				<th class="th_comm">회원번호</th>
				<td class="td_comm"><input type="text" class="input_comm" name="cust_no" value="<%=res.getString("cust_no") %>"></td>
			</tr>
			<tr>
				<th class="th_comm">회원성명</th>
				<td class="td_comm"><input type="text" class="input_comm" name="cust_name" value="<%=res.getString("cust_name") %>"></td>
			</tr>
			<tr>
				<th class="th_comm">핸드폰전화</th>
				<td class="td_comm"><input type="text" name="phone" style="width:180px;" value="<%=res.getString("phone") %>"></td>
			</tr>
			<tr>
				<th class="th_comm">회원주소</th>
				<td class="td_comm"><input type="text" name="address" style="width:220px;" value="<%=res.getString("address") %>"></td>
			</tr>
			<tr>
				<th class="th_comm">가입일자</th>
				<td class="td_comm"><input type="text" class="input_comm" name="join_date" value="<%=res.getString("join_date") %>"></td>
			</tr>
			<tr>
				<th class="th_comm">상태구분</th>
				<td class="td_comm">
				<select name="stat_fg">
					<option value="0">정상</option>
					<option value="1">휴면</option>
					<option value="2">탈퇴</option>
				</select>
				</td>
			</tr>
			<tr>
			<td class="table_footer" colspan="2">
				<input class="btn_comm" value="수정" type="submit"/>
				<input class="btn_comm" value="조회" type="button" onclick="location.href='index.jsp'">
			</td>
			</tr>
		 </table>
        </form>
    </div>
<jsp:include page="footer.jsp"/>
</div>
</body>
</html>
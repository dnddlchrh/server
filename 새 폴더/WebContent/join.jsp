<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="DBConn.jsp" %>
<%@ page import="java.util.*, java.text.*"  %>
<%
String target = request.getParameter("target");
query = "SELECT custno from member_tbl_02 where rownum <= 1 order by custno desc";
int custno = 10001;
pstmt = conn.prepareStatement(query);
res = pstmt.executeQuery();
if (res.next()) custno = res.getInt(1)+1;
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");
String today = formatter.format(new java.util.Date());
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
<jsp:include page="nav.jsp"/>
    <div class="section">
        <form action="action.jsp" method="post" name = "fr">
        <input type="hidden" name="action" value="insert">
		<div class="tit_comm" >홈쇼핑 회원 정보 수정</div>
	  	<table border="1" class="rent_tb">
			<tr>
				<th class="th_comm">회원번호</th>
				<td class="td_comm"><input type="text" class="input_comm" name="custno" value="<%= custno %>"></td>
			</tr>
			<tr>
				<th class="th_comm">회원성명</th>
				<td class="td_comm"><input type="text" class="input_comm" name="custname"></td>
			</tr>
			<tr>
				<th class="th_comm">핸드폰전화</th>
				<td class="td_comm"><input type="text" name="phone" style="width:200px;" ></td>
			</tr>
			<tr>
				<th class="th_comm">회원주소</th>
				<td class="td_comm"><input type="text" name="address" style="width:250px;" ></td>
			</tr>
			<tr>
				<th class="th_comm">가입일자</th>
				<td class="td_comm"><input type="text" class="input_comm" name="joindate" value="<%=today %>"></td>
			</tr>
			<tr>
				<th class="th_comm">고객등급[A:VIP,B:일반,C:직원]</th>
				<td class="td_comm">
				<input type="text" class="input_comm" name="grade" >
				</td>
			</tr>
			<tr>
				<th class="th_comm">도시코드</th>
				<td class="td_comm"><input type="text" class="input_comm" name="city" ></td>
			</tr>
			<tr>
			<td class="table_footer_comm" colspan="2">
				<input class="btn_comm" value="등록" type="submit"/>
				<input class="btn_comm" value="조회" type="button" onclick="location.href='member.jsp'">
			</td>
			</tr>
		 </table>
        </form>
    </div>
<jsp:include page="footer.jsp"/>
</div>
</body>
</html>
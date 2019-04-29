<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h2 class="sec_tit">카페 프렌차이즈 관리 프로그램</h2>
	<p>카페 프렌차이즈 관리를 위한 메뉴, 매장, 매출관리를 위한 데이터베이스를 구축하고 편의점 매출 관리 프로그램을 작성하는 프로그램이다.</p>
	<p>프로그램 작성순서</p>
	<p>1. 메뉴정보 테이블을 생성한다</p>
	<p>2. 매장정보 테이블을 생성한다</p>
	<p>3. 매출정보 테이블을 생성한다</p>
	<p>4. 매출정보 테이블에 제시된 문제지의 참조데이터를 추가 생성한다</p>
	<p>5. 매장등록 프로그램을 작성한다.</p>
	<p>6. 메뉴관리(등록,수저으삭제)프로그램을 작성한다.</p>
	<p>7. 매출현황 조회 프로그램을 작성한다.</p>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>
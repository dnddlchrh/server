<%@ include file="DBconn.jsp" %>
<%
String custno = request.getParameter("custno");
String custname = request.getParameter("custname");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String joindate = request.getParameter("joindate");
String grade = request.getParameter("grade");
String city = request.getParameter("city");
System.out.print(custno);
/* query = "update"+table+"set custno='"+custno+"',custname='"+custname+"',phone='"+phone+"',address='"+address+"',joindate='"+joindate+"',grade='"+grade+"',city='"+city+"';";
pstmt = conn.prepareStatement(query);
response.sendRedirect("member.jsp"); */
%>
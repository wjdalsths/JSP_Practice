<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
String mode = request.getParameter("mode");

String custno = request.getParameter("custno");
String custname = request.getParameter("custname");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String gender = request.getParameter("gender");
try {
	Connection conn = Util.getConnection();
	String sql = "";
	PreparedStatement pstmt = null;

	switch (mode) {
	case "insert":
		sql = "INSERT INTO jeu_member VALUES(?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, custno);
		pstmt.setString(2, custname);
		pstmt.setString(3, phone);
		pstmt.setString(4, address);
		pstmt.setString(5, gender);

		pstmt.executeUpdate();
%>
<jsp:forward page="insert.jsp"></jsp:forward>
<%
		break;
	case "modify":
		sql = "UPDATE jeu_member SET custname=?, phone=?, address=?, gender=? WHERE custno=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, custname);
		pstmt.setString(2, phone);
		pstmt.setString(3, address);
		pstmt.setString(4, gender);
		pstmt.setString(5, custno);

		pstmt.executeUpdate();
%>
<jsp:forward page="modify.jsp"></jsp:forward>
<%
		break;
	case "delete":
		sql = "DELETE FROM jeu_member WHERE custno=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, custno);
		
		pstmt.executeUpdate();
%>
<jsp:forward page="list.jsp"></jsp:forward>
<%
break;
}
} catch (Exception e) {
e.printStackTrace();
}
%>

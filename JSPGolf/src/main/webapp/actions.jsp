<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="DBPKG.Util" %>
<%
request.setCharacterEncoding("UTF-8");

String regist_month = request.getParameter("month");
String c_no = request.getParameter("c_name");
String class_area = request.getParameter("place");
String tuition = request.getParameter("t_price");
String teacher_code = request.getParameter("t_name");
int result = 0;
try{
	
	Connection conn =Util.getConnection();
	/* Statement stmt = conn.createStatement(); */
	String sql = "INSERT INTO TBL_CLASS_202201 VALUES (?,?,?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, regist_month);
	pstmt.setString(2, c_no);
	pstmt.setString(3, class_area);
	pstmt.setInt(4, Integer.parseInt(tuition));
	pstmt.setString(5, teacher_code);
	
	pstmt.executeUpdate();
	
	
	

%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
}

	catch(Exception e){
		e.printStackTrace();
	}	
%>
<jsp:forward page="수강신청.jsp"></jsp:forward>


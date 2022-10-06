<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DBPKG.Util" %>
<%@page import="java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");
String empno = request.getParameter("empno");
try{
	Connection conn = Util.getConnection();
	String sql = "select * from tbl_resv_202108 where empno=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, empno);
	ResultSet rs = pstmt.executeQuery();
	if(rs.next()){
		%>
		<jsp:forward page = "success.jsp"/>
		<%
	}else{
		%>
		<jsp:forward page = "fail.jsp"/>
		<%
	}
	
}catch(Exception e){
	e.printStackTrace();
}
%>
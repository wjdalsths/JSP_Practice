<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*" %>
<%@page import="DBPKG.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

try{
	Connection conn = Util.getConnection();
	String sql="insert into tbl_resv_202108 values(?,?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, request.getParameter("resvno"));
	pstmt.setString(2, request.getParameter("empno"));
	pstmt.setString(3, request.getParameter("resvdate"));
	pstmt.setString(4, request.getParameter("seatno"));
	
	pstmt.executeUpdate();
%>
<jsp:forward page="insert.jsp"/>
<%
}catch(Exception e){
	e.printStackTrace();
}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="DBPKG.Util" %>
<%
request.setCharacterEncoding("UTF-8");
String mode = request.getParameter("mode");
try{
	Connection conn = Util.getConnection();
	String sql="";
	PreparedStatement pstmt = null;
	switch(mode){	
	case "insert":
		sql = "insert into order_tbl values(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("orderno"));
		pstmt.setString(2, request.getParameter("custno"));
		pstmt.setString(3, request.getParameter("custname"));
		pstmt.setString(4, request.getParameter("menuno"));
		pstmt.setString(5, request.getParameter("amount"));
		pstmt.setString(6, request.getParameter("orderdate"));
		pstmt.executeUpdate();
		%>
		<jsp:forward page="orderlist.jsp"></jsp:forward>
		<%
		break;
	case "modify":
		sql = "update order_tbl set custno=?, custname=?, menuno=?, amount=?, orderdate=? where orderno=? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("custno"));
		pstmt.setString(2, request.getParameter("custname"));
		pstmt.setString(3, request.getParameter("menuno"));
		pstmt.setString(4, request.getParameter("amount"));
		pstmt.setString(5, request.getParameter("orderdate"));
		pstmt.setString(6, request.getParameter("orderno"));
		pstmt.executeUpdate();
		%>
		<jsp:forward page="orderlist.jsp"></jsp:forward>
		<%
		break;
	case "delete":
		sql = "delete from order_tbl where orderno=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("orderno"));
		pstmt.executeUpdate();
		%>
		<jsp:forward page="orderlist.jsp"></jsp:forward>
		<%
		break;
	}
}catch(Exception e){
	e.printStackTrace();
}

%>
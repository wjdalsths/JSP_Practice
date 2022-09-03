<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
String mode = request.getParameter("mode");

String movie = request.getParameter("movie");
String moviename = request.getParameter("moviename");
String directorname = request.getParameter("directorname");
String genrename = request.getParameter("genrename");
String joindate = request.getParameter("joindate");
try {
	Connection conn = Util.getConnection();
	String sql = "";
	PreparedStatement pstmt = null;

	switch (mode) {
	case "insert":
		sql = "INSERT INTO movie_tbl_02 VALUES(?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, movie);
		pstmt.setString(2, moviename);
		pstmt.setString(3, directorname);
		pstmt.setString(4, genrename);
		pstmt.setString(5, joindate);

		pstmt.executeUpdate();
%>
<jsp:forward page="join.jsp"></jsp:forward>
<%
		break;
	case "modify":
		sql = "UPDATE movie_tbl_02 SET moviename=?, directorname=?, genrename=?, joindate=? WHERE movie=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, moviename);
		pstmt.setString(2, directorname);
		pstmt.setString(3, genrename);
		pstmt.setString(4, joindate);
		pstmt.setString(5, movie);

		pstmt.executeUpdate();
%>
<jsp:forward page="modify.jsp"></jsp:forward>
<%
		break;
	case "delete":
		sql = "DELETE FROM movie_tbl_02 WHERE movie=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, movie);
		
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

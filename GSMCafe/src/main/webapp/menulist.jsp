<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DBPKG.Util" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menulist</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<section style="position:fixed; width:100%; height: 100%; top:60px;left:0;background: lightgray;">
	<h2 style="text-align: center;">카페 메뉴</h2>
	<form style="display: flex; justify-content: center; text-align: center; align-items: center; ">
	<table border="1" style="border-collapse: collapse;">
	<tr>
		<td>메뉴번호</td>
		<td>메뉴이름</td>
		<td>가격</td>
		<td>칼로리</td>
	</tr>
	<%
	request.setCharacterEncoding("UTF-8");
	try{
	Connection conn = Util.getConnection();
	String sql = "select * from menu_tbl";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
	
	%>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
	</tr>
	<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
	</table>
	</form>
	</section>
	
	<jsp:include page="footer.jsp" />
</body>
</html>
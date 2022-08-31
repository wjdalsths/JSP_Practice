<%@page import="java.sql.*" %>
<%@page import="DBPKG.Util" %>
<%@ page import="java.text.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사조회</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<section style="position: fixed; left:0; top:60px; width:100%; height: 100%; background: lightgray;">
	<h2 style="text-align: center;">강사조회</h2>
	<form style="display:flex; align-item:center; justify-content: center; text-align: center;">
	<table border="1" style="border-collapse: collapse; width:500px;">
	
	<tr style="text-align: center">
		<td>강사코드</td>
		<td>강사명</td>
		<td>강의명</td>
		<td>수강료</td>
		<td>강사자격취득일</td>
	</tr>
	
	<%
	try{
		Connection conn = Util.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "select * from tbl_teacher_202201";
		ResultSet rs = stmt.executeQuery(sql);	
		DecimalFormat def = new DecimalFormat("###,###,###");
		while(rs.next()){
		String date = rs.getString(5);
	%>
	
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td>￦<%=def.format(rs.getInt(4)) %></td>
		<td><%=date.substring(0,4)+"년"+date.substring(4,6)+"월"+date.substring(6,8)+"일" %> </td>
	</tr>
	
	<%
		}
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	%>
	</table>
	</form>
	</section>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util" %>
<%@page import="java.text.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보조회</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<section style="position: fixed; left: 0; top: 60px; width: 100%; height: 100%; background: lightgray;">
	<h2 style="text-align: center;">회원정보조회</h2>
	<form style="display: flex; justify-content: center;">
	<table border="1" style="border-collapse: collapse;  width:500px;">
	<tr style="text-align: center">
		<td>수강월</td>
		<td>회원번호</td>
		<td>회원명</td>
		<td>강의명</td>
		<td>강의장소</td>
		<td>수강료</td>
		<td>등급</td> 
	</tr>
	
	<%
	try{
		Connection conn = Util.getConnection();
		Statement stmt = conn.createStatement();
	 	String sql = "select C.regist_month, C.c_no, M.c_name, T.class_name, C.class_area, C.tuition, M.grade  from tbl_teacher_202201 T, tbl_member_202201 M, tbl_class_202201 C where C.c_no = M.c_no and C.teacher_code = T.teacher_code";
	 	ResultSet rs = stmt.executeQuery(sql);
		DecimalFormat def = new DecimalFormat("###,###");
		while(rs.next()){
		String date = rs.getString(1);
	%>
	
	<tr style="text-align: center">
		<td><%=date.substring(0,4)+"년"+date.substring(4,6)+"월" %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td>￦<%=def.format(rs.getInt(6)) %></td>
		<td><%=rs.getString(7) %></td>
	</tr>
	
	<%
		}
	}
	catch(Exception e){
		e.printStackTrace();
	}
	%>
	</table>
	</form>
	</section>
	
	<jsp:include page="footer.jsp" />
</body>
</html>
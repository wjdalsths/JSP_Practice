<%@include file="db.jsp" %>
<%@page import="java.sql.*" %>
<%@ page import="java.text.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<section style="position:fixed; left:0; top:60px; width:100%; height: 100%; background: lightgray;">
	<h2 style="text-align: center"><b>강사조회</b></h2>
	<form style="display: flex; justify-content: center; align-items: center; text-align: center;">
	<table border="1" style="border-collapse: collapse; width:800px;">
	<tr>
		<td>강사코드</td>
		<td>강사명</td>
		<td>강의명</td>
		<td>수강료</td>
		<td>강사자격취득일</td>
	</tr>
	<%
	request.setCharacterEncoding("UTF-8");
	try{
		String sql = "select * from tbl_teacher_202201 order by teacher_code";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery(); 
		DecimalFormat def = new DecimalFormat("###,###,###");
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd"); 
		while(rs.next()){
			String date = rs.getString(5);/* 
			Date formatDate = sf.parse(date); */
	%>	
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td> 
			<td>\ <%=def.format(rs.getInt(4)) %></td>  
			<td><%=rs.getString(5).substring(0,4) +"년"+ rs.getString(5).substring(4,6) +"월"+ rs.getString(5).substring(6,8)+"일" %></td>  
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
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
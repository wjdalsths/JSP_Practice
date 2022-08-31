<%@page import="javax.print.PrintException"%>
<%@page import="java.sql.*" %>
<%@page import="DBPKG.Util" %>
<%@page import="java.text.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사매출현황</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<section style="position: fixed; left: 0; top: 60px; width:100%; height: 100%; background: lightgray;">
	<h2 style="text-align: center;">강사매출현황</h2>
	<form style="display: flex; justify-content: center;">
	<table border="1" style="border-collapse: collapse; width:500px;"> 
		<tr style="text-align: center">
			<td>강사코드</td>
			<td>강의명</td>
			<td>강사명</td>
			<td>총매출</td>
		</tr>
		
		<%
		try{
			Connection conn = Util.getConnection();
			Statement stmt = conn.createStatement();
			String sql = "select C.teacher_code , T.class_name , T.teacher_name , SUM(C.tuition) from tbl_teacher_202201 T , tbl_class_202201 C where T.teacher_code = C.teacher_code group by C.teacher_code , T.class_name, T.teacher_name order by C.teacher_code";
			/* PreparedStatement pstmt = Util.getConnection().prepareStatement(sql)*/
			ResultSet rs = stmt.executeQuery(sql);
			DecimalFormat def = new DecimalFormat("###,###,###");
			while(rs.next()){
		%>
			<tr style="text-align: center">
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>				
				<td style="text-align:right;"><%=rs.getString(3) %></td>
				<td style="text-align:right;">￦<%=def.format(rs.getInt(4)) %></td>
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
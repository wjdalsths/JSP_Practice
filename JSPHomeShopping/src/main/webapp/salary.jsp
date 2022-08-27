<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>salary</title>
</head>
<body>
	<script type="text/javascript" src="check.js"></script>
	<jsp:include page="header.jsp" />
	
	<section style="position: fixed; left:0; top:60px; width: 100%; height: 100%; background: lightgray; ">
	<h2 style="text-align: center;">회원매출조회</h2>
	<form action="action.jsp" method="post" name="frm"
	style="display: flex; justify-content: center; text-align: center; align-items: center;">
	<table border="1" style="border-collapse: collapse;">
	
	<tr>
		<th>회원번호</th>
		<th>회원성명</th>
		<th>고객등급</th>
		<th>매출</th>
	</tr>
	<%
	request.setCharacterEncoding("UTF-8");
	String grade="";

	try{
		Statement stmt = Util.getConnection().createStatement();
		String sql = "select M.custno , M.custname , M.grade, sum(M2.price) from member_tbl_02 M, money_tbl_02 M2 where M.custno = M2.custno group by M.custno, M.custname, M.grade order by sum(M2.price) desc";
		ResultSet rs =  stmt.executeQuery(sql);
		while(rs.next()){
			grade = rs.getString("grade");
			switch(grade){
			case "A":
				grade = "VIP";
				break;
			case "B":
				grade = "일반";
				break;
			case "C":
				grade = "직원";
				break;
					
		    }
	%> 
	
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=grade %></td>
		<td><%=rs.getString(4) %></td>
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
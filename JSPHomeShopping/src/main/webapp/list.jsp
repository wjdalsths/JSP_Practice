<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>
	<script type="text/javascript" src="check.js"></script>
	<jsp:include page="header.jsp" />
	
	<section style="position: fixed; left:0; top:60px; width: 100%; height: 100%; background: lightgray; ">
	<h2 style="text-align: center;">회원정보조회/수정</h2>
	<form action="action.jsp" method="post" name="frm"
	style="display: flex; justify-content: center; text-align: center; align-items: center;">
	<table border="1" style="border-collapse: collapse;">
	
	<tr>
		<th>회원번호</th>
		<th>회원성명</th>
		<th>전화번호</th>
		<th>주소</th>
		<th>가입일자</th>
		<th>고객등급</th>
		<th>거주지역</th>
	</tr>
	<%
	request.setCharacterEncoding("UTF-8");
	String grade = "";
	try{
		Statement stmt = Util.getConnection().createStatement();
		String sql = "select * from member_tbl_02";
		ResultSet rs =  stmt.executeQuery(sql);
		while(rs.next()){
			grade = rs.getString(6);
			/* if(grade == "A"){
				grade = "VIP";
			}else if(grade == "B"){
				grade = "일반";
			}else if(grade == "C"){
				grade = "직원";
			} */
			switch(grade){
			case "A": grade = "VIP"; break;
			case "B": grade = "일반"; break;
			case "C": grade = "직원"; break;
			}
			
	%> 
	
	<tr>
		<td><a href="modify.jsp?mod_custno=<%=rs.getString(1)%>"><%=rs.getString(1) %></a></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getDate(5) %></td>
		<td><%=grade %></td>
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
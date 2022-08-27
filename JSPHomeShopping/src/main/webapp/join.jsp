<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
</head>
<body>
	<script type="text/javascript" src="check.js"></script>
	<jsp:include page="header.jsp" />
	
	<section style="position: fixed; left:0; top:60px; width: 100%; height: 100%; background: lightgray; ">
	<h2 style="text-align: center;">홈쇼핑 회원 등록</h2>
	<form action="action.jsp" method="post" name="frm"
	style="display: flex; justify-content: center; text-align: center; align-items: center;">
	<input type="hidden" name="mode" value="insert">
	<table border="1" style="border-collapse: collapse;">
	<%
	request.setCharacterEncoding("UTF-8");
	String custno = "";
	try{
		Statement stmt = Util.getConnection().createStatement();
		String sql = "select max(custno)+1 from member_tbl_02";
		ResultSet rs =  stmt.executeQuery(sql);
		rs.next();
		custno = rs.getString(1);
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	%>
	
	<tr>
		<th>회원번호(자동발생)</th>
		<td><input type="text" name="custno" value="<%=custno %>" readonly></td>
	</tr>
	<tr>
		<th>회원성명</th>
		<td><input type="text" name="custname"></td>
	</tr>
	<tr>
		<th>회원전화</th>
		<td><input type="text" name="phone"></td>
	</tr>
	<tr>
		<th>회원주소</th>
		<td><input type="text" name="address"></td>
	</tr>
	<tr>
		<th>가입일자</th>
		<td><input type="text" name="joindate"></td>
	</tr>
	<tr>
		<th>고객등급[A:VIP,B:일반,C:직원]</th>
		<td><input type="text" name="grade"></td>
	</tr>
	<tr>
		<th>도시코드</th>
		<td><input type="text" name="city"></td>
	</tr>
	<tr>
		<td colspan="2">
		<button type="submit" value="등록" onclick="return joinCheck();">등록</button>
		<button type="button" value="조회" onclick="return search();">조회</button>
		</td>
	</tr>
	
	</table>
	</form>
	</section>
	
	<jsp:include page="footer.jsp" />
</body>
</html>
<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify</title>
</head>
<body>
	<script type="text/javascript" src="check.js"></script>
	<jsp:include page="header.jsp" />
	
	<section style="position: fixed; left:0; top:60px; width: 100%; height: 100%; background: lightgray; ">
	<h2 style="text-align: center;">홈쇼핑 회원 정보 수정</h2>
	<form action="action.jsp" method="post" name="frm"
	style="display: flex; justify-content: center; text-align: center; align-items: center;">
	<input type="hidden" name="mode" value="modify">
	<table border="1" style="border-collapse: collapse;">
	<%
	request.setCharacterEncoding("UTF-8");
	String mod_custno = request.getParameter("mod_custno");
	String custname = "";
	String phone = "";
	String address = "";
	Date joindate;
	String grade = "";
	String city = "";
	try{
		Statement stmt = Util.getConnection().createStatement();
		String sql = "select * from member_tbl_02 where custno = "+ mod_custno;
		ResultSet rs =  stmt.executeQuery(sql);
		rs.next();
		custname = rs.getString(2);
		phone = rs.getString(3);
		address = rs.getString(4);
		joindate = rs.getDate(5);
		grade = rs.getString(6);
		city= rs.getString(7);
	
	%>
	
	<tr>
		<th>회원번호(자동발생)</th>
		<td><input type="text" name="custno" value="<%=mod_custno %>" readonly></td>
	</tr>
	<tr>
		<th>회원성명</th>
		<td><input type="text" name="custname" value="<%=custname %>"></td>
	</tr>
	<tr>
		<th>회원전화</th>
		<td><input type="text" name="phone" value="<%=phone %>"></td>
	</tr>
	<tr>
		<th>회원주소</th>
		<td><input type="text" name="address" value="<%=address %>"></td>
	</tr>
	<tr>
		<th>가입일자</th>
		<td><input type="text" name="joindate" value="<%=joindate %>"></td>
	</tr>
	<tr>
		<th>고객등급[A:VIP,B:일반,C:직원]</th>
		<td><input type="text" name="grade" value="<%=grade %>"></td>
	</tr>
	<tr>
		<th>도시코드</th>
		<td><input type="text" name="city" value="<%=city %>"></td>
	</tr>
	<tr>
		<td colspan="2">
		<button type="submit" value="수정" onclick="return modify();">수정</button>
		<button type="button" value="조회" onclick="return search();">조회</button>
		</td>
	</tr>
	<%
		
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
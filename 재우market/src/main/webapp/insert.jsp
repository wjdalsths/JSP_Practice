<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
</head>
<body>
<script type="text/javascript" src="check.js"></script>

<jsp:include page="header.jsp"></jsp:include>

<section style=" position: fixed; top: 70px; left:0;width: 100%; height: 100%; background-color: lightgray ">
<h2 style=" text-align: center;"><b>등록</b></h2>

<form method="post" action="action.jsp" name="frm" style=" display: flex; align-items: center; justify-content: center;
text-align: center">

<input type="hidden" name="mode" value="insert">

<table border="1">

<%
request.setCharacterEncoding("UTF-8");

Connection conn = null;
Statement stmt = null;
String custno="";

try{
	conn = Util.getConnection(); 
	stmt = conn.createStatement(); 
	String sql = "select max(custno)+1 custno from jeu_member";
	ResultSet rs = stmt.executeQuery(sql); 
	rs.next();
	custno = rs.getString("custno");
}

catch(Exception e){
	e.printStackTrace();
}
%>


<tr>
	<td>회원번호(자동발생)</td>
	<td><input type="text" name="custno" value="<%=custno%>" readonly></td>
</tr>
<tr>
	<td>회원이름</td>
	<td><input type="text" name="custname" style="width: 96%"></td>
</tr>

<tr>
	<td>회원전화</td>
	<td><input type="text" name="phone" style="width: 96%"></td>
</tr>

<tr>
	<td>회원성명</td>
	<td>
		<input type="radio" name="gender" value="1">남 
		<input type="radio" name="gender" value="2">여
	</td>
</tr>

<tr>
	<td>회원주소</td>
	<td><input type="text" name="address" style="width: 96%"></td>
</tr>
<tr>
<td colspan="2">
	<input type="button" value="등록" onclick="addCheck()">
	<input type="button" value="조회" onclick="search()">
</td>
</tr>
</table>

</form>

</section>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
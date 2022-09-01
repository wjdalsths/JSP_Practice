<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<section style="position: fixed; top: 70px; left: 0px; width: 100%; height: 100%; background-color: lightgray">
<h2 style="text-align: center">
	<b>회원목록조회/수정</b>
</h2>

<form
	style="display: flex; align-items: center; justify-content: center; text-align: center">
	<table border="1">
		<tr>
			<td>회원번호</td>
			<td>회원성명</td>
			<td>전화번호</td>
			<td>성별</td>
			<td>주소</td>
		</tr>

<%
Connection conn = null;
Statement stmt = null;

try{
	conn = Util.getConnection();
	stmt = conn.createStatement();
	String sql = "select * from jeu_member order by movie";
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
%>

<tr>
	<td><a href = "modify.jsp?custno=<%=rs.getString("custno")%>"><%=rs.getString("custno") %></a></td>
	<td><%=rs.getString("custname") %> </td>
	<td><%=rs.getString("phone") %> </td>
	<td><%=rs.getString("gender") %> </td>
	<td><%=rs.getDate("address") %> </td>
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
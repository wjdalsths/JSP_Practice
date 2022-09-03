<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
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

<jsp:include page="header.jsp"></jsp:include>

<section style=" position: fixed; top: 60px; width: 100%; height: 100%; background-color: lightgray ">
<h2 style=" text-align: center;"><b>영화 등록</b></h2>

<form method="post" action="action.jsp" name="frm" style=" display: flex; align-items: center; justify-content: center;
text-align: center">

<input type="hidden" name="mode" value="insert">

<table border="1">

<%
request.setCharacterEncoding("UTF-8");

Connection conn = null;
Statement stmt = null;
String movie="";

try{
	conn = Util.getConnection(); // DB 연결
	stmt = conn.createStatement(); // sql 실행하기 위한 변수 생성
	String sql = "select max(movie)+1 movie from movie_tbl_02";
	ResultSet rs = stmt.executeQuery(sql); // stmt 통해서 sql 실행 결과
	rs.next();
	movie = rs.getString("movie");
}

catch(Exception e){
	e.printStackTrace();
}
%>


<tr>
	<td>영화번호(자동발생)</td>
	<td><input type="text" name="movie" value="<%=movie%>" readonly></td>
</tr>
<tr>
	<td>영화이름</td>
	<td><input type="text" name="moviename"></td>
</tr>
<tr>
	<td>영화감독</td>
	<td><input type="text" name="directorname"></td>
</tr>
<tr>
	<td>영화장르</td>
	<td><input type="text" name="genrename"></td>
</tr>
<tr>
	<td>등록일자</td>
	<td><input type="text" name="joindate"></td>
</tr>
<tr>
	<td colspan="2">
	<input type="submit" value="등록" onclick="return joinCheck()">
	<input type="button" value="조회" onclick="return search()"> 
	</td>
</tr>
</table>

</form>

</section>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
<%@page import="java.sql.*" %>
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

<section style="position: fixed; top: 60px; width:100%; height: 100%; background-color: lightgray">
<h2 style="text-align: center"><b>영화목록조회/수정</b></h2><br>

<form style=" display: flex; align-items: center; justify-content: center;
text-align: center">
<table border="1">

<tr>
	<td> 영화번호</td>
	<td> 영화이름</td>
	<td> 영화감독</td>
	<td> 영화장르</td>
	<td> 등록일자</td>
</tr>

<%
Connection conn = null;
Statement stmt = null;

try{
	conn = Util.getConnection();
	stmt = conn.createStatement();
	String sql = "select * from movie_tbl_02 order by movie";
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
%>

<tr>
	<td><a href = "modify.jsp?movie=<%=rs.getString("movie")%>"><%=rs.getString("movie") %></a></td>
	<td><%=rs.getString("moviename") %> </td>
	<td><%=rs.getString("directorname") %> </td>
	<td><%=rs.getString("genrename") %> </td>
	<td><%=rs.getDate("joindate") %> </td>
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
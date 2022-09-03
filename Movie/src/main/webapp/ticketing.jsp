<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="java.sql.*" %>
   <%@page import="DBPKG.Util" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화매출수조회</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<section style="position: fixed; top: 60px; width:100%; height: 100%; background-color: lightgray">
<h2 style="text-align: center"><b>영화매출조회</b></h2>

<form style=" display: flex; align-items: center; justify-content: center; text-align: center">

<table border="1">
<tr>
	<td>영화번호</td>
	<td>영화이름</td>
	<td>매출</td>
</tr>


<%
Connection conn = null;
Statement stmt = null;

try{
	conn = Util.getConnection();
	stmt = conn.createStatement();
	String sql = "select me.movie, me.moviename, sum(mo.price) price " +
				 "from movie_tbl_02 me, ticketing_tbl_02 mo " +
				 "where me.movie = mo.movie " +
				 "group by me.movie, me.moviename " +
				 "order by sum(mo.price) desc ";
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
%>
		
<tr>
	<td><%=rs.getString("movie") %></td>
	<td><%=rs.getString("moviename") %></td>
	<td><%=rs.getString("price") %></td>
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
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
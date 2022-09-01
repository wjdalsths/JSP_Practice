<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="java.sql.*" %>
   <%@page import="DBPKG.Util" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원매출조회</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<section style="position: fixed; top: 70px; left:0px; width:100%; height: 100%; background-color: lightgray">
<h2 style="text-align: center"><b>회원매출조회</b></h2>

<form style=" display: flex; align-items: center; justify-content: center; text-align: center">
<table border="1">
<tr>
	<td>회원번호</td>
	<td>회원성명</td>
	<td>매출</td>
</tr>


<%
Connection conn = null;
Statement stmt = null;

try{
	conn = Util.getConnection();
	stmt = conn.createStatement();
	String sql = "select me.custno, me.custname, sum(mo.price) price " +
				 "from jeu_member me, jeu_money mo " +
				 "where me.custno = mo.custno " +
				 "group by me.custno, me.custname" +
				 "order by sum(mo.price) desc";
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
%>
		
<tr>
	<td><%=rs.getString("custno") %></td>
	<td><%=rs.getString("custname") %></td>
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
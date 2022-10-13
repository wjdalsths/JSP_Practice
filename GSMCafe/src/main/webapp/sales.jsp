<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sales</title>
</head>
<body>
	<jsp:include page="header.jsp"/>

	<section style="position: fixed; top: 60px; left: 0px; width: 100%; height: 100%; background-color: lightgray">
	<h1 style="text-align: center"><b>카페 매출 조회 프로그램</b></h1>
	<form style="display:flex; align-items:center; justify-content:center; text-align:center; ">
	<table border="1" style="border-collapse: collapse;">
	<tr>
		<td>메뉴번호</td>
		<td>메뉴이름</td>
		<td>주문량</td>
		<td>합계</td>
	</tr>
	<%
	try{
	Connection conn = Util.getConnection();
	String sql = "select M.menuno, M.menuname, SUM(O.amount), SUM(price*amount) from menu_tbl M, order_tbl O where M.menuno = O.menuno group by M.menuno, M.menuname order by M.menuno asc";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()) {
	%>
		<tr>
			<td><%=rs.getInt(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %>원</td>
		</tr>
	<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
	</table>
	</form>
	</section>

<jsp:include page="footer.jsp"/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db.jsp" %>
<%@page import="java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체도서리스트</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<section style="position:fixed; left:0; top:60px; width:100%; height: 100%; background: lightgray; color: black;">
	<h2 style="text-align: center"><b>전체 도서 리스트</b></h2>
	<form style="display:flex; align-item:center; justify-content: center; text-align: center;">
	<table border="1" style="border-collapse: collapse; width:800px;">
	<tr>
		<td>도서번호</td>
		<td>도서명</td>
		<td>장르</td>
		<td>가격</td>
		<td>남은 수량</td>
		<td>대출가능여부</td>
	</tr>
	<%
	request.setCharacterEncoding("UTF-8");
	try{
	String sql = "select * from book_tbl";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	DecimalFormat def = new DecimalFormat("###,###,###");
	while(rs.next()){
	%>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td>\<%=def.format(rs.getInt(4)) %></td>
		<td><%=rs.getString(5) %>권</td>
		<td><%if(rs.getInt(5) != 0){%><a href="도서대여.jsp?bookno=<%=rs.getString(1)%>">대출하기</a><%} %></td> 
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
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
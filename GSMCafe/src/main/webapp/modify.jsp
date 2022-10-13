<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="DBPKG.Util"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify</title>
</head>
<body>
	<script type="text/javascript" src="script.js"></script>
	<jsp:include page="header.jsp" />
	
	<section style="position: fixed; left:0; top:60px; width: 100%; height: 100%; background: lightgray; ">
	<h2 style="text-align: center;">주문 수정하기</h2>
	<form action="action.jsp" method="post" name="frm" style="display: flex; justify-content: center; text-align: center; align-items: center;">
	<input type="hidden" name="mode" value="modify">
	<table border="1" style="border-collapse: collapse;">
	<%
	request.setCharacterEncoding("UTF-8"); 
	String orderno= request.getParameter("orderno");
	try{
		Connection conn = Util.getConnection();  
		String sql = "select * from order_tbl where orderno = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, orderno);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
	%>
	<tr>
		<td>주문번호(자동발생)</td>
		<td><input type="text" name="orderno" value="<%=orderno%>" readonly></td>
	</tr>
	<tr>
		<td>고객번호</td>
		<td><input type="text" name="custno" value="<%=rs.getString(2)%>"></td>
	</tr>
	<tr>
		<td>고객이름</td>
		<td><input type="text" name="custname" value="<%=rs.getString(3)%>"></td>
	</tr>
	<tr>
		<td>메뉴번호</td> 
		<td>
			<input type="radio" name="menuno" value="10001" <%if(rs.getString(4).equals("10001")) out.println("checked"); %>>아메리카노
			<input type="radio" name="menuno" value="10002" <%if(rs.getString(4).equals("10002")) out.println("checked"); %>>카페 라떼
			<input type="radio" name="menuno" value="10003" <%if(rs.getString(4).equals("10003")) out.println("checked"); %>>카페 모카
			<input type="radio" name="menuno" value="10004" <%if(rs.getString(4).equals("10004")) out.println("checked"); %>>돌체 라떼
			<input type="radio" name="menuno" value="10005" <%if(rs.getString(4).equals("10005")) out.println("checked"); %>>콜드 부르
		</td>
	</tr>
	<tr>
		<td>수량</td>
		<td>
			<select name="amount">
			<option value="1" <% if(rs.getString(5).equals("1")) out.println("selected"); %>>1개(추가 주문 시 선택)</option>
			<option value="2" <% if(rs.getString(5).equals("2")) out.println("selected"); %>>2</option>
			<option value="3" <% if(rs.getString(5).equals("3")) out.println("selected"); %>>3</option>
			<option value="4" <% if(rs.getString(5).equals("4")) out.println("selected"); %>>4</option>
			<option value="5" <% if(rs.getString(5).equals("5")) out.println("selected"); %>>5</option>
			<option value="6" <% if(rs.getString(5).equals("6")) out.println("selected"); %>>6</option>
			<option value="7" <% if(rs.getString(5).equals("7")) out.println("selected"); %>>7</option>
			<option value="8" <% if(rs.getString(5).equals("8")) out.println("selected"); %>>8</option>
			<option value="9" <% if(rs.getString(5).equals("9")) out.println("selected"); %>>9</option>
			<option value="10" <% if(rs.getString(5).equals("10")) out.println("selected"); %>>10</option>
			</select>
		</td>
	</tr>
	<tr> 
		<td>주문일자</td>
		<td><input type="text" name="orderdate" placeholder="예) 20220105" value="<%=rs.getDate(6) %>"></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center;">
		<input type="button" value="수정하기" onclick="return modify()">
		<input type="button" value="다시하기" onclick="return res()"> 
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
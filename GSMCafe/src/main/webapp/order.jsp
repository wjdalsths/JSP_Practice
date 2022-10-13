<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>order</title>
</head>
	<body>
	<script type="text/javascript" src="script.js"></script>
	
	<jsp:include page="header.jsp"></jsp:include>
	
	<section style=" position: fixed; top: 60px; left:0;width: 100%; height: 100%; background-color: lightgray ">
	<h2 style=" text-align: center;"><b>카페 메뉴 주문하기</b></h2>
	<form method="post" action="action.jsp" name="frm" style=" display: flex; align-items: center; justify-content: center;">
	<input type="hidden" name="mode" value="insert">
	<table border="1" style="border-collapse: collapse;">
	
	<%
	request.setCharacterEncoding("UTF-8");
	String orderno="";
	try{
		Connection conn = Util.getConnection();  
		String sql = "select max(orderno)+1 from order_tbl";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery(sql);
		rs.next();
		orderno = rs.getString(1);
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
	<tr>
		<td>주문번호(자동발생)</td>
		<td><input type="text" name="orderno" value="<%=orderno%>" readonly></td>
	</tr>
	<tr>
		<td>고객번호</td>
		<td><input type="text" name="custno"></td>
	</tr>
	<tr>
		<td>고객이름</td>
		<td><input type="text" name="custname"></td>
	</tr>
	<tr>
		<td>메뉴번호</td> 
		<td>
			<input type="radio" name="menuno" value="10001">아메리카노
			<input type="radio" name="menuno" value="10002">카페 라떼
			<input type="radio" name="menuno" value="10003">카페 모카
			<input type="radio" name="menuno" value="10004">돌체 라떼
			<input type="radio" name="menuno" value="10005">콜드 부르
		</td>
	</tr>
	<tr>
		<td>수량</td>
		<td>
			<select name="amount">
			<option value="1">1개(추가 주문 시 선택)</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
			</select>
		</td>
	</tr>
	<tr> 
		<td>주문일자</td>
		<td><input type="text" name="orderdate" placeholder="예) 20220105"></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center;">
		<input type="button" value="주문하기" onclick="return orderCheck()">
		<input type="button" value="다시하기" onclick="return res()"> 
		</td>
	</tr>
	</table>
	</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@page import="java.text.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>orderlist</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<section style="position: fixed; top: 60px; left: 0px; width: 100%; height: 100%; background-color: lightgray">
	<h1 style="text-align: center"><b>카페 메뉴</b></h1>
	
		<form style="display:flex; align-items:center; justify-content:center; text-align:center; ">
		<table border="1" style="border-collapse: collapse;">
		<tr>
		<td colspan="9" style="text-align: right; border-left: hidden; border-top:hidden; border-right:hidden;"><a href="order.jsp">주문하기</a></td>
		</tr>
		<tr>
				<td>주문번호</td>
				<td>고객번호</td>
				<td>고객이름</td>
				<td>메뉴이름</td>
				<td>수량</td>
				<td>지불금액</td>
				<td>주문일자</td>
				<td>수정</td>
				<td>삭제</td>
			</tr>
			<%
			Connection conn = Util.getConnection();
			String sql = "select O.orderno, O.custno, O.custname, M.menuname, O.amount, SUM(price*amount), O.orderdate from menu_tbl M, order_tbl O where M.menuno = O.menuno group by O.orderno, O.custno, O.custname, M.menuname, O.amount, O.orderdate order by O.orderno asc ";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			DecimalFormat def = new DecimalFormat("###,###");
			while(rs.next()) {
				%>
				<tr>
					<td><%=rs.getInt(1) %></td>
					<td><%=rs.getInt(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getInt(5) %></td>
					<td><%=def.format(rs.getInt(6))%>원</td>
					<td><%=rs.getDate(7) %></td>
					<td><a href = "modify.jsp?orderno=<%=rs.getString("orderno")%>">주문 수정</a></td>
					<td><a href = "action.jsp?orderno=<%=rs.getString("orderno")%>&mode=delete">주문 삭제</a></td>
				</tr>
				<%
			}
			%>
		</table>
		</form>
	</section>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>
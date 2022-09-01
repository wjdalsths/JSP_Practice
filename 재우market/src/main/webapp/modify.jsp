<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify</title>
</head>
<body>
	<script type="text/javascript" src="check.js"></script>
	<jsp:include page="header.jsp"></jsp:include>
	<section style="position: fixed; top: 70px; left: 0px; width: 100%; height: 100%; background-color: lightgray">
	<h2 style="text-align: center">
		<b>회원정보수정</b>
	</h2>

		<form method="post" action="action.jsp" name="frm" style="display: flex; align-items: center; justify-content: center; text-align: center">
			<input type="hidden" name="mode" value="modify">
			<table border="1">
				<%
				request.setCharacterEncoding("UTF-8");
				String custno = request.getParameter("custno");

				try {
					Connection conn = Util.getConnection();
					String sql = "SELECT * FROM jeu_member WHERE custno= ?";
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, custno);
					ResultSet rs = pstmt.executeQuery();
					rs.next();
					String custname = rs.getString(2);
					String phone = rs.getString(3);
					String gender= rs.getString(4);
					String address = rs.getString(5);
					
				%>
				<tr>
					<td>회원번호</td>
					<td><input type="text" name="custno" style="width: 100%"
						value="<%=custno%>" readonly></td>
				</tr>

				<tr>
					<td>회원이름</td>
					<td><input type="text" name="custname" style="width: 100%"
						value="<%=rs.getString(2)%>"></td>
				</tr>

				<tr>
					<td>전화번호</td>
					<td><input type="text" name="phone" style="width: 100%"
						value="<%=rs.getString(3)%>"></td>
				</tr>

				<tr>
					<td>회원성별</td>
					<td>
						<input type="radio" name="gender" value="1"<%if (gender.equals("1")) out.println("checked");%>> 남 
						<input type="radio" name="gender" value="2"<%if (gender.equals("2")) out.println("checked");%>> 여
						
				</tr>

				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address" style="width: 100%"
						value="<%=rs.getString(5)%>"></td>
				</tr>

				<tr>
					<td colspan="2">
					<input type="button" value="수정" onclick="modify()">
					<input type="button" value="취소" onclick="res()">
					</td>

				</tr>
				<%
				} catch (Exception e) {
				e.printStackTrace();
				}
				%>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
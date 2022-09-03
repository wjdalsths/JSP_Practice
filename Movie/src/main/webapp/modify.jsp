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
	<section
		style="position: fixed; top: 70px; left: 0px; width: 100%; height: 100%; background-color: lightgray">
		<h1 style="text-align: center">
			<b>영화 수정</b>
		</h1>

		<form method="post" action="action.jsp" name="frm" style="display: flex; align-items: center; justify-content: center; text-align: center">
			<input type="hidden" name="mode" value="modify">
			<table border="1">
				<%
				request.setCharacterEncoding("UTF-8");
				String movie = request.getParameter("movie");

				try {
					Connection conn = Util.getConnection();
					String sql = "SELECT * FROM movie_tbl_02 WHERE movie= ?";
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, movie);
					ResultSet rs = pstmt.executeQuery();
					rs.next();
					String directorname = rs.getString(2);
					String genrename = rs.getString(3);
					String joindate = rs.getString(4);
				%>
				<tr>
					<td>영화번호</td>
					<td><input type="text" name="movie" style="width: 100%"
						value="<%=movie%>" readonly></td>
				</tr>

				<tr>
					<td>영화이름</td>
					<td><input type="text" name="moviename" style="width: 100%"
						value="<%=rs.getString(2)%>"></td>
				</tr>

				<tr>
					<td>영화감독</td>
					<td><input type="text" name="directorname" style="width: 100%"
						value="<%=rs.getString(3)%>"></td>
				</tr>
				<tr>
					<td>영화장르</td>
					<td><input type="text" name="genrename" style="width: 100%"
						value="<%=rs.getString(4)%>"></td>
				</tr>
				<tr>
					<td>등록일자</td>
					<td><input type="text" name="joindate" style="width: 100%"
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
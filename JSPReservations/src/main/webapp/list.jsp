<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>
	<script type="text/javascript" src="script1.js"></script>
	<jsp:include page="header.jsp"></jsp:include>
	
	<section style="position: fixed; top:60px; left:0; width:100%;height: 100%;background: lightgray;">
	<h2 style="text-align: center;">좌석예약조회</h2>
	<form name="frm2" action="action2.jsp" method="post" style="display: flex; justify-content: center; align-items: center;">
	<table border="1" style="border-collapse: collapse;">
	<tr>
		<td>사원번호를 입력하시오.</td>
		<td><input type="text" name="empno"></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center;">
		<input type="button" value="좌석예약조회" onclick="serch()">
		<input type="button" value="홈으로" onclick="location.href='index.jsp'">
		</td>
	</tr>
	
	</table>
	</form>
	</section>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>
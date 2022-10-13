<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<section style="position:fixed; width:100%; height: 100%; top:60px;left:0;background: lightgray;">
	<h2 style="text-align: center;">GSM 카페에 오신 것을 환영합니다</h2>
	<p style="padding-left:15px;"><br><br>
	1.이 프로그램은 GSM 학생들을 위한 카페 프로그램입니다.<br>
	2.조회부터 수정,삽입,삭제까지 모두 다 연습해봅시다<br>
	3.select는 executeQuert(),그 외(insert,update,delete는 executeUpdate())함수 사용
	</p>
	</section>
	
	<jsp:include page="footer.jsp" />
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<section
		style="position: fixed; top: 70px; left: 0px; width: 100%; height: 100%; background-color: lightgray;">
		<h2 style="text-align: center">
			<b>재우마켓 회원관리 서비스</b>
		</h2>

		<p style="padding-left: 20px; line-height: 20px;" >
			마트 회원정보와 회원매출정보 데이터베이스를 구축하고 회원관리 프로그램을 작성하는 프로그램이다.<br>
			프로그램작성순서<br>
			<br> 1. 회원테이블을 생성한다. <br>
			<br> 2. 메출정보 테이블을 생성한다. <br>
			<br> 3. 회원정보, 매출정보 테이블에 제시된 강조데이터를 추가 생성한다. <br>
			<br> 4. 회원정보 입력 화면 프로그램을 작성한다. <br>
			<br> 5. 회원정보 조회 프로그램을 작성한다. <br>
			<br> 6. 회원매출정보 조회 프로그램을 작성한다. <br>
			
			<br>
		</p>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
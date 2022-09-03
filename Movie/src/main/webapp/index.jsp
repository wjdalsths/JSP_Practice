<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>

<jsp:include page="header.jsp"/>

<section style=" position: fixed; top: 60px; width: 100%; height: 100%; background-color: lightgray ">
<h2 style=" text-align: center;"><b>영화 관리 프로그램</b></h2>
<p style=" padding-left: 10px; text-align: center;">
영화 관리 프로그램<br>
영화정보와 영화매출정보 데이터베이스를 구축하고 영화관리 프로그램을 작성하는 프로그램이다.<br>
프로그램 작성 순서<br>
1. 영화등록 테이블을 작성한다.<br>
2. 영화매출정보 테이블을 생성한다.<br>
3. 회원정보, 매출정보테이블에 제시된 문제지의 참조 데이터를 추가 생성한다.<br>
4. 영화등록 입력 화면프로그램을 작성한다.<br>
5. 영화정보 조회/수정 프로그램을 작성한다.<br>
6. 영화매출정보 조회 프로그램을 작성한다.<br>
</p>
</section>

<jsp:include page="footer.jsp"/>

</body>
</html>
<%@page import="java.sql.*" %>
<%@page import="DBPKG.Util" %>
<%@page import="java.text.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청</title>
</head>
<body>
<script type="text/javascript" src="script3.js"></script>

	<jsp:include page="header.jsp"></jsp:include>
	
	<section style="position: fixed; left:0; top:60px; width:100%; height: 100%; background: lightgray;">
	<h2 style="text-align: center;">수강신청</h2>
	<form method="post" action="actions.jsp" name="frm"
	 style="display:flex; align-item:center; justify-content: center; ">
	<table border="1" style="border-collapse: collapse;  width:500px;">
	   
	<tr>
		<th>수강1월</th>
		<td><input type="text" name="month" maxlength="6">2022년03월 예)202203</td>
	</tr>
	<tr>
		<th>회원명</th>
		<td>
			<select name="c_name" onchange="cname_change();">
				<option value="">회원명</option>
				<option value="10001">홍길동</option>			
				<option value="10002">장발장</option>			
				<option value="10003">임꺽정</option>			
				<option value="20001">성춘향</option>			
				<option value="20002">이몽룡</option>
			</select>
		</td> 
	</tr>
	<tr>
		<th>회원번호</th>
		<td><input type="text" name="c_no" readonly>예)10001</td> 
	</tr>
	<tr>
		<th>강의장소</th>
		<td>
			<select name="place">
				<option value="">강의장소</option>
				<option value="서울본원">서울본원</option>
				<option value="성남본원">성남본원</option>
				<option value="대전본원">대전본원</option>
				<option value="부산본원">부산본원</option>
				<option value="대구본원">대구본원</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>강의명</th>
		<td>
			<select name="t_name" onchange="price_change()">
				<option value="">강의신청</option>
				<option value="100">초급반</option>
				<option value="200">중급반</option>
				<option value="300">고급반</option>
				<option value="400">심화반</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>수강료</th>
		<td><input type="text" name="t_price" readonly>원</td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center;"> 
		<input type="submit" value="수강신청" onclick="return insertCheck()">
		<input type="button" value="다시쓰기" onclick="return back()">
		</td>
	</tr>
	
	</table>
	</form>
	</section>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
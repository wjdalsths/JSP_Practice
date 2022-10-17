<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서대여</title>
</head>
<body>
	<script type="text/javascript" src="script1.js"></script>
	<jsp:include page="header.jsp"></jsp:include>
	
	<section style="position:fixed; left:0; top:60px; width:100%; height: 100%; background: lightgray; color: black;">
	<h2 style="text-align: center"><b>도서 대여 프로그램</b></h2>
	<form name="frm" action="action.jsp" method="post" style="display:flex; justify-content: center; align-items: center;">
	<input type="hidden" name="mode" value="borrow">
	<table border="1" style="border-collapse: collapse; width:400px;">
	<%
	request.setCharacterEncoding("UTF-8");
	String bookno = request.getParameter("bookno");
	String bookname = request.getParameter("bookname");
	String sql = "select max(bor_no)+1 bor_no from borrow_tbl";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs =  pstmt.executeQuery(sql);
	rs.next();
	String bor_no = rs.getString(1);
	%>
	<tr>
		<td>대여번호</td>
		<td><input type="text" name="bor_no" value="<%=bor_no %>" readonly></td>
	</tr>
	<tr>
		<td>고객이름</td>
		<td>
		<select name="m_name" onchange="namechange()">
			<option>고객명</option>
			<option value="유미">유미</option>
			<option value="바비">바비</option>  
			<option value="순록">순록</option>
			<option value="광규">광규</option>
			<option value="까를로스">까를로스</option>
		</select>
		</td>
	</tr>
	<tr>
 
		<td>고객번호</td>
		<td><input type="text" name="m_no" readonly>예)101</td>
	</tr>
	<tr>
		<td>직업</td>
		<td> 
		<input type="radio" name="job" value="학생">학생 
		<input type="radio" name="job" value="교사">교사
		<input type="radio" name="job" value="외부인">외부인
		</td>
	</tr>
	<tr>
		<td>도서명</td>
		<td>
		<select name="bookname">
			<option value="C언어" <%if(bookno.equals("10001")) out.print("selected"); %>>C언어</option>
			<option value="Java" <%if(bookno.equals("10002")) out.print("selected"); %>>Java</option>
			<option value="셜록홈즈" <%if(bookno.equals("10003")) out.print("selected"); %>>셜록홈즈</option>
			<option value="해리포터" <%if(bookno.equals("10004")) out.print("selected"); %>>해리포터</option>
			<option value="전지적독자시점" <%if(bookno.equals("10005")) out.print("selected"); %>>전지적독자시점</option>
			<option value="Python" <%if(bookno.equals("10006")) out.print("selected"); %>>Python</option>
			<option value="여름이였다" <%if(bookno.equals("10007")) out.print("selected"); %>>여름이였다</option>
		</select>
		</td>
	</tr>
	<tr>
		<td>대여날짜</td>
		<td><input type="text" name="bor_date" placeholder="예) 20220303"></td>
	</tr>  
	<tr> 
		<td colspan="2" style="text-align: center;"> 
			<input type="button" value="대출하기" onclick="return check()">
			<input type="button" value="다시하기" onclick="alert('처음부터 다시 입력합니다'); document.frm.reset();">
		</td> 
	</tr>
	</table>
	</form>
	</section>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
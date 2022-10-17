<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서반납</title>
</head>
<body>
	<script type="text/javascript" src="script.js"></script>
	<jsp:include page="header.jsp"></jsp:include>
	
	<section style="position:fixed; left:0; top:60px; width:100%; height: 100%; background: lightgray; color: black;">
	<h2 style="text-align: center"><b>도서 반납</b></h2>
	<form name="frm" action="action.jsp" method="post" style="display:flex; justify-content: center; align-items: center;">
	<input type="hidden" name="mode" value="return">
	<table border="1" style="border-collapse: collapse; width:400px;">
	<%
	request.setCharacterEncoding("UTF-8");
	
	
	String bor_no = request.getParameter("bor_no");
	String m_name = request.getParameter("m_name");
	String m_no = request.getParameter("m_no");
	String bookname = request.getParameter("bookname");
	String bor_date = request.getParameter("bor_date");
	try{
		String sql = "select job from mem_tbl where m_no = " + m_no;
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs =  pstmt.executeQuery(sql);
		rs.next();
		String job = rs.getString(1);

	%>
	<tr>
		<td>대여번호</td>
		<td><input name="bor_no" value="<%=bor_no %>" readonly></td>
	</tr>
	<tr>
		<td>고객이름</td>
		<td>
		<select name="m_name" onchange="namechange()">
			<option value=<%=m_name %>><%=m_name %>
		</select>
		</td>
	</tr>
	<tr>
 
		<td>고객번호</td>
		<td><input readonly name="m_no" value="<%=m_no%>" readonly>예)101</td>
	</tr>
	<tr>
		<td>직업</td>
		<td> 
		<input type="radio" name="job" value="학생" <% if(job.equals("학생")) out.println("checked"); %>>학생 
		<input type="radio" name="job" value="교사" <% if(job.equals("교사")) out.println("checked"); %>>교사
		<input type="radio" name="job" value="외부인" <% if(job.equals("외부인")) out.println("checked"); %>>외부인
		</td>
	</tr>
	<tr>
		<td>도서명</td>
		<td>
		<select name="bookname">
				<option value=<%=bookname %>><%=bookname %></option>
		</select>
		</td>
	</tr>
	<tr>
		<td>대여날짜</td>
		<td><input readonly name="bor_date" value=<%=bor_date %>></td>
	</tr>   
	<tr> 
		<td colspan="2" style="text-align: center;"> 
			<input type="submit" value="반납하기" onclick="return returnB()"> 
			<input type="button" value="뒤로가기" onclick="window.location='대여정보확인.jsp'">
		</td> 
	</tr> 
	<%
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
	</table>
	</form>
	</section>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
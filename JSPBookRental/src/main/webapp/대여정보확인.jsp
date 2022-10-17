<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대여정보확인</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<section style="position:fixed; left:0; top:60px; width:100%; height: 100%; background: lightgray; color: black;">
	<h2 style="text-align: center"><b>대여 정보 확인하기</b></h2>
	<form style="display:flex; align-item:center; justify-content: center; text-align: center;">
	<table border="1" style="border-collapse: collapse; width:800px;">
	<tr>
		<td>대여번호</td>
		<td>고객번호</td>
		<td>고객이름</td>
		<td>연락처</td>
		<td>도서명</td>
		<td>대여날짜</td>
		<td>대여기한</td>
		<td>반납여부</td>
	</tr>
	<%
	request.setCharacterEncoding("UTF-8");
	try{
	String sql = "select bo.bor_no, bo.m_no, bo.m_name, me.phone, bo.bookname, bo.bor_date, bo.re_book "+
			"from mem_tbl me, borrow_tbl bo "+
			"where bo.m_name = me.m_name order by bor_no ";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
	String re = rs.getString(7);
		/* switch(re){
		case "반납":re = "<a href=''>반납하기</a>"; break;
		case "대여":re = ""; break;
		} */
		
	SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd"); 
	String day = dateFormat.format(rs.getDate(6));
	%> 
	<tr> 
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><%=rs.getDate(6) %></td> 
		<td><%=day.substring(0, 8) + String.format("%02d", (Integer.parseInt(day.substring(8)) + 6)) %></td> 
		<td><%if(re.equals("대여")){%><a href="도서반납.jsp?&bor_no=<%=rs.getString(1) %>&m_name=<%=rs.getString(3) %>&m_no=<%=rs.getString(2) %>&bookname=<%=rs.getString(5) %>&bor_date=<%=rs.getString(6) %>">반납하기</a><%}  %></td>
	</tr> 
	<%
		}
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
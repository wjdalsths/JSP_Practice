<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="db.jsp" %>
<%

request.setCharacterEncoding("UTF-8");
String mode = request.getParameter("mode");
String bookname = request.getParameter("bookname");
String bor_no = request.getParameter("bor_no");
PreparedStatement pstmt = null;
String sql = "select bookno from book_tbl where bookname = ? ";
pstmt = con.prepareStatement(sql);
pstmt.setString(1, bookname);
ResultSet rs = pstmt.executeQuery();
if(rs.next());
String bookno = rs.getString(1);

sql = "select amount from book_tbl where bookno = " + bookno;
pstmt = con.prepareStatement(sql);
rs = pstmt.executeQuery();
if(rs.next());
int amount = rs.getInt(1);
try{
	switch(mode){
	case "borrow":
		sql = "insert into borrow_tbl values (?,?,?,?,?,?,?)";
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, bor_no);
		pstmt.setString(2, request.getParameter("m_no"));
		pstmt.setString(3, request.getParameter("m_name"));
		pstmt.setString(4, bookno);
		pstmt.setString(5, bookname);
		pstmt.setString(6, request.getParameter("bor_date"));
		pstmt.setString(7, "대여"); 
		pstmt.executeUpdate(); 
		
		sql = "update book_tbl set amount = ? where bookno = ? ";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, amount-1);
		pstmt.setString(2, bookno);
		pstmt.executeUpdate();
		%>
		<jsp:forward page="대여정보확인.jsp"></jsp:forward>
		<%
	break;
	case "return":
		sql = "update borrow_tbl set re_book = '반납'  where bor_no = ? ";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, bor_no);
		pstmt.executeUpdate();
		
		sql = "update book_tbl set amount = ? where bookno = ? ";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, amount+1);
		pstmt.setString(2, bookno);
		pstmt.executeUpdate();
		%>
		<jsp:forward page="index.jsp"/>
		<%
		break;
	}
}
	catch(Exception e){
		e.printStackTrace();
	}	
%>
<jsp:forward page=".jsp"></jsp:forward>

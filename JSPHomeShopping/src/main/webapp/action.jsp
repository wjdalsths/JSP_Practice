<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*" %>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>action</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");


	String mode = request.getParameter("mode");
	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	
	try{
		Connection conn = Util.getConnection();
		String sql = " ";
		/* Statement stmt = conn.createStatement(); */
		PreparedStatement pstmt= null;
		switch(mode){
		case "insert": 
		/* 	sql = "insert into member_tbl_02 values("+custno+","+"'"+custname+"',"+"'"+phone+"',"+"'"+address+"',"+"TO_DATE('" + joindate + "', 'yyyy-MM-dd'),"+"'"+grade+"',"+"'"+city+"')";
		 */
			sql = "insert into member_tbl_02 values(?,?,?,?,?,?,?)";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, custno);
			pstmt.setString(2, custname);
			pstmt.setString(3, phone);
			pstmt.setString(4, address);
			pstmt.setString(5, joindate);
			pstmt.setString(6, grade);
			pstmt.setString(7, city);

		 /* stmt.executeUpdate(sql); */
			pstmt.executeUpdate();		
	 
	
%>
<jsp:forward page="join.jsp" />
<%
			break;
		case "modify":	
			 /* sql = "update member_tbl_02 set custname ='"+custname+"', phone = '"+phone+"' , address='"+address+"', joindate=to_date('"+joindate+"','yyyy-mm-dd'), grade='"+grade+"', city='"+city+"'"
			+"where custno ="+custno;  */
			sql = "update member_tbl_02 set custname=?, phone=?, address=?, joindate=?, grade=?, city=? where custno =?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, custname);
			pstmt.setString(2, phone);
			pstmt.setString(3, address);
			pstmt.setString(4, joindate);
			pstmt.setString(5, grade);
			pstmt.setString(6, city);
			pstmt.setString(7, custno);
			
		/* stmt.executeUpdate(sql); */
			pstmt.executeUpdate();		

%>
<jsp:forward page="list.jsp" />
<%
		break;

	}
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>
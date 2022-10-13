<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>vote</title>
</head>
<body>
<script type="text/javascript" src="check.js"></script>

	<jsp:include page="header.jsp"/>
	
	<section style="position: fixed; top: 100px; left: 0px; right:0; width: 100%; height: 100%; background-color: lightgray;">
		<h2 style="text-align: center; /* font-weight: 500 */">투표하기</h2>
		<form action="action.jsp" method="post" name="frm" style="display: flex; justify-content: center;">
		<input type="hidden" name="mode" value="insert">
			<table border="1" style="border-collapse: collapse; width:600px;">
			<tr>
				<th>주민번호</th> 
				<td><input type="text" name="jumin" maxlength="13">예: 8906153154726</td>
			</tr>
			<tr>
				<th>성명</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>투표번호</th>
				<td>
					<select name="no">
					<option value=""></option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>투표시간</th>
				<td><input type="text" name="time"></td>
			</tr>
			<tr>
				<th>투표장소</th>
				<td><input type="text" name="area"></td>
			</tr>
			<tr>
				<th>유권자확인</th>
				<td>
				<input type="radio" name="vote" value="Y">확인 &nbsp;&nbsp;
				<input type="radio" name="vote" value="N">미확인
				</td>
			</tr>
			<tr >
				<td colspan="2" style="text-align: center;">
					<button type="submit" onclick="return voteCheck()">투표하기</button>
					<button type="button" onclick="return back()">다시하기</button>
				</td>
			</tr>
			</table>
		</form>
	</section>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>
function joinCheck(){
	if(document.frm.custname.value == ""){
		alert("회원성명을 입력해주세요!");
		frm.custname.focus();
		return false;
	}
	if(document.frm.phone.value == ""){
		alert("전화를 입력해주세요!");
		frm.phone.focus();
		return false;
	}
	if(document.frm.address.value == ""){
		alert("주소를 입력해주세요!");
		frm.address.focus();
		return false;
	}
	if(document.frm.joindate.value == ""){
		alert("가입일자를 입력해주세요!");
		frm.joindate.focus();
		return false;
	}
	if(document.frm.grade.value == ""){
		alert("고객등급 입력해주세요!");
		frm.grade.focus();
		return false;
	}
	if(document.frm.city.value == ""){
		alert("도시코드 입력해주세요!");
		frm.city.focus();
		return false;
	}
	alert("회원등록이 완료되었습니다.");
	return true;
}

function search(){
	window.location = 'list.jsp';
}
function modify(){
	alert("회원정보수정이 완료되었습니다.");
}
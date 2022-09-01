function addCheck() {

	if (frm.custname.value.length == 0) {
		alert("회원이름이 입력되지 않았습니다.");
		frm.custname.focus();
		return false;
	}

	else if (frm.phone.value.length == 0) {
		alert("회원전화가 입력되지 않았습니다.");
		frm.phone.focus();
		return false;
	}

	else if (frm.gender[0].checked == false && frm.gender[1].checked == false && frm.gender[2].checked == false) {
		alert("성별이 선택되지 않았습니다.");
		frm.gender.focus();
		return false;
	}

	else if (frm.address.value.length == 0) {
		alert("회원주소 입력되지 않았습니다.");
		frm.address.focus();
		return false;
	}

	else
		alert("회원 등록이 완료되었습니다!");
	document.frm.submit();
	return ;
}

function search() {
	window.location = 'list.jsp';
}

function modify() {
	alert("회원 수정이 완료되었습니다!");
	document.frm.submit();
}

function res() {
	alert("회원 수정이 취소되었습니다!");
	document.frm.reset();
}
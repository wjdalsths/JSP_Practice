function check(){
	if(document.frm.m_name.value.length == 0){
		alert("이름이 선택되지않았습니다");
		frm.m_name.focus();
		return false;
	}else if(document.frm.m_no.value.length == 0){
		alert("고객번호가 입력되지 않았습니다");
		frm.m_no.focus();
		return false;
	}else if(document.frm.job.value.length == 0){
		alert("직업이 선택되지 않았습니다");
		frm.job.focus();
		return false;
	}else if(document.frm.bor_date.value.length == 0){
		alert("대여날짜가 입력되지 않았습니다");
		frm.bor_date.focus();
		return false;
	}else{
		alert("대여 완료");
		document.frm.submit();
		return ture;	
	}
}

function namechange() {
	let name = frm.m_name.selectedIndex;
	if(name == 1){
		frm.m_no.value = 101;
	}else if(name == 2){
		frm.m_no.value = 102;
	}else if(name == 3){
		frm.m_no.value = 103;
	}else if(name == 4){
		frm.m_no.value = 104;
	}else if(name == 5){
		frm.m_no.value = 105;
	}
}

function returnB(){
	alert("반납 완료");
	return ture;
}
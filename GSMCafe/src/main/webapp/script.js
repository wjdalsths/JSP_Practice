function orderCheck() {
	if(frm.custno.value.length == 0) {
		alert("고객번호가 입력되지 않았습니다!");
		frm.custno.focus();
		return false;
	}else if(frm.custname.value.length == 0){
		alert("고객이름이 입력되지 않았습니다!");
		frm.custname.focus();
		return false;
	}else if(!document.frm.menuno.value){
		alert("메뉴가 선택되지 않았습니다!");
		return false;
	}else if(frm.orderdate.value.length == 0){
		alert("주문일자가 입력되지 않았습니다!");
		frm.orderdate.focus();
		return false;
	}else{
		alert("-----주문 완료-----");
		document.frm.submit();
		return true;
	}
}

function res(){
	alert("----처음부터 다시 시작-----");
	document.frm.reset();
	frm.custno.focus();
}

function modify(){
	if(frm.custno.value.length == 0) {
		alert("고객번호가 입력되지 않았습니다!");
		frm.custno.focus();
		return false;
	}else if(frm.custname.value.length == 0){
		alert("고객이름이 입력되지 않았습니다!");
		frm.custname.focus();
		return false;
	}else if(!document.frm.menuno.value){
		alert("메뉴가 선택되지 않았습니다!");
		return false;
	}else if(frm.orderdate.value.length == 0){
		alert("주문일자가 입력되지 않았습니다!");
		frm.orderdate.focus();
		return false;
	}else{
		alert("주문 수정이 완료되었습니다!");
		document.frm.submit();
		return true;
	}
}
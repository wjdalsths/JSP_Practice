function insertCheck(){
	let fn= document.frm;
	if(fn.month.value.length == 0){
		alert("수강월을 입력해주세요!");
		fn.month.focus();
		return false;
	}
	if(fn.c_name.value.length == 0){
		alert("회원명을 선택해주세요!");
		fn.c_name.focus();
		return false;
	}
	if(fn.place.value.length == 0){
		alert("강의장소를 선택해주세요!");
		fn.place.focus();
		return false;
	}
	if(fn.t_name.value.length == 0){
		alert("강의명을 선택해주세요!");
		fn.t_name.focus();
		return false;
	}
	success();
/*	document.frm.submit();
*/	return true;
	
}
function success(){
	alert("수강신청이 정상적으로 완료되었습니다!");
	window.location = 'index.jsp';

}
function back(){
	/*alert("정보를 지우고 1처음부터 다시 입력합니다!")
	window.location = '수강신청.jsp';*/
	alert("정보를 지우고 3처음부터 다시 입력합니다!");
    document.frm.reset();
    frm.month.focus();
}

function cname_change(){
	console.log("cname_change");
	
	let fn = document.frm;
	fn.t_price.value = "";
	fn.t_name.options[0].selected = true;
	
	fn.c_no.value = fn.c_name.value; 
}
function price_change(){
	let fn = document.frm;
	let price = fn.t_name.value*1000;
	let no = fn.c_no.value;
	if(no>=20000) price*=0.5;
	
	fn.t_price.value = price;
}

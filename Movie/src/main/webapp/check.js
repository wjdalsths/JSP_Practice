function joinCheck() {

    if(document.frm.moviename.value.length == 0){
        alert("영화이름이 입력되지 않았습니다.");
        frm.custname.focus();
        return false;
    }
    if(document.frm.directorname.value.length == 0){
        alert("영화감독이 입력되지 않았습니다.");
        frm.joindate.focus();
        return false;
    }
    if(document.frm.genrename.value.length == 0){
        alert("영화장르가 입력되지 않았습니다.");
        frm.genrename.focus();
        return false;
    }
    
    success();
    return true;
}

function success() {
	alert("영화등록이 완료 되었습니다!");
}

function search(){
	window.location = 'list.jsp';
}

function modify(){
	alert("영좌정보수정이 왼료되었습니다.");
	document.frm.submit();

}
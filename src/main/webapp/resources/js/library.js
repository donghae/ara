/**
 * 
 */

var msg_text = "미입력된 텍스트가 있습니다. 양식을 작성해주세요";
var msg_noLogin = "로그인 후 이용가능합니다";


/*로그인 창 유도*/
function libnologin() {
	swal(msg_noLogin);
	librarylogin();
}


/*로그인창*/
function librarylogin() {
	//window.open("파일명", "윈도우명(=별칭)", "창 속성");
	//get방식 : url="주소?속성="+속성값;
	var url="lib_loginForm";
	window.open(url, "login", "menubar=no, width=610, height=450");
}




/*도서 등록 양식 입력확인*/
function bookAddForm_written() {
	if (!document.bookAddForm.global.value || document.bookAddForm.global.value == 0) {
		swal(msg_text);
		document.bookAddForm.global.focus();
		return false;
	}
	if (!document.bookAddForm.category.value || document.bookAddForm.category.value == 0) {
		swal(msg_text);
		document.bookAddForm.category.focus();
		return false;
	}
	if (!document.bookAddForm.isbn.value) {
		swal(msg_text);
		document.bookAddForm.isbn.focus();
		return false;
	}
	if (!document.bookAddForm.title.value) {
		swal(msg_text);
		document.bookAddForm.title.focus();
		return false;
	}
	if (!document.bookAddForm.price.value) {
		swal(msg_text);
		document.bookAddForm.price.focus();
		return false;
	}
	if (!document.bookAddForm.amt.value) {
		swal(msg_text);
		document.bookAddForm.amt.focus();
		return false;
	}
/*	if (!document.bookAddForm.img.value) {
		swal(msg_text);
		document.bookAddForm.img.focus();
		return false;
	}*/
	if (!document.bookAddForm.publish.value) {
		swal(msg_text);
		document.bookAddForm.publish.focus();
		return false;
	}
	if (!document.bookAddForm.year.value) {
		swal(msg_text);
		document.bookAddForm.year.focus();
		return false;
	}
	if (!document.bookAddForm.month.value) {
		swal(msg_text);
		document.bookAddForm.month.focus();
		return false;
	}
	if (!document.bookAddForm.day.value) {
		swal(msg_text);
		document.bookAddForm.day.focus();
		return false;
	}

}







/*도서 삭제 시 컨펌*/
function delBook(b_no) {
	
	swal({
		  title: "선택하신 도서를 삭제하시겠습니까?",
		  buttons: true,
		  dangerMode: true,
		})
		.then((okay) => {
			  if (okay) {
				  window.location='lib_bookDelPro?b_no='+b_no;
			  } else {
				  return false;
			  }			
		});
}







/*관리자 : 대여/반납 페이지 - 입력여부*/
function loanForm_written() {
	if(!document.loanForm.user_no.value) {
		swal(msg_text);
		document.loanForm.user_no.focus();
		return false;
	}
	if(!document.loanForm.b_no.value) {
		swal(msg_text);
		document.loanForm.b_no.focus();
		return false;
	}
}


/*관리자 : 대여/반납 페이지 - 입력여부, 반납처리*/
function return_written() {
	if(!document.bookLoanForm.user_no.value) {
		swal(msg_text); 
		document.bookLoanForm.user_no.focus();
		return false;
	}
	if(!document.bookLoanForm.b_no.value) {
		swal(msg_text);
		document.bookLoanForm.b_no.focus();
		return false;
	}
	
	var b_no = document.getElementsByName("b_no")[0];
	var user_no = document.getElementsByName("user_no")[0];
	
	window.location="lib_bookReturnPro?b_no="+b_no.value+"&user_no="+user_no.value;
}


/*관리자 : 대여/반납 페이지 - 입력여부, 연장처리*/
function renew_written() {
	if(!document.bookLoanForm.user_no.value) {
		swal(msg_text); 
		document.bookLoanForm.user_no.focus();
		return false;
	}
	if(!document.bookLoanForm.b_no.value) {
		swal(msg_text);
		document.bookLoanForm.b_no.focus();
		return false;
	}
	
	var b_no = document.getElementsByName("b_no")[0];
	var user_no = document.getElementsByName("user_no")[0];
	
	window.location="lib_bookRenewPro?b_no="+b_no.value+"&user_no="+user_no.value;
}



/*관리자 : 대출/반납 페이지 - 폼 추가*/
function addloanForm() {
	$('.formplus').append("<br><br><label><span>도서 번호</span>" +
			"<input style='display:inline-block;' type='text' name='b_no' required></label>");
}



/*function closeWithSubmit() {
	var f= document.forms.seat_form;
    document.domain = "localhost"; 
    opener.name = "lib_seat";
    f.target = opener.name;
    f.submit();
    self.close();
}*/
//입학신청서
function inputCheck() {
	if (!document.myForm.name.value) {
		document.myForm.name.focus();
		return false;
	}
	if (!document.myForm.jumin1.value) {
		document.myForm.jumin1.focus();
		return false;
	}
	if (!document.myForm.jumin2.value) {
		document.myForm.jumin2.focus();
		return false;
	}
	if (!document.myForm.grade.value) {
		document.myForm.grade.focus();
		return false;
	}
	if (!document.myForm.email1.value) {
		document.myForm.email1.focus();
		return false;
	}
	if (!document.myForm.email2.value) {
		document.myForm.email2.focus();
		return false;
	}
	if (!document.myForm.hp1.value) {
		document.myForm.hp1.focus();
		return false;
	}
	if (!document.myForm.hp2.value) {
		document.myForm.hp2.focus();
		return false;
	}
	if (!document.myForm.hp3.value) {
		document.myForm.hp3.focus();
		return false;
	}
	if (!document.myForm.image.value) {
		document.myForm.image.focus();
		return false;
	}
}

//이메일 선택
function selectEmailCheck() {
	if (document.myForm.email3.value == 0) {
		document.myForm.email2.focus();
	} else
		document.myForm.email2.value = document.myForm.email3.value;
}

function openAddr(){
	   daum.postcode.load(function(){
	      new daum.Postcode({
	          oncomplete: function(data) {
	                 document.getElementsByName( "zipcode" )[0].value = data.zonecode;
	                 document.getElementsByName( "address1" )[0].value = data.roadAddress;
	              }
	          }).open();
	      });
	  }
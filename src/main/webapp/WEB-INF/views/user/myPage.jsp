<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value='/resources/css/styles.css'/>" rel="stylesheet" />
</head>
<body>

	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
	<!-- Page Content-->
	<section class="py-5">
		<div class="container">
			<form id="boardForm" method="post" enctype="multipart/form-data">
			<input type="hidden" name="ADDRESS">
				<!-- Page Heading/Breadcrumbs-->
				<h1> 회원 정보 관리 </h1>
				
							
					<button class="btn selectDelete_btn btn-info btn-sm float-right" onclick="fn_update()" type="button">수정</button>
<!-- 					<button class="btn selectDelete_btn btn-danger btn-sm float-right" onclick="" type="submit">탈퇴</button> -->
		<br><br>
			<table class="table">
				<tr>
					<td>아이디</td>
					<td colspan="2">
						<div class="form-group w-25">
						<input class="form-control" id="id" name="ID" type="text" value="${member.ID}" disabled/>
						</div>
					</td>
				</tr>
				
				
				<c:if test="${empty member.k_userInfo and empty member.u_userInfo}">	
				<tr>
					<td>비밀번호</td>
					<td colspan="2"><div class="form-group w-25"><input class="form-control" id="pw"
									name="PW" type="password" value="${info.PW}" required
									data-validation-required-message="Please enter your email address." /></div></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td colspan="2"><div class="form-group w-25"><input class="form-control" id="pwChk"
									name="pwChk" type="password" required
									data-validation-required-message="Please enter your email address." /><div class="form-group w-25"></td>
				</tr>
		</c:if>
				<tr>
					<td rowspan="2">주소</td>
					<td colspan="2">
							<input type="text" class="form-control-sm" id="sample2_postcode" placeholder="우편번호">
							<input type="button" onclick="sample2_execDaumPostcode()" class="btn btn-info btn-sm" value="우편번호 찾기">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="text" name="postalCode" id="sample2_address" value="${info.ADDRESS}" placeholder="주소" >
						<input type="text" name="address2" id="sample2_detailAddress" value="${info.ADDRESS}"  placeholder="상세주소">
						<input type="text" name="addressDetail" id="sample2_extraAddress" value="${info.ADDRESS}" placeholder="참고항목">
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td colspan="2"><div class="form-group w-25"><input class="form-control" id="name"
									name="NAME" type="text" value="${info.NAME}" required
									data-validation-required-message="Please enter your email address." /></div></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td colspan="2"><div class="form-group w-25"><input class="form-control" id="contact" value="${info.CONTACT}"
									name="CONTACT" type="text" required
									data-validation-required-message="Please enter your email address." /></div></td>
				</tr>
				<tr>
					<td>휴대폰 번호</td>
					<td colspan="2"><div class="form-group w-25"><input class="form-control" id="phone"
									name="PHONE" type="text" required value="${info.PHONE}"
									data-validation-required-message="Please enter your email address." /></div></td>
				</tr>
				<tr>
					<td>이메일 주소</td>
					<td colspan="2"><div class="form-group w-25"><input class="form-control" id="email" value="${info.EMAIL}"
									name="EMAIL" type="text" required
									data-validation-required-message="Please enter your email address." /></div></td>
				</tr>
				
				
			</table>
			
						<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
						<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
						</div>
						<div id="success"></div>
                        
					</div>
			</form>
		
				
			
	</section>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="<c:url value='/resources/js/scripts.js'/>"></script>
	
	
	<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
<!-- 	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> -->
	<%@ include file="/WEB-INF/views/common/commonFunction.jsp"%>
</body>

<script>
$(document).ready(function(){
	var addressArr=$("#sample2_detailAddress").val().split(', ');

	$("#sample2_postcode").val(addressArr[0]);
	$("#sample2_address").val(addressArr[1]);
	$("#sample2_extraAddress").val(addressArr[2]);
	$("#sample2_detailAddress").val(addressArr[3]);


});

function fn_list(no) {
	//$('#currentPageNo').val(no);
	window.location='<c:url value="/signIn.do"/>';
	
	/* $('#boardForm').attr({
		action : '<c:url value="/boardList.do"/>',
		target : '_self'
	}).submit(); */
};



function fn_check() {
	var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);
	var getName = RegExp(/^[가-힣]+$/);
	var fmt = RegExp(/^\d{6}[1234]\d{6}$/); //형식 설정 
	var regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;

	if ($("#contact").val() == "") {
		alert("연락처를 입력해주세요");
		$("#contact").focus();
		return false;
	} //연락처 유효성검사
	if (!regExp.test($("#contact").val())) {
		alert("형식에 맞게 입력해주세요");
		$("#contact").val("");
		$("#contact").focus();
		return false;
	} 
	
	if ($("#phone").val() == "") {
		alert("휴대폰 번호를 입력해주세요");
		$("#phone").focus();
		return false;
	} //휴대폰 번호 유효성검사
	if (!regExp.test($("#phone").val())) {
		alert("형식에 맞게 입력해주세요");
		$("#phone").val("");
		$("#phone").focus();
		return false;
	} 
	
	//비밀번호 공백 확인 
	if ($("#pw").val() == "") {
		alert("패스워드를 입력해주세요");
		$("#pw").focus();
		return false;
	} //아이디 비밀번호 같음 확인 
	if ($("#id").val() == $("#pw").val()) {
		alert("아이디와 비밀번호가 같습니다");
		$("#pw").val("");
		$("#pw").focus();
		return false;
	} //비밀번호 유효성검사 
	if (!getCheck.test($("#pw").val())) {
		alert("형식에 맞게 입력해주세요");
		$("#pw").val("");
		$("#pw").focus();
		return false;
	} //비밀번호 확인란 공백 확인 
	if ($("#pwChk").val() == "") {
		alert("패스워드 확인란을 입력해주세요");
		$("#pwChk").focus();
		return false;
	} //비밀번호 서로확인
	if ($("#pw").val() != $("#pwChk").val()) {
		alert("비밀번호가 상이합니다");
		$("#pw").val("");
		$("#pwChk").val("");
		$("#pw").focus();
		return false;
	} //이메일 공백 확인 
	if ($("#email").val() == "") {
		alert("이메일을 입력해주세요");
		$("#email").focus();
		return false;
	} //이메일 유효성 검사 
	if (!getMail.test($("#email").val())) {
		alert("이메일형식에 맞게 입력해주세요")
		$("#email").val("");
		$("#email").focus();
		return false;
	} //이름 공백 검사 
	if ($("#name").val() == "") {
		alert("이름을 입력해주세요");
		$("#name").focus();
		return false;
	} //이름 유효성 검사 
	if (!getName.test($("#name").val())) {
		alert("이름형식에 맞게 입력해주세요")
		$("#name").val("");
		$("#name").focus();
		return false;
	}
	return true;
}

function fn_update() {
	if(fn_check()){
		//var formData = $('#boardForm').serialize();
		var wholeAddress=$("#sample2_postcode").val()+', '+$("#sample2_address").val()
		+', '+$("#sample2_extraAddress").val()
		+', '+$("#sample2_detailAddress").val();
	/* 	var wholeAddress=$("#postalCode").val()+', '+$("#address").val()+', '+$("#addressDetail").val(); */
		$("#wholeAddress").val(wholeAddress);
		$('#boardForm #id').attr('disabled',false);
		$("input[name=ADDRESS]").val(wholeAddress);
		var formData = new FormData($("#boardForm")[0]);

	$.ajax({
		url : "${pageContext.request.contextPath}/user/updateUser.do",
		type : "post",
		enctype: 'multipart/form-data',
		data : formData,
		processData : false,
		contentType : false,
		success : function(result) {
			if(result=='success')
				alert('회원정보가 수정되었습니다.');
		}, // success 

		error : function(xhr, status) {
			alert(xhr + " : " + status);
		}
	});

	}
	
}

</script>

</html>


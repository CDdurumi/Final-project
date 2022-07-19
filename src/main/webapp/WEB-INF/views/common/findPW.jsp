<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/login/findPW.css">

<script>
	$(document).ready(function(){
		
		let target_email;
		
		function ableBtn1(passwordCheck){
			
			console.log("비밀번호 찾기")
			
			if(passwordCheck == true){
				$("#reset-btn").prop("disabled", false);
			} else {
				$("#reset-btn").prop("disabled", true);
			}
		}
		
		// 이름 유효성 검사
		$("#inputName").blur(function(){
			let username = $("#inputName").val();
			let unameRegex = /^[가-힣]{2,5}$/;//2~6글자 한글
			let unameResult = unameRegex.test(username);

			if(!unameResult){
				$(".msg1").css({"color":"red", "font-family":"LeferiPoint-WhiteA", "font-size":"0.8rem", "padding-top":"1px"});
				$(".msg1").text("2~5자 한글을 입력해주세요.");
				$("#inputName").val("");
				$("#inputName").focus();

			} else{
				$(".msg1").text("");
			}
		});		
		
		
		// 이메일 유효성 검사
		$("#inputEmail").blur(function(){
			let email = $("#inputEmail").val();
			let emailRegex = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/; //이메일
			let emailResult = emailRegex.test(email);
			
			if(!emailResult){
				$(".msg2").css({"color":"red", "font-family":"LeferiPoint-WhiteA", "font-size":"0.8rem", "padding-top":"1px"});
				$(".msg2").text("이메일 형식에 맞게 입력해주세요.");
				$("#inputEmail").val("");
				$("#inputEmail").focus();

			} else{
				$(".msg2").text("");
			}
			
			
		});		
		
		
		$("#certifi-btn").on("click", function(){
			
			let name = $("#inputName").val();
			let email = $("#inputEmail").val();
			
			if((name.replace(/\s|　/gi, "").length == 0 && email.replace(/\s|　/gi, "").length == 0)){
				alert("계정 정보를 다시 확인해주세요.");
				
				$("#inputName").val("");
				$("#inputEmail").val("");
				$("#inputName").focus();
				
				return false;
				
			} 
			
			// AJAX로 데이터 전송
			$.ajax({
				url:"/login/sendCode",
				data:{name:name, email:email},
				async:false,
				type:"post"
			}).done(function(resp){
				let result = JSON.parse(resp);	
				
				// 전송 후 실패하면 취소하고 알람창 + 비워버리고 ASYNC
				if(!result){
					alert("계정 정보를 다시 확인해주세요.");
					$("#inputName").val("");
					$("#inputEmail").val("");
					$("#inputName").focus();
					
				} else {
					// 성공하면 다음 토글로 이동
					alert("메일이 전송되었습니다.");
					target_email = email;
					$("#hide-btn1").get(0).click();
					
				}
			});
		});
		
		// 인증 번호 유효성 검사
		$("#inputCode").blur(function(){
			let code = $("#inputCode").val();
			
    		let codeRegex = /^[0-9]{7}$/;
			let codeResult = codeRegex.test(code);
			
    		if(!codeResult){
				$(".msg3").css({"color":"red", "font-family":"LeferiPoint-WhiteA", "font-size":"0.8rem", "padding-top":"1px"});
				$(".msg3").text("7자리 숫자를 입력하세요.");
				$("#inputCode").val("");
				$("#inputCode").focus();
    		} else {
				$(".msg3").css({"color":"dodgerblue", "font-family":"LeferiPoint-WhiteA", "font-size":"0.8rem", "padding-top":"1px"});
				$(".msg3").text("입력완료를 누르세요");
    		}
    		
		});
		
		// 인증 번호 검사
		$("#confirm-btn").on("click", function(){
			
			let code = $("#inputCode").val();
			
			if(code.replace(/\s|　/gi, "").length == 0){
				$(".msg3").css({"color":"red", "font-family":"LeferiPoint-WhiteA", "font-size":"0.8rem", "padding-top":"1px"});
				$(".msg3").text("번호를 입력하셔야 합니다.");
				$("#inputCode").val("");
				$("#inputCode").focus();
			} 
			
			// AJAX로 데이터 전송
			$.ajax({
				url:"/login/mailAuth",
				data:{code:code, email:target_email},
				async:false,
				type:"post"
			}).done(function(resp){
				let result = JSON.parse(resp);	
				
				// 전송 후 실패하면 취소하고 알람창 + 비워버리고 ASYNC
				if(!result){
					alert("인증에 실패했습니다. 다시 시도해주세요.");
					$("#inputCode").val("");
					$("#inputCode").focus();
					
				} else {
					// 성공하면 다음 모달로 이동
					alert("인증이 완료되었습니다.");
					$("#hide-btn2").get(0).click();
					
				}
			});
		});
		////////////////////////////////////////////////////////////////////////////
	
			let passwordCheck = false;
		
			$("#reset-password").on("keyup",function(){
				let pw = $("#reset-password").val();
				let pwRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,12}$/; //영문, 숫자를 하나 이상 포함한 8~12자
				let pwResult = pwRegex.test(pw);
		
				if(!pwResult){
					$(".msg4").css({"color":"red", "font-family":"LeferiPoint-WhiteA", "font-size":"0.8rem", "padding-top":"1px"});
					$(".msg4").text("영문, 숫자를 각각 하나 이상 포함한 8~12자");
					
					passwordCheck = false;
					
					ableBtn1(passwordCheck)
				} else {
					$(".msg4").text("");
				}			
				
				if(pw.replace(/\s|　/gi, "").length == 0){
					$(".msg4").css({"color":"red", "font-family":"LeferiPoint-WhiteA", "font-size":"0.8rem", "padding-top":"1px"});
					$(".msg4").text("값을 입력하세요.");
					
					passwordCheck = false;
					
					ableBtn1(passwordCheck)
					
				} 
			});

			// 4) 비밀번호 확인 + 유효성 검사
			$("#pwChk").on("keyup",function(){
				let pw = $("#reset-password").val();
				let pwcheck = $("#pwChk").val();
				let pwcheckRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,12}$/;
				let pwcheckResult = pwcheckRegex.test(pwcheck);
				
				// 유효성 검사
				if(!pwcheckResult){
					$(".msg5").css({"color":"red", "font-family":"LeferiPoint-WhiteA", "font-size":"0.8rem", "padding-top":"1px"});
					$(".msg5").text("영문, 숫자를 각각 하나 이상 포함한 8~16자");
					
					passwordCheck = false;
					
					ableBtn1(passwordCheck)
				} 
				
				if(pwcheck.replace(/\s|　/gi, "").length == 0){
					$(".msg5").css({"color":"red", "font-family":"LeferiPoint-WhiteA", "font-size":"0.8rem", "padding-top":"1px"});
					$(".msg5").text("꼭 필요한 정보입니다.");
					
					passwordCheck = false;
					
					ableBtn1(passwordCheck)
				} 
			});
			
			$("#reset-password").on("input", function(){
				let pw = $("#reset-password").val();
				let pwcheck = $("#pwChk").val();
				
				if(pw !="" && pwcheck !=""){
				
					if(pw == pwcheck){
						$(".msg5").css({"color":"dodgerblue", "font-family":"LeferiPoint-WhiteA", "font-size":"0.8rem", "padding-top":"1px"});
						$(".msg5").text("비밀번호가 일치합니다.");
						
						passwordCheck = true;
						
						ableBtn1(passwordCheck)

					} else {
						$(".msg5").css({"color":"red", "font-family":"LeferiPoint-WhiteA", "font-size":"0.8rem", "padding-top":"1px"});
						$(".msg5").text("비밀번호가 일치하지 않습니다.");
						
						passwordCheck = false;
						
						ableBtn1(passwordCheck)
					}
				} else {
					if(pw != pwcheck){
						$(".msg5").css({"color":"red", "font-family":"LeferiPoint-WhiteA", "font-size":"0.8rem", "padding-top":"1px"});
						$(".msg5").text("비밀번호가 일치하지 않습니다.");
						
						passwordCheck = false;
						
						ableBtn1(passwordCheck)
					} 
				}
			});
			
			
			$("#pwChk").on("input", function(){
				let pw = $("#reset-password").val();
				let pwcheck = $("#pwChk").val();
				
				if(pw !="" && pwcheck !=""){
				
					if(pw == pwcheck){
						$(".msg5").css({"color":"dodgerblue", "font-family":"LeferiPoint-WhiteObliqueA", "font-size":"0.8rem", "padding-top":"1px"});
						$(".msg5").text("비밀번호가 일치합니다.");
						
						passwordCheck = true;
						
						ableBtn1(passwordCheck)

					} else {
						$(".msg5").css({"color":"red", "font-family":"LeferiPoint-WhiteObliqueA", "font-size":"0.8rem", "padding-top":"1px"});
						$(".msg5").text("비밀번호가 일치하지 않습니다.");
						
						passwordCheck = false;
						
						ableBtn1(passwordCheck)
					}
				}
			});
		
			
		$("#reset-btn").on("click", function(){
			let email = target_email;
			let pw = $("#reset-password").val();
			
			$.ajax({
				url:"/login/resetPw",
				type:"post",
				data:{pw:pw, email:target_email},
				async:false
			}).done(function(resp){
				
				if(resp == "1"){
					alert("비밀번호 변경이 완료되었습니다.");
					$("#hide-btn3").get(0).click();
				}
				
			});
			
		});
		
		
		
		////////////////////////////////////////////////////////////////////////////
		
		// ______________모달 종료 시 입력값 초기화
		$('.modal').on('hidden.bs.modal', function(e) { // 모달 클래스에 .modal이 있는지 꼭 확인
		    console.log('modal close'); // 'hidden.bs.modal' => 부트스트랩 모달 이벤트, 모달이 사라지면 작동함

		    // 초기화 로직 : 아래에 초기화할 대상을 모두 적으면 됨.
		    
		    // 전체 텍스트 인풋 초기화
		    if($(this).find('form').length >0){
		    	$(this).find('form')[0].reset();
		   		var inputValue = $(this).find('select:eq(0) option:eq(0)');
		    }
		    
		    // CSS 초기화
			$(".msg1").text("");
			$(".msg2").text("");
			$(".msg3").text("");
			$(".msg4").text("");
			
		    // 셀렉트 초기화 - 선택된 거 초기화
		    $('.select2').val(0).trigger('change.select2');

		    console.log('모달 초기화', inputValue)
		});
		
	});
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 1) 입력 모달 -->
	<div class="modal fade" id="find-pw-toggle" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content pw-input-box">
				<form id="certifi-data" method="post">

					<div class="modal-header t-auto" style="border-bottom: none; padding-bottom: 0px;" id="login-header">

						<h2>비밀번호 찾기</h2>

					</div>


					<div class="modal-body">

						<div class="input-data-box mt-3">
							<input type="text" name="name" id="inputName" required> <label id="pw">가입 시 이름</label>
						</div>
						
						<div class="d-flex msg-box">
							<div class="ms-auto msg1" style="height:20.2px;">
							
							</div>
						</div>
						
						
						<div class="input-data-box">
							<input type="text" name="email" id="inputEmail" required> <label id="id">가입한 이메일</label>
						</div>
						
						<div class="d-flex msg-box">
							<div class="ms-auto msg2" style="height:20.2px;">
							
							</div>
						</div>						
						
					</div>

					<div class="modal-footer d-flex" style="border-top: none;">
					
						<button type="button" id="certifi-btn" class="ms-auto" style="background:white;">
							인증하기
						</button> 

						<a id="hide-btn1" style="display:none;" class="ms-auto" style="background:white;" data-bs-target="#input-code-modal" data-bs-toggle="modal"></a> 
					</div>
				</form>
			</div>
		</div>
	</div>

<!-- 2) 인증번호 모달 : input-code-modal -->	

	<div class="modal fade" id="input-code-modal" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content pw-code-box">
				<form id="certifi-data" method="post">

					<div class="modal-header t-auto" style="border-bottom: none; padding-bottom: 0px;" id="login-header">

						<h2>인증번호 입력</h2>

					</div>


					<div class="modal-body">

						<div class="input-data-box mt-3">
							<input type="text" name="code" id="inputCode" required> <label id="code">인증번호를 입력하세요.</label>
						</div>
						
						<div class="d-flex msg-box">
							<div class="ms-auto msg3" style="height:20.2px;">
							
							</div>
						</div>
						
					</div>

					<div class="modal-footer d-flex" style="border-top: none;">
					
						<button id="confirm-btn" type="button" class="ms-auto" style="background:white;">
							입력완료
						</button> 
						
						<a id="hide-btn2" style="display:none;" class="ms-auto" style="background:white;" data-bs-target="#pw-reset-modal" data-bs-toggle="modal"></a> 
					</div>
				</form>
			</div>
		</div>
	</div>

<!-- 3) 재설정 모달 -->

	<div class="modal fade" id="pw-reset-modal" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content pw-reset-box">
				<form id="certifi-data" method="post">

					<div class="modal-header t-auto" style="border-bottom: none; padding-bottom: 0px;" id="login-header">

						<h2>비밀번호 재설정</h2>

					</div>


					<div class="modal-body">

						<div class="input-data-box mt-3">
							<input type="password" name="pw" id="reset-password" required> <label id="pw1">새로운 비밀번호를 입력하세요.</label>
						</div>
						
						<div class="d-flex msg-box">
							<div class="ms-auto msg4" style="height:20.2px;">
							
							</div>
						</div>
						
						<div class="input-data-box mt-3">
							<input type="password" name="pwChk" id="pwChk" required> <label id="pw2">비밀번호 확인</label>
						</div>
						
						<div class="d-flex msg-box">
							<div class="ms-auto msg5" style="height:20.2px;">
							
							</div>
						</div>
						
					</div>

					<div class="modal-footer d-flex" style="border-top: none;">
					
						<button id="reset-btn" type="button" class="ms-auto" style="background:white;" disabled>
							재설정 완료
						</button> 
						
						<a id="hide-btn3" style="display:none;" class="ms-auto" style="background:white;" data-bs-target="#login-toggle" data-bs-toggle="modal"></a> 
					</div>
				</form>
			</div>
		</div>
	</div>






</body>
</html>
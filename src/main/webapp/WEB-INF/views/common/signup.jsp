<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="/css/login/signup.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>

	<script>
		$(document).ready(function(){
			let input_email; // 장난질 못하게 하는 용도
			// 0. 입력 정보를 활성화할 배열 선언
			const dataCheckArr = [false, false, false, false, false, false];
			
			// 1. 유효성 검사 - 포커스를 잃을 때마다 검사 후 통과되면 배열 결과 저장

			// 1) 유저명
			$("#username").blur(function(){
				let username = $("#username").val();
				let unameRegex = /^[가-힣]{2,5}$/;//2~6글자 한글
				let unameResult = unameRegex.test(username);
				console.log(unameResult);

				if(!unameResult){
					$(this).next(".notice_box").css("color", "red");
					$(this).next(".notice_box").text("2~5자 한글을 입력해주세요.");
					$(this).val("");
					$(this).focus();
					dataCheckArr[0] = false;

				} else{
					$(this).next(".notice_box").text("");
					dataCheckArr[0] = true;
					console.log("첫번째 요소 : " + dataCheckArr[0]);
				}

				if(username.replace(/\s|　/gi, "").length == 0){
					$(this).next(".notice_box").css("color", "red");
					$(this).next(".notice_box").text("꼭 필요한 정보입니다.");
					$(this).val("");
					$(this).focus();	
					dataCheckArr[0] = false;
				} 
			});
			
			// 2) 이메일
			$("#email").blur(function(){
				let email = $("#email").val();
				let emailRegex = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/; //이메일
				let emailResult = emailRegex.test(email);
		
				if(!emailResult){
					$(this).next().next().text("");
					$(this).next().next().css("color", "red");
					$(this).next().next().text("이메일 형식에 맞게 입력해주세요.");
					$(this).val("");
					$(this).focus();
					dataCheckArr[1] = false;
					$("#mailCheck").prop("disabled", true);
					
				} else{
					$("#mailCheck").prop("disabled", false)
					$(this).next().next().css("color", "dodgerblue");
					$(this).next().next().text("인증 보내기를 눌러주세요.");
					
					input_email = email; // 여기다가 백업 시킴
				
				}
				if(email.replace(/\s|　/gi, "").length == 0){
					$(this).next().next().css("color", "red");
					$(this).next().next().text("");
					$(this).next().next().text("꼭 필요한 정보입니다.");
					$(this).val("");
					$(this).focus();	
					dataCheckArr[1] = false;
					$("#mailCheck").prop("disabled", true);
				} 
			});

			// 3) 비밀번호
			$("#password1").on("keyup",function(){
				let pw = $("#password1").val();
				let pwRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,12}$/; //영문, 숫자를 하나 이상 포함한 8~12자
				let pwResult = pwRegex.test(pw);
		
				if(!pwResult){
					$(this).next().css("color", "red");
					$(this).next().text("영문, 숫자를 각각 하나 이상 포함한 8~12자");
					dataCheckArr[2] = false;
				} else{
					$(this).next().text("");

					dataCheckArr[2] = true;
					console.log("세번째 요소: " + dataCheckArr[2]);
				}
				if(pw.replace(/\s|　/gi, "").length == 0){
					$(this).next().text("");
					dataCheckArr[2] = false;
				} 
			});

			// 4) 비밀번호 확인 + 유효성 검사
			$("#password2").on("keyup",function(){
				let pw = $("#password1").val();
				let pwcheck = $("#password2").val();
				let pwcheckRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,12}$/;
				let pwcheckResult = pwcheckRegex.test(pwcheck);
				
				// 유효성 검사
				if(!pwcheckResult){
					$(this).next().css("color", "red");
					$(this).next().text("영문, 숫자를 각각 하나 이상 포함한 8~16자");
					dataCheckArr[3] = false;
				} 
				
				if(pwcheck.replace(/\s|　/gi, "").length == 0){
					$(this).next().text("꼭 필요한 정보입니다.");
					dataCheckArr[3] = false;
				} 
			});
			
			$("#password1").blur(function(){
				let pw = $("#password1").val();
				let pwcheck = $("#password2").val();
				
				if(pw !="" && pwcheck !=""){
				
					if(pw == pwcheck){
						$("#password2").next().css("color", "dodgerblue");
						$("#password2").next().text("비밀번호가 일치합니다.");

						dataCheckArr[3] = true;
						console.log("네번째 요소: " + dataCheckArr[3]);
					} else {
						dataCheckArr[3] = false;
						$("#password2").next().css("color", "red");
						$("#password2").next().text("비밀번호가 일치하지 않습니다.");
					}
				}
			});
			
	
			
			
			$("#password2").blur(function(){
				let pw = $("#password1").val();
				let pwcheck = $("#password2").val();
				
				if(pw !="" && pwcheck !=""){
				
					if(pw == pwcheck){
						$(this).next().css("color", "dodgerblue");
						$(this).next().text("비밀번호가 일치합니다.");

						dataCheckArr[3] = true;
						console.log("네번째 요소: " + dataCheckArr[3]);
					} else {
						dataCheckArr[3] = false;
						$(this).next().css("color", "red");
						$(this).next().text("비밀번호가 일치하지 않습니다.");
					}
				}
			});

			// 5) 닉네임 유효성 검사	
			$("#nickname").blur(function(){
				let nickname = $("#nickname").val();
				let nicknameRegex = /^[a-z0-9가-힣]{2,10}$/; //영어 소문자, 숫자 2~10글자
				let nicknameResult = nicknameRegex.test(nickname);
		
				if(!nicknameResult){
					$(this).next().css("color", "red");
					$(this).next().text("2~10자(영문 소문자,숫자)를 입력하세요.");
					$("#nickname").val("");
					$("#nickname").focus();
					dataCheckArr[4] = false;
				} else {
					$.ajax({
						url:"/signup/nickNameCheck",
						type:"get",
						data:{nickname:nickname}
					}).done(function(resp){
						let result = JSON.parse(resp);
						console.log("AJAX 결과: "+result);
						
						if(result == true){
							$("#nickname").next().css("color", "red");
							$("#nickname").next().text("이미 사용중인 닉네임입니다.");
							$("#nickname").val("");
							dataCheckArr[4] = false;
						}else{
							$("#nickname").next().css("color", "dodgerblue");
							$("#nickname").next().text("사용 가능한 닉네임입니다.");
							dataCheckArr[4] = true;
							console.log("다섯 번째 요소: " + dataCheckArr[4]);
					 	}
					});

				}
					if(nickname.replace(/\s|　/gi, "").length == 0){
						$(this).next().css("color", "red");
						$(this).next().text("꼭 필요한 정보입니다.");
						$("#nickname").focus();
						dataCheckArr[4] = false;
					} 		
			});

			// 연락처 유효성 검사
			$("#phone").on("keyup",function(){
				let phone = $("#phone").val();
	    		let phoneRegex = /^010[0-9]{8}$/; //핸드폰 11자리
				let phoneResult = phoneRegex.test(phone);
				if(!phoneResult){
					$(this).next().css("color", "red");
					$(this).next().text("휴대폰번호 11자리를 작성해주세요.('-'미포함)");
					dataCheckArr[5] = false;

				} else{
					$(this).next().text("");
					dataCheckArr[5] = true;
					console.log("여섯 번째 요소: " + dataCheckArr[3]);
					console.log(dataCheckArr);
				}
				if(phone.replace(/\s|　/gi, "").length == 0){
					$(this).next().css("color", "red");
					$(this).next().text("연락처를 입력해주세요.");
					
					dataCheckArr[5] = false;
				} 
			});
			
			// 2-2. 메일 인증 - Ajax { 중복 확인 + 메일 전송 } API로그인 시에는 정보 받아오는 과정에서 진행
			$("#mailCheck").on("click", function(){
				let email = $("#email").val();
				
				$.ajax({
					url:"/signup/sendCode",
					type:"get",
					data:{email:email}
				}).done(function(resp){
					let result = JSON.parse(resp);
					if(result){
						$("#email").next().next().text("인증 번호가 전송되었습니다.");
						$("#signup-box").css("height", "800px");
						$("#mail_box").css("display", "block");
					} else {
						$("#email").next().next().text("이미 존재하는 이메일입니다.");
						$("#email").next().next().css("color", "red");
						$("#email").val("");
						$("#email").focus();
					}
				});
			});
			
			// 3. 회원 가입 활성화
			// (1) 인증코드 유효성 검사 keyup - send_code 버튼 활성화
			$("#mail_code").on("keyup", function(){
				let code = $("#mail_code").val();
				console.log(code);
				
	    		let codeRegex = /^[0-9]{7}$/;
				let codeResult = codeRegex.test(code);
				
	    		if(!codeResult){
	    			$(this).next().next().css("color", "red");
					$(this).next().next().text("7자리 숫자만 입력하세요.");
	    			$("#send_code").prop("disabled", true);
	    			$("#send_code").css("background", "#a6a6a6");
	    		} else {
	    			$(this).next().next().css("color", "dodgerblue");
					$(this).next().next().text("계정 인증을 누르세요.");
	    			$("#send_code").prop("disabled", false);
	    			$("#send_code").css("background", "#16a085");
	    			
	    		}
	    		
				if(code.replace(/\s|　/gi, "").length == 0){
					$(this).next().next().text("입력하셔야 인증이 가능합니다.");
					$(this).next().next().css("color", "red");
	    			$("#send_code").prop("disabled", true);
	    			$("#send_code").css("background", "#a6a6a6");
				} 
			});
			
			
			// (2) 인증코드 확인 후, 배열 true, mail_box 초기화
			$("#send_code").on("click", function(){
				let code = $("#mail_code").val();
				let email = input_email;
				
				$.ajax({
					url:"/signup/mailAuth",
					type: "get",
					data:{code:code, email:email}
				}).done(function(resp){
					let result = JSON.parse(resp);
					
					if(resp){
						alert("인증되었습니다.")
						dataCheckArr[1] = true; // 메일 인증 완료 
						
						// 인증코드 입력란 초기화 - 계속 인증 할 사람들 대비 예정
						$("#mail_code").val("");
						
						// 버튼 초기화
						$("#send_code").prop("disabled", true);
	    				$("#send_code").css("background", "#a6a6a6");
						
						
						$("#signup-box").css("height", "740px");
						$("#mail_box").css("display", "none");
						
						
						console.log("두번째 요소: " + dataCheckArr[1]); // 삭제 예정
						console.log(dataCheckArr); // 삭제 예정
						
					} else{
						alert("SNS 로그인(카카오, 구글)으로 가입된 계정은 가입이 불가능합니다.")
						dataCheckArr[1] = false; // 메일 인증 완료 
						
						// 인증코드 입력란 초기화 - 계속 인증 할 사람들 대비 예정
						$("#mail_code").val("");
						
						// 버튼 초기화
						$("#send_code").prop("disabled", true);
	    				$("#send_code").css("background", "#a6a6a6");
						
						
						$("#signup-box").css("height", "740px");
						$("#mail_box").css("display", "none");
						
						
						console.log("두번째 요소: " + dataCheckArr[1]); // 삭제 예정
						console.log(dataCheckArr); // 삭제 예정
						
					}
				});
			});
			
			
			// 4. 데이터 전송 후 로그인 처리- Ajax
			// (1) 회원가입 버튼 활성화
			$("#signup-box").mouseover(function(){
				console.log("회원가입 이벤트 발생")
				
				let true_stack = 0;
				
				for(i=0; i<dataCheckArr.length; i++){
					
					if(dataCheckArr[i]==true){
						
						true_stack++;
						
					}
				}
				
				if(true_stack == 6){
					$("#sign-submit").prop("disabled", false);
					$("#sign-submit").css("background", "#16a085");
				} else {
					$("#sign-submit").prop("disabled", true);
					$("#sign-submit").css("background", "#a6a6a6");
				}
			});
		
			
		});
	</script>


</head>
<body>

	<!-- 회원가입 -->
	<div class="modal fade" id="signup-toggle" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div id="signup-box" class="modal-content left" style="width:900px;">
					
					<!-- 회원가입 부분 : 미디어 쿼리로 모바일에서 padding-left 간격 줄이기 -->
					
					<div class="modal-header" style="border-bottom: none; padding:3rem 1rem 0rem 2rem;">
						<h1>회원가입</h1>
					</div>
					
					<div class="modal-body" style="text-align:center; padding-bottom: 1rem; padding-left: 1rem; padding-right: 1rem;">
						<form action="/signup/insertMember" method="post">
							<input id="username" class="sign-form" type="text" name="name" placeholder="이름" /> 
							<div class="notice_box"></div>
							
							<input id="email" type="text" class="sign-form" name="email" placeholder="이메일" style="width:240px;"/> <button type="button" id="mailCheck" disabled>인증번호 보내기</button>
							<div class="notice_box">아이디 비밀번호 분실시 필요한 정보이므로, 정확하게 기입해주세요.</div> <!-- 기본 블루 -->
							
							<!-- 인증번호 보내기에 성공하면 보임 -->
							<div id="mail_box">
								<input id="mail_code" class="sign-form" type="text" placeholder="전송된 번호를 입력하세요"/> <button type="button" id="send_code" disabled>계정 인증</button> 
								<div class="text_box"></div>
							</div>
							
							<input id="password1" type="password" class="sign-form" name="password" placeholder="비밀번호" /> 
							<div class="notice_box"></div>
							
							<input id="password2" type="password" class="sign-form" placeholder="비밀번호 확인" />
							<div class="notice_box"></div>
							
							<input id="nickname" type="text"  class="sign-form" name="nickname" placeholder="닉네임" />
							<div class="notice_box"></div>
							
							<input id="phone" type="text" class="sign-form" name="phone" placeholder="사용하시는 연락처 ('-'미포함)" />
							<div class="notice_box"></div>


							<button id="sign-submit" type="submit" disabled>회원가입</button>
						</form>
					</div>
					
					<!-- 소셜 로그인 부분 -->
					<div class="modal-footer" style="justify-content: center; border-top: 2.5px; padding:0px;">

					</div>

			</div>
		</div>
	</div>


</body>
</html>
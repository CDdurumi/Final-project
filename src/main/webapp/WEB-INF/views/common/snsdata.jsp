<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="/css/login/snsdata.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>

	<script>
		$(document).ready(function(){
			// 0. 입력 정보를 활성화할 배열 선언
			const kakao_dataCheckArr = [false, false, false];
			
			// 1. 유효성 검사 - 포커스를 잃을 때마다 검사 후 통과되면 배열 결과 저장

			// 1) 유저명
			$("#kakao-username").blur(function(){
				let username = $("#kakao-username").val();
				let unameRegex = /^[가-힣]{2,5}$/;//2~6글자 한글
				let unameResult = unameRegex.test(username);
				console.log(unameResult);

				if(!unameResult){
					$(this).next(".notice_box").css("color", "red");
					$(this).next(".notice_box").text("2~5자 한글을 입력해주세요.");
					$(this).val("");
					$(this).focus();
					kakao_dataCheckArr[0] = false;

				} else{
					$(this).next(".notice_box").text("");
					kakao_dataCheckArr[0] = true;
					console.log("첫번째 요소 : " + kakao_dataCheckArr[0]);
				}

				if(username.replace(/\s|　/gi, "").length == 0){
					$(this).next(".notice_box").css("color", "red");
					$(this).next(".notice_box").text("꼭 필요한 정보입니다.");
					$(this).val("");
					$(this).focus();	
					kakao_dataCheckArr[0] = false;
				} 
			});
		
			// 2) 닉네임 유효성 검사	
			$("#kakao-nickname").blur(function(){
				let nickname = $("#kakao-nickname").val();
				let nicknameRegex = /^[a-z0-9가-힣]{2,10}$/; //영어 소문자, 숫자 2~10글자
				let nicknameResult = nicknameRegex.test(nickname);
		
				if(!nicknameResult){
					$(this).next().css("color", "red");
					$(this).next().text("2~10자(영문 소문자,숫자)를 입력하세요.");
					$("#kakao-nickname").val("");
					$("#kakao-nickname").focus();
					kakao_dataCheckArr[1] = false;
				} else {
					$.ajax({
						url:"/signup/nickNameCheck",
						type:"get",
						data:{nickname:nickname}
					}).done(function(resp){
						let result = JSON.parse(resp);
						console.log("AJAX 결과: "+result);
						
						if(result == true){
							$("#kakao-nickname").next().css("color", "red");
							$("#kakao-nickname").next().text("이미 사용중인 닉네임입니다.");
							$("#kakao-nickname").val("");
							kakao_dataCheckArr[1] = false;
						}else{
							$("#kakao-nickname").next().css("color", "dodgerblue");
							$("#kakao-nickname").next().text("사용 가능한 닉네임입니다.");
							kakao_dataCheckArr[1] = true;
							console.log("다섯 번째 요소: " + kakao_dataCheckArr[1]);
					 	}
					});

				}
					if(nickname.replace(/\s|　/gi, "").length == 0){
						$(this).next().css("color", "red");
						$(this).next().text("꼭 필요한 정보입니다.");
						$("#kakao-nickname").focus();
						kakao_dataCheckArr[1] = false;
					} 		
			});

			// 연락처 유효성 검사
//			$("#kakao-phone").on("keyup",function(){
//				let phone = $("#kakao-phone").val();
//	    		let phoneRegex = /^010[0-9]{8}$/; //핸드폰 11자리
//				let phoneResult = phoneRegex.test(phone);
//				if(!phoneResult){
//					$(this).next().css("color", "red");
//					$(this).next().text("휴대폰번호 11자리를 작성해주세요.('-'미포함)");
//					kakao_dataCheckArr[2] = false;

//				} else{
//					$(this).next().text("");
//					kakao_dataCheckArr[2] = true;
//					console.log("두 번째 요소: " + kakao_dataCheckArr[2]);
//					console.log(kakao_dataCheckArr);
//				}
//				if(phone.replace(/\s|　/gi, "").length == 0){
//					$(this).next().css("color", "red");
//					$(this).next().text("연락처를 입력해주세요.");
					
//					kakao_dataCheckArr[2] = false;
//				} 
//			});
			
			$("#kakao-phone").blur(function(){
				let phone = $("#kakao-phone").val();
	    		let phoneRegex = /^010[0-9]{8}$/; //핸드폰 11자리
				let phoneResult = phoneRegex.test(phone);
		
				if(!phoneResult){
					$(this).next().css("color", "red");
					$(this).next().text("휴대폰번호 11자리를 작성해주세요.('-'미포함)");
					kakao_dataCheckArr[2] = false;
				} else {
					$.ajax({
						url:"/login/phoneCheck",
						type:"get",
						data:{phone:phone}
					}).done(function(resp){
						let result = JSON.parse(resp);
						console.log("AJAX 결과: "+result);
						
						if(result == true){
							$("#kakao-phone").next().css("color", "red");
							$("#kakao-phone").next().text("이미 가입된 연락처입니다.");
							$("#kakao-phone").val("");
							kakao_dataCheckArr[2] = false;
						}else{
							$("#kakao-phone").next().css("color", "dodgerblue");
							$("#kakao-phone").next().text("사용 가능한 연락처입니다.");
							kakao_dataCheckArr[2] = true;
							console.log("두 번째 요소: " + kakao_dataCheckArr[2]);
					 	}
					});

				}
					if(phone.replace(/\s|　/gi, "").length == 0){
						$(this).next().css("color", "red");
						$(this).next().text("연락처를 입력해주세요.");
						$("#kakao-phone").focus();
						kakao_dataCheckArr[2] = false;
					} 		
			});
			
			// 3. 정보입력 활성화

			// 4. 데이터 전송 후 로그인 처리- Ajax
			// (1) 회원가입 버튼 활성화
			$("#sns-box").mouseover(function(){
				console.log("정보입력 이벤트 발생")
				
				let true_stack = 0;
				
				for(i=0; i<kakao_dataCheckArr.length; i++){
					
					if(kakao_dataCheckArr[i]==true){
						
						true_stack++;
						
					}
				}
				
				if(true_stack == 3){
					$("#kakao-data-submit").prop("disabled", false);
					$("#kakao-data-submit").css("background", "#16a085");
				} else {
					$("#kakao-data-submit").prop("disabled", true);
					$("#kakao-data-submit").css("background", "#a6a6a6");
				}
			});
		
			
		});
	</script>


</head>
<body>

	<!-- 회원가입 -->
	<div class="modal fade" id="sns-toggle" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div id="sns-box" class="modal-content left" style="width:900px;">
					
					<!-- 회원가입 부분 : 미디어 쿼리로 모바일에서 padding-left 간격 줄이기 -->
					
					<div class="modal-header" style="border-bottom: none; padding:3rem 1rem 0rem 2rem;">
						<h1>추가 정보</h1>
					</div>
					
					<div class="modal-body" style="text-align:center; padding-bottom: 1rem; padding-left: 1rem; padding-right: 1rem;">
						<form action="/login/insertData" method="post">
							<input id="kakao-username" class="data-form" type="text" name="name" placeholder="이름" /> 
							<div class="notice_box"></div>
							
							<input id="kakao-email" type="text" class="data-form" name="email" placeholder="이메일" readonly/> 
							<div class="notice_box"></div> <!-- 기본 블루 -->
							
							<input id="kakao-nickname" type="text"  class="data-form" name="nickname" placeholder="닉네임" />
							<div class="notice_box"></div>
							
							<input id="kakao-phone" type="text" class="data-form" name="phone" placeholder="사용하시는 연락처 ('-'미포함)" />
							<div class="notice_box"></div>
							
							<input id="kakao-img" type="hidden" class="data-form" name="profile_img">
							<button id="kakao-data-submit" type="submit" disabled>DOWA 시작</button>
						</form>
					</div>
			</div>
		</div>
	</div>


</body>
</html>
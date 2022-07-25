<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/login/findEmail.css">

<script>
	$(document).ready(function(){
		
		// 이름 유효성 검사
		$("#input-name").blur(function(){
			let username = $("#input-name").val();
			let unameRegex = /^[가-힣]{2,5}$/;//2~6글자 한글
			let unameResult = unameRegex.test(username);

			if(!unameResult){
				$(".message1").css({"color":"red", "font-family":"LeferiPoint-WhiteA", "font-size":"0.8rem", "padding-top":"1px"});
				$(".message1").text("2~5자 한글을 입력해주세요.");
				$("#input-name").val("");
				$("#input-name").focus();

			} else{
				$(".message1").text("");
			}
			
			if(username.replace(/\s|　/gi, "").length == 0){
				$(".message1").css({"color":"red", "font-family":"LeferiPoint-WhiteA", "font-size":"0.8rem", "padding-top":"1px"});
				$(".message1").text("2~5자 한글을 입력해주세요.");
				$("#input-name").val("");
				$("#input-name").focus();
			} 
		});
		
		
		// 핸드폰 유효성 검사
		$("#input-phone").blur(function(){
			let phone = $("#input-phone").val();
	    	let phoneRegex = /^010[0-9]{8}$/; //핸드폰 11자리
			let phoneResult = phoneRegex.test(phone);
			if(!phoneResult){
				$(".message2").css({"color":"red", "font-family":"LeferiPoint-WhiteA", "font-size":"0.8rem", "padding-top":"1px"});
				$(".message2").text("휴대폰번호 11자리를 작성해주세요.('-'미포함)");
				$("#input-phone").val("");
				$("#input-phone").focus();

			} else{
				$(".message2").text("");
			}
			
			
		});
		
		
		// 서브밋 전 데이터 유무 검사
		$("#submit-btn").on("click", function(){
			let name = $("#input-name").val();
			let phone = $("#input-phone").val();
			
			if(name.replace(/\s|　/gi, "").length == 0){
				$(".message1").css({"color":"red", "font-family":"LeferiPoint-WhiteA", "font-size":"0.8rem", "padding-top":"1px"});
				$(".message1").text("2~5자 한글을 입력해주세요.");
				$("#input-name").val("");
				$("#input-name").focus();
				
				return false;
			} 
			
			if(phone.replace(/\s|　/gi, "").length == 0){
				$(".message2").css({"color":"red", "font-family":"LeferiPoint-WhiteA", "font-size":"0.8rem", "padding-top":"1px"});
				$(".message2").text("휴대폰번호 11자리를 작성해주세요.('-'미포함)");
				$("#input-phone").val("");
				$("#input-phone").focus();
				
				return false;
			} 
			
			
			$.ajax({
				url:"/login/findEmail",
				type:"post",
				data:{name:name, phone:phone}
			}).done(function(resp){
				let result = resp;
				
				if(result == "none"){
					$("#input-name").val("");
					$("#input-phone").val("");
					alert("존재하는 계정이 없습니다. 입력 정보를 확인하세요");
				} else {
					
					$(".user-box1").css("display", "none")
					$(".msg-box").css("display", "none")
					$("#submit-btn").css("display", "none")
					
					$(".result-email-box").css("display", "block");
					$(".go-to-login").css("display", "block");
					$("#result-email").text(resp);
					
					
				}
			});
		});
		
		// ______________모달 종료 시 입력값 초기화
		$('.modal').on('hidden.bs.modal', function(e) {

		    // 텍스트 인풋 초기화
		    if($(this).find('form').length >0){
		    	$(this).find('form')[0].reset();
		   		var inputValue = $(this).find('select:eq(0) option:eq(0)');
		    }
		    
		    // CSS 초기화
			$(".user-box1").css("display", "block")
			$(".msg-box").css("display", "block")
			$("#submit-btn").css("display", "block")
					
			$(".result-email-box").css("display", "none");
			$(".go-to-login").css("display", "none");
			$("#result-email").text("");
			
			$(".message1").text("");
			$(".message2").text("");
			
		    // 셀렉트 초기화
		    $('.select2').val(0).trigger('change.select2');
		});
		
			
	});
	
		
</script>




<meta charset="UTF-8">
<title>Find-Email</title>
</head>
<body>

	<div class="modal fade" id="find-email-toggle" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content find-email-box">
				<form id="login-data" action="/login" method="post">

					<div class="modal-header t-auto" style="border-bottom: none; padding-bottom: 0px;" id="login-header">

						<h2>Email 찾기</h2>

					</div>


					<div class="modal-body">
						<div class="user-box1">
							<input type="text" name="name" id="input-name" required> <label id="id">가입 시 이름</label>
						</div>
						
						<div class="d-flex msg-box">
							<div class="ms-auto message1" style="height:20.2px;">
							
							</div>
						</div>

						<div class="user-box1 mt-4">
							<input type="text" name="phone" id="input-phone" required> <label id="pw">가입 시 연락처</label>
						</div>
						
						<div class="d-flex msg-box">
							<div class="ms-auto message2" style="height:20.2px;">
							
							</div>
						</div>
						
						<div class="result-email-box">
								<p>찾으시는 이메일은 다음과 같습니다.</p><br>
								<p id="result-email">gods11077@naver.com</p>
						</div>
					</div>

					<div class="modal-footer d-flex" style="border-top: none;">
					
						<button type="button" id="submit-btn" class="ms-auto" style="background:white;">
							Submit
						</button> 
						
						<a id="submit-btn" class="ms-auto go-to-login" style="display:none; background:white;" data-bs-target="#login-toggle" data-bs-toggle="modal" >
							Login
						</a> 
				
					</div>
				</form>
			</div>
		</div>
	</div>










</body>
</html>
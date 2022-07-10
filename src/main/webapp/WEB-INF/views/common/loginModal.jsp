<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/login/loginModal.css">


<script>
	$(document).ready(function(){
		
		// 아이디 저장 옵션
	     fnInit();
	         
	     function fnInit(){
	         var cookieid = getCookie("saveid");
	         console.log(cookieid);
	         if(cookieid !=""){
	             $(".saveId").prop("checked", true);
	             $('#inputId').val(cookieid);
	         }
	         
	     }  
		
		
	     function saveid() {
	         console.log("saveid실행")
	         var expdate = new Date();
	         if ($(".saveId").is(":checked")){
	             expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30);
	             setCookie("saveid", $("#inputId").val(), expdate);
	             }else{
	            expdate.setTime(expdate.getTime() - 1000 * 3600 * 24 * 30);
	             setCookie("saveid", $("#inputId").val(), expdate);
	              
	         }
	     }
	     
	     function setCookie(name, value, expiredays) {
	         var todayDate = new Date();
	         todayDate.setTime(todayDate.getTime() + 0);
	         if(todayDate > expiredays){
	             document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expiredays + ";";
	         }else if(todayDate < expiredays){
	             todayDate.setDate(todayDate.getDate() + expiredays);
	             document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
	         }
	         
	         
	         console.log(document.cookie);
	     }
		
	     function getCookie(Name) {
	         var search = Name + "=";
	         console.log("search : " + search);
	         
	         if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면 
	             offset = document.cookie.indexOf(search);
	             console.log("offset : " + offset);
	             if (offset != -1) { // 쿠키가 존재하면 
	                 offset += search.length;
	                 // set index of beginning of value
	                 end = document.cookie.indexOf(";", offset);
	                 console.log("end : " + end);
	                 // 쿠키 값의 마지막 위치 인덱스 번호 설정 
	                 if (end == -1)
	                     end = document.cookie.length;
	                 console.log("end위치  : " + end);
	                 
	                 return unescape(document.cookie.substring(offset, end));
	             }
	         }
	         return "";
	     }
		

		$("#login-data").submit(function(){
			
			var rtn = true;
			
			let email = $("#inputId").val();
			let pw = $("#inputPw").val();
			
			// 정규표현식
			let emailRegex = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/; //이메일
			let emailResult = emailRegex.test(email);
			
			let pwRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,12}$/; //영문, 숫자를 하나 이상 포함한 8~12자
			let pwResult = pwRegex.test(pw);
			
			
			// 조건식
			if(!emailResult){
				
				alert("이메일을 다시 확인해주세요.");
				
				$("#inputId").val("");
				$("#inputId").focus();
				
				return false;
				
			} 
			
			if(!pwResult){
				
				alert("비밀번호 형식이 맞지 않습니다.(영문, 숫자 포함 8~12자)");
				
				$("#inputPw").val("");
				$("#inputPw").focus();
				
				return false;
			}
			
			// 계정 정보 확인
			
			$.ajax({
				url:"/login/accountCheck",
				type:"post",
				async:false,
				data:{email:email, pw:pw}
			}).done(function(resp){
				let result = JSON.parse(resp);
				
				if(!result){
					
					alert("계정 정보를 다시 확인해주세요");
					
					rtn = false;
					
				}
			});
			
	        saveid();
	        
			return rtn;
			
		});
	});
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 로그인 -->
	<div class="modal fade" id="login-toggle" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content login-box">
				<form id="login-data" action="/login/login" method="post">

					<div class="modal-header t-auto" style="border-bottom: none; padding-bottom: 0px;" id="login-header">

						<h2>Dowa Login</h2>

					</div>


					<div class="modal-body">

						<div class="user-box">
							<input type="text" name="email" id="inputId" required> <label
								id="id">Email</label>
						</div>
						
						<div class="d-flex">
							<div class="form-check">
								<input class="form-check-input saveId" type="checkbox" value=""
									id="flexCheckDefault" style="margin-top: 5px;"> <label
									class="form-check-label" for="flexCheckDefault"
									style="font-size: 15px; color: black; margin-top: 4px;">
									아이디 기억하기 </label>
							</div>
							<div class="ms-auto">
								<a class="find" data-bs-target="#find-email-toggle" data-bs-toggle="modal">아이디 찾기</a>
							</div>
						</div>

						<div class="user-box mt-3">
							<input type="password" name="pw" id="inputPw" required>
							<label id="pw">Password</label>
						</div>
						
						<div class="d-flex">
							<div>
								<a class="find" data-bs-target="#signup-toggle" data-bs-toggle="modal">회원가입</a>
							</div>
							<div class="ms-auto">
								<a class="find" data-bs-target="#find-pw-toggle" data-bs-toggle="modal">비밀번호 찾기</a>
							</div>
						</div>
					</div>

					<div class="modal-footer d-flex" style="border-top: none;">
					
						<a><img alt="" src="/img/naver.png"></a> 
						<a><img alt="" src="/img/kakao.png"></a> 
						
						<button type="submit" id="submit" class="ms-auto" style="background:white;">
							Submit
						</button> 
				


					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 회원가입 모달 -->
	<%@ include file="signup.jsp" %>
	
	<!-- ID 찾기 모달 -->
	<%@ include file="findEmail.jsp" %>
	
	<!-- PW 찾기 모달 -->
	<%@ include file="findPW.jsp" %>

	<script type="text/javascript">
		$("#inputId").focus(function() {
			$("#id").text("Email (예 : dowa@gmail.com)");
		});

		$("#inputId").blur(function() {
			$("#id").text("Email");
		});

		$("#inputPw").focus(function() {
			$("#pw").text("Password (영문자, 특수문자 포함 5~12자리)");
		});

		$("#inputPw").blur(function() {
			$("#pw").text("Password");
		});
	</script>


</body>
</html>
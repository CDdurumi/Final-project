<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="/css/signup.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	$(document).ready(function(){
		// 0. 유효성 검사 - 포커스를 잃을 때마다 검사
		
		
		
		
		
		// 1. 메일 인증 - Ajax
		$("#mailCheck").on();
		
		
		
		// 2. 회원 가입 활성화
		
		
		
		// 3. 데이터 전송 후 로그인 처리- Ajax

		
		
		// 4. 로그인 API 처리- Ajax
		// 클릭 시, API 연동으로 SNS 로그인 -> 정보 서버로 넘기기 -> 받은 값을 다시 회원가입으로 뿌려주기 (넘겨온 정보는 비활성화)
		// 다시 유효성 검사
		// 회원가입 활성화
		// 데이터 전송 후 로그인 처리
		
		
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
						<form>
							<input id="text" type="text" name="username" placeholder="이름" /> 
							<input id="email" type="text" name="email" placeholder="이메일" style="width:305px;"/> <button type="button" id="mailCheck">인증</button>
							<input id="password1" type="password" name="password1" placeholder="비밀번호" /> 
							<input id="password2" type="password" name="password2" placeholder="비밀번호 확인" />
							<input id="nickname" type="text" name="nickname" placeholder="닉네임" />
							<input id="phone" type="text" name="phone" placeholder="사용하시는 연락처" />

							<input id="sign-submit" type="submit" name="signup_submit" value="회원가입"/>
						</form>
					</div>
					
					<hr style="height: 2.5px; box-shadow: 0 1px 2px rgba(0, 0, 0, 0.4);">
					
					<!-- 소셜 로그인 부분 -->
					<div class="modal-footer" style="justify-content: center; border-top: none; padding:0px;">
						<div class="loginwith mt-3 pt-3" style="text-align:center;">SNS계정으로 편하게 회원가입하세요<br>
						
							<button id="naver-API" type="button" class="social-signin naver" style="margin-top: 15px;">네이버 계정으로 회원가입</button> <br>
							<button id="kakao-API" type="button" class="social-signin kakao" style="margin-top: 10px;">카카오 계정으로 회원가입</button> <br>
						
						</div>
					</div>

			</div>
		</div>
	</div>

</body>
</html>
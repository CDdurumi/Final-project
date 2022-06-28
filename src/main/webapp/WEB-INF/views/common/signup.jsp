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
</head>
<body>

	<!-- 회원가입 -->
	<div class="modal fade" id="signup-toggle" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div id="signup-box" class="modal-content" style="width:900px;">
				<div class="left">
					<h1>회원가입</h1>

					<input id="text" type="text" name="username" placeholder="이름" /> 
					<input id="email" type="text" name="email" placeholder="이메일" /> <button>인증</button>
					<input id="password1" type="password" name="password1" placeholder="비밀번호" /> 
					<input id="password2" type="password" name="password2" placeholder="비밀번호 확인" />
					<input id="nickname" type="text" name="nickname" placeholder="닉네임" />
					<input id="phone" type="text" name="phone" placeholder="사용하시는 연락처" />

					<input id="sign-submit" type="submit" name="signup_submit" value="회원가입"/>

					<hr style="height: 2.5px; box-shadow: 0 1px 2px rgba(0, 0, 0, 0.4);">
					
					<div class="loginwith mt-4 pt-3" style="text-align:center;">SNS계정으로 편하게 회원가입을 하세요<br>
						
						<button class="social-signin naver" style="margin-top: 15px;">네이버 계정으로 회원가입</button> <br>
						<button class="social-signin kakao" style="margin-top: 10px;">카카오 계정으로 회원가입</button> <br>
					</div>
				</div>

			</div>
		</div>
	</div>


</body>
</html>
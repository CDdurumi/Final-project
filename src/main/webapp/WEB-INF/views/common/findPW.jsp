<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/login/findPW.css">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="modal fade" id="find-pw-toggle" aria-hidden="true"
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
								<input class="form-check-input" type="checkbox" value=""
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

</body>
</html>
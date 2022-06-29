<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/memberOut.css">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 로그인 -->
	<div class="modal fade" id="memberOut-toggle" aria-hidden="true"
		aria-labelledby="exampleModalToggleLabel" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content login-box">
				<form>
					<div class="modal-header t-auto" style="border-bottom: none; padding-bottom: 0px;"id="login-header">
						<h2>정말 탈퇴하시겠어요?</h2>
					</div>
					<div class="modal-body">
						<div class="user-box">
							회원 탈퇴 시 회원 정보 및 결제 내역, 작성 게시글 및 댓글은 모두 삭제됩니다.
						</div>
						<div class="d-flex">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									id="flexCheckDefault" style="margin-top: 5px;"> <label
									class="form-check-label" for="flexCheckDefault"
									style="font-size: 6px; color: black; margin-top: 3px;">
									아이디 기억하기 </label>
							</div>
							<div class="ms-auto">
								<a class="find">아이디 찾기</a>
							</div>
						</div>

						<div class="user-box mt-3">
							<input type="password" name="pw" required="" id="inputPw">
							<label id="pw">Password</label>
						</div>
						<div class="d-flex">
							<div>
								<a class="find" data-bs-target="#signup-toggle"
									data-bs-toggle="modal">회원가입</a>
							</div>
							<div class="ms-auto">
								<a class="find">비밀번호 찾기</a>
							</div>
						</div>
					</div>

					<div class="modal-footer d-flex" style="border-top: none;">
						<a><img alt="" src="/img/naver.png"></a> <a><img alt=""
							src="/img/kakao.png"></a> <a href="#" id="submit"
							class="ms-auto"> <span></span> <span></span> <span></span> <span></span>
							Submit
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>

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
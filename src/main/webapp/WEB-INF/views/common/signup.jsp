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
					<h1>Sign up</h1>

					<input type="text" name="username" placeholder="Username" /> <input
						type="text" name="email" placeholder="E-mail" /> <input
						type="password" name="password" placeholder="Password" /> <input
						type="password" name="password2" placeholder="Retype password" />

					<input type="submit" name="signup_submit" value="Sign me up" />



					
					<span class="loginwith">Sign in with<br />social SNS
					</span>

					<button class="social-signin facebook">Log in with
						facebook</button>
					<button class="social-signin twitter">Log in with Twitter</button>
					<button class="social-signin google">Log in with Google+</button>
				</div>

			</div>
		</div>
	</div>


</body>
</html>
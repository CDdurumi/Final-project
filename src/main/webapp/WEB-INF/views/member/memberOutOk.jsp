<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/memberOut.css?after">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 로그인 -->
	<div class="modal fade" id="memberOutOk-toggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content memberout-box" align=center>
				<form>
					<div class="modal-body">
						<div class="user-box">
							<h3>탈퇴 처리가 완료되었습니다.</h3>
						</div>
					</div>
					<div class="modal-footer d-flex" style="border-top: none; display: flex; justify-content: center;">
					<button id="outOk" class="btns2">확인</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	$("#outOk").on('click',function(){
		$("#memberOutOk-toggle").modal('hide');
	})
	</script>
</body>
</html>